import ../DxDll
{.push dynlib: DLL.}
##  DxMemory.cpp関数プロトタイプ宣言
##  メモリ確保系関数

proc DxAlloc*(AllocSize: csize_t; File: cstring = nil; Line: cint = -1): pointer
##  指定のサイズのメモリを確保する( AllocSize:確保するメモリのサイズ( 単位:byte )  File:DxAllocを呼んだソースファイル名( デバッグ用 )  Line:DxAllocを呼んだソースファイル中の行番号( デバッグ用 )　　戻り値  NULL:メモリの確保失敗   NULL以外:確保したメモリ領域の先頭アドレス )

proc DxAllocAligned*(AllocSize: csize_t; Alignment: csize_t; File: cstring = nil;
                    Line: cint = -1): pointer
##  指定のサイズのメモリを確保する( アライン指定版 )( AllocSize:確保するメモリのサイズ( 単位:byte )  Alignment:確保するメモリ領域のアドレス値の倍数  File:DxAllocを呼んだソースファイル名( デバッグ用 )  Line:DxAllocを呼んだソースファイル中の行番号( デバッグ用 )　　戻り値  NULL:メモリの確保失敗   NULL以外:確保したメモリ領域の先頭アドレス )

proc DxCalloc*(AllocSize: csize_t; File: cstring = nil; Line: cint = -1): pointer
##  指定のサイズのメモリを確保して、０で埋める、初期化後に０で埋める以外は DxAlloc と動作は同じ

proc DxCallocAligned*(AllocSize: csize_t; Alignment: csize_t; File: cstring = nil;
                     Line: cint = -1): pointer
##  指定のサイズのメモリを確保して、０で埋める、初期化後に０で埋める以外は DxAllocAligned と動作は同じ

proc DxRealloc*(Memory: pointer; AllocSize: csize_t; File: cstring = nil;
               Line: cint = -1): pointer
##  メモリの再確保を行う( Memory:再確保を行うメモリ領域の先頭アドレス( DxAlloc の戻り値 )  AllocSize:新しい確保サイズ　FileとLine の説明は DxAlloc の注釈の通り 　戻り値 NULL:メモリの再確保失敗　NULL以外:再確保した新しいメモリ領域の先頭アドレス　)

proc DxReallocAligned*(Memory: pointer; AllocSize: csize_t; Alignment: csize_t;
                      File: cstring = nil; Line: cint = -1): pointer
##  メモリの再確保を行う( アライン指定版 )( Memory:再確保を行うメモリ領域の先頭アドレス( DxAlloc の戻り値 )  AllocSize:新しい確保サイズ   Alignment:新しく確保するメモリ領域のアドレス値の倍数　FileとLine の説明は DxAlloc の注釈の通り 　戻り値 NULL:メモリの再確保失敗　NULL以外:再確保した新しいメモリ領域の先頭アドレス　)

proc DxFree*(Memory: pointer)
##  メモリを解放する( Memory:解放するメモリ領域の先頭アドレス( DxAlloc の戻り値 ) )

proc DxSetAllocSizeTrap*(Size: csize_t): csize_t
##  列挙対象にするメモリの確保容量をセットする

proc DxSetAllocPrintFlag*(Flag: cint): cint
##  ＤＸライブラリ内でメモリ確保が行われる時に情報を出力するかどうかをセットする

proc DxGetAllocSize*(): csize_t
##  DxAlloc や DxCalloc で確保しているメモリサイズを取得する

proc DxGetAllocNum*(): cint
##  DxAlloc や DxCalloc で確保しているメモリの数を取得する

proc DxDumpAlloc*()
##  DxAlloc や DxCalloc で確保しているメモリを列挙する

proc DxDrawAlloc*(x: cint; y: cint; Width: cint; Height: cint)
##  DxAlloc や DxCalloc で確保しているメモリの状況を描画する

proc DxErrorCheckAlloc*(): cint
##  確保したメモリ情報が破壊されていないか調べる( -1:破壊あり  0:なし )

proc DxSetAllocSizeOutFlag*(Flag: cint): cint
##  メモリが確保、解放が行われる度に確保しているメモリの容量を出力するかどうかのフラグをセットする

proc DxSetAllocMemoryErrorCheckFlag*(Flag: cint): cint
##  メモリの確保、解放が行われる度に確保しているメモリ確保情報が破損していないか調べるかどうかのフラグをセットする

{.pop.}
