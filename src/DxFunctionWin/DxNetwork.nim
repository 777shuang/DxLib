import ../DxDll
{.push dynlib: DLL, importc.}

##  DxNetwork.cpp関数プロトタイプ宣言

proc GetWinSockLastError*(): cint
##  WinSock で最後に発生したエラーのコードを取得する

{.pop.}
