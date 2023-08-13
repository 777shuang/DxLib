import ../DxDll
{.push dynlib: DLL, importc.}

##  DxFile.cpp関数プロトタイプ宣言
##  ファイルアクセス関数

proc FileRead_open*(FilePath: cstring; ASync: cint = FALSE): cint
##  ファイルを開く

proc FileRead_open_WithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                              ASync: cint = FALSE): cint
##  ファイルを開く

proc FileRead_open_mem*(FileImage: pointer; FileImageSize: csize_t): cint
##  メモリに展開されたファイルを開く

proc FileRead_size*(FilePath: cstring): LONGLONG
##  ファイルのサイズを取得する

proc FileRead_size_WithStrLen*(FilePath: cstring; FilePathLength: csize_t): LONGLONG
##  ファイルのサイズを取得する

proc FileRead_size_handle*(FileHandle: cint): LONGLONG
##  ファイルのサイズを取得する( ファイルハンドル使用版 )

proc FileRead_close*(FileHandle: cint): cint
##  ファイルを閉じる

proc FileRead_tell*(FileHandle: cint): LONGLONG
##  ファイルポインタの読み込み位置を取得する

proc FileRead_seek*(FileHandle: cint; Offset: LONGLONG; Origin: cint): cint
##  ファイルポインタの読み込み位置を変更する

proc FileRead_read*(Buffer: pointer; ReadSize: cint; FileHandle: cint): cint
##  ファイルからデータを読み込む

proc FileRead_idle_chk*(FileHandle: cint): cint
##  ファイル読み込みが完了しているかどうかを取得する

proc FileRead_eof*(FileHandle: cint): cint
##  ファイルの読み込み位置が終端に達しているかどうかを取得する

proc FileRead_set_format*(FileHandle: cint; CharCodeFormat: cint): cint
  ##  DX_CHARCODEFORMAT_SHIFTJIS 等
##  ファイルの文字コード形式を設定する( テキストファイル用 )

proc FileRead_gets*(Buffer: cstring; BufferSize: cint; FileHandle: cint): cint
##  ファイルから文字列を読み出す

proc FileRead_getc*(FileHandle: cint): TCHAR
##  ファイルから一文字読み出す

proc FileRead_scanf*(FileHandle: cint; Format: cstring): cint {.varargs.}
##  ファイルから書式化されたデータを読み出す

proc FileRead_createInfo*(ObjectPath: cstring): DWORD_PTR
##  ファイル情報ハンドルを作成する( 戻り値  -1:エラー  -1以外:ファイル情報ハンドル )

proc FileRead_createInfo_WithStrLen*(ObjectPath: cstring;
                                    ObjectPathLength: csize_t): DWORD_PTR
##  ファイル情報ハンドルを作成する( 戻り値  -1:エラー  -1以外:ファイル情報ハンドル )

proc FileRead_getInfoNum*(FileInfoHandle: DWORD_PTR): cint
##  ファイル情報ハンドル中のファイルの数を取得する

proc FileRead_getInfo*(Index: cint; Buffer: ptr FILEINFO; FileInfoHandle: DWORD_PTR): cint
##  ファイル情報ハンドル中のファイルの情報を取得する

proc FileRead_deleteInfo*(FileInfoHandle: DWORD_PTR): cint
##  ファイル情報ハンドルを削除する

proc FileRead_findFirst*(FilePath: cstring; Buffer: ptr FILEINFO): DWORD_PTR
##  指定のファイル又はフォルダの情報を取得し、ファイル検索ハンドルも作成する( 戻り値: -1=エラー  -1以外=ファイル検索ハンドル )

proc FileRead_findFirst_WithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                   Buffer: ptr FILEINFO): DWORD_PTR
##  指定のファイル又はフォルダの情報を取得し、ファイル検索ハンドルも作成する( 戻り値: -1=エラー  -1以外=ファイル検索ハンドル )

proc FileRead_findNext*(FindHandle: DWORD_PTR; Buffer: ptr FILEINFO): cint
##  条件の合致する次のファイルの情報を取得する( 戻り値: -1=エラー  0=成功 )

proc FileRead_findClose*(FindHandle: DWORD_PTR): cint
##  ファイル検索ハンドルを閉じる( 戻り値: -1=エラー  0=成功 )

proc FileRead_fullyLoad*(FilePath: cstring): cint
##  指定のファイルの内容を全てメモリに読み込み、その情報のアクセスに必要なハンドルを返す( 戻り値  -1:エラー  -1以外:ハンドル )、使い終わったらハンドルは FileRead_fullyLoad_delete で削除する必要があります

proc FileRead_fullyLoad_WithStrLen*(FilePath: cstring; FilePathLength: csize_t): cint
##  指定のファイルの内容を全てメモリに読み込み、その情報のアクセスに必要なハンドルを返す( 戻り値  -1:エラー  -1以外:ハンドル )、使い終わったらハンドルは FileRead_fullyLoad_delete で削除する必要があります

proc FileRead_fullyLoad_delete*(FLoadHandle: cint): cint
##  FileRead_fullyLoad で読み込んだファイルのハンドルを削除する

proc FileRead_fullyLoad_getImage*(FLoadHandle: cint): pointer
##  FileRead_fullyLoad で読み込んだファイルの内容を格納したメモリアドレスを取得する

proc FileRead_fullyLoad_getSize*(FLoadHandle: cint): LONGLONG
##  FileRead_fullyLoad で読み込んだファイルのサイズを取得する
##  設定関係関数

proc GetStreamFunctionDefault*(): cint
##  ＤＸライブラリでストリームデータアクセスに使用する関数がデフォルトのものか調べる( TRUE:デフォルトのもの  FALSE:デフォルトではない )

proc ChangeStreamFunction*(StreamThread: ptr STREAMDATASHREDTYPE2): cint
##  ＤＸライブラリでストリームデータアクセスに使用する関数を変更する

proc ChangeStreamFunctionW*(StreamThreadW: ptr STREAMDATASHREDTYPE2W): cint
##  ＤＸライブラリでストリームデータアクセスに使用する関数を変更する( wchar_t 使用版 )
##  補助関係関数

proc ConvertFullPath*(Src: cstring; Dest: cstring; CurrentDir: cstring = nil): cint
##  フルパスではないパス文字列をフルパスに変換する( CurrentDir はフルパスである必要がある(語尾に『\』があっても無くても良い) )( CurrentDir が NULL の場合は現在のカレントディレクトリを使用する )

proc ConvertFullPathWithStrLen*(Src: cstring; SrcLength: csize_t; Dest: cstring;
                               CurrentDir: cstring = nil;
                               CurrentDirLength: csize_t = 0): cint

{.pop.}
