import strutils
import strformat

# このパッケージのバージョンと DX ライブラリのバージョンは対応する。
const NimblePkgVersion {.strdefine.} = "0.0.0"
const DxLibVersionSplitted = NimblePkgVersion.split(".")
# DX ライブラリのバージョン表記は [数字1桁].[数字2桁][アルファベット小文字1文字(ないこともある)] である
# バインディングのバージョン表記は[数字1桁].[数字2桁].[数字1桁(0:何もなし,1:a,2:b,3:c...)].[バインディング内部のバージョン]
when DxLibVersionSplitted[2] != "0":
  const ch = $char(int('a') + DxLibVersionSplitted[2].parseInt - 1)
else:
  const ch = ""
const DxLibVersion* = fmt"{DxLibVersionSplitted[0]}_{DxLibVersionSplitted[1]}{ch}"