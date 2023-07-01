import os, strutils, encodings
import puppy
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

var res: Response
try:
  res = url.get
except PuppyError:
  echo "Failed to connect"
if res.code != 200:
  echo "Failed to connect"

const zipFileName = "DxLibMake.zip"
var fileRead, fileWrite : File
try:
  fileWrite = open(zipFileName, FileMode.fmWrite)
except IOError:
  echo getCurrentExceptionMsg()

fileWrite.write(res.body)
fileWrite.close()

var lines: seq[string]
try:
  let reader = openZipArchive(zipFileName)
  lines = reader.extractFile("DxLibMake/DxLib.h").convert(srcEncoding="shiftjis", destEncoding="UTF-8").split("\r\n")
  reader.close()
except ZippyError:
  echo getCurrentExceptionMsg()

when defined(windows):
  const DataType = "DxDataTypeWin.h"
else:
  const DataType = "DxDataTypeLinux.h"
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

proc c2nim(option: string) = discard execShellCmd("c2nim " & option)
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
      const name = splitFile($DEFINE).name
      const
        before = name & "_.nim"
        after = name & ".nim"
      c2nim($DEFINE & " --out:" & before)
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