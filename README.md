# DX Library for Nim

## 概要

[DX ライブラリ](https://dxlib.xsrv.jp/)のバインディング<br>
現在、**Windows のみ**で使用可能です。Linux にも対応する予定。

## 使用方法

1. `$ nimble install DxLib`
2. [DX ライブラリ DLL 版](https://github.com/777shuang/DxLib.dll/releases) をダウンロードし、作業ディレクトリに展開する
3. `import DxLib` と書く

## 命名の変更点

|DXライブラリでの命名     |Nim版での命名                |
|------------------------|-----------------------------|
|`VERTEX_3D`             |`VERTEX3D_OLD`               |
|`DX_BLENDMODE_MUL_A`    |`DX_BLENDMODE_MUL_ONLY_A`    |
|`DX_BLENDMODE_PMA_MUL_A`|`DX_BLENDMODE_PMA_MUL_ONLY_A`|

Nimの命名規則ではアンダーバーは使用できるが無視されるため、DXライブラリの命名をそのまま使用すると衝突が起きるのでこのような対応を行っています。

## DxLibHeaderSpliter.nim について

DX ライブラリのヘッダファイルから、Nim のプロトタイプ宣言を生成するプログラム。<br>
`c2nim` への PATH が通っている必要があります。(ほとんどの環境では心配する必要はありません)
