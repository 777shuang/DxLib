import ../DxDll
{.push dynlib: DLL, importc.}

##  DxMask.cpp 関数プロトタイプ宣言
##  マスク関係

proc CreateMaskScreen*(): cint
##  マスクスクリーンを作成する

proc DeleteMaskScreen*(): cint
##  マスクスクリーンを削除する

proc DrawMaskToDirectData*(x: cint; y: cint; Width: cint; Height: cint;
                          MaskData: pointer; TransMode: cint): cint
##  マスクスクリーンにメモリ上のビットマップデータを転送する( MaskData は 1byte で 1dot 表す１ラインあたり Width byte のデータ配列の先頭アドレス )

proc DrawFillMaskToDirectData*(x1: cint; y1: cint; x2: cint; y2: cint; Width: cint;
                              Height: cint; MaskData: pointer): cint
##  マスクスクリーンにメモリ上のビットマップデータで指定矩形内を塗りつぶすように転送する

proc SetUseMaskScreenFlag*(ValidFlag: cint): cint
##  マスクスクリーンを使用するかどうかを設定する( ValidFlag:使用するかどうか( TRUE:使用する  FALSE:使用しない( デフォルト ) )

proc GetUseMaskScreenFlag*(): cint
##  マスクスクリーンを使用するかどうかを取得する

proc FillMaskScreen*(Flag: cint): cint
##  マスクスクリーンを指定の色で塗りつぶす

proc SetMaskScreenGraph*(GraphHandle: cint): cint
##  マスクスクリーンとして使用するグラフィックのハンドルを設定する、-1を渡すと解除( 引数で渡すグラフィックハンドルは MakeScreen で作成した「アルファチャンネル付きの描画対象にできるグラフィックハンドル」である必要があります( アルファチャンネルがマスクに使用されます ) )

proc SetMaskScreenGraphUseChannel*(UseChannel: cint): cint
  ##  DX_MASKGRAPH_CH_A 等
##  マスクスクリーンとして使用するグラフィックの、どのチャンネルをマスクとして使用するかを設定する( デフォルトは DX_MASKGRAPH_CH_A、 尚、DX_MASKGRAPH_CH_A以外を使用する場合はグラフィックスデバイスがシェーダーモデル2.0以降に対応している必要があります )

proc InitMask*(): cint
##  マスクハンドルをすべて削除する

proc MakeMask*(Width: cint; Height: cint): cint
##  マスクハンドルを作成する

proc GetMaskSize*(WidthBuf: ptr cint; HeightBuf: ptr cint; MaskHandle: cint): cint
##  マスクハンドルが持つマスクイメージのサイズを取得する

proc GetMaskBaseImageInfo*(BaseImage: ptr BASEIMAGE; MaskHandle: cint): cint
##  マスクハンドルが持つマスクイメージのBASEIMAGEデータを取得する( フォーマットが変更されるような操作をすると正常に動作しなくなります、あと、ReleaseBaseImage は実行する必要はありません )

proc SetDataToMask*(Width: cint; Height: cint; MaskData: pointer; MaskHandle: cint): cint
##  マスクハンドルにビットマップイメージを転送する

proc DeleteMask*(MaskHandle: cint): cint
##  マスクハンドルを削除する

proc GraphImageBltToMask*(BaseImage: ptr BASEIMAGE; ImageX: cint; ImageY: cint;
                         MaskHandle: cint): cint
##  マスクハンドルにBASEIMAGEデータを転送する

proc LoadMask*(FileName: ptr TCHAR): cint
##  画像ファイルを読み込みマスクハンドルを作成する

proc LoadMaskWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  画像ファイルを読み込みマスクハンドルを作成する

proc LoadDivMask*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                 YSize: cint; HandleArray: ptr cint): cint
##  画像ファイルを分割読み込みしてマスクハンドルを作成する

proc LoadDivMaskWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                           AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                           YSize: cint; HandleArray: ptr cint): cint
##  画像ファイルを分割読み込みしてマスクハンドルを作成する

proc CreateMaskFromMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上にある画像ファイルイメージを読み込みマスクハンドルを作成する

proc CreateDivMaskFromMem*(FileImage: pointer; FileImageSize: cint; AllNum: cint;
                          XNum: cint; YNum: cint; XSize: cint; YSize: cint;
                          HandleArray: ptr cint): cint
##  メモリ上にある画像ファイルイメージを分割読み込みしてマスクハンドルを作成する

proc DrawMask*(x: cint; y: cint; MaskHandle: cint; TransMode: cint): cint
##  マスクスクリーンにマスクハンドルの持つマスクイメージを書き込む

proc DrawFormatStringMask*(x: cint; y: cint; Flag: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  書式指定ありの文字列をマスクスクリーンに描画する

proc DrawFormatStringMaskToHandle*(x: cint; y: cint; Flag: cint; FontHandle: cint;
                                  FormatString: ptr TCHAR): cint {.varargs.}
##  書式指定ありの文字列をマスクスクリーンに描画する( フォントハンドル指定版 )( SetFontCacheToTextureFlag( FALSE ) ; にして作成したフォントハンドルのみ使用可能 )

proc DrawStringMask*(x: cint; y: cint; Flag: cint; String: ptr TCHAR): cint
##  文字列をマスクスクリーンに描画する

proc DrawNStringMask*(x: cint; y: cint; Flag: cint; String: ptr TCHAR;
                     StringLength: csize_t): cint
##  文字列をマスクスクリーンに描画する

proc DrawStringMaskToHandle*(x: cint; y: cint; Flag: cint; FontHandle: cint;
                            String: ptr TCHAR): cint
##  文字列をマスクスクリーンに描画する( フォントハンドル指定版 )( SetFontCacheToTextureFlag( FALSE ) ; にして作成したフォントハンドルのみ使用可能 )

proc DrawNStringMaskToHandle*(x: cint; y: cint; Flag: cint; FontHandle: cint;
                             String: ptr TCHAR; StringLength: csize_t): cint
##  文字列をマスクスクリーンに描画する( フォントハンドル指定版 )( SetFontCacheToTextureFlag( FALSE ) ; にして作成したフォントハンドルのみ使用可能 )

proc DrawFillMask*(x1: cint; y1: cint; x2: cint; y2: cint; MaskHandle: cint): cint
##  マスクハンドルが持つマスクイメージをマスクスクリーンいっぱいに描画する( タイル状に並べる )

proc SetMaskReverseEffectFlag*(ReverseFlag: cint): cint
##  マスクイメージ内の数値に対する効果を逆転させる( 旧バージョンとの互換性の為の機能 )

proc GetMaskScreenData*(x1: cint; y1: cint; x2: cint; y2: cint; MaskHandle: cint): cint
##  マスクスクリーンの指定矩形部分をマスクハンドルに転送する

proc GetMaskUseFlag*(): cint
##  マスクスクリーンを使用する設定になっているかどうかを取得する

{.pop.}
