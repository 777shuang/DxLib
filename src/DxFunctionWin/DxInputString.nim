import ../DxDll
{.push dynlib: DLL, importc.}

##  DxInputString.cpp関数プロトタイプ宣言

proc SetUseTSFFlag*(UseFlag: cint): cint
##  ＩＭＥの漢字変換候補表示の処理に TSF を使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )

{.pop.}
