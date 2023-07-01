import os, strutils, encodings
import puppy
from zippy/ziparchives {.all.} import ZipArchiveReader
import zippy/ziparchives

{.push header: "DxLibHeaderSpliter.c".}
proc SEEK_SET(): cint {.importc: "get_SEEK_SET".}
proc SEEK_END(): cint {.importc: "get_SEEK_END".}
proc SEEK_CUR(): cint {.importc: "get_SEEK_CUR".}
{.pop.}

const NimblePkgVersion {.strdefine.} = "0.0.0"
const DxLibVersion = NimblePkgVersion.split(".")
when DxLibVersion[2] != "0":
  const ch = $char(int('a') + DxLibVersion[2].parseInt - 1)
else:
  const ch = ""
const url =   "https://dxlib.xsrv.jp/DxLib/DxLibMake" &
  DxLibVersion[0] &
  "_" &
  DxLibVersion[1] &
  ch &
  ".zip"

const zipFileName = "DxLibMake.zip"
var res: Response
var fileRead, fileWrite : File
if not fileExists(zipFileName):
  try:
    res = url.get
    if res.code != 200:
      raise newException(PuppyError, res.code.intToStr)
    fileWrite = open(zipFileName, FileMode.fmWrite)
    fileWrite.write(res.body)
    fileWrite.close()
  except PuppyError:
    echo getCurrentExceptionMsg()
  except IOError:
    echo getCurrentExceptionMsg()

var reader: ZipArchiveReader
try:
  reader = openZipArchive(zipFileName)
except ZippyError:
  echo getCurrentExceptionMsg()

proc c2nim(option: string) = discard execShellCmd("c2nim " & option)

const DataType = "DxDataTypeWin.h"
try:
  fileWrite = open(DataType, FileMode.fmWrite)
  fileWrite.write(reader.extractFile("DxLibMake/" & DataType))
  fileWrite.close()
except IOError:
  echo getCurrentExceptionMsg()
c2nim(DataType & " -o:" & "src" / DataType.splitFile.name & ".nim")

type Flag = enum
  NULL = ""
  DEFINE = "DxDefine.h"
  STRUCT = "DxStruct.h"
  FUNCTION = "DxFunctions.h"
var flag: Flag = NULL
proc changeFlag(f: Flag) =
  flag = f
  try:
    fileWrite = open($f, FileMode.fmWrite)
  except IOError:
    echo getCurrentExceptionMsg()

let lines = reader.extractFile("DxLibMake/DxLib.h").convert(srcEncoding="shiftjis", destEncoding="UTF-8").split("\r\n")
for line in lines:
  case flag
  of NULL:
    case line
    of "#define DX_DEFINE_START":
      changeFlag(DEFINE)
      fileWrite.writeLine("#define SEEK_SET " & SEEK_SET().intToStr)
      fileWrite.writeLine("#define SEEK_END " & SEEK_END().intToStr)
      fileWrite.writeLine("#define SEEK_CUR " & SEEK_CUR().intToStr)
    of "#define DX_STRUCT_START":
      changeFlag(STRUCT)
    of "#define DX_FUNCTION_START":
      changeFlag(FUNCTION)
      fileWrite.writeLine("#define DEFAULTPARAM(param) param")
      
  of DEFINE:
    if line == "#define DX_DEFINE_END":
      flag = NULL
      fileWrite.close()
      const
        before = splitFile($DEFINE).name & ".nim"
        after = "src" / before
      c2nim($DEFINE)
      try:
        fileRead = open(before, FileMode.fmRead)
        fileWrite = open(after, FileMode.fmWrite)
      except IOError:
        echo getCurrentExceptionMsg()
      while not fileRead.endOfFile:
        fileWrite.writeLine(fileRead.readLine.replace("div", "/").replace("(DX_FONTTYPE_NORMAL)", "0"))
      fileRead.close()
      fileWrite.close()
    else:
      fileWrite.writeLine(line)

  of STRUCT:
    if line == "#define DX_STRUCT_END":
      flag = NULL
      fileWrite.close()
      c2nim($STRUCT)
    else:
      fileWrite.writeLine(line)

  of  FUNCTION:
    if line == "#define DX_FUNCTION_END":
      flag = NULL
      fileWrite.close()
      c2nim($FUNCTION)
    else:
      fileWrite.writeLine(line)

reader.close()