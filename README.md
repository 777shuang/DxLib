# DX Library for Nim
## 概要
[DX ライブラリ](https://dxlib.xsrv.jp/)のバインディング<br>
現在、**Windows のみ**で使用可能です。Linux にも対応する予定。
## 使用方法
1. `$ nimble install DxLib`
2. [DX ライブラリ DLL 版](https://github.com/777shuang/DxLib.dll/releases) をダウンロードし、作業ディレクトリに展開する
3. `import DxLib` と書く

## 注意
`VERTEX_3D` 構造体は、命名規則の関係上、`VERTEX3D_OLD` に改名されています。

## DxLibHeaderSpliter.nim について
DX ライブラリのヘッダファイルから、Nim のプロトタイプ宣言を生成するプログラム。<br>
`c2nim` への PATH が通っている必要があります。(ほとんどの環境では心配する必要はありません)
