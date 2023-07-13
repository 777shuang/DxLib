import ../DxDll
{.push dynlib: DLL, importc.}

##  DxFont.cpp 関数プロトタイプ宣言

proc AddFontFile*(FontFilePath: ptr TCHAR): HANDLE
##  指定のフォントファイルをシステムに追加する( 戻り値  NULL:失敗  NULL以外:フォントハンドル( WindowsOS のものなので、ＤＸライブラリのフォントハンドルとは別物です ) )

proc AddFontFileWithStrLen*(FontFilePath: ptr TCHAR; FontFilePathLength: csize_t): HANDLE
##  指定のフォントファイルをシステムに追加する( 戻り値  NULL:失敗  NULL以外:フォントハンドル( WindowsOS のものなので、ＤＸライブラリのフォントハンドルとは別物です ) )

proc AddFontFileFromMem*(FontFileImage: pointer; FontFileImageSize: cint): HANDLE
##  指定のメモリアドレスに展開したフォントファイルイメージをシステムに追加する( 戻り値  NULL:失敗  NULL以外:フォントハンドル( WindowsOS のものなので、ＤＸライブラリのフォントハンドルとは別物です ) )

proc RemoveFontFile*(FontHandle: HANDLE): cint
##  指定のフォントハンドルをシステムから削除する( 引数は AddFontFile や AddFontFileFromMem の戻り値 )

proc CreateFontDataFile*(SaveFilePath: ptr TCHAR; FontName: ptr TCHAR; Size: cint; BitDepth: cint; ##  DX_FONTIMAGE_BIT_1等
                        Thick: cint; Italic: cint = FALSE; CharSet: cint = -1;
                        SaveCharaList: ptr TCHAR = nil): cint
##  フォントデータファイルを作成する

proc CreateFontDataFileWithStrLen*(SaveFilePath: ptr TCHAR;
                                  SaveFilePathLength: csize_t;
                                  FontName: ptr TCHAR; FontNameLength: csize_t;
                                  Size: cint; BitDepth: cint; ##  DX_FONTIMAGE_BIT_1等
                                  Thick: cint; Italic: cint = FALSE;
                                  CharSet: cint = -1;
                                  SaveCharaList: ptr TCHAR = nil;
                                  SaveCharaListLength: csize_t = 0): cint
##  フォントデータファイルを作成する
##  基本イメージデータのロード＋ＤＩＢ関係

proc CreateDIBGraph*(FileName: ptr TCHAR; ReverseFlag: cint; SrcColor: ptr COLORDATA): HBITMAP
##  画像ファイルからＤＩＢデータを作成する

proc CreateDIBGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                              ReverseFlag: cint; SrcColor: ptr COLORDATA): HBITMAP
##  画像ファイルからＤＩＢデータを作成する

proc CreateDIBGraphToMem*(BmpInfo: ptr BITMAPINFO; GraphData: pointer;
                         ReverseFlag: cint; SrcColor: ptr COLORDATA): HBITMAP
##  ＢＭＰデータからＤＩＢデータクを作成する

proc CreateDIBGraph_plus_Alpha*(FileName: ptr TCHAR; RGBBmp: ptr HBITMAP;
                               AlphaBmp: ptr HBITMAP; ReverseFlag: cint = FALSE;
                               SrcColor: ptr COLORDATA = nil): cint
##  画像ファイルからＤＩＢデータとマスク用ＤＩＢデータを作成する

proc CreateDIBGraph_plus_AlphaWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; RGBBmp: ptr HBITMAP; AlphaBmp: ptr HBITMAP;
    ReverseFlag: cint = FALSE; SrcColor: ptr COLORDATA = nil): cint
##  画像ファイルからＤＩＢデータとマスク用ＤＩＢデータを作成する

proc CreateDIBGraphVer2*(FileName: ptr TCHAR; MemImage: pointer; MemImageSize: cint;
                        ImageType: cint; ReverseFlag: cint; SrcColor: ptr COLORDATA): HBITMAP
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージからＤＩＢデータを作成する

proc CreateDIBGraphVer2WithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                  MemImage: pointer; MemImageSize: cint;
                                  ImageType: cint; ReverseFlag: cint;
                                  SrcColor: ptr COLORDATA): HBITMAP
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージからＤＩＢデータを作成する

proc CreateDIBGraphVer2_plus_Alpha*(FileName: ptr TCHAR; MemImage: pointer;
                                   MemImageSize: cint; AlphaImage: pointer;
                                   AlphaImageSize: cint; ImageType: cint;
                                   RGBBmp: ptr HBITMAP; AlphaBmp: ptr HBITMAP;
                                   ReverseFlag: cint; SrcColor: ptr COLORDATA): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージからＤＩＢデータとマスク用ＤＩＢデータを作成する

proc CreateDIBGraphVer2_plus_AlphaWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; MemImage: pointer; MemImageSize: cint;
    AlphaImage: pointer; AlphaImageSize: cint; ImageType: cint; RGBBmp: ptr HBITMAP;
    AlphaBmp: ptr HBITMAP; ReverseFlag: cint; SrcColor: ptr COLORDATA): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージからＤＩＢデータとマスク用ＤＩＢデータを作成する

proc ConvBitmapToGraphImage*(BmpInfo: ptr BITMAPINFO; GraphData: pointer;
                            GraphImage: ptr BASEIMAGE; CopyFlag: cint): cint
##  ＢＭＰデータから基本イメージデータを構築する( Ret 0:正常終了  1:コピーを行った  -1:エラー )

proc ConvGraphImageToBitmap*(GraphImage: ptr BASEIMAGE; BmpInfo: ptr BITMAPINFO;
                            GraphData: ptr pointer; CopyFlag: cint;
                            FullColorConv: cint = TRUE): cint
##  基本イメージデータをＢＭＰデータに変換するGraphImage を ＢＭＰ に変換する(アルファデータはあっても無視される)( 戻り値　0:正常終了  1:コピーを行った  -1:エラー )
##  基本イメージデータ構造体関係

proc UpdateLayerdWindowForBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを使用して UpdateLayerdWindow を行う

proc UpdateLayerdWindowForBaseImageRect*(BaseImage: ptr BASEIMAGE; x1: cint; y1: cint;
                                        x2: cint; y2: cint): cint
##  基本イメージデータの指定の範囲を使用して UpdateLayerdWindow を行う

proc UpdateLayerdWindowForPremultipliedAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  乗算済みアルファの基本イメージデータを使用して UpdateLayerdWindow を行う

proc UpdateLayerdWindowForPremultipliedAlphaBaseImageRect*(
    BaseImage: ptr BASEIMAGE; x1: cint; y1: cint; x2: cint; y2: cint): cint
##  乗算済みアルファの基本イメージデータの指定の範囲を使用して UpdateLayerdWindow を行う
##  デスクトップキャプチャ

proc GetDesktopScreenBaseImage*(x1: cint; y1: cint; x2: cint; y2: cint;
                               BaseImage: ptr BASEIMAGE; DestX: cint; DestY: cint): cint
##  デスクトップの指定の領域を基本イメージデータに転送する

{.pop.}
