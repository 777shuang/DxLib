import ../DxDll
{.push dynlib: DLL, importc.}

##  DxBaseFunc.cpp 関数プロトタイプ宣言
##  文字コード関係

proc GetCharBytes*(CharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                  String: pointer): cint
##  文字列の先頭の文字のバイト数を取得する

proc ConvertStringCharCodeFormat*(SrcCharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                                 SrcString: pointer; DestCharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                                 DestStringBuffer: pointer): cint
##  文字列の文字コード形式を別の文字コード形式に変換する

proc SetUseCharCodeFormat*(CharCodeFormat: cint): cint
  ##  DX_CHARCODEFORMAT_SHIFTJIS 等
##  文字列の引数の文字コード形式を設定する( 文字列描画系関数とその他一部関数を除く )( UNICODE版では無効 )

proc GetUseCharCodeFormat*(): cint
##  文字列の引数の文字コード形式を取得する( 戻り値：文字コード形式( DX_CHARCODEFORMAT_SHIFTJIS 等 ) )( UNICODE版では無効 )

proc Get_wchar_t_CharCodeFormat*(): cint
##  wchar_t型の文字コード形式を取得する( 戻り値： DX_CHARCODEFORMAT_UTF16LE など )
##  文字列関係

proc strcpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR)
##  strcpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR)
##  strcpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy、Pos はコピー開始位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy_s、Pos はコピー開始位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy、Pos はコピー開始位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy_s、Pos はコピー開始位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint; Num: cint)
##  strncpy のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint;
                  Num: cint)
##  strncpy_s のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint; Num: cint)
##  strncpy のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint;
                   Num: cint)
##  strncpy_s のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcatDx*(Dest: ptr TCHAR; Src: ptr TCHAR)
##  strcat と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcat_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR)
##  strcat_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strlenDx*(Str: ptr TCHAR): csize_t
##  strlen と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strlen2Dx*(Str: ptr TCHAR): csize_t
##  strlen の戻り値が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  strcmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc stricmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  stricmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Num: cint): cint
##  strncmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncmp2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Num: cint): cint
##  strncmp の Num が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Pos: cint; Num: cint): cint
##  strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置、Num が文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncmp2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Pos: cint; Num: cint): cint
##  strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置( 全角文字も 1 扱い )、Num が文字数( 全角文字も 1 扱い )( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strgetchrDx*(Str: ptr TCHAR; Pos: cint; CharNums: ptr cint = nil): DWORD
##  文字列の指定の位置の文字コードを取得する、Pos は取得する位置、CharNums は文字数を代入する変数のアドレス、戻り値は文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strgetchr2Dx*(Str: ptr TCHAR; Pos: cint; CharNums: ptr cint = nil): DWORD
##  文字列の指定の位置の文字コードを取得する、Pos は取得する位置( 全角文字も 1 扱い )、CharNums は文字数を代入する変数のアドレス、戻り値は文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strputchrDx*(Str: ptr TCHAR; Pos: cint; CharCode: DWORD): cint
##  文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置、CharCode は文字コード、戻り値は書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strputchr2Dx*(Str: ptr TCHAR; Pos: cint; CharCode: DWORD): cint
##  文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置( 全角文字も 1 扱い )、CharCode は文字コード、戻り値は書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strposDx*(Str: ptr TCHAR; Pos: cint): ptr TCHAR
##  文字列の指定の位置のアドレスを取得する、Pos は取得する位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpos2Dx*(Str: ptr TCHAR; Pos: cint): ptr TCHAR
##  文字列の指定の位置のアドレスを取得する、Pos は取得する位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strstrDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): ptr TCHAR
##  strstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strstr2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  strstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrstrDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): ptr TCHAR
##  strrstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrstr2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  strrstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strchrDx*(Str: ptr TCHAR; CharCode: DWORD): ptr TCHAR
##  strchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strchr2Dx*(Str: ptr TCHAR; CharCode: DWORD): cint
##  strchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrchrDx*(Str: ptr TCHAR; CharCode: DWORD): ptr TCHAR
##  strrchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrchr2Dx*(Str: ptr TCHAR; CharCode: DWORD): cint
##  strrchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc struprDx*(Str: ptr TCHAR): ptr TCHAR
##  strupr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsprintfDx*(Buffer: ptr TCHAR; FormatString: ptr TCHAR; Arg: va_list): cint
##  vsprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsnprintfDx*(Buffer: ptr TCHAR; BufferSize: csize_t; FormatString: ptr TCHAR;
                 Arg: va_list): cint
##  vsnprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc sprintfDx*(Buffer: ptr TCHAR; FormatString: ptr TCHAR): cint {.varargs.}
##  sprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc snprintfDx*(Buffer: ptr TCHAR; BufferSize: csize_t; FormatString: ptr TCHAR): cint {.
    varargs.}
##  snprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc itoaDx*(Value: cint; Buffer: ptr TCHAR; Radix: cint): ptr TCHAR
##  itoa と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc itoa_sDx*(Value: cint; Buffer: ptr TCHAR; BufferBytes: csize_t; Radix: cint): ptr TCHAR
##  itoa_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc atoiDx*(Str: ptr TCHAR): cint
##  atoi と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc atofDx*(Str: ptr TCHAR): cdouble
##  atof と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsscanfDx*(String: ptr TCHAR; FormatString: ptr TCHAR; Arg: va_list): cint
##  vsscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc sscanfDx*(String: ptr TCHAR; FormatString: ptr TCHAR): cint {.varargs.}
##  sscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

{.pop.}
