import ../DxDll
{.push dynlib: DLL, importc.}

##  DxMask.cpp 関数プロトタイプ宣言

proc BmpBltToMask*(Bmp: HBITMAP; BmpPointX: cint; BmpPointY: cint; MaskHandle: cint): cint
##  マスクハンドルにＢＭＰデータを転送する

{.pop.}
