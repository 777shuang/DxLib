import os, strutils, encodings, nre, options
import puppy
import zippy/ziparchives

{.push header: "DxLibHeaderSpliter.c".}
proc SEEK_SET(): cint {.importc: "get_SEEK_SET".}
proc SEEK_END(): cint {.importc: "get_SEEK_END".}
proc SEEK_CUR(): cint {.importc: "get_SEEK_CUR".}

proc HexToInt(hex: cstring): cint
{.pop.}

var fileRead, fileWrite : File

# このパッケージのバージョンと DX ライブラリのバージョンは対応する。
const NimblePkgVersion {.strdefine.} = "0.0.0"
const DxLibVersion = NimblePkgVersion.split(".")
# DX ライブラリのバージョン表記は [数字1桁].[数字2桁][アルファベット小文字1文字(ないこともある)] である
# バインディングのバージョン表記は[数字1桁].[数字2桁].[数字1桁(0:何もなし,1:a,2:b,3:c...)].[バインディング内部のバージョン]
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
if not fileExists(zipFileName):
  try:
    let res = url.get
    if res.code != 200:
      raise newException(PuppyError, res.code.intToStr)
    fileWrite = open(zipFileName, FileMode.fmWrite)
    fileWrite.write(res.body)
    fileWrite.close()
  except PuppyError:
    echo getCurrentExceptionMsg()
  except IOError:
    echo getCurrentExceptionMsg()

var lines: seq[string]
var functionWin: seq[string]
try:
  let encodingConverter = open(srcEncoding="shiftjis", destEncoding="UTF-8")
  var reader = openZipArchive(zipFileName)
  lines = encodingConverter.convert(reader.extractFile("DxLibMake/DxLib.h")).split("\r\n")
  functionWin = encodingConverter.convert(reader.extractFile("DxLibMake/DxFunctionWin.h")).split("\r\n")
  reader.close()
  encodingConverter.close()
except IOError:
  echo getCurrentExceptionMsg()
except ZippyError:
  echo getCurrentExceptionMsg()

proc c2nim(option: string) = discard execShellCmd("c2nim " & option)

type Flag = enum
  NULL
  DEFINE = "DxDefine.h"
  STRUCT = "DxStruct.h"
  FUNCTION
var
  flag: Flag = NULL
  functionsWriting = ""

# DEFAULTPARAM を外す
proc convertC(line: string): string =
  var buf = line
  while buf.contains("DEFAULTPARAM"):
    buf = buf.replace(
      re"(.*)(DEFAULTPARAM[  ]*\([  ]*=[  ]*)([^\)]*)([   ]*\))(.*)",
      proc(match: RegexMatch): string = return $match.captures[0] & " = " & $match.captures[2] & $match.captures[4]
    )
  for str in ["ULL_NUM", "LL_NUM", "ULL_PARAM", "LL_PARAM"]:
    buf = buf.replace(str, "")
  return buf.replace("__inline", "inline")

proc convertNim(line: string): string =
  var buf = line
  buf = buf.replace("ptr TCHAR", "cstring")
  buf = buf.replace("0xffffffffffffffff'u", "0xffffffffffffffff'i64")
  # 負の数として表現される16進数を正しく変換する
  buf = buf.replace(
    re"(0x[0-9A-Fa-f]+)",
    proc(match: RegexMatch): string =
      if $match.captures[0] != "0xffffffff":
        return $HexToInt(cstring($match.captures[0]))
      else:
        return "0xffffffff'u32"
  )
  buf = buf.replace("VERTEX_3D", "VERTEX3D_OLD")
  if buf.startsWith("proc _GetSystemInfo"):
    buf = buf.replace("_GetSystemInfo", "GetSystemInfo")
    buf = buf & " {.importc: \"_GetSystemInfo\".}"
    return buf
  return buf

proc close(path: string) =
  fileWrite.close()
  c2nim("--cpp " & functionsWriting)

  let
    before = functionsWriting.splitFile.name & ".nim"
    after = "src" / path / before
  fileRead = open(before, FileMode.fmRead)
  fileWrite = open(after, FileMode.fmWrite)       
  fileWrite.writeLine("import ../DxDll")
  fileWrite.writeLine("{.push dynlib: DLL, importc.}")
  fileWrite.writeLine("")
  while not fileRead.endOfFile:
    fileWrite.writeLine(convertNim(fileRead.readLine))
  fileWrite.writeLine("")
  fileWrite.writeLine("{.pop.}")
  fileRead.close()
  fileWrite.close()

