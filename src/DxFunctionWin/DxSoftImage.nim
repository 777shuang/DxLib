import ../DxDll
{.push dynlib: DLL, importc.}

##  DxSoftImage.cpp関数プロトタイプ宣言

proc UpdateLayerdWindowForSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを使用して UpdateLayerdWindow を行う

proc UpdateLayerdWindowForSoftImageRect*(SIHandle: cint; x1: cint; y1: cint; x2: cint;
                                        y2: cint): cint
##  ソフトウエアイメージハンドルの指定の範囲を使用して UpdateLayerdWindow を行う

proc UpdateLayerdWindowForPremultipliedAlphaSoftImage*(SIHandle: cint): cint
##  乗算済みアルファのソフトウエアイメージハンドルを使用して UpdateLayerdWindow を行う

proc UpdateLayerdWindowForPremultipliedAlphaSoftImageRect*(SIHandle: cint;
    x1: cint; y1: cint; x2: cint; y2: cint): cint
##  乗算済みアルファのソフトウエアイメージハンドルの指定の範囲を使用して UpdateLayerdWindow を行う
##  デスクトップキャプチャ

proc GetDesktopScreenSoftImage*(x1: cint; y1: cint; x2: cint; y2: cint; SIHandle: cint;
                               DestX: cint; DestY: cint): cint
##  デスクトップの指定の領域をソフトウエアイメージハンドルに転送する

{.pop.}
