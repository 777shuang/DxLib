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

proc strcpyDx*(Dest: cstring; Src: cstring)
##  strcpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcpy_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring)
##  strcpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpyDx*(Dest: cstring; Src: cstring; Pos: cint)
##  位置指定付き strcpy、Pos はコピー開始位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Pos: cint)
##  位置指定付き strcpy_s、Pos はコピー開始位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy2Dx*(Dest: cstring; Src: cstring; Pos: cint)
##  位置指定付き strcpy、Pos はコピー開始位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy2_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Pos: cint)
##  位置指定付き strcpy_s、Pos はコピー開始位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpyDx*(Dest: cstring; Src: cstring; Num: cint)
##  strncpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Num: cint)
##  strncpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy2Dx*(Dest: cstring; Src: cstring; Num: cint)
##  strncpy の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy2_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Num: cint)
##  strncpy_s の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpyDx*(Dest: cstring; Src: cstring; Num: cint)
##  strncpy の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Num: cint)
##  strncpy_s の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy2Dx*(Dest: cstring; Src: cstring; Num: cint)
##  strncpy の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy2_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Num: cint)
##  strncpy_s の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpyDx*(Dest: cstring; Src: cstring; Pos: cint; Num: cint)
##  strncpy のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Pos: cint;
                  Num: cint)
##  strncpy_s のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy2Dx*(Dest: cstring; Src: cstring; Pos: cint; Num: cint)
##  strncpy のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy2_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring; Pos: cint;
                   Num: cint)
##  strncpy_s のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcatDx*(Dest: cstring; Src: cstring)
##  strcat と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcat_sDx*(Dest: cstring; DestBytes: csize_t; Src: cstring)
##  strcat_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strlenDx*(Str: cstring): csize_t
##  strlen と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strlen2Dx*(Str: cstring): csize_t
##  strlen の戻り値が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcmpDx*(Str1: cstring; Str2: cstring): cint
##  strcmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc stricmpDx*(Str1: cstring; Str2: cstring): cint
##  stricmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncmpDx*(Str1: cstring; Str2: cstring; Num: cint): cint
##  strncmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncmp2Dx*(Str1: cstring; Str2: cstring; Num: cint): cint
##  strncmp の Num が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncmpDx*(Str1: cstring; Str2: cstring; Pos: cint; Num: cint): cint
##  strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置、Num が文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncmp2Dx*(Str1: cstring; Str2: cstring; Pos: cint; Num: cint): cint
##  strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置( 全角文字も 1 扱い )、Num が文字数( 全角文字も 1 扱い )( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strgetchrDx*(Str: cstring; Pos: cint; CharNums: ptr cint = nil): DWORD
##  文字列の指定の位置の文字コードを取得する、Pos は取得する位置、CharNums は文字数を代入する変数のアドレス、戻り値は文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strgetchr2Dx*(Str: cstring; Pos: cint; CharNums: ptr cint = nil): DWORD
##  文字列の指定の位置の文字コードを取得する、Pos は取得する位置( 全角文字も 1 扱い )、CharNums は文字数を代入する変数のアドレス、戻り値は文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strputchrDx*(Str: cstring; Pos: cint; CharCode: DWORD): cint
##  文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置、CharCode は文字コード、戻り値は書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strputchr2Dx*(Str: cstring; Pos: cint; CharCode: DWORD): cint
##  文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置( 全角文字も 1 扱い )、CharCode は文字コード、戻り値は書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strposDx*(Str: cstring; Pos: cint): cstring
##  文字列の指定の位置のアドレスを取得する、Pos は取得する位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpos2Dx*(Str: cstring; Pos: cint): cstring
##  文字列の指定の位置のアドレスを取得する、Pos は取得する位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strstrDx*(Str1: cstring; Str2: cstring): cstring
##  strstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strstr2Dx*(Str1: cstring; Str2: cstring): cint
##  strstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrstrDx*(Str1: cstring; Str2: cstring): cstring
##  strrstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrstr2Dx*(Str1: cstring; Str2: cstring): cint
##  strrstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strchrDx*(Str: cstring; CharCode: DWORD): cstring
##  strchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strchr2Dx*(Str: cstring; CharCode: DWORD): cint
##  strchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrchrDx*(Str: cstring; CharCode: DWORD): cstring
##  strrchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrchr2Dx*(Str: cstring; CharCode: DWORD): cint
##  strrchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc struprDx*(Str: cstring): cstring
##  strupr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsprintfDx*(Buffer: cstring; FormatString: cstring; Arg: va_list): cint
##  vsprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsnprintfDx*(Buffer: cstring; BufferSize: csize_t; FormatString: cstring;
                 Arg: va_list): cint
##  vsnprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc sprintfDx*(Buffer: cstring; FormatString: cstring): cint {.varargs.}
##  sprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc snprintfDx*(Buffer: cstring; BufferSize: csize_t; FormatString: cstring): cint {.
    varargs.}
##  snprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc itoaDx*(Value: cint; Buffer: cstring; Radix: cint): cstring
##  itoa と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc itoa_sDx*(Value: cint; Buffer: cstring; BufferBytes: csize_t; Radix: cint): cstring
##  itoa_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc atoiDx*(Str: cstring): cint
##  atoi と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc atofDx*(Str: cstring): cdouble
##  atof と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsscanfDx*(String: cstring; FormatString: cstring; Arg: va_list): cint
##  vsscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc sscanfDx*(String: cstring; FormatString: cstring): cint {.varargs.}
##  sscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

{.pop.}