proc functionSpliter(line, dir: string) =
  let m = line.match(re"(// )(Dx[A-Za-z0-9]+)(\.cpp.*)")
  if m.isSome:
    if functionsWriting != "":
      close(dir)
    else:
      discard existsOrCreateDir("src" / dir)
      fileWrite = open("src" / dir & ".nim", FileMode.fmWrite)
      fileWrite.close()

    fileWrite = open("src" / dir & ".nim", FileMode.fmAppend)
    fileWrite.writeLine("import " & dir & "/" & $m.get.captures[1])
    fileWrite.writeLine("export " & $m.get.captures[1])
    fileWrite.writeLine("")
    fileWrite.close()

    functionsWriting = m.get.captures[1] & ".h"
    fileWrite = open(functionsWriting, FileMode.fmWrite)

  if functionsWriting != "" and not line.strip.startsWith("#"):
    fileWrite.writeLine(convertC(line))

# c2nim では入力ファイルが大きすぎるとエラーが出るため、内容を分割する
try:
  for line in lines:
    case flag
    of NULL:
      case line
      of "#ifndef DX_MAKE":
        flag = DEFINE
        fileWrite = open($DEFINE, FileMode.fmWrite)
        fileWrite.writeLine("#define SEEK_SET " & SEEK_SET().intToStr)
        fileWrite.writeLine("#define SEEK_END " & SEEK_END().intToStr)
        fileWrite.writeLine("#define SEEK_CUR " & SEEK_CUR().intToStr)
        fileWrite.writeLine("#ifndef DX_MAKE")
      of "#define DX_STRUCT_START":
        flag = STRUCT
        fileWrite = open($STRUCT, FileMode.fmWrite)
      of "#define DX_FUNCTION_START":
        flag = FUNCTION
        
    of DEFINE:
      # マクロ定義部
      if line == "#define DX_DEFINE_END":
        flag = NULL
        fileWrite.close()
        const
          before = splitFile($DEFINE).name & ".nim"
          after = "src" / before
        c2nim($DEFINE)
        fileRead = open(before, FileMode.fmRead)
        fileWrite = open(after, FileMode.fmWrite)
        while not fileRead.endOfFile:
          var buf = convertNim(fileRead.readLine)
          buf = buf.replace("div", "/")
          buf = buf.replace("(DX_FONTTYPE_NORMAL)", "0")
          fileWrite.writeLine(buf)
        fileRead.close()
        fileWrite.close()
      else:
        if line.startsWith("#define DX_CHAR\t"):
          fileWrite.writeLine("typedef char DX_CHAR;")
        else:
          fileWrite.writeLine(line)

    of STRUCT:
      # 構造体定義部
      if line == "#define DX_STRUCT_END":
        flag = NULL
        fileWrite.close()
        c2nim($STRUCT)
        const
          before = splitFile($STRUCT).name & ".nim"
          after = "src" / before
        fileRead = open(before, FileMode.fmRead)
        fileWrite = open(after, FileMode.fmWrite)
        fileWrite.writeLine("import winim")
        fileWrite.writeLine("import DxDefine")
        while not fileRead.endOfFile:
          fileWrite.writeLine(convertNim(fileRead.readLine))
        fileRead.close()
        fileWrite.close()
      else:
        fileWrite.writeLine(line)

    of  FUNCTION:
      const DxFunctions = "DxFunctions"
      if line == "#define DX_FUNCTION_END":
        flag = NULL
        close(DxFunctions)
      else:
        functionSpliter(line, DxFunctions)

  const DxFunctionWin = "DxFunctionWin"
  functionsWriting = ""
  for line in functionWin:
    if line == "#define DX_FUNCTION_END":
      close(DxFunctionWin)
      break
    functionSpliter(line, DxFunctionWin)
except IOError:
  echo getCurrentExceptionMsg()