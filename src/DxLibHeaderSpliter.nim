import os, strutils, encodings, nre, options
import puppy
import zippy/ziparchives

{.push header: "DxLibHeaderSpliter.c".}
proc SEEK_SET(): cint {.importc: "get_SEEK_SET".}
proc SEEK_END(): cint {.importc: "get_SEEK_END".}
proc SEEK_CUR(): cint {.importc: "get_SEEK_CUR".}
{.pop.}

var fileRead, fileWrite : File

# このパッケージのバージョンと DX ライブラリのバージョンは対応する。
const NimblePkgVersion {.strdefine.} = "0.0.0"
const DxLibVersion = NimblePkgVersion.split(".")
# DX ライブラリのバージョン表記は [数字1桁].[数字2桁][アルファベット小文字1文字(ないこともある)] である
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
try:
  var reader = openZipArchive(zipFileName)
  lines = reader.extractFile("DxLibMake/DxLib.h").convert(srcEncoding="shiftjis", destEncoding="UTF-8").split("\r\n")
  reader.close()
except ZippyError:
  echo getCurrentExceptionMsg()

proc c2nim(option: string) = discard execShellCmd("c2nim " & option)

type Flag = enum
  NULL
  DEFINE = "DxDefine.h"
  STRUCT = "DxStruct.h"
  FUNCTION
var flag: Flag = NULL
proc changeFlag(f: Flag) =
  flag = f
  fileWrite = open($f, FileMode.fmWrite)

# c2nim では入力ファイルが大きすぎるとエラーが出るため、内容を分割する
try:
  for line in lines:
    case flag
    of NULL:
      case line
      of "#ifndef DX_MAKE":
        changeFlag(DEFINE)
        fileWrite.writeLine("#define SEEK_SET " & SEEK_SET().intToStr)
        fileWrite.writeLine("#define SEEK_END " & SEEK_END().intToStr)
        fileWrite.writeLine("#define SEEK_CUR " & SEEK_CUR().intToStr)
        fileWrite.writeLine("#ifndef DX_MAKE")
      of "#define DX_STRUCT_START":
        changeFlag(STRUCT)
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
          var buf = fileRead.readLine
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
          fileWrite.writeLine(fileRead.readLine.replace("VERTEX_3D", "VERTEX3D_OLD"))
        fileRead.close()
        fileWrite.close()
      else:
        fileWrite.writeLine(line)

    of  FUNCTION:
      # 関数前方宣言部
      if line == "#define DX_FUNCTION_END":
        flag = NULL
        fileWrite.close()
        c2nim("--cpp " & $FUNCTION)
        const
          before = splitFile($FUNCTION).name & ".nim"
          after = "src" / before
        fileRead = open(before, FileMode.fmRead)
        fileWrite = open(after, FileMode.fmWrite)
        for str in ["import winim", "import DxDefine", "import DxStruct", "import DxDll", "", "{.push dynlib: DLL.}"]:
          fileWrite.writeLine(str)
        while not fileRead.endOfFile:
          var buf = fileRead.readLine
          buf = buf.replace("0xffffffff;", "0xffffffff'u32;")
          buf = buf.replace("0xffffffffffffffff'u", "0xffffffffffffffff'i64")
          buf = buf.replace("VERTEX_3D", "VERTEX3D_OLD")
          fileWrite.writeLine(buf)
        fileWrite.writeLine("")
        fileWrite.writeLine("{.pop.}")
        fileRead.close()
        fileWrite.close()
      else:
        let m = line.match(re"(// Dx)([A-Za-z0-9]+)(\.cpp.*)")
        if m.isSome:
          fileWrite.close()
          fileWrite = open("Dx" & $m.get().captures[1] & ".nim", FileMode.fmWrite)
        if not line.strip.startsWith("#"):
          var buf:string = line
          # DEFAULTPARAM を外す
          while buf.contains("DEFAULTPARAM"):
            buf = buf.replace(
              re"(.*)(DEFAULTPARAM[  ]*\([  ]*=[  ]*)([^\)]*)([   ]*\))(.*)",
              proc(match: RegexMatch): string = return $match.captures[0] & " = " & $match.captures[2] & $match.captures[4]
            )
          for str in ["ULL_NUM", "LL_NUM", "ULL_PARAM", "LL_PARAM"]:
            buf = buf.replace(str, "")
          fileWrite.writeLine(buf.replace("__inline", "inline"))
except IOError:
  echo getCurrentExceptionMsg()