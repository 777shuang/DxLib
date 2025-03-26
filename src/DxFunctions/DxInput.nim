import ../DxDll
{.push dynlib: DLL, importc.}

##  DxInput.cpp関数プロトタイプ宣言
##  入力状態取得関数

proc CheckHitKey*(KeyCode: cint): cint
##  キーボードの押下状態を取得する

proc CheckHitKeyAll*(CheckType: cint = DX_CHECKINPUT_ALL): cint
##  どれか一つでもキーが押されているかどうかを取得( 押されていたら戻り値が 0 以外になる )

proc GetHitKeyStateAll*(KeyStateArray: ptr DX_CHAR): cint
##  すべてのキーの押下状態を取得する( KeyStateBuf:char型256個分の配列の先頭アドレス )

proc GetHitKeyStateAllEx*(KeyStateArray: ptr cint): cint
##  すべてのキーの押下状態を取得する( KeyStateBuf:int型256個分の配列の先頭アドレス、初回は配列の全要素に 0 が代入されている必要があります、配列の各要素の状態　0:押されていない　1：押された１回め　2以上：押され続けている回数　-1：押されて離された１回め　-2以下：押されて離されてからの回数 )

proc GetJoypadNum*(): cint
##  ジョイパッドが接続されている数を取得する

proc GetJoypadButtonNum*(InputType: cint): cint
##  ジョイパッドのボタンの数を取得する

proc GetJoypadInputState*(InputType: cint): cint
##  ジョイパッドの入力状態を取得する

proc GetJoypadAnalogInput*(XBuf: ptr cint; YBuf: ptr cint; InputType: cint): cint
##  ジョイパッドのアナログ的なスティック入力情報を得る

proc GetJoypadAnalogInputRight*(XBuf: ptr cint; YBuf: ptr cint; InputType: cint): cint
##  ( 使用非推奨 )ジョイパッドのアナログ的なスティック入力情報を得る(右スティック用)

proc GetJoypadDirectInputState*(InputType: cint; DInputState: ptr DINPUT_JOYSTATE): cint
##  DirectInput から得られるジョイパッドの生のデータを取得する( DX_INPUT_KEY や DX_INPUT_KEY_PAD1 など、キーボードが絡むタイプを InputType に渡すとエラーとなり -1 を返す )

proc CheckJoypadXInput*(InputType: cint): cint
##  指定の入力デバイスが XInput に対応しているかどうかを取得する( 戻り値  TRUE:XInput対応の入力デバイス  FALSE:XInput非対応の入力デバイス   -1:エラー )( DX_INPUT_KEY や DX_INPUT_KEY_PAD1 など、キーボードが絡むタイプを InputType に渡すとエラーとなり -1 を返す )

proc GetJoypadType*(InputType: cint): cint
##  ジョイパッドのタイプを取得する( 戻り値  -1:エラー  0以上:ジョイパッドタイプ( DX_PADTYPE_XBOX_360 など ) )

proc GetJoypadXInputState*(InputType: cint; XInputState: ptr XINPUT_STATE): cint
##  XInput から得られる入力デバイス( Xbox360コントローラ等 )の生のデータを取得する( XInput非対応のパッドの場合はエラーとなり -1 を返す、DX_INPUT_KEY や DX_INPUT_KEY_PAD1 など、キーボードが絡むタイプを InputType に渡すとエラーとなり -1 を返す )

proc SetJoypadInputToKeyInput*(InputType: cint; PadInput: cint; KeyInput1: cint;
                              KeyInput2: cint = -1; KeyInput3: cint = -1;
                              KeyInput4: cint = -1): cint
##  ジョイパッドの入力に対応したキーボードの入力を設定する( InputType:設定を変更するパッドの識別子( DX_INPUT_PAD1等 )　　PadInput:設定を変更するパッドボタンの識別子( PAD_INPUT_1 等 )　　KeyInput1:PadInput を押下したことにするキーコード( KEY_INPUT_A など )その１　　KeyInput2:その２、-1で設定なし　　KeyInput3:その３、-1で設定なし　　KeyInput4:その４、-1で設定なし )

proc SetJoypadDeadZone*(InputType: cint; Zone: cdouble): cint
##  ジョイパッドの無効ゾーンの設定を行う( InputType:設定を変更するパッドの識別子( DX_INPUT_PAD1等 )   Zone:新しい無効ゾーン( 0.0 ～ 1.0 )、デフォルト値は 0.35 )

proc GetJoypadDeadZone*(InputType: cint): cdouble
##  ジョイパッドの無効ゾーンの設定を取得する( InputType:設定を変更するパッドの識別子( DX_INPUT_PAD1等 )   戻り値:無効ゾーン( 0.0 ～ 1.0 ) )

proc SetJoypadDefaultDeadZoneAll*(Zone: cdouble): cint
##  ジョイパッドのデフォルトの無効ゾーンを設定する( Zone:新しい無効ゾーン( 0.0 ～ 1.0 )、デフォルト値は 0.35 )

proc GetJoypadDefaultDeadZoneAll*(): cdouble
##  ジョイパッドのデフォルトの無効ゾーンを取得する( 戻り値:無効ゾーン( 0.0 ～ 1.0 ) )

proc StartJoypadVibration*(InputType: cint; Power: cint; Time: cint;
                          EffectIndex: cint = -1): cint
##  ジョイパッドの振動を開始する

proc StopJoypadVibration*(InputType: cint; EffectIndex: cint = -1): cint
##  ジョイパッドの振動を停止する

proc GetJoypadPOVState*(InputType: cint; POVNumber: cint): cint
##  ジョイパッドのＰＯＶ入力の状態を得る( 戻り値　指定のPOVデータの角度、単位は角度の１００倍( 90度なら 9000 ) 中心位置にある場合は -1 が返る )

proc ReSetupJoypad*(): cint
##  ジョイパッドの再セットアップを行う( 新たに接続されたジョイパッドがあったら検出される )

proc ReSetupInputSystem*(): cint
##  入力システムの再セットアップを行う( 戻り値  0:正常終了  -1:エラー発生 )

proc SetUseJoypadVibrationFlag*(Flag: cint): cint
##  ジョイパッドの振動機能を使用するかどうかを設定する( TRUE:使用する　　FALSE:使用しない )
##  画像処理系関数プロトタイプ宣言
##  グラフィックハンドル作成関係関数

proc MakeGraph*(SizeX: cint; SizeY: cint; NotUse3DFlag: cint = FALSE): cint
##  指定サイズのグラフィックハンドルを作成する

proc MakeScreen*(SizeX: cint; SizeY: cint; UseAlphaChannel: cint = FALSE): cint
##  SetDrawScreen で描画対象にできるグラフィックハンドルを作成する

proc DerivationGraph*(SrcX: cint; SrcY: cint; Width: cint; Height: cint;
                     SrcGraphHandle: cint): cint
##  指定のグラフィックハンドルの指定部分だけを抜き出して新たなグラフィックハンドルを作成する

proc DerivationGraphF*(SrcX: cfloat; SrcY: cfloat; Width: cfloat; Height: cfloat;
                      SrcGraphHandle: cint): cint
##  指定のグラフィックハンドルの指定部分だけを抜き出して新たなグラフィックハンドルを作成する( float版 )

proc DeleteGraph*(GrHandle: cint): cint
##  グラフィックハンドルを削除する

proc DeleteSharingGraph*(GrHandle: cint): cint
##  指定のグラフィックハンドルと、同じグラフィックハンドルから派生しているグラフィックハンドル( DerivationGraph で派生したハンドル、LoadDivGraph 読み込んで作成された複数のハンドル )を一度に削除する

proc GetGraphNum*(): cint
##  有効なグラフィックハンドルの数を取得する

proc FillGraph*(GrHandle: cint; Red: cint; Green: cint; Blue: cint; Alpha: cint = 255): cint
##  グラフィックハンドルを指定の色で塗りつぶす

proc FillRectGraph*(GrHandle: cint; x: cint; y: cint; Width: cint; Height: cint; Red: cint;
                   Green: cint; Blue: cint; Alpha: cint = 255): cint
##  グラフィックハンドルの指定の範囲を指定の色で塗りつぶす

proc SetGraphLostFlag*(GrHandle: cint; LostFlag: ptr cint): cint
##  指定のグラフィックハンドルが削除された際に 1 にする変数のアドレスを設定する

proc InitGraph*(): cint
##  すべてのグラフィックハンドルを削除する

proc ReloadFileGraphAll*(): cint
##  ファイルから画像を読み込んだ全てのグラフィックハンドルについて、再度ファイルから画像を読み込む
##  シャドウマップハンドル関係関数

proc MakeShadowMap*(SizeX: cint; SizeY: cint): cint
##  シャドウマップハンドルを作成する

proc DeleteShadowMap*(SmHandle: cint): cint
##  シャドウマップハンドルを削除する

proc SetShadowMapLightDirection*(SmHandle: cint; Direction: VECTOR): cint
##  シャドウマップが想定するライトの方向を設定する

proc ShadowMap_DrawSetup*(SmHandle: cint): cint
##  シャドウマップへの描画の準備を行う

proc ShadowMap_DrawEnd*(): cint
##  シャドウマップへの描画を終了する

proc SetUseShadowMap*(SmSlotIndex: cint; SmHandle: cint): cint
##  描画で使用するシャドウマップを指定する、有効なスロットは０～２、SmHandle に -1 を渡すと指定のスロットのシャドウマップを解除

proc SetShadowMapDrawArea*(SmHandle: cint; MinPosition: VECTOR; MaxPosition: VECTOR): cint
##  シャドウマップに描画する際の範囲を設定する( この関数で描画範囲を設定しない場合は視錐台を拡大した範囲が描画範囲となる )

proc ResetShadowMapDrawArea*(SmHandle: cint): cint
##  SetShadowMapDrawArea の設定を解除する

proc SetShadowMapAdjustDepth*(SmHandle: cint; Depth: cfloat): cint
##  シャドウマップを使用した描画時の補正深度を設定する

proc GetShadowMapViewProjectionMatrix*(SmHandle: cint; MatrixBuffer: ptr MATRIX): cint
##  シャドウマップ作成時や適用時に使用するビュー行列と射影行列を乗算した行列を取得する

proc TestDrawShadowMap*(SmHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint): cint
##  シャドウマップを画面にテスト描画する
##  グラフィックハンドルへの画像転送関数

proc BltBmpToGraph*(BmpColorData: ptr COLORDATA; RgbBmp: HBITMAP; AlphaBmp: HBITMAP;
                   CopyPointX: cint; CopyPointY: cint; GrHandle: cint): cint
##  ＢＭＰの内容をグラフィックハンドルに転送

proc BltBmpToDivGraph*(BmpColorData: ptr COLORDATA; RgbBmp: HBITMAP;
                      AlphaBmp: HBITMAP; AllNum: cint; XNum: cint; YNum: cint;
                      Width: cint; Height: cint; GrHandle: ptr cint; ReverseFlag: cint): cint
##  ＢＭＰの内容を分割作成したグラフィックハンドルたちに転送

proc BltBmpOrGraphImageToGraph*(BmpColorData: ptr COLORDATA; RgbBmp: HBITMAP;
                               AlphaBmp: HBITMAP; BmpFlag: cint;
                               RgbBaseImage: ptr BASEIMAGE;
                               AlphaBaseImage: ptr BASEIMAGE; CopyPointX: cint;
                               CopyPointY: cint; GrHandle: cint): cint
##  ＢＭＰ か BASEIMAGE をグラフィックハンドルに転送

proc BltBmpOrGraphImageToGraph2*(BmpColorData: ptr COLORDATA; RgbBmp: HBITMAP;
                                AlphaBmp: HBITMAP; BmpFlag: cint;
                                RgbBaseImage: ptr BASEIMAGE;
                                AlphaBaseImage: ptr BASEIMAGE; SrcRect: ptr RECT;
                                DestX: cint; DestY: cint; GrHandle: cint): cint
##  ＢＭＰ か BASEIMAGE の指定の領域をグラフィックハンドルに転送

proc BltBmpOrGraphImageToDivGraph*(BmpColorData: ptr COLORDATA; RgbBmp: HBITMAP;
                                  AlphaBmp: HBITMAP; BmpFlag: cint;
                                  RgbBaseImage: ptr BASEIMAGE;
                                  AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                  XNum: cint; YNum: cint; Width: cint; Height: cint;
                                  GrHandle: ptr cint; ReverseFlag: cint): cint
##  ＢＭＰ か BASEIMAGE を分割作成したグラフィックハンドルたちに転送

proc BltBmpOrGraphImageToDivGraphF*(BmpColorData: ptr COLORDATA; RgbBmp: HBITMAP;
                                   AlphaBmp: HBITMAP; BmpFlag: cint;
                                   RgbBaseImage: ptr BASEIMAGE;
                                   AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                   XNum: cint; YNum: cint; Width: cfloat;
                                   Height: cfloat; GrHandle: ptr cint;
                                   ReverseFlag: cint): cint
##  ＢＭＰ か BASEIMAGE を分割作成したグラフィックハンドルたちに転送( float型 )
##  画像からグラフィックハンドルを作成する関数

proc LoadBmpToGraph*(FileName: cstring; TextureFlag: cint; ReverseFlag: cint;
                    SurfaceMode: cint = DX_MOVIESURFACE_NORMAL): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadBmpToGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                              TextureFlag: cint; ReverseFlag: cint;
                              SurfaceMode: cint = DX_MOVIESURFACE_NORMAL): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadGraph*(FileName: cstring; NotUse3DFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                         NotUse3DFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadReverseGraph*(FileName: cstring; NotUse3DFlag: cint = FALSE): cint
##  画像ファイルを反転したものでグラフィックハンドルを作成する

proc LoadReverseGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                NotUse3DFlag: cint = FALSE): cint
##  画像ファイルを反転したものでグラフィックハンドルを作成する

proc LoadDivGraph*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                  YSize: cint; HandleArray: ptr cint; NotUse3DFlag: cint = FALSE;
                  XStride: cint = 0; YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                            AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                            YSize: cint; HandleArray: ptr cint;
                            NotUse3DFlag: cint = FALSE; XStride: cint = 0;
                            YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivGraphF*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                   XSize: cfloat; YSize: cfloat; HandleArray: ptr cint;
                   NotUse3DFlag: cint = FALSE; XStride: cfloat = 0; YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivGraphFWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                             AllNum: cint; XNum: cint; YNum: cint; XSize: cfloat;
                             YSize: cfloat; HandleArray: ptr cint;
                             NotUse3DFlag: cint = FALSE; XStride: cfloat = 0;
                             YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraph*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                       SizeX: cint; SizeY: cint; HandleArray: ptr cint;
                       TextureFlag: cint; ReverseFlag: cint; XStride: cint = 0;
                       YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                 AllNum: cint; XNum: cint; YNum: cint; SizeX: cint;
                                 SizeY: cint; HandleArray: ptr cint;
                                 TextureFlag: cint; ReverseFlag: cint;
                                 XStride: cint = 0; YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraphF*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                        SizeX: cfloat; SizeY: cfloat; HandleArray: ptr cint;
                        TextureFlag: cint; ReverseFlag: cint; XStride: cfloat = 0;
                        YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraphFWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                  AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat;
                                  SizeY: cfloat; HandleArray: ptr cint;
                                  TextureFlag: cint; ReverseFlag: cint;
                                  XStride: cfloat = 0; YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraph*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                         XSize: cint; YSize: cint; HandleArray: ptr cint;
                         NotUse3DFlag: cint = FALSE; XStride: cint = 0;
                         YStride: cint = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                   AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                                   YSize: cint; HandleArray: ptr cint;
                                   NotUse3DFlag: cint = FALSE; XStride: cint = 0;
                                   YStride: cint = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraphF*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                          XSize: cfloat; YSize: cfloat; HandleArray: ptr cint;
                          NotUse3DFlag: cint = FALSE; XStride: cfloat = 0;
                          YStride: cfloat = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraphFWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                    AllNum: cint; XNum: cint; YNum: cint;
                                    XSize: cfloat; YSize: cfloat;
                                    HandleArray: ptr cint;
                                    NotUse3DFlag: cint = FALSE; XStride: cfloat = 0;
                                    YStride: cfloat = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadBlendGraph*(FileName: cstring): cint
##  画像ファイルからブレンド用グラフィックハンドルを作成する

proc LoadBlendGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  画像ファイルからブレンド用グラフィックハンドルを作成する

proc CreateGraphFromMem*(RGBFileImage: pointer; RGBFileImageSize: cint;
                        AlphaFileImage: pointer = nil; AlphaFileImageSize: cint = 0;
                        TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE): cint
##  メモリ上の画像イメージからグラフィックハンドルを作成する

proc ReCreateGraphFromMem*(RGBFileImage: pointer; RGBFileImageSize: cint;
                          GrHandle: cint; AlphaFileImage: pointer = nil;
                          AlphaFileImageSize: cint = 0; TextureFlag: cint = TRUE;
                          ReverseFlag: cint = FALSE): cint
##  メモリ上の画像イメージから既存のグラフィックハンドルにデータを転送する

proc CreateDivGraphFromMem*(RGBFileImage: pointer; RGBFileImageSize: cint;
                           AllNum: cint; XNum: cint; YNum: cint; SizeX: cint;
                           SizeY: cint; HandleArray: ptr cint;
                           TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                           AlphaFileImage: pointer = nil;
                           AlphaFileImageSize: cint = 0): cint
##  メモリ上の画像イメージから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromMem*(RGBFileImage: pointer; RGBFileImageSize: cint;
                            AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat;
                            SizeY: cfloat; HandleArray: ptr cint;
                            TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                            AlphaFileImage: pointer = nil;
                            AlphaFileImageSize: cint = 0): cint
##  メモリ上の画像イメージから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromMem*(RGBFileImage: pointer; RGBFileImageSize: cint;
                             AllNum: cint; XNum: cint; YNum: cint; SizeX: cint;
                             SizeY: cint; HandleArray: ptr cint;
                             TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                             AlphaFileImage: pointer = nil;
                             AlphaFileImageSize: cint = 0): cint
##  メモリ上の画像イメージから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromMem*(RGBFileImage: pointer; RGBFileImageSize: cint;
                              AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat;
                              SizeY: cfloat; HandleArray: ptr cint;
                              TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                              AlphaFileImage: pointer = nil;
                              AlphaFileImageSize: cint = 0): cint
##  メモリ上の画像イメージから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc CreateGraphFromBmp*(RGBBmpInfo: ptr BITMAPINFO; RGBBmpImage: pointer;
                        AlphaBmpInfo: ptr BITMAPINFO = nil;
                        AlphaBmpImage: pointer = nil; TextureFlag: cint = TRUE;
                        ReverseFlag: cint = FALSE): cint
##  ビットマップデータからグラフィックハンドルを作成する

proc ReCreateGraphFromBmp*(RGBBmpInfo: ptr BITMAPINFO; RGBBmpImage: pointer;
                          GrHandle: cint; AlphaBmpInfo: ptr BITMAPINFO = nil;
                          AlphaBmpImage: pointer = nil; TextureFlag: cint = TRUE;
                          ReverseFlag: cint = FALSE): cint
##  ビットマップデータから既存のグラフィックハンドルにデータを転送する

proc CreateDivGraphFromBmp*(RGBBmpInfo: ptr BITMAPINFO; RGBBmpImage: pointer;
                           AllNum: cint; XNum: cint; YNum: cint; SizeX: cint;
                           SizeY: cint; HandleArray: ptr cint;
                           TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                           AlphaBmpInfo: ptr BITMAPINFO = nil;
                           AlphaBmpImage: pointer = nil): cint
##  ビットマップデータから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromBmp*(RGBBmpInfo: ptr BITMAPINFO; RGBBmpImage: pointer;
                            AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat;
                            SizeY: cfloat; HandleArray: ptr cint;
                            TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                            AlphaBmpInfo: ptr BITMAPINFO = nil;
                            AlphaBmpImage: pointer = nil): cint
##  ビットマップデータから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromBmp*(RGBBmpInfo: ptr BITMAPINFO; RGBBmpImage: pointer;
                             AllNum: cint; XNum: cint; YNum: cint; SizeX: cint;
                             SizeY: cint; HandleArray: ptr cint;
                             TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                             AlphaBmpInfo: ptr BITMAPINFO = nil;
                             AlphaBmpImage: pointer = nil): cint
##  ビットマップデータから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromBmp*(RGBBmpInfo: ptr BITMAPINFO; RGBBmpImage: pointer;
                              AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat;
                              SizeY: cfloat; HandleArray: ptr cint;
                              TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE;
                              AlphaBmpInfo: ptr BITMAPINFO = nil;
                              AlphaBmpImage: pointer = nil): cint
##  ビットマップデータから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc CreateDXGraph*(RgbBaseImage: ptr BASEIMAGE; AlphaBaseImage: ptr BASEIMAGE;
                   TextureFlag: cint): cint
##  基本イメージデータからサイズを割り出し、それに合ったグラフィックハンドルを作成する

proc CreateGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                               TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE): cint
##  基本イメージデータからグラフィックハンドルを作成する

proc ReCreateGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE; GrHandle: cint;
                                 TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存のグラフィックハンドルにデータを転送する

proc CreateDivGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE; AllNum: cint;
                                  XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                  HandleArray: ptr cint; TextureFlag: cint = TRUE;
                                  ReverseFlag: cint = FALSE): cint
##  基本イメージデータから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromGraphImage*(RgbBaseImage: ptr BASEIMAGE; AllNum: cint;
                                   XNum: cint; YNum: cint; SizeX: cfloat;
                                   SizeY: cfloat; HandleArray: ptr cint;
                                   TextureFlag: cint = TRUE;
                                   ReverseFlag: cint = FALSE): cint
##  基本イメージデータから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE; AllNum: cint;
                                    XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                    HandleArray: ptr cint;
                                    TextureFlag: cint = TRUE;
                                    ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromGraphImage*(RgbBaseImage: ptr BASEIMAGE; AllNum: cint;
                                     XNum: cint; YNum: cint; SizeX: cfloat;
                                     SizeY: cfloat; HandleArray: ptr cint;
                                     TextureFlag: cint = TRUE;
                                     ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc CreateGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                               AlphaBaseImage: ptr BASEIMAGE;
                               TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE): cint
##  基本イメージデータからグラフィックハンドルを作成する

proc ReCreateGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                                 AlphaBaseImage: ptr BASEIMAGE; GrHandle: cint;
                                 TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存のグラフィックハンドルにデータを転送する

proc CreateDivGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                                  AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                  XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                  HandleArray: ptr cint; TextureFlag: cint = TRUE;
                                  ReverseFlag: cint = FALSE): cint
##  基本イメージデータから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                                   AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                   XNum: cint; YNum: cint; SizeX: cfloat;
                                   SizeY: cfloat; HandleArray: ptr cint;
                                   TextureFlag: cint = TRUE;
                                   ReverseFlag: cint = FALSE): cint
##  基本イメージデータから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                                    AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                    XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                    HandleArray: ptr cint;
                                    TextureFlag: cint = TRUE;
                                    ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromGraphImage*(RgbBaseImage: ptr BASEIMAGE;
                                     AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                     XNum: cint; YNum: cint; SizeX: cfloat;
                                     SizeY: cfloat; HandleArray: ptr cint;
                                     TextureFlag: cint = TRUE;
                                     ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc CreateGraphFromGraphImage2*(RgbBaseImage: ptr BASEIMAGE;
                                AlphaBaseImage: ptr BASEIMAGE;
                                TextureFlag: cint = TRUE; ReverseFlag: cint = FALSE): cint
##  基本イメージデータからグラフィックハンドルを作成する

proc ReCreateGraphFromGraphImage2*(RgbBaseImage: ptr BASEIMAGE;
                                  AlphaBaseImage: ptr BASEIMAGE; GrHandle: cint;
                                  TextureFlag: cint = TRUE;
                                  ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存のグラフィックハンドルにデータを転送する

proc CreateDivGraphFromGraphImage2*(RgbBaseImage: ptr BASEIMAGE;
                                   AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                   XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                   HandleArray: ptr cint; TextureFlag: cint = TRUE;
                                   ReverseFlag: cint = FALSE): cint
##  基本イメージデータから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromGraphImage2*(RgbBaseImage: ptr BASEIMAGE;
                                    AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                    XNum: cint; YNum: cint; SizeX: cfloat;
                                    SizeY: cfloat; HandleArray: ptr cint;
                                    TextureFlag: cint = TRUE;
                                    ReverseFlag: cint = FALSE): cint
##  基本イメージデータから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromGraphImage2*(RgbBaseImage: ptr BASEIMAGE;
                                     AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                     XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                     HandleArray: ptr cint;
                                     TextureFlag: cint = TRUE;
                                     ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromGraphImage2*(RgbBaseImage: ptr BASEIMAGE;
                                      AlphaBaseImage: ptr BASEIMAGE; AllNum: cint;
                                      XNum: cint; YNum: cint; SizeX: cfloat;
                                      SizeY: cfloat; HandleArray: ptr cint;
                                      TextureFlag: cint = TRUE;
                                      ReverseFlag: cint = FALSE): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc CreateGraph*(Width: cint; Height: cint; Pitch: cint; RGBImage: pointer;
                 AlphaImage: pointer = nil; GrHandle: cint = -1): cint
##  メモリ上のビットマップイメージからグラフィックハンドルを作成する

proc CreateDivGraph*(Width: cint; Height: cint; Pitch: cint; RGBImage: pointer;
                    AllNum: cint; XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                    HandleArray: ptr cint; AlphaImage: pointer = nil): cint
##  メモリ上のビットマップイメージから分割グラフィックハンドルを作成する

proc CreateDivGraphF*(Width: cint; Height: cint; Pitch: cint; RGBImage: pointer;
                     AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat; SizeY: cfloat;
                     HandleArray: ptr cint; AlphaImage: pointer = nil): cint
##  メモリ上のビットマップイメージから分割グラフィックハンドルを作成する( float版 )

proc ReCreateGraph*(Width: cint; Height: cint; Pitch: cint; RGBImage: pointer;
                   GrHandle: cint; AlphaImage: pointer = nil): cint
##  メモリ上のビットマップイメージからグラフィックハンドルを再作成する

proc CreateBlendGraphFromSoftImage*(SIHandle: cint): cint
##  ソフトウエアで扱うイメージからブレンド用画像グラフィックハンドルを作成する( -1:エラー  -1以外:ブレンド用グラフィックハンドル )

proc CreateGraphFromSoftImage*(SIHandle: cint): cint
##  ソフトウエアで扱うイメージからグラフィックハンドルを作成する( -1:エラー  -1以外:グラフィックハンドル )

proc CreateGraphFromRectSoftImage*(SIHandle: cint; x: cint; y: cint; SizeX: cint;
                                  SizeY: cint): cint
##  ソフトウエアで扱うイメージの指定の領域を使ってグラフィックハンドルを作成する( -1:エラー  -1以外:グラフィックハンドル )

proc ReCreateGraphFromSoftImage*(SIHandle: cint; GrHandle: cint): cint
##  ソフトウエアで扱うイメージから既存のグラフィックハンドルに画像データを転送する

proc ReCreateGraphFromRectSoftImage*(SIHandle: cint; x: cint; y: cint; SizeX: cint;
                                    SizeY: cint; GrHandle: cint): cint
##  ソフトウエアで扱うイメージから既存のグラフィックハンドルに画像データを転送する

proc CreateDivGraphFromSoftImage*(SIHandle: cint; AllNum: cint; XNum: cint; YNum: cint;
                                 SizeX: cint; SizeY: cint; HandleArray: ptr cint): cint
##  ソフトウエアで扱うイメージから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromSoftImage*(SIHandle: cint; AllNum: cint; XNum: cint;
                                  YNum: cint; SizeX: cfloat; SizeY: cfloat;
                                  HandleArray: ptr cint): cint
##  ソフトウエアで扱うイメージから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromSoftImage*(SIHandle: cint; AllNum: cint; XNum: cint;
                                   YNum: cint; SizeX: cint; SizeY: cint;
                                   HandleArray: ptr cint): cint
##  ソフトウエアで扱うイメージから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromSoftImage*(SIHandle: cint; AllNum: cint; XNum: cint;
                                    YNum: cint; SizeX: cfloat; SizeY: cfloat;
                                    HandleArray: ptr cint): cint
##  ソフトウエアで扱うイメージから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc CreateGraphFromBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータからグラフィックハンドルを作成する

proc CreateGraphFromRectBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint;
                                  SizeX: cint; SizeY: cint): cint
##  基本イメージデータの指定の領域を使ってグラフィックハンドルを作成する

proc ReCreateGraphFromBaseImage*(BaseImage: ptr BASEIMAGE; GrHandle: cint): cint
##  基本イメージデータから既存のグラフィックハンドルに画像データを転送する

proc ReCreateGraphFromRectBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint;
                                    SizeX: cint; SizeY: cint; GrHandle: cint): cint
##  基本イメージデータの指定の領域を使って既存のグラフィックハンドルに画像データを転送する

proc CreateDivGraphFromBaseImage*(BaseImage: ptr BASEIMAGE; AllNum: cint; XNum: cint;
                                 YNum: cint; SizeX: cint; SizeY: cint;
                                 HandleArray: ptr cint): cint
##  基本イメージデータから分割グラフィックハンドルを作成する

proc CreateDivGraphFFromBaseImage*(BaseImage: ptr BASEIMAGE; AllNum: cint; XNum: cint;
                                  YNum: cint; SizeX: cfloat; SizeY: cfloat;
                                  HandleArray: ptr cint): cint
##  基本イメージデータから分割グラフィックハンドルを作成する( float版 )

proc ReCreateDivGraphFromBaseImage*(BaseImage: ptr BASEIMAGE; AllNum: cint;
                                   XNum: cint; YNum: cint; SizeX: cint; SizeY: cint;
                                   HandleArray: ptr cint): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する

proc ReCreateDivGraphFFromBaseImage*(BaseImage: ptr BASEIMAGE; AllNum: cint;
                                    XNum: cint; YNum: cint; SizeX: cfloat;
                                    SizeY: cfloat; HandleArray: ptr cint): cint
##  基本イメージデータから既存の分割グラフィックハンドルにデータを転送する( float版 )

proc ReloadGraph*(FileName: cstring; GrHandle: cint; ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルへ画像データを転送する

proc ReloadGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                           GrHandle: cint; ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルへ画像データを転送する

proc ReloadDivGraph*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                    XSize: cint; YSize: cint; HandleArray: ptr cint;
                    ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する

proc ReloadDivGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                              AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                              YSize: cint; HandleArray: ptr cint;
                              ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する

proc ReloadDivGraphF*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                     XSize: cfloat; YSize: cfloat; HandleArray: ptr cint;
                     ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する( float版 )

proc ReloadDivGraphFWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                               AllNum: cint; XNum: cint; YNum: cint; XSize: cfloat;
                               YSize: cfloat; HandleArray: ptr cint;
                               ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する( float版 )

proc ReloadReverseGraph*(FileName: cstring; GrHandle: cint): cint
##  ReloadGraph の画像反転処理追加版

proc ReloadReverseGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                  GrHandle: cint): cint
##  ReloadGraph の画像反転処理追加版

proc ReloadReverseDivGraph*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                           XSize: cint; YSize: cint; HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版

proc ReloadReverseDivGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                     AllNum: cint; XNum: cint; YNum: cint;
                                     XSize: cint; YSize: cint; HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版

proc ReloadReverseDivGraphF*(FileName: cstring; AllNum: cint; XNum: cint; YNum: cint;
                            XSize: cfloat; YSize: cfloat; HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版( float版 )

proc ReloadReverseDivGraphFWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                      AllNum: cint; XNum: cint; YNum: cint;
                                      XSize: cfloat; YSize: cfloat;
                                      HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版( float版 )
##  グラフィックハンドル作成時設定係関数

proc SetGraphColorBitDepth*(ColorBitDepth: cint): cint
##  SetCreateGraphColorBitDepth の旧名称

proc GetGraphColorBitDepth*(): cint
##  GetCreateGraphColorBitDepth の旧名称

proc SetCreateGraphColorBitDepth*(BitDepth: cint): cint
##  作成するグラフィックハンドルの色深度を設定する

proc GetCreateGraphColorBitDepth*(): cint
##  作成するグラフィックハンドルの色深度を取得する

proc SetCreateGraphChannelBitDepth*(BitDepth: cint): cint
##  作成するグラフィックハンドルの１チャンネル辺りのビット深度を設定する

proc GetCreateGraphChannelBitDepth*(): cint
##  作成するグラフィックハンドルの１チャンネル辺りのビット深度を取得する

proc SetCreateGraphInitGraphDelete*(Flag: cint): cint
##  作成するグラフィックハンドルを InitGraph() で削除されるかを設定する( Flag  TRUE:InitGraphで削除される(デフォルト)  FALSE:InitGraphで削除されない )

proc GetCreateGraphInitGraphDelete*(): cint
##  作成するグラフィックハンドルを InitGraph() で削除されるかを取得する( Flag  TRUE:InitGraphで削除される(デフォルト)  FALSE:InitGraphで削除されない )

proc SetCreateGraphHandle*(GrHandle: cint): cint
##  作成するグラフィックハンドルのハンドル値を設定する、０以下の値を渡すと設定解除( 存在しないグラフィックハンドルの値の場合のみ有効 )

proc GetCreateGraphHandle*(): cint
##  作成するグラフィックハンドルのハンドル値を取得する

proc SetCreateDivGraphHandle*(HandleArray: ptr cint; HandleNum: cint): cint
##  作成するグラフィックハンドルのハンドル値を設定する、LoadDivGraph 等の分割画像読み込み用、HandleArray に NULL を渡すと設定解除( 存在しないグラフィックハンドルの値の場合のみ有効 )

proc GetCreateDivGraphHandle*(HandleArray: ptr cint): cint
##  作成するグラフィックハンドルのハンドル値を取得する、LoadDivGraph 等の分割画像読み込み用、戻り値は SetCreateDivGraphHandle の引数 HandleNum に渡した値、HandleArray は NULL でも可

proc SetDrawValidGraphCreateFlag*(Flag: cint): cint
##  SetDrawScreen に引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成するかどうかを設定する( TRUE:描画可能グラフィックハンドルを作成する  FLASE:通常のグラフィックハンドルを作成する( デフォルト ) )

proc GetDrawValidGraphCreateFlag*(): cint
##  SetDrawScreen に引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成するかどうかを設定を取得する

proc SetDrawValidFlagOf3DGraph*(Flag: cint): cint
##  SetDrawValidGraphCreateFlag の旧名称

proc SetLeftUpColorIsTransColorFlag*(Flag: cint): cint
##  画像ファイルからグラフィックハンドルを作成する際に画像左上の色を透過色として扱うかどうかを設定する( TRUE:透過色として扱う 　FALSE:透過色として扱わない( デフォルト ) )

proc SetUsePaletteGraphFlag*(Flag: cint): cint
##  読み込む画像がパレット画像の場合、パレット画像として使用できる場合はパレット画像として使用するかどうかを設定する( TRUE:パレット画像として使用できる場合はパレット画像として使用する( デフォルト )  FALSE:パレット画像として使用できる場合もパレット画像としては使用しない( 通常タイプの画像に変換して使用する ) )

proc SetUseBlendGraphCreateFlag*(Flag: cint): cint
##  ブレンド処理用画像を作成するかどうか( 要は画像の赤成分をα成分として扱うかどうか )の設定を行う( TRUE:ブレンド画像として読み込む  FALSE:通常画像として読み込む( デフォルト ) )

proc GetUseBlendGraphCreateFlag*(): cint
##  ブレンド処理用画像を作成するかどうか( 要は画像の赤成分をα成分として扱うかどうか )の設定を取得する

proc SetUseAlphaTestGraphCreateFlag*(Flag: cint): cint
##  アルファテストを使用するグラフィックハンドルを作成するかどうかを設定する( TRUE:アルファテストを使用する( デフォルト )  FALSE:アルファテストを使用しない )

proc GetUseAlphaTestGraphCreateFlag*(): cint
##  アルファテストを使用するグラフィックハンドルを作成するかどうかを取得する

proc SetUseAlphaTestFlag*(Flag: cint): cint
##  SetUseAlphaTestGraphCreateFlag の旧名称

proc GetUseAlphaTestFlag*(): cint
##  GetUseAlphaTestGraphCreateFlag の旧名称

proc SetCubeMapTextureCreateFlag*(Flag: cint): cint
##  キューブマップテクスチャを作成するかどうかのフラグを設定する

proc GetCubeMapTextureCreateFlag*(): cint
##  キューブマップテクスチャを作成するかどうかのフラグを取得する

proc SetUseNoBlendModeParam*(Flag: cint): cint
##  SetDrawBlendMode 関数の第一引数に DX_BLENDMODE_NOBLEND を代入した際に、デフォルトでは第二引数は内部で２５５を指定したことになるが、その自動２５５化をしないかどうかを設定する( TRUE:しない(第二引数の値が使用される)   FALSE:する(第二引数の値は無視されて 255 が常に使用される)(デフォルト) )αチャンネル付き画像に対して描画を行う場合のみ意味がある関数

proc SetDrawValidAlphaChannelGraphCreateFlag*(Flag: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )αチャンネル付きグラフィックハンドルを作成するかどうかを設定する( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )( TRUE:αチャンネル付き   FALSE:αチャンネルなし( デフォルト ) )

proc GetDrawValidAlphaChannelGraphCreateFlag*(): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )αチャンネル付きグラフィックハンドルを作成するかどうかを取得する

proc SetDrawValidFloatTypeGraphCreateFlag*(Flag: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )ピクセルフォーマットが浮動小数点型のグラフィックハンドルを作成するかどうかを設定する( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )、グラフィックスデバイスが浮動小数点型のピクセルフォーマットに対応していない場合はグラフィックハンドルの作成に失敗する( TRUE:浮動小数点型　　FALSE:整数型( デフォルト ) )

proc GetDrawValidFloatTypeGraphCreateFlag*(): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )ピクセルフォーマットが浮動小数点型のグラフィックハンドルを作成するかどうかを取得する

proc SetDrawValidGraphCreateZBufferFlag*(Flag: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成する際に専用のＺバッファも作成するかどうかを設定する( TRUE:専用のＺバッファを作成する( デフォルト )  FALSE:専用のＺバッファは作成しない )

proc GetDrawValidGraphCreateZBufferFlag*(): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルを作成する際に専用のＺバッファも作成するかどうかを取得する

proc SetCreateDrawValidGraphZBufferBitDepth*(BitDepth: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するＺバッファのビット深度を設定する( BitDepth:ビット深度( 指定可能な値は 16, 24, 32 の何れか( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )

proc GetCreateDrawValidGraphZBufferBitDepth*(): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するＺバッファのビット深度を取得する

proc SetCreateDrawValidGraphMipLevels*(MipLevels: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するMipMapのレベルを設定する

proc GetCreateDrawValidGraphMipLevels*(): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するMipMapのレベルを取得する

proc SetCreateDrawValidGraphChannelNum*(ChannelNum: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用する色のチャンネル数を設定する( ChannelNum:チャンネル数( 指定可能な値は 1, 2, 4 の何れか( SetDrawValidGraphCreateFlag 関数で描画対象として使用できるグラフィックハンドルを作成するように設定されていないと効果ありません )

proc GetCreateDrawValidGraphChannelNum*(): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用する色のチャンネル数を取得する

proc SetCreateDrawValidGraphMultiSample*(Samples: cint; Quality: cint): cint
##  SetDrawScreen の引数として渡せる( 描画対象として使用できる )グラフィックハンドルに適用するマルチサンプリング( アンチエイリアシング )設定を行う( Samples:マルチサンプル処理に使用するドット数( 多いほど重くなります )  Quality:マルチサンプル処理の品質 )

proc SetDrawValidMultiSample*(Samples: cint; Quality: cint): cint
##  SetCreateDrawValidGraphMultiSample の旧名称

proc GetMultiSampleQuality*(Samples: cint): cint
##  指定のマルチサンプル数で使用できる最大クオリティ値を取得する( 戻り値がマイナスの場合は引数のサンプル数が使用できないことを示します )

proc SetUseTransColor*(Flag: cint): cint
##  透過色機能を使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )

proc SetUseTransColorGraphCreateFlag*(Flag: cint): cint
##  透過色機能を使用することを前提とした画像データの読み込み処理を行うかどうかを設定する( TRUE にすると SetDrawMode( DX_DRAWMODE_BILINEAR ); をした状態で DrawGraphF 等の浮動小数点型座標を受け取る関数で小数点以下の値を指定した場合に発生する描画結果の不自然を緩和する効果があります ( デフォルトは FALSE ) )

proc SetUseGraphAlphaChannel*(Flag: cint): cint
##  SetUseAlphaChannelGraphCreateFlag の旧名称

proc GetUseGraphAlphaChannel*(): cint
##  GetUseAlphaChannelGraphCreateFlag の旧名称

proc SetUseAlphaChannelGraphCreateFlag*(Flag: cint): cint
##  αチャンネル付きグラフィックハンドルを作成するかどうかを設定する( TRUE:αチャンネル付き   FALSE:αチャンネル無し )

proc GetUseAlphaChannelGraphCreateFlag*(): cint
##  αチャンネル付きグラフィックハンドルを作成するかどうかを取得する( TRUE:αチャンネル付き   FALSE:αチャンネル無し )

proc SetUseNotManageTextureFlag*(Flag: cint): cint
##  Direct3D の管理テクスチャ機能を使用するグラフィックハンドルを作成するかどうかを設定する( TRUE:管理機能を使用する( デフォルト )  FALSE:管理機能を使用しない )、管理機能を使用するとグラフィックスデバイスのＶＲＡＭ容量以上の画像を扱うことができる代わりにシステムメモリの使用量が増えます

proc GetUseNotManageTextureFlag*(): cint
##  Direct3D の管理テクスチャ機能を使用するグラフィックハンドルを作成するかどうかを取得する

proc SetUsePlatformTextureFormat*(PlatformTextureFormat: cint): cint
##  作成するグラフィックハンドルで使用する環境依存のテクスチャフォーマットを指定する( Direct3D9環境なら DX_TEXTUREFORMAT_DIRECT3D9_R8G8B8 など、0 を渡すと解除 )

proc GetUsePlatformTextureFormat*(): cint
##  作成するグラフィックハンドルで使用する環境依存のテクスチャフォーマットを取得する

proc SetTransColor*(Red: cint; Green: cint; Blue: cint): cint
##  作成するグラフィックハンドルに適用する透過色を設定する( Red,Green,Blue:透過色を光の３原色で表したもの( 各色０～２５５ ) )

proc GetTransColor*(Red: ptr cint; Green: ptr cint; Blue: ptr cint): cint
##  作成するグラフィックハンドルに適用する透過色を取得する

proc SetUseDivGraphFlag*(Flag: cint): cint
##  ２のｎ乗ではないサイズの画像を複数のテクスチャを使用してＶＲＡＭの無駄を省くかどうかを設定する( TRUE:複数のテクスチャを使用する   FALSE:なるべく一枚のテクスチャで済ます( デフォルト ) )、複数のテクスチャを使用する場合はＶＲＡＭ容量の節約ができる代わりに速度の低下やバイリニアフィルタリング描画時にテクスチャとテクスチャの境目が良く見るとわかる等の弊害があります

proc SetUseAlphaImageLoadFlag*(Flag: cint): cint
##  LoadGraph などの際にファイル名の末尾に _a が付いたアルファチャンネル用の画像ファイルを追加で読み込む処理を行うかどうかを設定する( TRUE:行う( デフォルト )  FALSE:行わない )

proc SetUseMaxTextureSize*(Size: cint): cint
##  使用するテクスチャーの最大サイズを設定する( デフォルトではグラフィックスデバイスが対応している最大テクスチャーサイズ、引数に 0 を渡すとデフォルト設定になります )

proc SetUseGraphBaseDataBackup*(Flag: cint): cint
##  グラフィックハンドルを作成する際に使用した画像データのバックアップをして Direct3DDevice のデバイスロスト時に使用するかどうかを設定する( TRUE:バックアップをする( デフォルト )  FALSE:バックアップをしない )、バックアップをしないとメモリの節約になりますが、復帰に掛かる時間が長くなり、メモリ上のファイルイメージからグラフィックハンドルを作成した場合は自動復帰ができないなどの弊害があります

proc GetUseGraphBaseDataBackup*(): cint
##  グラフィックハンドルを作成する際に使用した画像データのバックアップをして Direct3DDevice のデバイスロスト時に使用するかどうかを取得する

proc SetUseSystemMemGraphCreateFlag*(Flag: cint): cint
##  ( 現在効果なし )グラフィックハンドルが持つ画像データをシステムメモリ上に作成するかどうかを設定する( TRUE:システムメモリ上に作成  FALSE:ＶＲＡＭ上に作成( デフォルト ) )

proc GetUseSystemMemGraphCreateFlag*(): cint
##  ( 現在効果なし )グラフィックハンドルが持つ画像データをシステムメモリ上に作成するかどうかを取得する

proc SetUseLoadDivGraphSizeCheckFlag*(Flag: cint): cint
##  LoadDivGraph 系の分割画像読み込み関数でサイズのチェックを行うかどうかを設定する( Flag:TRUE( チェックを行う(デフォルト) )  FALSE:チェックを行わない )

proc GetUseLoadDivGraphSizeCheckFlag*(): cint
##  LoadDivGraph 系の分割画像読み込み関数でサイズのチェックを行うかどうかの設定を取得する
##  画像情報関係関数

proc GetFullColorImage*(GrHandle: cint): ptr cuint
##  指定のグラフィックハンドルのＡＲＧＢ８イメージを取得する( 現在動画ファイルをグラフィックハンドルで読み込んだ場合のみ使用可能 )

proc GraphLock*(GrHandle: cint; PitchBuf: ptr cint; DataPointBuf: ptr pointer;
               ColorDataPP: ptr ptr COLORDATA = nil; WriteOnly: cint = FALSE): cint
##  グラフィックメモリ領域のロック

proc GraphUnLock*(GrHandle: cint): cint
##  グラフィックメモリ領域のロック解除

proc SetUseGraphZBuffer*(GrHandle: cint; UseFlag: cint; BitDepth: cint = -1): cint
##  グラフィックハンドル専用のＺバッファを持つかどうかを設定する( GrHandle:対象となるグラフィックハンドル( 描画対象として使用可能なグラフィックハンドルのみ有効 )  UseFlag:専用のＺバッファを持つかどうか( TRUE:持つ( デフォルト )  FALSE:持たない )  BitDepth:ビット深度( 16 or 24 or 32 ) )

proc CopyGraphZBufferImage*(DestGrHandle: cint; SrcGrHandle: cint): cint
##  グラフィックハンドルのＺバッファの状態を別のグラフィックハンドルのＺバッファにコピーする( DestGrHandle も SrcGrHandle もＺバッファを持っている描画対象にできるグラフィックハンドルで、サイズが同じであり、且つマルチサンプリング( アンチエイリアス )設定が無いことが条件 )

proc SetDeviceLostDeleteGraphFlag*(GrHandle: cint; DeleteFlag: cint): cint
##  グラフィックスデバイスのデバイスロスト発生時に指定のグラフィックハンドルを削除するかどうかを設定する( TRUE:デバイスロスト時に削除する  FALSE:デバイスロストが発生しても削除しない )

proc GetGraphSize*(GrHandle: cint; SizeXBuf: ptr cint; SizeYBuf: ptr cint): cint
##  グラフィックハンドルが持つ画像のサイズを得る

proc GetGraphSizeF*(GrHandle: cint; SizeXBuf: ptr cfloat; SizeYBuf: ptr cfloat): cint
##  グラフィックハンドルが持つ画像のサイズを得る( float型 )

proc GetGraphTextureSize*(GrHandle: cint; SizeXBuf: ptr cint; SizeYBuf: ptr cint): cint
##  グラフィックハンドルが持つ一つ目のテクスチャのサイズを得る

proc GetGraphUseBaseGraphArea*(GrHandle: cint; UseX: ptr cint; UseY: ptr cint;
                              UseSizeX: ptr cint; UseSizeY: ptr cint): cint
##  LoadDivGraph や DerivationGraph で元画像の一部分を使用している場合に、指定のグラフィックハンドルが使用している元画像の範囲を取得する

proc GetGraphMipmapCount*(GrHandle: cint): cint
##  グラフィックハンドルが持つテクスチャのミップマップレベル数を取得する

proc GetGraphFilePath*(GrHandle: cint; FilePathBuffer: cstring): cint
##  グラフィックハンドルが画像ファイルから読み込まれていた場合、その画像のファイルパスを取得する

proc CheckDrawValidGraph*(GrHandle: cint): cint
##  指定のグラフィックハンドルが描画対象にできる( SetDrawScreen の引数に渡せる )グラフィックハンドルかどうかを取得する( 戻り値　TRUE:描画対象にできるグラフィックハンドル　FALSE:描画対象にできないグラフィックハンドル )

proc GetTexColorData*(AlphaCh: cint; AlphaTest: cint; ColorBitDepth: cint;
                     DrawValid: cint = FALSE): ptr COLORDATA
##  カラーデータを得る

proc GetTexColorData*(Format: ptr IMAGEFORMATDESC): ptr COLORDATA
##  フォーマットに基づいたカラーデータを得る

proc GetTexColorData*(FormatIndex: cint): ptr COLORDATA
  ##  DX_GRAPHICSIMAGE_FORMAT_3D_RGB32 等
##  指定のフォーマットインデックスのカラーデータを得る

proc GetTexColorData2*(Format: ptr IMAGEFORMATDESC): ptr COLORDATA
##  フォーマットに基づいたカラーデータを得る

proc GetTexColorData3*(FormatIndex: cint): ptr COLORDATA
  ##  DX_GRAPHICSIMAGE_FORMAT_3D_RGB32 等
##  指定のフォーマットインデックスのカラーデータを得る

proc GetMaxGraphTextureSize*(SizeX: ptr cint; SizeY: ptr cint): cint
##  グラフィックスデバイスが対応している最大テクスチャサイズを取得する

proc GetValidRestoreShredPoint*(): cint
##  グラフィックハンドルの画像を復元する関数が登録されているかどうかを取得する( TRUE:登録されている  FALSE:登録されていない )

proc GetCreateGraphColorData*(ColorData: ptr COLORDATA; Format: ptr IMAGEFORMATDESC): cint
##  ( 現在効果なし )これから新たにグラフィックを作成する場合に使用するカラー情報を取得する
##  画像パレット操作関係関数( ソフトウエア画像のみ使用可能 )

proc GetGraphPalette*(GrHandle: cint; ColorIndex: cint; Red: ptr cint; Green: ptr cint;
                     Blue: ptr cint): cint
##  グラフィックハンドルのパレットを取得する( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )

proc GetGraphOriginalPalette*(GrHandle: cint; ColorIndex: cint; Red: ptr cint;
                             Green: ptr cint; Blue: ptr cint): cint
##  グラフィックハンドルの SetGraphPalette で変更する前のパレットを取得する( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )

proc SetGraphPalette*(GrHandle: cint; ColorIndex: cint; Color: cuint): cint
##  グラフィックハンドルのパレットを変更する( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )

proc ResetGraphPalette*(GrHandle: cint): cint
##  SetGraphPalette で変更したパレットを全て元に戻す( ソフトウエアレンダリングモードで、且つパレット画像の場合のみ使用可能 )
##  図形描画関数

proc DrawLine*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint; Thickness: cint = 1): cint
##  線を描画する

proc DrawLineAA*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; Color: cuint;
                Thickness: cfloat = 1.0f): cint
##  線を描画する( アンチエイリアス付き )

proc DrawBox*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint; FillFlag: cint;
             LineThickness: cint = 1): cint
##  四角形を描画する

proc DrawBoxAA*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; Color: cuint;
               FillFlag: cint; LineThickness: cfloat = 1.0f): cint
##  四角形を描画する( アンチエイリアス付き )

proc DrawFillBox*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint): cint
##  中身を塗りつぶす四角形を描画する

proc DrawLineBox*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint;
                 LineThickness: cint = 1): cint
##  枠だけの四角形の描画 する

proc DrawCircle*(x: cint; y: cint; r: cint; Color: cuint; FillFlag: cint = TRUE;
                LineThickness: cint = 1): cint
##  円を描画する

proc DrawCircleAA*(x: cfloat; y: cfloat; r: cfloat; posnum: cint; Color: cuint;
                  FillFlag: cint = TRUE; LineThickness: cfloat = 1.0f;
                  Angle: cdouble = 0.0): cint
##  円を描画する( アンチエイリアス付き )

proc DrawOval*(x: cint; y: cint; rx: cint; ry: cint; Color: cuint; FillFlag: cint;
              LineThickness: cint = 1): cint
##  楕円を描画する

proc DrawOvalAA*(x: cfloat; y: cfloat; rx: cfloat; ry: cfloat; posnum: cint; Color: cuint;
                FillFlag: cint; LineThickness: cfloat = 1.0f): cint
##  楕円を描画する( アンチエイリアス付き )

proc DrawOval_Rect*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint; FillFlag: cint): cint
##  指定の矩形に収まる円( 楕円 )を描画する

proc DrawTriangle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; Color: cuint;
                  FillFlag: cint): cint
##  三角形を描画する

proc DrawTriangleAA*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                    y3: cfloat; Color: cuint; FillFlag: cint;
                    LineThickness: cfloat = 1.0f): cint
##  三角形を描画する( アンチエイリアス付き )

proc DrawQuadrangle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                    y4: cint; Color: cuint; FillFlag: cint): cint
##  四角形を描画する

proc DrawQuadrangleAA*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                      y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint; FillFlag: cint;
                      LineThickness: cfloat = 1.0f): cint
##  四角形を描画する( アンチエイリアス付き )

proc DrawRoundRect*(x1: cint; y1: cint; x2: cint; y2: cint; rx: cint; ry: cint; Color: cuint;
                   FillFlag: cint): cint
##  角の丸い四角形を描画する

proc DrawRoundRectAA*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; rx: cfloat;
                     ry: cfloat; posnum: cint; Color: cuint; FillFlag: cint;
                     LineThickness: cfloat = 1.0f): cint
##  角の丸い四角形を描画する( アンチエイリアス付き )

proc BeginAADraw*(): cint
##  DrawTriangleAA などのアンチエイリアス付き図形描画の準備を行う

proc EndAADraw*(): cint
##  DrawTriangleAA などのアンチエイリアス付き図形描画の後始末を行う

proc DrawPixel*(x: cint; y: cint; Color: cuint): cint
##  点を描画する

proc Paint*(x: cint; y: cint; FillColor: cuint;
           BoundaryColor: ULONGLONG = (-1'i64)): cint
##  指定点から境界色があるところまで塗りつぶす(境界色を -1 にすると指定点の色の領域を塗りつぶす)

proc DrawPixelSet*(PointDataArray: ptr POINTDATA; Num: cint): cint
##  点の集合を描画する

proc DrawLineSet*(LineDataArray: ptr LINEDATA; Num: cint): cint
##  線の集合を描画する

proc DrawBoxSet*(RectDataArray: ptr RECTDATA; Num: cint): cint
##  矩形の集合を描画する

proc DrawPixel3D*(Pos: VECTOR; Color: cuint): cint
##  ３Ｄの点を描画する

proc DrawPixel3DD*(Pos: VECTOR_D; Color: cuint): cint
##  ３Ｄの点を描画する

proc DrawLine3D*(Pos1: VECTOR; Pos2: VECTOR; Color: cuint): cint
##  ３Ｄの線分を描画する

proc DrawLine3DD*(Pos1: VECTOR_D; Pos2: VECTOR_D; Color: cuint): cint
##  ３Ｄの線分を描画する

proc DrawTriangle3D*(Pos1: VECTOR; Pos2: VECTOR; Pos3: VECTOR; Color: cuint;
                    FillFlag: cint): cint
##  ３Ｄの三角形を描画する

proc DrawTriangle3DD*(Pos1: VECTOR_D; Pos2: VECTOR_D; Pos3: VECTOR_D; Color: cuint;
                     FillFlag: cint): cint
##  ３Ｄの三角形を描画する

proc DrawCube3D*(Pos1: VECTOR; Pos2: VECTOR; DifColor: cuint; SpcColor: cuint;
                FillFlag: cint): cint
##  ３Ｄの立方体を描画する

proc DrawCube3DD*(Pos1: VECTOR_D; Pos2: VECTOR_D; DifColor: cuint; SpcColor: cuint;
                 FillFlag: cint): cint
##  ３Ｄの立方体を描画する

proc DrawCubeSet3D*(CubeDataArray: ptr CUBEDATA; Num: cint; FillFlag: cint): cint
##  ３Ｄの立方体の集合を描画する

proc DrawSphere3D*(CenterPos: VECTOR; r: cfloat; DivNum: cint; DifColor: cuint;
                  SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの球体を描画する

proc DrawSphere3DD*(CenterPos: VECTOR_D; r: cdouble; DivNum: cint; DifColor: cuint;
                   SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの球体を描画する

proc DrawCapsule3D*(Pos1: VECTOR; Pos2: VECTOR; r: cfloat; DivNum: cint; DifColor: cuint;
                   SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄのカプセルを描画する

proc DrawCapsule3DD*(Pos1: VECTOR_D; Pos2: VECTOR_D; r: cdouble; DivNum: cint;
                    DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄのカプセルを描画する

proc DrawCylinder3D*(Pos1: VECTOR; Pos2: VECTOR; r: cfloat; DivNum: cint;
                    DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの円柱を描画する

proc DrawCylinder3DD*(Pos1: VECTOR_D; Pos2: VECTOR_D; r: cdouble; DivNum: cint;
                     DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの円柱を描画する

proc DrawTube3D*(Pos1: VECTOR; Pos2: VECTOR; r1: cfloat; r2: cfloat; DivNum: cint;
                DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの筒を描画する

proc DrawTube3DD*(Pos1: VECTOR_D; Pos2: VECTOR_D; r1: cdouble; r2: cdouble; DivNum: cint;
                 DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの筒を描画する

proc DrawCone3D*(TopPos: VECTOR; BottomPos: VECTOR; r: cfloat; DivNum: cint;
                DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの円錐を描画する

proc DrawCone3DD*(TopPos: VECTOR_D; BottomPos: VECTOR_D; r: cdouble; DivNum: cint;
                 DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの円錐を描画する
##  画像描画関数

proc LoadGraphScreen*(x: cint; y: cint; GraphName: cstring; TransFlag: cint): cint
##  画像ファイルを読みこんで画面に描画する

proc LoadGraphScreenWithStrLen*(x: cint; y: cint; GraphName: cstring;
                               GraphNameLength: csize_t; TransFlag: cint): cint
##  画像ファイルを読みこんで画面に描画する

proc DrawGraph*(x: cint; y: cint; GrHandle: cint; TransFlag: cint): cint
##  画像の等倍描画

proc DrawExtendGraph*(x1: cint; y1: cint; x2: cint; y2: cint; GrHandle: cint;
                     TransFlag: cint): cint
##  画像の拡大描画

proc DrawRotaGraph*(x: cint; y: cint; ExRate: cdouble; Angle: cdouble; GrHandle: cint;
                   TransFlag: cint; ReverseXFlag: cint = FALSE;
                   ReverseYFlag: cint = FALSE): cint
##  画像の回転描画

proc DrawRotaGraph2*(x: cint; y: cint; cx: cint; cy: cint; ExtRate: cdouble;
                    Angle: cdouble; GrHandle: cint; TransFlag: cint;
                    ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の回転描画２( 回転中心指定付き )

proc DrawRotaGraph3*(x: cint; y: cint; cx: cint; cy: cint; ExtRateX: cdouble;
                    ExtRateY: cdouble; Angle: cdouble; GrHandle: cint;
                    TransFlag: cint; ReverseXFlag: cint = FALSE;
                    ReverseYFlag: cint = FALSE): cint
##  画像の回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )

proc DrawRotaGraphFast*(x: cint; y: cint; ExRate: cfloat; Angle: cfloat; GrHandle: cint;
                       TransFlag: cint; ReverseXFlag: cint = FALSE;
                       ReverseYFlag: cint = FALSE): cint
##  画像の回転描画( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRotaGraphFast2*(x: cint; y: cint; cx: cint; cy: cint; ExtRate: cfloat;
                        Angle: cfloat; GrHandle: cint; TransFlag: cint;
                        ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の回転描画２( 回転中心指定付き )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRotaGraphFast3*(x: cint; y: cint; cx: cint; cy: cint; ExtRateX: cfloat;
                        ExtRateY: cfloat; Angle: cfloat; GrHandle: cint;
                        TransFlag: cint; ReverseXFlag: cint = FALSE;
                        ReverseYFlag: cint = FALSE): cint
##  画像の回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawModiGraph*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                   y4: cint; GrHandle: cint; TransFlag: cint): cint
##  画像の自由変形描画

proc DrawTurnGraph*(x: cint; y: cint; GrHandle: cint; TransFlag: cint): cint
##  画像の左右反転描画

proc DrawReverseGraph*(x: cint; y: cint; GrHandle: cint; TransFlag: cint;
                      ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の反転描画

proc DrawGraphF*(xf: cfloat; yf: cfloat; GrHandle: cint; TransFlag: cint): cint
##  画像の描画( 座標指定が float 版 )

proc DrawExtendGraphF*(x1f: cfloat; y1f: cfloat; x2f: cfloat; y2f: cfloat;
                      GrHandle: cint; TransFlag: cint): cint
##  画像の拡大描画( 座標指定が float 版 )

proc DrawRotaGraphF*(xf: cfloat; yf: cfloat; ExRate: cdouble; Angle: cdouble;
                    GrHandle: cint; TransFlag: cint; ReverseXFlag: cint = FALSE;
                    ReverseYFlag: cint = FALSE): cint
##  画像の回転描画( 座標指定が float 版 )

proc DrawRotaGraph2F*(xf: cfloat; yf: cfloat; cxf: cfloat; cyf: cfloat; ExtRate: cdouble;
                     Angle: cdouble; GrHandle: cint; TransFlag: cint;
                     ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の回転描画２( 回転中心指定付き )( 座標指定が float 版 )

proc DrawRotaGraph3F*(xf: cfloat; yf: cfloat; cxf: cfloat; cyf: cfloat;
                     ExtRateX: cdouble; ExtRateY: cdouble; Angle: cdouble;
                     GrHandle: cint; TransFlag: cint; ReverseXFlag: cint = FALSE;
                     ReverseYFlag: cint = FALSE): cint
##  画像の回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 座標指定が float 版 )

proc DrawRotaGraphFastF*(xf: cfloat; yf: cfloat; ExRate: cfloat; Angle: cfloat;
                        GrHandle: cint; TransFlag: cint; ReverseXFlag: cint = FALSE;
                        ReverseYFlag: cint = FALSE): cint
##  画像の回転描画( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRotaGraphFast2F*(xf: cfloat; yf: cfloat; cxf: cfloat; cyf: cfloat;
                         ExtRate: cfloat; Angle: cfloat; GrHandle: cint;
                         TransFlag: cint; ReverseXFlag: cint = FALSE;
                         ReverseYFlag: cint = FALSE): cint
##  画像の回転描画２( 回転中心指定付き )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRotaGraphFast3F*(xf: cfloat; yf: cfloat; cxf: cfloat; cyf: cfloat;
                         ExtRateX: cfloat; ExtRateY: cfloat; Angle: cfloat;
                         GrHandle: cint; TransFlag: cint;
                         ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawModiGraphF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                    y3: cfloat; x4: cfloat; y4: cfloat; GrHandle: cint; TransFlag: cint): cint
##  画像の自由変形描画( 座標指定が float 版 )

proc DrawTurnGraphF*(xf: cfloat; yf: cfloat; GrHandle: cint; TransFlag: cint): cint
##  画像の左右反転描画( 座標指定が float 版 )

proc DrawReverseGraphF*(xf: cfloat; yf: cfloat; GrHandle: cint; TransFlag: cint;
                       ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の反転描画( 座標指定が float 版 )

proc DrawChipMap*(Sx: cint; Sy: cint; XNum: cint; YNum: cint; MapData: ptr cint;
                 ChipTypeNum: cint; MapDataPitch: cint; ChipGrHandle: ptr cint;
                 TransFlag: cint): cint
##  チップ画像を使った２Ｄマップ描画

proc DrawChipMap*(MapWidth: cint; MapHeight: cint; MapData: ptr cint; ChipTypeNum: cint;
                 ChipGrHandle: ptr cint; TransFlag: cint; MapDrawPointX: cint;
                 MapDrawPointY: cint; MapDrawWidth: cint; MapDrawHeight: cint;
                 ScreenX: cint; ScreenY: cint): cint
##  チップ画像を使った２Ｄマップ描画

proc DrawChipMap2*(MapWidth: cint; MapHeight: cint; MapData: ptr cint;
                  ChipTypeNum: cint; ChipGrHandle: ptr cint; TransFlag: cint;
                  MapDrawPointX: cint; MapDrawPointY: cint; MapDrawWidth: cint;
                  MapDrawHeight: cint; ScreenX: cint; ScreenY: cint): cint
##  チップ画像を使った２Ｄマップ描画

proc DrawTile*(x1: cint; y1: cint; x2: cint; y2: cint; Tx: cint; Ty: cint; ExtRate: cdouble;
              Angle: cdouble; GrHandle: cint; TransFlag: cint): cint
##  画像を指定領域にタイル状に描画する

proc DrawRectGraph*(DestX: cint; DestY: cint; SrcX: cint; SrcY: cint; Width: cint;
                   Height: cint; GraphHandle: cint; TransFlag: cint;
                   ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを等倍描画

proc DrawRectExtendGraph*(DestX1: cint; DestY1: cint; DestX2: cint; DestY2: cint;
                         SrcX: cint; SrcY: cint; SrcWidth: cint; SrcHeight: cint;
                         GraphHandle: cint; TransFlag: cint): cint
##  画像の指定矩形部分のみを拡大描画

proc DrawRectRotaGraph*(x: cint; y: cint; SrcX: cint; SrcY: cint; Width: cint;
                       Height: cint; ExtRate: cdouble; Angle: cdouble;
                       GraphHandle: cint; TransFlag: cint;
                       ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画

proc DrawRectRotaGraph2*(x: cint; y: cint; SrcX: cint; SrcY: cint; Width: cint;
                        Height: cint; cx: cint; cy: cint; ExtRate: cdouble;
                        Angle: cdouble; GraphHandle: cint; TransFlag: cint;
                        ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画２( 回転中心指定付き )

proc DrawRectRotaGraph3*(x: cint; y: cint; SrcX: cint; SrcY: cint; Width: cint;
                        Height: cint; cx: cint; cy: cint; ExtRateX: cdouble;
                        ExtRateY: cdouble; Angle: cdouble; GraphHandle: cint;
                        TransFlag: cint; ReverseXFlag: cint = FALSE;
                        ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )

proc DrawRectRotaGraphFast*(x: cint; y: cint; SrcX: cint; SrcY: cint; Width: cint;
                           Height: cint; ExtRate: cfloat; Angle: cfloat;
                           GraphHandle: cint; TransFlag: cint;
                           ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRectRotaGraphFast2*(x: cint; y: cint; SrcX: cint; SrcY: cint; Width: cint;
                            Height: cint; cx: cint; cy: cint; ExtRate: cfloat;
                            Angle: cfloat; GraphHandle: cint; TransFlag: cint;
                            ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画２( 回転中心指定付き )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRectRotaGraphFast3*(x: cint; y: cint; SrcX: cint; SrcY: cint; Width: cint;
                            Height: cint; cx: cint; cy: cint; ExtRateX: cfloat;
                            ExtRateY: cfloat; Angle: cfloat; GraphHandle: cint;
                            TransFlag: cint; ReverseXFlag: cint = FALSE;
                            ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRectModiGraph*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                       y4: cint; SrcX: cint; SrcY: cint; Width: cint; Height: cint;
                       GraphHandle: cint; TransFlag: cint): cint
##  画像の指定矩形部分のみを自由変形描画

proc DrawRectGraphF*(DestX: cfloat; DestY: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                    Height: cint; GraphHandle: cint; TransFlag: cint;
                    ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを等倍描画( 座標指定が float 版 )

proc DrawRectGraphF2*(DestX: cfloat; DestY: cfloat; SrcX: cfloat; SrcY: cfloat;
                     Width: cfloat; Height: cfloat; GraphHandle: cint;
                     TransFlag: cint; ReverseXFlag: cint = FALSE;
                     ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを等倍描画( 座標指定が float 版( 画像内座標の指定も float 版 ) )

proc DrawRectExtendGraphF*(DestX1: cfloat; DestY1: cfloat; DestX2: cfloat;
                          DestY2: cfloat; SrcX: cint; SrcY: cint; SrcWidth: cint;
                          SrcHeight: cint; GraphHandle: cint; TransFlag: cint): cint
##  画像の指定矩形部分のみを拡大描画( 座標指定が float 版 )

proc DrawRectExtendGraphF2*(DestX1: cfloat; DestY1: cfloat; DestX2: cfloat;
                           DestY2: cfloat; SrcX: cfloat; SrcY: cfloat;
                           SrcWidth: cfloat; SrcHeight: cfloat; GraphHandle: cint;
                           TransFlag: cint): cint
##  画像の指定矩形部分のみを拡大描画( 座標指定が float 版( 画像内座標の指定も float 版 ) )

proc DrawRectRotaGraphF*(x: cfloat; y: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                        Height: cint; ExtRate: cdouble; Angle: cdouble;
                        GraphHandle: cint; TransFlag: cint;
                        ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画( 座標指定が float 版 )

proc DrawRectRotaGraph2F*(x: cfloat; y: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                         Height: cint; cxf: cfloat; cyf: cfloat; ExtRate: cdouble;
                         Angle: cdouble; GraphHandle: cint; TransFlag: cint;
                         ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画２( 回転中心指定付き )( 座標指定が float 版 )

proc DrawRectRotaGraph3F*(x: cfloat; y: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                         Height: cint; cxf: cfloat; cyf: cfloat; ExtRateX: cdouble;
                         ExtRateY: cdouble; Angle: cdouble; GraphHandle: cint;
                         TransFlag: cint; ReverseXFlag: cint = FALSE;
                         ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 座標指定が float 版 )

proc DrawRectRotaGraphFastF*(x: cfloat; y: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                            Height: cint; ExtRate: cfloat; Angle: cfloat;
                            GraphHandle: cint; TransFlag: cint;
                            ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRectRotaGraphFast2F*(x: cfloat; y: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                             Height: cint; cxf: cfloat; cyf: cfloat; ExtRate: cfloat;
                             Angle: cfloat; GraphHandle: cint; TransFlag: cint;
                             ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画２( 回転中心指定付き )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRectRotaGraphFast3F*(x: cfloat; y: cfloat; SrcX: cint; SrcY: cint; Width: cint;
                             Height: cint; cxf: cfloat; cyf: cfloat; ExtRateX: cfloat;
                             ExtRateY: cfloat; Angle: cfloat; GraphHandle: cint;
                             TransFlag: cint; ReverseXFlag: cint = FALSE;
                             ReverseYFlag: cint = FALSE): cint
##  画像の指定矩形部分のみを回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 座標指定が float 版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRectModiGraphF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                        y3: cfloat; x4: cfloat; y4: cfloat; SrcX: cint; SrcY: cint;
                        Width: cint; Height: cint; GraphHandle: cint; TransFlag: cint): cint
##  画像の指定矩形部分のみを自由変形描画( 座標指定が float 版 )

proc DrawBlendGraph*(x: cint; y: cint; GrHandle: cint; TransFlag: cint; BlendGraph: cint;
                    BorderParam: cint; BorderRange: cint): cint
##  ブレンド画像と合成して画像を等倍描画する

proc DrawBlendGraphF*(x: cfloat; y: cfloat; GrHandle: cint; TransFlag: cint;
                     BlendGraph: cint; BorderParam: cint; BorderRange: cint): cint
##  ブレンド画像と合成して画像を等倍描画する( 座標指定が float 版 )

proc DrawBlendGraphPos*(x: cint; y: cint; GrHandle: cint; TransFlag: cint; bx: cint;
                       by: cint; BlendGraph: cint; BorderParam: cint;
                       BorderRange: cint): cint
##  ブレンド画像と合成して画像を等倍描画する( ブレンド画像の起点座標を指定する引数付き )

proc DrawCircleGauge*(CenterX: cint; CenterY: cint; Percent: cdouble; GrHandle: cint;
                     StartPercent: cdouble = 0.0; Scale: cdouble = 1.0;
                     ReverseX: cint = FALSE; ReverseY: cint = FALSE): cint
##  円グラフ的な描画を行う( GrHandle の画像の上下左右の端は透過色にしておく必要があります )

proc DrawCircleGaugeF*(CenterX: cfloat; CenterY: cfloat; Percent: cdouble;
                      GrHandle: cint; StartPercent: cdouble = 0.0;
                      Scale: cdouble = 1.0; ReverseX: cint = FALSE;
                      ReverseY: cint = FALSE): cint
##  円グラフ的な描画を行う( GrHandle の画像の上下左右の端は透過色にしておく必要があります )( 座標指定が float 版 )

proc DrawGraphToZBuffer*(X: cint; Y: cint; GrHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して画像の等倍描画

proc DrawTurnGraphToZBuffer*(x: cint; y: cint; GrHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して画像の左右反転描画

proc DrawReverseGraphToZBuffer*(x: cint; y: cint; GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                               ReverseXFlag: cint = FALSE;
                               ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の反転描画

proc DrawExtendGraphToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; GrHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して画像の拡大描画

proc DrawRotaGraphToZBuffer*(x: cint; y: cint; ExRate: cdouble; Angle: cdouble;
                            GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                            ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の回転描画

proc DrawRotaGraph2ToZBuffer*(x: cint; y: cint; cx: cint; cy: cint; ExtRate: cdouble;
                             Angle: cdouble; GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                             ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の回転描画２( 回転中心指定付き )

proc DrawRotaGraph3ToZBuffer*(x: cint; y: cint; cx: cint; cy: cint; ExtRateX: cdouble;
                             ExtRateY: cdouble; Angle: cdouble; GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                             ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )

proc DrawRotaGraphFastToZBuffer*(x: cint; y: cint; ExRate: cfloat; Angle: cfloat;
                                GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                ReverseXFlag: cint = FALSE;
                                ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の回転描画( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRotaGraphFast2ToZBuffer*(x: cint; y: cint; cx: cint; cy: cint; ExtRate: cfloat;
                                 Angle: cfloat; GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                 ReverseXFlag: cint = FALSE;
                                 ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の回転描画２( 回転中心指定付き )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawRotaGraphFast3ToZBuffer*(x: cint; y: cint; cx: cint; cy: cint; ExtRateX: cfloat;
                                 ExtRateY: cfloat; Angle: cfloat; GrHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                 ReverseXFlag: cint = FALSE;
                                 ReverseYFlag: cint = FALSE): cint
##  Ｚバッファに対して画像の回転描画３( 回転中心指定付き＋縦横拡大率別指定版 )( 高速版、座標計算のアルゴリズムが簡略化されています、描画結果に不都合が無ければこちらの方が高速です )

proc DrawModiGraphToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                            x4: cint; y4: cint; GrHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して画像の自由変形描画

proc DrawBoxToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; FillFlag: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して矩形の描画

proc DrawCircleToZBuffer*(x: cint; y: cint; r: cint; FillFlag: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して円の描画

proc DrawTriangleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                           FillFlag: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して三角形を描画する

proc DrawQuadrangleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                             x4: cint; y4: cint; FillFlag: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して四角形を描画する

proc DrawRoundRectToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; rx: cint; ry: cint;
                            FillFlag: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  Ｚバッファに対して角の丸い四角形を描画する

proc DrawPolygon*(VertexArray: ptr VERTEX; PolygonNum: cint; GrHandle: cint;
                 TransFlag: cint; UVScaling: cint = FALSE): cint
##  ２Ｄポリゴンを描画する( Vertex:三角形を形成する頂点配列の先頭アドレス( 頂点の数はポリゴンの数×３ )  PolygonNum:描画するポリゴンの数  GrHandle:使用するグラフィックハンドル  TransFlag:透過色処理を行うかどうか( TRUE:行う  FALSE:行わない )  UVScaling:基本FALSEでOK )

proc DrawPolygon2D*(VertexArray: ptr VERTEX2D; PolygonNum: cint; GrHandle: cint;
                   TransFlag: cint): cint
##  ２Ｄポリゴンを描画する

proc DrawPolygon3D*(VertexArray: ptr VERTEX3D; PolygonNum: cint; GrHandle: cint;
                   TransFlag: cint): cint
##  ３Ｄポリゴンを描画する

proc DrawPolygonIndexed2D*(VertexArray: ptr VERTEX2D; VertexNum: cint;
                          IndexArray: ptr cushort; PolygonNum: cint; GrHandle: cint;
                          TransFlag: cint): cint
##  ２Ｄポリゴンを描画する( 頂点インデックスを使用 )

proc DrawPolygon32bitIndexed2D*(VertexArray: ptr VERTEX2D; VertexNum: cint;
                               IndexArray: ptr cuint; PolygonNum: cint;
                               GrHandle: cint; TransFlag: cint): cint
##  ２Ｄポリゴンを描画する( 頂点インデックスを使用 )

proc DrawPolygonIndexed3D*(VertexArray: ptr VERTEX3D; VertexNum: cint;
                          IndexArray: ptr cushort; PolygonNum: cint; GrHandle: cint;
                          TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 頂点インデックスを使用 )

proc DrawPolygon32bitIndexed3D*(VertexArray: ptr VERTEX3D; VertexNum: cint;
                               IndexArray: ptr cuint; PolygonNum: cint;
                               GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 頂点インデックスを使用 )

proc DrawPolygonIndexed3DBase*(VertexArray: ptr VERTEX3D_OLD; VertexNum: cint;
                              IndexArray: ptr cushort; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                              GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 頂点インデックスを使用 )( 旧バージョン用 )

proc DrawPolygon32bitIndexed3DBase*(VertexArray: ptr VERTEX3D_OLD; VertexNum: cint;
                                   IndexArray: ptr cuint; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                                   GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 頂点インデックスを使用 )( 旧バージョン用 )

proc DrawPolygon3DBase*(VertexArray: ptr VERTEX3D_OLD; VertexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                       GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 旧バージョン用 )

proc DrawPolygon3D*(VertexArray: ptr VERTEX3D_OLD; PolygonNum: cint; GrHandle: cint;
                   TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 旧バージョン用 )

proc DrawPolygon3D2*(VertexArray: ptr VERTEX3D_OLD; PolygonNum: cint; GrHandle: cint;
                    TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 旧バージョン用 )

proc DrawPolygonBase*(VertexArray: ptr VERTEX; VertexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                     GrHandle: cint; TransFlag: cint; UVScaling: cint = FALSE): cint
##  ２Ｄプリミティブを描画する

proc DrawPrimitive2D*(VertexArray: ptr VERTEX2D; VertexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                     GrHandle: cint; TransFlag: cint): cint
##  ２Ｄプリミティブを描画する

proc DrawPrimitive3D*(VertexArray: ptr VERTEX3D; VertexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                     GrHandle: cint; TransFlag: cint): cint
##  ３Ｄプリミティブを描画する

proc DrawPrimitiveIndexed2D*(VertexArray: ptr VERTEX2D; VertexNum: cint;
                            IndexArray: ptr cushort; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                            GrHandle: cint; TransFlag: cint): cint
##  ２Ｄプリミティブを描画する(頂点インデックス使用)

proc DrawPrimitive32bitIndexed2D*(VertexArray: ptr VERTEX2D; VertexNum: cint;
                                 IndexArray: ptr cuint; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                                 GrHandle: cint; TransFlag: cint): cint
##  ２Ｄプリミティブを描画する(頂点インデックス使用)

proc DrawPrimitiveIndexed3D*(VertexArray: ptr VERTEX3D; VertexNum: cint;
                            IndexArray: ptr cushort; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                            GrHandle: cint; TransFlag: cint): cint
##  ３Ｄプリミティブを描画する(頂点インデックス使用)

proc DrawPrimitive32bitIndexed3D*(VertexArray: ptr VERTEX3D; VertexNum: cint;
                                 IndexArray: ptr cuint; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                                 GrHandle: cint; TransFlag: cint): cint
##  ３Ｄプリミティブを描画する(頂点インデックス使用)

proc DrawPolygon3D_UseVertexBuffer*(VertexBufHandle: cint; GrHandle: cint;
                                   TransFlag: cint): cint
##  頂点バッファを使用して３Ｄポリゴンを描画する

proc DrawPrimitive3D_UseVertexBuffer*(VertexBufHandle: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                                     GrHandle: cint; TransFlag: cint): cint
##  頂点バッファを使用して３Ｄプリミティブを描画する

proc DrawPrimitive3D_UseVertexBuffer2*(VertexBufHandle: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                                      StartVertex: cint; UseVertexNum: cint;
                                      GrHandle: cint; TransFlag: cint): cint
##  頂点バッファを使用して３Ｄプリミティブを描画する

proc DrawPolygonIndexed3D_UseVertexBuffer*(VertexBufHandle: cint;
    IndexBufHandle: cint; GrHandle: cint; TransFlag: cint): cint
##  頂点バッファとインデックスバッファを使用して３Ｄポリゴンを描画する

proc DrawPrimitiveIndexed3D_UseVertexBuffer*(VertexBufHandle: cint;
    IndexBufHandle: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
    GrHandle: cint; TransFlag: cint): cint
##  頂点バッファとインデックスバッファを使用して３Ｄプリミティブを描画する

proc DrawPrimitiveIndexed3D_UseVertexBuffer2*(VertexBufHandle: cint;
    IndexBufHandle: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
    BaseVertex: cint; StartVertex: cint; UseVertexNum: cint; StartIndex: cint;
    UseIndexNum: cint; GrHandle: cint; TransFlag: cint): cint
##  頂点バッファとインデックスバッファを使用して３Ｄプリミティブを描画する

proc DrawGraph3D*(x: cfloat; y: cfloat; z: cfloat; GrHandle: cint; TransFlag: cint): cint
##  画像の３Ｄ描画

proc DrawExtendGraph3D*(x: cfloat; y: cfloat; z: cfloat; ExRateX: cdouble;
                       ExRateY: cdouble; GrHandle: cint; TransFlag: cint): cint
##  画像の拡大３Ｄ描画

proc DrawRotaGraph3D*(x: cfloat; y: cfloat; z: cfloat; ExRate: cdouble; Angle: cdouble;
                     GrHandle: cint; TransFlag: cint; ReverseXFlag: cint = FALSE;
                     ReverseYFlag: cint = FALSE): cint
##  画像の回転３Ｄ描画

proc DrawRota2Graph3D*(x: cfloat; y: cfloat; z: cfloat; cx: cfloat; cy: cfloat;
                      ExtRateX: cdouble; ExtRateY: cdouble; Angle: cdouble;
                      GrHandle: cint; TransFlag: cint; ReverseXFlag: cint = FALSE;
                      ReverseYFlag: cint = FALSE): cint
##  画像の回転３Ｄ描画(回転中心指定型)

proc DrawModiBillboard3D*(Pos: VECTOR; x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
                         x3: cfloat; y3: cfloat; x4: cfloat; y4: cfloat; GrHandle: cint;
                         TransFlag: cint): cint
##  画像の自由変形３Ｄ描画

proc DrawBillboard3D*(Pos: VECTOR; cx: cfloat; cy: cfloat; Size: cfloat; Angle: cfloat;
                     GrHandle: cint; TransFlag: cint; ReverseXFlag: cint = FALSE;
                     ReverseYFlag: cint = FALSE): cint
##  ３Ｄ空間上に画像を描画
##  描画設定関係関数

proc SetDrawMode*(DrawMode: cint): cint
##  描画モードを設定する

proc GetDrawMode*(): cint
##  描画モードを取得する

proc SetDrawBlendMode*(BlendMode: cint; BlendParam: cint): cint
##  描画ブレンドモードを設定する

proc GetDrawBlendMode*(BlendMode: ptr cint; BlendParam: ptr cint): cint
##  描画ブレンドモードを取得する

proc SetDrawCustomBlendMode*(BlendEnable: cint; SrcBlendRGB: cint; ##  DX_BLEND_SRC_COLOR 等
                            DestBlendRGB: cint; ##  DX_BLEND_SRC_COLOR 等
                            BlendOpRGB: cint; ##  DX_BLENDOP_ADD 等
                            SrcBlendA: cint; ##  DX_BLEND_SRC_COLOR 等
                            DestBlendA: cint; ##  DX_BLEND_SRC_COLOR 等
                            BlendOpA: cint; ##  DX_BLENDOP_ADD 等
                            BlendParam: cint): cint
##  カスタムブレンドモードを設定する

proc GetDrawCustomBlendMode*(BlendEnable: ptr cint; SrcBlendRGB: ptr cint;
                            DestBlendRGB: ptr cint; BlendOpRGB: ptr cint;
                            SrcBlendA: ptr cint; DestBlendA: ptr cint;
                            BlendOpA: ptr cint; BlendParam: ptr cint): cint
##  カスタムブレンドモードを取得する

proc SetDrawAlphaTest*(TestMode: cint; TestParam: cint): cint
##  描画時のアルファテストの設定を行う( TestMode:テストモード( DX_CMP_GREATER等 -1でデフォルト動作に戻す )  TestParam:描画アルファ値との比較に使用する値( 0～255 ) )

proc GetDrawAlphaTest*(TestMode: ptr cint; TestParam: ptr cint): cint
##  描画時のアルファテストの設定を取得する( TestMode:テストモード( DX_CMP_GREATER等 -1でデフォルト動作に戻す )  TestParam:描画アルファ値との比較に使用する値( 0～255 ) )

proc SetBlendGraph*(BlendGraph: cint; BorderParam: cint; BorderRange: cint): cint
##  ( SetBlendGraphParam の BlendType = DX_BLENDGRAPHTYPE_WIPE の処理を行う旧関数 )描画処理時に描画する画像とブレンドするαチャンネル付き画像をセットする( BlendGraph を -1 でブレンド機能を無効 )

proc SetBlendGraphParam*(BlendGraph: cint; BlendType: cint): cint {.varargs.}
##  描画処理時に描画する画像とブレンドする画像のブレンド設定を行う、BlendGraph を -1 にすれば設定を解除、その場合 BlendType とその後ろのパラメータは無視される
## 		int			SetBlendGraphParam(					int BlendGraph, int BlendType = DX_BLENDGRAPHTYPE_NORMAL, int Ratio = ( 0( ブレンド率０％ )～255( ブレンド率１００％ ) ) ) ;
## 		int			SetBlendGraphParam(					int BlendGraph, int BlendType = DX_BLENDGRAPHTYPE_WIPE, int BorderParam = 境界位置(０～２５５), int BorderRange = 境界幅(指定できる値は１、６４、１２８、２５５の４つ) ) ;
## 		int			SetBlendGraphParam(					int BlendGraph, int BlendType = DX_BLENDGRAPHTYPE_ALPHA ) ;

proc SetBlendGraphPosition*(x: cint; y: cint): cint
##  ブレンド画像の起点座標をセットする

proc SetBlendGraphPositionMode*(BlendGraphPositionMode: cint): cint
  ##  DX_BLENDGRAPH_POSMODE_DRAWGRAPH など
##  ブレンド画像の適応座標モードを設定する

proc SetDrawBright*(RedBright: cint; GreenBright: cint; BlueBright: cint): cint
##  描画輝度を設定する

proc GetDrawBright*(Red: ptr cint; Green: ptr cint; Blue: ptr cint): cint
##  描画輝度を取得する

proc SetDrawAddColor*(Red: cint; Green: cint; Blue: cint): cint
##  描画カラーに加算する色を設定する( Red, Green, Blue : 加算する色( 0 = 0%  255 = 100%  -255 = -100% ) ( マイナスの値で減算もできます ) )

proc GetDrawAddColor*(Red: ptr cint; Green: ptr cint; Blue: ptr cint): cint
##  描画カラーに加算する色を取得する

proc SetWriteAlphaChannelFlag*(Flag: cint): cint
##  描画先のアルファチャンネルの内容を書き換えるかを設定する( FALSE:書き換えない  TRUE:書き換える( デフォルト ) )

proc GetWriteAlphaChannelFlag*(): cint
##  描画先のアルファチャンネルの内容を書き換えるかを取得する( FALSE:書き換えない  TRUE:書き換える( デフォルト ) )

proc CheckSeparateAlphaBlendEnable*(): cint
##  描画先のアルファチャンネルの内容を書き換えないことができるかどうかを取得する( TRUE:書き換えないことができる  FALSE:書き換えないことができない )

proc SetIgnoreDrawGraphColor*(EnableFlag: cint): cint
##  描画する画像のＲＧＢ成分を無視するかどうかを指定する( EnableFlag:この機能を使うかどうか( TRUE:使う  FALSE:使わない( デフォルト ) )

proc GetIgnoreDrawGraphColor*(): cint
##  描画する画像のＲＧＢ成分を無視するかどうかを取得する( 戻り値  この機能を使うかどうか( TRUE:使う  FALSE:使わない )

proc SetMaxAnisotropy*(MaxAnisotropy: cint): cint
##  最大異方性値を設定する

proc GetMaxAnisotropy*(): cint
##  最大異方性値を取得する

proc SetUseLarge3DPositionSupport*(UseFlag: cint): cint
##  ３Ｄ処理で使用する座標値が 10000000.0f などの大きな値になっても描画の崩れを小さく抑える処理を使用するかどうかを設定する、DxLib_Init の呼び出し前でのみ使用可能( TRUE:描画の崩れを抑える処理を使用する( CPU負荷が上がります )　　FALSE:描画の崩れを抑える処理は使用しない( デフォルト ) )

proc SetUseZBufferFlag*(Flag: cint): cint
##  Ｚバッファを使用するかどうかを設定する( ２Ｄと３Ｄ描画に影響 )( TRUE:Ｚバッファを使用する  FALSE:Ｚバッファを使用しない( デフォルト ) )

proc SetWriteZBufferFlag*(Flag: cint): cint
##  Ｚバッファに書き込みを行うかどうかを設定する( ２Ｄと３Ｄ描画に影響 )( TRUE:書き込みを行う  FALSE:書き込みを行わない( デフォルト ) )

proc SetZBufferCmpType*(CmpType: cint): cint
  ##  DX_CMP_NEVER 等
##  ＺバッファのＺ値と書き込むＺ値との比較モードを設定する( ２Ｄと３Ｄ描画に影響 )( CmpType:DX_CMP_NEVER等( デフォルト:DX_CMP_LESSEQUAL ) )

proc SetZBias*(Bias: cint): cint
##  書き込むＺ値のバイアスを設定する( ２Ｄと３Ｄ描画に影響 )( Bias:バイアス値( デフォルト:0 ) )

proc SetUseZBuffer3D*(Flag: cint): cint
##  Ｚバッファを使用するかどうかを設定する( ３Ｄ描画のみに影響 )( TRUE:Ｚバッファを使用する  FALSE:Ｚバッファを使用しない( デフォルト ) )

proc SetWriteZBuffer3D*(Flag: cint): cint
##  Ｚバッファに書き込みを行うかどうかを設定する( ３Ｄ描画のみに影響 )( TRUE:書き込みを行う  FALSE:書き込みを行わない( デフォルト ) )

proc SetZBufferCmpType3D*(CmpType: cint): cint
  ##  DX_CMP_NEVER 等
##  ＺバッファのＺ値と書き込むＺ値との比較モードを設定する( ３Ｄ描画のみに影響 )( CmpType:DX_CMP_NEVER等( デフォルト:DX_CMP_LESSEQUAL ) )

proc SetZBias3D*(Bias: cint): cint
##  書き込むＺ値のバイアスを設定する( ３Ｄ描画のみに影響 )( Bias:バイアス値( デフォルト:0 ) )

proc SetDrawZ*(Z: cfloat): cint
##  ２Ｄ描画でＺバッファに書き込むＺ値を設定する( Z:書き込むＺ値( デフォルト:0.2f ) )

proc SetUseReversedZ*(Flag: cint): cint
##  Ｚバッファに書き込むＺ値を標準方式と反転した値( リバースＺ )にするかどうかを設定する、DxLib_Init実行前のみ使用可能( TRUE:反転した値にする　FALSE:通常の値にする( デフォルト ) )

proc SetDrawArea*(x1: cint; y1: cint; x2: cint; y2: cint): cint
##  描画可能領域の設定する

proc GetDrawArea*(Rect: ptr RECT): cint
##  描画可能領域を取得する

proc SetDrawAreaFull*(): cint
##  描画可能領域を描画対象画面全体にする

proc SetDraw3DScale*(Scale: cfloat): cint
##  ３Ｄ描画の拡大率を設定する

proc SetRestoreShredPoint*(ShredPoint: proc ()): cint
##  SetRestoreGraphCallback の旧名

proc SetRestoreGraphCallback*(Callback: proc ()): cint
##  グラフィックハンドル復元関数を登録する

proc RunRestoreShred*(): cint
##  グラフィック復元関数を実行する

proc SetGraphicsDeviceRestoreCallbackFunction*(Callback: proc (Data: pointer);
    CallbackData: pointer): cint
##  グラフィックスデバイスがロストから復帰した際に呼ばれるコールバック関数を設定する

proc SetGraphicsDeviceLostCallbackFunction*(Callback: proc (Data: pointer);
    CallbackData: pointer): cint
##  グラフィックスデバイスがロストから復帰する前に呼ばれるコールバック関数を設定する

proc SetTransformTo2D*(Matrix: ptr MATRIX): cint
##  ２Ｄ描画に使用される変換行列を設定する

proc SetTransformTo2DD*(Matrix: ptr MATRIX_D): cint
##  ２Ｄ描画に使用される変換行列を設定する

proc ResetTransformTo2D*(): cint
##  ２Ｄ描画用に使用する変換行列の設定を初期状態に戻す

proc SetTransformToWorld*(Matrix: ptr MATRIX): cint
##  ローカル座標からワールド座標に変換するための行列を設定する

proc SetTransformToWorldD*(Matrix: ptr MATRIX_D): cint
##  ローカル座標からワールド座標に変換するための行列を設定する

proc GetTransformToWorldMatrix*(MatBuf: ptr MATRIX): cint
##  ローカル座標からワールド座標に変換するための行列を取得する

proc GetTransformToWorldMatrixD*(MatBuf: ptr MATRIX_D): cint
##  ローカル座標からワールド座標に変換するための行列を取得する

proc SetTransformToView*(Matrix: ptr MATRIX): cint
##  ワールド座標からビュー座標に変換するための行列を設定する

proc SetTransformToViewD*(Matrix: ptr MATRIX_D): cint
##  ワールド座標からビュー座標に変換するための行列を設定する

proc GetTransformToViewMatrix*(MatBuf: ptr MATRIX): cint
##  ワールド座標からビュー座標に変換するための行列を取得する

proc GetTransformToViewMatrixD*(MatBuf: ptr MATRIX_D): cint
##  ワールド座標からビュー座標に変換するための行列を取得する

proc SetTransformToProjection*(Matrix: ptr MATRIX): cint
##  ビュー座標からプロジェクション座標に変換するための行列を設定する

proc SetTransformToProjectionD*(Matrix: ptr MATRIX_D): cint
##  ビュー座標からプロジェクション座標に変換するための行列を設定する

proc GetTransformToProjectionMatrix*(MatBuf: ptr MATRIX): cint
##  ビュー座標からプロジェクション座標に変換するための行列を取得する

proc GetTransformToProjectionMatrixD*(MatBuf: ptr MATRIX_D): cint
##  ビュー座標からプロジェクション座標に変換するための行列を取得する

proc SetTransformToViewport*(Matrix: ptr MATRIX): cint
##  ビューポート行列を設定する

proc SetTransformToViewportD*(Matrix: ptr MATRIX_D): cint
##  ビューポート行列を設定する

proc GetTransformToViewportMatrix*(MatBuf: ptr MATRIX): cint
##  ビューポート行列を取得する

proc GetTransformToViewportMatrixD*(MatBuf: ptr MATRIX_D): cint
##  ビューポート行列を取得する

proc GetTransformToAPIViewportMatrix*(MatBuf: ptr MATRIX): cint
##  Direct3Dで自動適用されるビューポート行列を取得する

proc GetTransformToAPIViewportMatrixD*(MatBuf: ptr MATRIX_D): cint
##  Direct3Dで自動適用されるビューポート行列を取得する

proc SetDefTransformMatrix*(): cint
##  デフォルトの変換行列を設定する

proc GetTransformPosition*(LocalPos: ptr VECTOR; x: ptr cfloat; y: ptr cfloat): cint
##  ローカル座標からスクリーン座標を取得する

proc GetTransformPositionD*(LocalPos: ptr VECTOR_D; x: ptr cdouble; y: ptr cdouble): cint
##  ローカル座標からスクリーン座標を取得する

proc GetBillboardPixelSize*(WorldPos: VECTOR; WorldSize: cfloat): cfloat
##  ワールド空間上のビルボードのサイズからスクリーンに投影した場合のピクセル単位のサイズを取得する

proc GetBillboardPixelSizeD*(WorldPos: VECTOR_D; WorldSize: cdouble): cdouble
##  ワールド空間上のビルボードのサイズからスクリーンに投影した場合のピクセル単位のサイズを取得する

proc ConvWorldPosToViewPos*(WorldPos: VECTOR): VECTOR
##  ワールド座標をビュー座標に変換する

proc ConvWorldPosToViewPosD*(WorldPos: VECTOR_D): VECTOR_D
##  ワールド座標をビュー座標に変換する

proc ConvWorldPosToScreenPos*(WorldPos: VECTOR): VECTOR
##  ワールド座標をスクリーン座標に変換する

proc ConvWorldPosToScreenPosD*(WorldPos: VECTOR_D): VECTOR_D
##  ワールド座標をスクリーン座標に変換する

proc ConvWorldPosToScreenPosPlusW*(WorldPos: VECTOR): FLOAT4
##  ワールド座標をスクリーン座標に変換する、最後のＸＹＺ座標をＷで割る前の値を得る

proc ConvWorldPosToScreenPosPlusWD*(WorldPos: VECTOR_D): DOUBLE4
##  ワールド座標をスクリーン座標に変換する、最後のＸＹＺ座標をＷで割る前の値を得る

proc ConvScreenPosToWorldPos*(ScreenPos: VECTOR): VECTOR
##  スクリーン座標をワールド座標に変換する

proc ConvScreenPosToWorldPosD*(ScreenPos: VECTOR_D): VECTOR_D
##  スクリーン座標をワールド座標に変換する

proc ConvScreenPosToWorldPos_ZLinear*(ScreenPos: VECTOR): VECTOR
##  スクリーン座標をワールド座標に変換する( Z座標が線形 )

proc ConvScreenPosToWorldPos_ZLinearD*(ScreenPos: VECTOR_D): VECTOR_D
##  スクリーン座標をワールド座標に変換する( Z座標が線形 )

proc SetUseCullingFlag*(Flag: cint): cint
##  SetUseBackCulling の旧名称

proc SetUseBackCulling*(Flag: cint): cint
  ##  DX_CULLING_LEFT 等
##  ポリゴンカリングモードを設定する

proc GetUseBackCulling*(): cint
##  ポリゴンカリングモードを取得する

proc SetUseRightHandClippingProcess*(Flag: cint): cint
##  右手座標系のクリッピング処理を行うかを設定する( TRUE:右手座標系のクリッピング処理を行う  FALSE:左手座標系のクリッピング処理を行う( デフォルト ) )

proc GetUseRightHandClippingProcess*(): cint
##  右手座標系のクリッピング処理を行うかを取得する( TRUE:右手座標系のクリッピング処理を行う  FALSE:左手座標系のクリッピング処理を行う( デフォルト ) )

proc SetTextureAddressMode*(Mode: cint; ##  DX_TEXADDRESS_WRAP 等
                           Stage: cint = -1): cint
##  テクスチャアドレスモードを設定する

proc SetTextureAddressModeUV*(ModeU: cint; ModeV: cint; Stage: cint = -1): cint
##  テクスチャアドレスモードを設定する( U と V を別々に設定する )

proc SetTextureAddressTransform*(TransU: cfloat; TransV: cfloat; ScaleU: cfloat;
                                ScaleV: cfloat; RotCenterU: cfloat;
                                RotCenterV: cfloat; Rotate: cfloat): cint
##  テクスチャ座標変換パラメータを設定する

proc SetTextureAddressTransformMatrix*(Matrix: MATRIX): cint
##  テクスチャ座標変換行列を設定する

proc ResetTextureAddressTransform*(): cint
##  テクスチャ座標変換設定をリセットする

proc SetFogEnable*(Flag: cint): cint
##  フォグを有効にするかどうかを設定する( TRUE:有効  FALSE:無効 )

proc GetFogEnable*(): cint
##  フォグが有効かどうかを取得する( TRUE:有効  FALSE:無効 )

proc SetFogMode*(Mode: cint): cint
  ##  DX_FOGMODE_NONE 等
##  フォグモードを設定する

proc GetFogMode*(): cint
##  フォグモードを取得する

proc SetFogColor*(r: cint; g: cint; b: cint): cint
##  フォグカラーを設定する

proc GetFogColor*(r: ptr cint; g: ptr cint; b: ptr cint): cint
##  フォグカラーを取得する

proc SetFogStartEnd*(start: cfloat; `end`: cfloat): cint
##  フォグが始まる距離と終了する距離を設定する( 0.0f ～ 1.0f )

proc GetFogStartEnd*(start: ptr cfloat; `end`: ptr cfloat): cint
##  フォグが始まる距離と終了する距離を取得する( 0.0f ～ 1.0f )

proc SetFogDensity*(density: cfloat): cint
##  フォグの密度を設定する( 0.0f ～ 1.0f )

proc GetFogDensity*(): cfloat
##  フォグの密度を取得する( 0.0f ～ 1.0f )

proc SetVerticalFogEnable*(Flag: cint): cint
##  高さフォグを有効にするかどうかを設定する( TRUE:有効  FALSE:無効 )

proc GetVerticalFogEnable*(): cint
##  高さフォグが有効かどうかを取得する( TRUE:有効  FALSE:無効 )

proc SetVerticalFogMode*(Mode: cint): cint
  ##  DX_FOGMODE_NONE 等
##  高さフォグモードを設定する

proc GetVerticalFogMode*(): cint
##  高さフォグモードを取得する

proc SetVerticalFogColor*(r: cint; g: cint; b: cint): cint
##  高さフォグカラーを設定する

proc GetVerticalFogColor*(r: ptr cint; g: ptr cint; b: ptr cint): cint
##  高さフォグカラーを取得する

proc SetVerticalFogStartEnd*(start: cfloat; `end`: cfloat): cint
##  高さフォグが始まる距離と終了する距離を設定する( 0.0f ～ 1.0f )

proc GetVerticalFogStartEnd*(start: ptr cfloat; `end`: ptr cfloat): cint
##  高さフォグが始まる距離と終了する距離を取得する( 0.0f ～ 1.0f )

proc SetVerticalFogDensity*(start: cfloat; density: cfloat): cint
##  高さフォグが始まる処理と密度を設定する( 0.0f ～ 1.0f )

proc GetVerticalFogDensity*(start: ptr cfloat; density: ptr cfloat): cint
##  高さフォグの始まる処理と密度を取得する( 0.0f ～ 1.0f )
##  画面関係関数

proc GetPixel*(x: cint; y: cint): cuint
##  指定座標の色を取得する

proc GetPixelDX*(x: cint; y: cint): cuint
##  指定座標の色を取得する

proc GetPixelF*(x: cint; y: cint): COLOR_F
##  指定座標の色を取得する( float型 )

proc SetBackgroundColor*(Red: cint; Green: cint; Blue: cint; Alpha: cint = 0): cint
##  メインウインドウの背景色を設定する( Red,Green,Blue,Alpha:それぞれ ０～２５５ )

proc GetBackgroundColor*(Red: ptr cint; Green: ptr cint; Blue: ptr cint;
                        Alpha: ptr cint = nil): cint
##  メインウインドウの背景色を取得する( Red,Green,Blue,Alpha:それぞれ ０～２５５ )

proc GetDrawScreenGraph*(x1: cint; y1: cint; x2: cint; y2: cint; GrHandle: cint;
                        UseClientFlag: cint = TRUE): cint
##  描画先の画面から指定領域の画像情報をグラフィックハンドルに転送する

proc BltDrawValidGraph*(TargetDrawValidGrHandle: cint; x1: cint; y1: cint; x2: cint;
                       y2: cint; DestX: cint; DestY: cint; DestGrHandle: cint): cint
##  SetDrawScreen で描画対象にできるグラフィックハンドルから指定領域の画像情報を別のグラフィックハンドルに転送する

proc ScreenFlip*(): cint
##  裏画面と表画面の内容を交換する

proc ScreenCopy*(): cint
##  裏画面の内容を表画面に転送する

proc WaitVSync*(SyncNum: cint): cint
##  垂直同期信号を待つ

proc ClearDrawScreen*(ClearRect: ptr RECT = nil): cint
##  画面をクリアする

proc ClearDrawScreenZBuffer*(ClearRect: ptr RECT = nil): cint
##  画面のＺバッファをクリアする

proc ClsDrawScreen*(): cint
##  ClearDrawScreenの旧名称

proc SetDrawScreen*(DrawScreen: cint): cint
##  描画先画面を設定する( MakeScreen で作成したグラフィックハンドルも渡すことができます )

proc GetDrawScreen*(): cint
##  描画先画面を取得する

proc GetActiveGraph*(): cint
##  GetDrawScreen の旧名称

proc SetUseSetDrawScreenSettingReset*(UseFlag: cint): cint
##  SetDrawScreen を実行した際にカメラや描画範囲の設定をリセットするかを設定する( UseFlag  TRUE:リセットする( デフォルト )  FALSE:リセットしない )

proc GetUseSetDrawScreenSettingReset*(): cint
##  SetDrawScreen を実行した際にカメラや描画範囲の設定をリセットするかを取得する

proc SetDrawZBuffer*(DrawScreen: cint): cint
##  描画先Ｚバッファのセット( DrawScreen 付属のＺバッファを描画先Ｚバッファにする、DrawScreen を -1 にするとデフォルトの描画先Ｚバッファに戻る )

proc SetGraphMode*(ScreenSizeX: cint; ScreenSizeY: cint; ColorBitDepth: cint;
                  RefreshRate: cint = 60): cint
##  画面モードを設定する

proc SetUserScreenImage*(Image: pointer; PixelFormat: cint): cint
  ##  DX_USER_SCREEN_PIXEL_FORMAT_R5G6B5 等
##  画面のメモリイメージをセットする( DxLib_Init の前で呼ぶ必要がある( DxLib_Init の前に一度でも呼んでいれば、DxLib_Init 後は Image のアドレスのみの変更目的で呼ぶことは可能 )、PixelFormat に DX_USER_SCREEN_PIXEL_FORMAT_R5G6B5 又は DX_USER_SCREEN_PIXEL_FORMAT_X8R8G8B8 の二つ以外を指定した場合はＤＸライブラリの描画関数は一切使用できなくなります )

proc SetFullScreenResolutionMode*(ResolutionMode: cint): cint
  ##  DX_FSRESOLUTIONMODE_NATIVE 等
##  フルスクリーン解像度モードを設定する

proc GetFullScreenResolutionMode*(ResolutionMode: ptr cint;
                                 UseResolutionMode: ptr cint): cint
##  フルスクリーン解像度モードを取得する( UseResolutionMode は実際に使用されている解像度モード( 例えば DX_FSRESOLUTIONMODE_NATIVE を指定していてもモニタが指定の解像度に対応していない場合は UseResolutionMode が DX_FSRESOLUTIONMODE_DESKTOP や DX_FSRESOLUTIONMODE_MAXIMUM になります ) )

proc GetUseFullScreenResolutionMode*(): cint
##  フルスクリーン解像度モードを取得する( GetFullScreenResolutionMode の UseResolutionMode で取得できる値を返す関数 )

proc SetFullScreenScalingMode*(ScalingMode: cint; ##  DX_FSSCALINGMODE_NEAREST 等
                              FitScaling: cint = FALSE): cint
##  フルスクリーンモード時の画面拡大モードを設定する

proc SetEmulation32576*(Flag: cint): cint
##  ６４０ｘ４８０の画面で３２０ｘ２４０の画面解像度にするかどうかを設定する、６４０ｘ４８０以外の解像度では無効( TRUE:有効  FALSE:無効 )

proc SetZBufferSize*(ZBufferSizeX: cint; ZBufferSizeY: cint): cint
##  画面用のＺバッファのサイズを設定する

proc SetZBufferBitDepth*(BitDepth: cint): cint
##  画面用のＺバッファのビット深度を設定する( 16 or 24 or 32 )

proc SetWaitVSyncFlag*(Flag: cint): cint
##  ScreenFlip 実行時にＶＳＹＮＣ待ちをするかどうかを設定する

proc GetWaitVSyncFlag*(): cint
##  ScreenFlip 実行時にＶＳＹＮＣ待ちをするかどうかを取得する

proc SetFullSceneAntiAliasingMode*(Samples: cint; Quality: cint): cint
##  画面のフルスクリーンアンチエイリアスモードの設定を行う( DxLib_Init の前でのみ使用可能 )

proc SetGraphDisplayArea*(x1: cint; y1: cint; x2: cint; y2: cint): cint
##  ScreenFlip 時に表画面全体に転送する裏画面の領域を設定する( DxLib_Init の前でのみ使用可能 )

proc SetChangeScreenModeGraphicsSystemResetFlag*(Flag: cint): cint
##  画面モード変更時( とウインドウモード変更時 )にグラフィックスシステムの設定やグラフィックハンドルをリセットするかどうかを設定する( TRUE:リセットする( デフォルト )  FALSE:リセットしない )

proc GetScreenState*(SizeX: ptr cint; SizeY: ptr cint; ColorBitDepth: ptr cint): cint
##  現在の画面の解像度とカラービット数を得る

proc GetDrawScreenSize*(XBuf: ptr cint; YBuf: ptr cint): cint
##  描画先のサイズを取得する

proc GetScreenBitDepth*(): cint
##  画面のカラービット数を取得する

proc GetColorBitDepth*(): cint
##  GetScreenBitDepth の旧名称

proc GetChangeDisplayFlag*(): cint
##  画面モードが変更されているかどうかを取得する

proc GetVideoMemorySize*(AllSize: ptr cint; FreeSize: ptr cint): cint
##  ビデオメモリの容量を得る

proc GetVideoMemorySizeEx*(TotalSize: ptr ULONGLONG; UseSize: ptr ULONGLONG): cint
##  ビデオメモリの容量を得る( 64bit版 )

proc GetRefreshRate*(): cint
##  現在の画面のリフレッシュレートを取得する

proc GetDisplayNum*(): cint
##  ディスプレイの数を取得

proc GetDisplayInfo*(DisplayIndex: cint; DesktopRectX: ptr cint;
                    DesktopRectY: ptr cint; DesktopSizeX: ptr cint;
                    DesktopSizeY: ptr cint; IsPrimary: ptr cint;
                    DesktopRefreshRate: ptr cint = nil): cint
##  ディスプレイのデスクトップ上での矩形位置を取得する

proc GetDisplayModeNum*(DisplayIndex: cint = 0): cint
##  変更可能なディスプレイモードの数を取得する

proc GetDisplayMode*(ModeIndex: cint; DisplayIndex: cint = 0): DISPLAYMODEDATA
##  変更可能なディスプレイモードの情報を取得する( ModeIndex は 0 ～ GetDisplayModeNum の戻り値-1 )

proc GetFullScreenUseDisplayMode*(): DISPLAYMODEDATA
##  フルスクリーンモードで起動している場合の使用しているディスプレイモードの情報を取得する( 仮想フルスクリーンモードの場合は取得できない )

proc GetDisplayMaxResolution*(SizeX: ptr cint; SizeY: ptr cint; DisplayIndex: cint = 0): cint
##  ディスプレイの最大解像度を取得する

proc GetDispColorData*(): ptr COLORDATA
##  ディスプレイのカラーデータアドレスを取得する

proc GetMultiDrawScreenNum*(): cint
##  同時に描画を行うことができる画面の数を取得する

proc GetDrawFloatCoordType*(): cint
##  DrawGraphF 等の浮動小数点値で座標を指定する関数における座標タイプを取得する( 戻り値 : DX_DRAWFLOATCOORDTYPE_DIRECT3D9 など )
##  その他設定関係関数

proc SetUseNormalDrawShader*(Flag: cint): cint
##  通常描画にプログラマブルシェーダーを使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )

proc SetUseSoftwareRenderModeFlag*(Flag: cint): cint
##  ソフトウエアレンダリングモードを使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない( デフォルト ) )( DxLib_Init の前に呼ぶ必要があります )

proc SetNotUse3DFlag*(Flag: cint): cint
##  ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )３Ｄ機能を使わないかどうかを設定する

proc SetUse3DFlag*(Flag: cint): cint
##  ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )３Ｄ機能を使うかどうかを設定する

proc GetUse3DFlag*(): cint
##  描画に３Ｄ機能を使うかどうかを取得する

proc SetScreenMemToVramFlag*(Flag: cint): cint
##  ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )画面のピクセルデータをＶＲＡＭに置くかどうかを設定する

proc GetScreenMemToSystemMemFlag*(): cint
##  画面のピクセルデータがシステムメモリ上に存在するかを取得する

proc SetWindowDrawRect*(DrawRect: ptr RECT): cint
##  通常使用しない

proc RestoreGraphSystem*(): cint
##  ＤＸライブラリのグラフィックス処理関連の復帰処理を行う

proc SetUseHardwareVertexProcessing*(Flag: cint): cint
##  ハードウエアの頂点演算処理機能を使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )( DxLib_Init の前に呼ぶ必要があります )

proc SetUsePixelLighting*(Flag: cint): cint
##  ピクセル単位でライティングを行うかどうかを設定する、要 ShaderModel 3.0( TRUE:ピクセル単位のライティングを行う  FALSE:頂点単位のライティングを行う( デフォルト ) )

proc SetUseOldDrawModiGraphCodeFlag*(Flag: cint): cint
##  古いバージョンの DrawModiGraph 関数のコードを使用するかどうかを設定する

proc SetUseVramFlag*(Flag: cint): cint
##  ( 現在効果なし )ＶＲＡＭを使用するかのフラグをセットする

proc GetUseVramFlag*(): cint
##  ( 現在効果なし )２Ｄグラフィックサーフェス作成時にシステムメモリーを使用するかのフラグ取得

proc SetBasicBlendFlag*(Flag: cint): cint
##  ( 現在効果なし )簡略化ブレンド処理を行うか否かのフラグをセットする

proc SetUseBasicGraphDraw3DDeviceMethodFlag*(Flag: cint): cint
##  ( 現在効果なし )単純図形の描画に３Ｄデバイスの機能を使用するかどうかを設定する

proc SetUseDisplayIndex*(Index: cint): cint
##  ＤＸライブラリのウインドウを表示するディスプレイデバイスを設定する( -1 を指定するとマウスカーソルがあるディスプレイデバイスにＤＸライブラリのウインドウを表示する )

proc RenderVertex*(): cint
##  頂点バッファに溜まった頂点データを描画する( 特殊用途 )
##  描画パフォーマンス関係関数

proc GetDrawCallCount*(): cint
##  前々回の ScreenFlip 呼び出しから、前回の ScreenFlip 呼び出しまでの間に行われた描画コールの回数を取得する

proc GetFPS*(): cfloat
##  フレームレート( １秒間に呼ばれる ScreenFlip の回数 )を取得する
##  描画先画面保存関数
##  Jpeg_Quality         = 0:低画質～100:高画質
##  Png_CompressionLevel = 0:無圧縮～  9:最高圧縮

proc SaveDrawScreen*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: cstring;
                    SaveType: cint = DX_IMAGESAVETYPE_BMP; Jpeg_Quality: cint = 80;
                    Jpeg_Sample2x1: cint = TRUE; Png_CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をファイルで保存する

proc SaveDrawScreenWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                              FileName: cstring; FileNameLength: csize_t;
                              SaveType: cint = DX_IMAGESAVETYPE_BMP;
                              Jpeg_Quality: cint = 80; Jpeg_Sample2x1: cint = TRUE;
                              Png_CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をファイルで保存する

proc SaveDrawScreenToBMP*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: cstring): cint
##  現在描画対象になっている画面をＢＭＰ形式で保存する

proc SaveDrawScreenToBMPWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   FileName: cstring; FileNameLength: csize_t): cint
##  現在描画対象になっている画面をＢＭＰ形式で保存する

proc SaveDrawScreenToDDS*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: cstring): cint
##  現在描画対象になっている画面をＤＤＳ形式で保存する

proc SaveDrawScreenToDDSWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   FileName: cstring; FileNameLength: csize_t): cint
##  現在描画対象になっている画面をＤＤＳ形式で保存する

proc SaveDrawScreenToJPEG*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: cstring;
                          Quality: cint = 80; Sample2x1: cint = TRUE): cint
##  現在描画対象になっている画面をＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawScreenToJPEGWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                    FileName: cstring; FileNameLength: csize_t;
                                    Quality: cint = 80; Sample2x1: cint = TRUE): cint
##  現在描画対象になっている画面をＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawScreenToPNG*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: cstring;
                         CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveDrawScreenToPNGWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   FileName: cstring; FileNameLength: csize_t;
                                   CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9
##  描画対象にできるグラフィックハンドル保存関数
##  Jpeg_Quality         = 0:低画質～100:高画質
##  Png_CompressionLevel = 0:無圧縮～  9:最高圧縮

proc SaveDrawValidGraph*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                        FileName: cstring; SaveType: cint = DX_IMAGESAVETYPE_BMP;
                        Jpeg_Quality: cint = 80; Jpeg_Sample2x1: cint = TRUE;
                        Png_CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをファイルで保存する

proc SaveDrawValidGraphWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                  y2: cint; FileName: cstring;
                                  FileNameLength: csize_t;
                                  SaveType: cint = DX_IMAGESAVETYPE_BMP;
                                  Jpeg_Quality: cint = 80;
                                  Jpeg_Sample2x1: cint = TRUE;
                                  Png_CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをファイルで保存する

proc SaveDrawValidGraphToBMP*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                             FileName: cstring): cint
##  描画対象にできるグラフィックハンドルをＢＭＰ形式で保存する

proc SaveDrawValidGraphToBMPWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                       y2: cint; FileName: cstring;
                                       FileNameLength: csize_t): cint
##  描画対象にできるグラフィックハンドルをＢＭＰ形式で保存する

proc SaveDrawValidGraphToDDS*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                             FileName: cstring): cint
##  描画対象にできるグラフィックハンドルをＤＤＳ形式で保存する

proc SaveDrawValidGraphToDDSWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                       y2: cint; FileName: cstring;
                                       FileNameLength: csize_t): cint
##  描画対象にできるグラフィックハンドルをＤＤＳ形式で保存する

proc SaveDrawValidGraphToJPEG*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                              FileName: cstring; Quality: cint = 80;
                              Sample2x1: cint = TRUE): cint
##  描画対象にできるグラフィックハンドルをＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawValidGraphToJPEGWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                        y2: cint; FileName: cstring;
                                        FileNameLength: csize_t;
                                        Quality: cint = 80; Sample2x1: cint = TRUE): cint
##  描画対象にできるグラフィックハンドルをＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawValidGraphToPNG*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                             FileName: cstring; CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveDrawValidGraphToPNGWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                       y2: cint; FileName: cstring;
                                       FileNameLength: csize_t;
                                       CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9
##  頂点バッファ関係関数

proc CreateVertexBuffer*(VertexNum: cint; VertexType: cint): cint
  ##  DX_VERTEX_TYPE_NORMAL_3D 等
##  頂点バッファを作成する( -1:エラー  0以上:頂点バッファハンドル )

proc DeleteVertexBuffer*(VertexBufHandle: cint): cint
##  頂点バッファを削除する

proc InitVertexBuffer*(): cint
##  すべての頂点バッファを削除する

proc SetVertexBufferData*(SetIndex: cint; VertexArray: pointer; VertexNum: cint;
                         VertexBufHandle: cint): cint
##  頂点バッファに頂点データを転送する

proc GetBufferVertexBuffer*(VertexBufHandle: cint): pointer
##  頂点バッファハンドルの頂点バッファのアドレスを取得する

proc UpdateVertexBuffer*(VertexBufHandle: cint; UpdateStartIndex: cint;
                        UpdateVertexNum: cint): cint
##  頂点バッファハンドルの頂点バッファへの変更を適用する( GetBufferVertexBuffer で取得したバッファへの変更を反映する )

proc CreateIndexBuffer*(IndexNum: cint; IndexType: cint): cint
  ##  DX_INDEX_TYPE_16BIT 等
##  インデックスバッファを作成する( -1:エラー　0以上：インデックスバッファハンドル )

proc DeleteIndexBuffer*(IndexBufHandle: cint): cint
##  インデックスバッファを削除する

proc InitIndexBuffer*(): cint
##  すべてのインデックスバッファを削除する

proc SetIndexBufferData*(SetIndex: cint; IndexArray: pointer; IndexNum: cint;
                        IndexBufHandle: cint): cint
##  インデックスバッファにインデックスデータを転送する

proc GetBufferIndexBuffer*(IndexBufHandle: cint): pointer
##  インデックスバッファハンドルのインデックスバッファのアドレスを取得する

proc UpdateIndexBuffer*(IndexBufHandle: cint; UpdateStartIndex: cint;
                       UpdateIndexNum: cint): cint
##  インデックスバッファハンドルのインデックスバッファへの変更を適用する( GetBufferIndexBuffer で取得したバッファへの変更を反映する )

proc GetMaxPrimitiveCount*(): cint
##  グラフィックスデバイスが対応している一度に描画できるプリミティブの最大数を取得する

proc GetMaxVertexIndex*(): cint
##  グラフィックスデバイスが対応している一度に使用することのできる最大頂点数を取得する
##  シェーダー関係関数

proc GetValidShaderVersion*(): cint
##  使用できるシェーダーのバージョンを取得する( 0=使えない  200=シェーダーモデル２．０が使用可能  300=シェーダーモデル３．０が使用可能 )

proc LoadVertexShader*(FileName: cstring): cint
##  頂点シェーダーバイナリをファイルから読み込み頂点シェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadVertexShaderWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  頂点シェーダーバイナリをファイルから読み込み頂点シェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadGeometryShader*(FileName: cstring): cint
##  ジオメトリシェーダーバイナリをファイルから読み込みジオメトリシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadGeometryShaderWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  ジオメトリシェーダーバイナリをファイルから読み込みジオメトリシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadPixelShader*(FileName: cstring): cint
##  ピクセルシェーダーバイナリをファイルから読み込みピクセルシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadPixelShaderWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  ピクセルシェーダーバイナリをファイルから読み込みピクセルシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadVertexShaderFromMem*(ImageAddress: pointer; ImageSize: cint): cint
##  メモリに読み込まれた頂点シェーダーバイナリから頂点シェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadGeometryShaderFromMem*(ImageAddress: pointer; ImageSize: cint): cint
##  メモリに読み込まれたジオメトリシェーダーバイナリからジオメトリシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadPixelShaderFromMem*(ImageAddress: pointer; ImageSize: cint): cint
##  メモリに読み込まれたピクセルシェーダーバイナリからピクセルシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc DeleteShader*(ShaderHandle: cint): cint
##  シェーダーハンドルの削除( 頂点シェーダー・ピクセルシェーダー共通 )

proc InitShader*(): cint
##  シェーダーハンドルを全て削除する( 頂点シェーダーハンドル・ピクセルシェーダーハンドルどちらもすべて削除 )

proc GetConstIndexToShader*(ConstantName: cstring; ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の番号を取得する

proc GetConstIndexToShaderWithStrLen*(ConstantName: cstring;
                                     ConstantNameLength: csize_t;
                                     ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の番号を取得する

proc GetConstCountToShader*(ConstantName: cstring; ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の数を取得する

proc GetConstCountToShaderWithStrLen*(ConstantName: cstring;
                                     ConstantNameLength: csize_t;
                                     ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の数を取得する

proc GetConstDefaultParamFToShader*(ConstantName: cstring; ShaderHandle: cint): ptr FLOAT4
##  指定の名前を持つ浮動小数点数定数のデフォルトパラメータが格納されているメモリアドレスを取得する

proc GetConstDefaultParamFToShaderWithStrLen*(ConstantName: cstring;
    ConstantNameLength: csize_t; ShaderHandle: cint): ptr FLOAT4
##  指定の名前を持つ浮動小数点数定数のデフォルトパラメータが格納されているメモリアドレスを取得する

proc SetVSConstSF*(ConstantIndex: cint; Param: cfloat): cint
##  頂点シェーダーの float 型定数を設定する

proc SetVSConstF*(ConstantIndex: cint; Param: FLOAT4): cint
##  頂点シェーダーの float 型定数を設定する

proc SetVSConstFMtx*(ConstantIndex: cint; Param: MATRIX): cint
##  頂点シェーダーの float 型定数に行列を設定する

proc SetVSConstFMtxT*(ConstantIndex: cint; Param: MATRIX): cint
##  頂点シェーダーの float 型定数に転置した行列を設定する

proc SetVSConstSI*(ConstantIndex: cint; Param: cint): cint
##  頂点シェーダーの int   型定数を設定する

proc SetVSConstI*(ConstantIndex: cint; Param: INT4): cint
##  頂点シェーダーの int   型定数を設定する

proc SetVSConstB*(ConstantIndex: cint; Param: BOOL): cint
##  頂点シェーダーの BOOL  型定数を設定する

proc SetVSConstSFArray*(ConstantIndex: cint; ParamArray: ptr cfloat; ParamNum: cint): cint
##  頂点シェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetVSConstFArray*(ConstantIndex: cint; ParamArray: ptr FLOAT4; ParamNum: cint): cint
##  頂点シェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetVSConstFMtxArray*(ConstantIndex: cint; ParamArray: ptr MATRIX; ParamNum: cint): cint
##  頂点シェーダーの float 型定数に行列を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetVSConstFMtxTArray*(ConstantIndex: cint; ParamArray: ptr MATRIX; ParamNum: cint): cint
##  頂点シェーダーの float 型定数に転置した行列を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetVSConstSIArray*(ConstantIndex: cint; ParamArray: ptr cint; ParamNum: cint): cint
##  頂点シェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetVSConstIArray*(ConstantIndex: cint; ParamArray: ptr INT4; ParamNum: cint): cint
##  頂点シェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetVSConstBArray*(ConstantIndex: cint; ParamArray: ptr BOOL; ParamNum: cint): cint
##  頂点シェーダーの BOOL  型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc ResetVSConstF*(ConstantIndex: cint; ParamNum: cint): cint
##  頂点シェーダーの float 型定数の設定をリセットする

proc ResetVSConstI*(ConstantIndex: cint; ParamNum: cint): cint
##  頂点シェーダーの int   型定数の設定をリセットする

proc ResetVSConstB*(ConstantIndex: cint; ParamNum: cint): cint
##  頂点シェーダーの BOOL  型定数の設定をリセットする

proc SetPSConstSF*(ConstantIndex: cint; Param: cfloat): cint
##  ピクセルシェーダーの float 型定数を設定する

proc SetPSConstF*(ConstantIndex: cint; Param: FLOAT4): cint
##  ピクセルシェーダーの float 型定数を設定する

proc SetPSConstFMtx*(ConstantIndex: cint; Param: MATRIX): cint
##  ピクセルシェーダーの float 型定数に行列を設定する

proc SetPSConstFMtxT*(ConstantIndex: cint; Param: MATRIX): cint
##  ピクセルシェーダーの float 型定数に転置した行列を設定する

proc SetPSConstSI*(ConstantIndex: cint; Param: cint): cint
##  ピクセルシェーダーの int   型定数を設定する

proc SetPSConstI*(ConstantIndex: cint; Param: INT4): cint
##  ピクセルシェーダーの int   型定数を設定する

proc SetPSConstB*(ConstantIndex: cint; Param: BOOL): cint
##  ピクセルシェーダーの BOOL  型定数を設定する

proc SetPSConstSFArray*(ConstantIndex: cint; ParamArray: ptr cfloat; ParamNum: cint): cint
##  ピクセルシェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetPSConstFArray*(ConstantIndex: cint; ParamArray: ptr FLOAT4; ParamNum: cint): cint
##  ピクセルシェーダーの float 型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetPSConstFMtxArray*(ConstantIndex: cint; ParamArray: ptr MATRIX; ParamNum: cint): cint
##  ピクセルシェーダーの float 型定数に行列を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetPSConstFMtxTArray*(ConstantIndex: cint; ParamArray: ptr MATRIX; ParamNum: cint): cint
##  ピクセルシェーダーの float 型定数に転置した行列を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetPSConstSIArray*(ConstantIndex: cint; ParamArray: ptr cint; ParamNum: cint): cint
##  ピクセルシェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetPSConstIArray*(ConstantIndex: cint; ParamArray: ptr INT4; ParamNum: cint): cint
##  ピクセルシェーダーの int   型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc SetPSConstBArray*(ConstantIndex: cint; ParamArray: ptr BOOL; ParamNum: cint): cint
##  ピクセルシェーダーの BOOL  型定数を設定する( 配列を使って連番インデックスに一度に設定 )

proc ResetPSConstF*(ConstantIndex: cint; ParamNum: cint): cint
##  ピクセルシェーダーの float 型定数の設定をリセットする

proc ResetPSConstI*(ConstantIndex: cint; ParamNum: cint): cint
##  ピクセルシェーダーの int   型定数の設定をリセットする

proc ResetPSConstB*(ConstantIndex: cint; ParamNum: cint): cint
##  ピクセルシェーダーの BOOL  型定数の設定をリセットする

proc SetRenderTargetToShader*(TargetIndex: cint; DrawScreen: cint;
                             SurfaceIndex: cint = 0; MipLevel: cint = 0): cint
##  シェーダーを使用した描画での描画先を設定する( DrawScreen に -1 を渡すと無効化 )

proc SetUseTextureToShader*(StageIndex: cint; GraphHandle: cint): cint
##  シェーダーを使用した描画で使用するグラフィックハンドルを設定する

proc SetUseVertexShader*(ShaderHandle: cint): cint
##  シェーダーを使用した描画に使用する頂点シェーダーを設定する( -1を渡すと解除 )

proc SetUseGeometryShader*(ShaderHandle: cint): cint
##  シェーダーを使用した描画に使用するジオメトリシェーダーを設定する( -1を渡すと解除 )

proc SetUsePixelShader*(ShaderHandle: cint): cint
##  シェーダーを使用した描画に使用するピクセルシェーダーを設定する( -1を渡すと解除 )

proc CalcPolygonBinormalAndTangentsToShader*(VertexArray: ptr VERTEX3DSHADER;
    PolygonNum: cint): cint
##  ポリゴンの頂点の接線と従法線をＵＶ座標から計算してセットする

proc CalcPolygonIndexedBinormalAndTangentsToShader*(
    VertexArray: ptr VERTEX3DSHADER; VertexNum: cint; IndexArray: ptr cushort;
    PolygonNum: cint): cint
##  ポリゴンの頂点の接線と従法線をＵＶ座標から計算してセットする( 頂点インデックスを使用する )

proc CalcPolygon32bitIndexedBinormalAndTangentsToShader*(
    VertexArray: ptr VERTEX3DSHADER; VertexNum: cint; IndexArray: ptr cuint;
    PolygonNum: cint): cint
##  ポリゴンの頂点の接線と従法線をＵＶ座標から計算してセットする( 頂点インデックスを使用する )

proc DrawBillboard3DToShader*(Pos: VECTOR; cx: cfloat; cy: cfloat; Size: cfloat;
                             Angle: cfloat; GrHandle: cint; TransFlag: cint;
                             ReverseXFlag: cint = FALSE; ReverseYFlag: cint = FALSE): cint
##  シェーダーを使ってビルボードを描画する

proc DrawPolygon2DToShader*(VertexArray: ptr VERTEX2DSHADER; PolygonNum: cint): cint
##  シェーダーを使って２Ｄポリゴンを描画する

proc DrawPolygon3DToShader*(VertexArray: ptr VERTEX3DSHADER; PolygonNum: cint): cint
##  シェーダーを使って３Ｄポリゴンを描画する

proc DrawPolygonIndexed2DToShader*(VertexArray: ptr VERTEX2DSHADER; VertexNum: cint;
                                  IndexArray: ptr cushort; PolygonNum: cint): cint
##  シェーダーを使って２Ｄポリゴンを描画する( 頂点インデックスを使用する )

proc DrawPolygon32bitIndexed2DToShader*(VertexArray: ptr VERTEX2DSHADER;
                                       VertexNum: cint; IndexArray: ptr cuint;
                                       PolygonNum: cint): cint
##  シェーダーを使って２Ｄポリゴンを描画する( 頂点インデックスを使用する )

proc DrawPolygonIndexed3DToShader*(VertexArray: ptr VERTEX3DSHADER; VertexNum: cint;
                                  IndexArray: ptr cushort; PolygonNum: cint): cint
##  シェーダーを使って３Ｄポリゴンを描画する( 頂点インデックスを使用する )

proc DrawPolygon32bitIndexed3DToShader*(VertexArray: ptr VERTEX3DSHADER;
                                       VertexNum: cint; IndexArray: ptr cuint;
                                       PolygonNum: cint): cint
##  シェーダーを使って３Ｄポリゴンを描画する( 頂点インデックスを使用する )

proc DrawPrimitive2DToShader*(VertexArray: ptr VERTEX2DSHADER; VertexNum: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って２Ｄプリミティブを描画する

proc DrawPrimitive3DToShader*(VertexArray: ptr VERTEX3DSHADER; VertexNum: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って３Ｄプリミティブを描画する

proc DrawPrimitiveIndexed2DToShader*(VertexArray: ptr VERTEX2DSHADER;
                                    VertexNum: cint; IndexArray: ptr cushort;
                                    IndexNum: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って２Ｄプリミティブを描画する( 頂点インデックスを使用する )

proc DrawPrimitive32bitIndexed2DToShader*(VertexArray: ptr VERTEX2DSHADER;
    VertexNum: cint; IndexArray: ptr cuint; IndexNum: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って２Ｄプリミティブを描画する( 頂点インデックスを使用する )

proc DrawPrimitiveIndexed3DToShader*(VertexArray: ptr VERTEX3DSHADER;
                                    VertexNum: cint; IndexArray: ptr cushort;
                                    IndexNum: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って３Ｄプリミティブを描画する( 頂点インデックスを使用する )

proc DrawPrimitive32bitIndexed3DToShader*(VertexArray: ptr VERTEX3DSHADER;
    VertexNum: cint; IndexArray: ptr cuint; IndexNum: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って３Ｄプリミティブを描画する( 頂点インデックスを使用する )

proc DrawPolygon3DToShader_UseVertexBuffer*(VertexBufHandle: cint): cint
##  シェーダーを使って３Ｄポリゴンを描画する( 頂点バッファ使用版 )

proc DrawPolygonIndexed3DToShader_UseVertexBuffer*(VertexBufHandle: cint;
    IndexBufHandle: cint): cint
##  シェーダーを使って３Ｄポリゴンを描画する( 頂点バッファとインデックスバッファ使用版 )

proc DrawPrimitive3DToShader_UseVertexBuffer*(VertexBufHandle: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って３Ｄプリミティブを描画する( 頂点バッファ使用版 )

proc DrawPrimitive3DToShader_UseVertexBuffer2*(VertexBufHandle: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
    StartVertex: cint; UseVertexNum: cint): cint
##  シェーダーを使って３Ｄプリミティブを描画する( 頂点バッファ使用版 )

proc DrawPrimitiveIndexed3DToShader_UseVertexBuffer*(VertexBufHandle: cint;
    IndexBufHandle: cint; PrimitiveType: cint): cint
  ##  DX_PRIMTYPE_TRIANGLELIST 等
##  シェーダーを使って３Ｄプリミティブを描画する( 頂点バッファとインデックスバッファ使用版 )

proc DrawPrimitiveIndexed3DToShader_UseVertexBuffer2*(VertexBufHandle: cint;
    IndexBufHandle: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
    BaseVertex: cint; StartVertex: cint; UseVertexNum: cint; StartIndex: cint;
    UseIndexNum: cint): cint
##  シェーダーを使って３Ｄプリミティブを描画する( 頂点バッファとインデックスバッファ使用版 )
##  シェーダー用定数バッファ関係関数

proc InitShaderConstantBuffer*(): cint
##  全てのシェーダー用定数バッファハンドルを削除する

proc CreateShaderConstantBuffer*(BufferSize: cint): cint
##  シェーダー用定数バッファハンドルを初期化する

proc DeleteShaderConstantBuffer*(SConstBufHandle: cint): cint
##  シェーダー用定数バッファハンドルを削除する

proc GetBufferShaderConstantBuffer*(SConstBufHandle: cint): pointer
##  シェーダー用定数バッファハンドルの定数バッファのアドレスを取得する

proc UpdateShaderConstantBuffer*(SConstBufHandle: cint): cint
##  シェーダー用定数バッファハンドルの定数バッファへの変更を適用する

proc SetShaderConstantBuffer*(SConstBufHandle: cint; TargetShader: cint; ##  DX_SHADERTYPE_VERTEX など
                             Slot: cint): cint
##  シェーダー用定数バッファハンドルの定数バッファを指定のシェーダーの指定のスロットにセットする
##  フィルター関係関数

proc SetGraphFilterBltBlendMode*(BlendMode: cint): cint
  ##  DX_BLENDMODE_ALPHA など
##  GraphFilterBlt や GraphBlendBlt の結果を転送先に転送する際のブレンドモードを設定する( 現状で対応しているのは DX_BLENDMODE_NOBLEND と DX_BLENDMODE_ALPHA のみ )

proc SetGraphBlendScalingFilterMode*(IsBilinearFilter: cint): cint
##  GraphBlend で GrHandle と BlendGrHandle のサイズが異なる場合に適用される拡大フィルターモードを設定する( IsBilinearFilter  TRUE:バイリニアフィルター(デフォルト)  FALSE:ニアレストフィルター )

proc GraphFilter*(GrHandle: cint; FilterType: cint): cint {.varargs.}
  ##  DX_GRAPH_FILTER_GAUSS 等
##  画像にフィルター処理を行う

proc GraphFilterBlt*(SrcGrHandle: cint; DestGrHandle: cint; FilterType: cint): cint {.
    varargs.}
  ##  DX_GRAPH_FILTER_GAUSS 等
##  画像のフィルター付き転送を行う

proc GraphFilterRectBlt*(SrcGrHandle: cint; DestGrHandle: cint; SrcX1: cint;
                        SrcY1: cint; SrcX2: cint; SrcY2: cint; DestX: cint; DestY: cint; FilterType: cint): cint {.
    varargs.}
  ##  DX_GRAPH_FILTER_GAUSS 等
##  画像のフィルター付き転送を行う( 矩形指定 )
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_MONO, int Cb = 青色差( -255 ～ 255 ), int Cr = 赤色差( -255 ～ 255 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_GAUSS, int PixelWidth = 使用ピクセル幅( 8 , 16 , 32 の何れか ), int Param = ぼかしパラメータ( 100 で約1ピクセル分の幅 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_DOWN_SCALE, int DivNum = 元のサイズの何分の１か、という値( 1 , 2 , 4 , 8 の何れか ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_BRIGHT_CLIP, int CmpType = クリップタイプ( DX_CMP_LESS:CmpParam以下をクリップ  又は  DX_CMP_GREATER:CmpParam以上をクリップ ), int CmpParam = クリップパラメータ( 0 ～ 255 ), int ClipFillFlag = クリップしたピクセルを塗りつぶすかどうか( TRUE:塗りつぶす  FALSE:塗りつぶさない ), unsigned int ClipFillColor = クリップしたピクセルに塗る色値( GetColor で取得する )( ClipFillFlag が FALSE の場合は使用しない ), int ClipFillAlpha = クリップしたピクセルに塗るα値( 0 ～ 255 )( ClipFillFlag が FALSE の場合は使用しない ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_BRIGHT_SCALE, int MinBright = 変換後に真っ暗になる明るさ( 0 ～ 255 ), int MaxBright = 変換後に真っ白になる明るさ( 0 ～ 255 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_HSB, int HueType = Hue の意味( 0:相対値  1:絶対値 ), int Hue = 色相パラメータ( HueType が 0 の場合 = ピクセルの色相に対する相対値( -180 ～ 180 )   HueType が 1 の場合 = 色相の絶対値( 0 ～ 360 ) ), int Saturation = 彩度( -255 ～ ), int Bright = 輝度( -255 ～ 255 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_INVERT ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_LEVEL, int Min = 変換元の下限値( 0 ～ 255 ), int Max = 変換元の上限値( 0 ～ 255 ), int Gamma = ガンマ値( 100 でガンマ補正無し、0 とそれ以下の値は不可 ), int AfterMin = 変換後の最低値( 0 ～ 255 ), int AfterMax = 変換後の最大値( 0 ～ 255 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_TWO_COLOR, int Threshold = 閾値( 0 ～ 255 ), unsigned int LowColor = 閾値より値が低かったピクセルの変換後の色値( GetColor で取得する ), int LowAlpha = 閾値より値が低かったピクセルの変換後のα値( 0 ～ 255 ), unsigned int HighColor = 閾値より値が高かったピクセルの変換後の色値( GetColor で取得する ), int HighAlpha = 閾値より値が高かったピクセルの変換後のα値( 0 ～ 255 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_GRADIENT_MAP, int MapGrHandle = グラデーションマップのグラフィックハンドル( 元画像の輝度からグラデーションマップ画像の x 座標を算出しますので縦幅は1dotでもＯＫ ), int Reverse = グラデーションマップ左右反転フラグ( TRUE : グラデーションマップを左右反転して使う  FALSE : 左右反転しない ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_REPLACEMENT, int TargetR, int TargetG, int TargetB, int TargetA = 置換対象の色( 0～255 ), int R, int G, int B, int A = 置換後の色( 0～255 ) ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_PREMUL_ALPHA ) ;			// 通常のアルファチャンネル付き画像を乗算済みアルファ画像に変換するフィルタ
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_INTERP_ALPHA ) ;			// 乗算済みα画像を通常のアルファチャンネル付き画像に変換するフィルタ
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_YUV_TO_RGB ) ;				// YUVカラーをRGBカラーに変換するフィルタ
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_Y2UV1_TO_RGB, int UVGrHandle = YUVカラーのUV成分のみで、且つYに対して解像度が半分( 若しくは 4 分の 1 )のグラフィックハンドル( U=R, V=G ) ) ;		// YUVカラーをRGBカラーに変換するフィルタ( UV成分が Y成分の半分・又は４分の１( 横・縦片方若しくは両方 )の解像度しかない場合用 )
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_YUV_TO_RGB_RRA ) ;				// YUVカラーをRGBカラーに変換するフィルタ( 且つ右側半分のRの値をアルファ値として扱う )
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_Y2UV1_TO_RGB_RRA, int UVGrHandle = YUVカラーのUV成分のみで、且つYに対して解像度が半分( 若しくは 4 分の 1 )のグラフィックハンドル( U=R, V=G ) ) ;		// YUVカラーをRGBカラーに変換するフィルタ( UV成分が Y成分の半分・又は４分の１( 横・縦片方若しくは両方 )の解像度しかない場合用 )( 且つ右側半分のRの値をアルファ値として扱う )
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_BICUBIC_SCALE, int DestSizeX = スケーリング後の横ピクセル数, int DestSizeY = スケーリング後の縦ピクセル数 ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_LANCZOS3_SCALE, int DestSizeX = スケーリング後の横ピクセル数, int DestSizeY = スケーリング後の縦ピクセル数 ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_SSAO, int ColorWithDepthGrHandle = Zバッファが含まれるカラーバッファ, float KernelRadius = 遮蔽物を調べる範囲, float MinDistance = 遮蔽物判定する最小深度値, float MaxDistance = 遮蔽物判定する最大深度値, float Strength = 遮蔽物の影響の強さ, int OcclusionColor = オクリュージョンカラー, float OcclusionPower = オクリュージョンカラーの強さ ) ;
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_FLOAT_COLOR_SCALE, float ColorScaleR = 赤成分へのスケーリング値, float ColorScaleG = 緑成分へのスケーリング値, float ColorScaleB = 青成分へのスケーリング値, float ColorScaleA = α成分へのスケーリング値, float ColorPreSubR = 赤成分にスケーリングを掛ける前に減算する値, float ColorPreSubG = 緑成分にスケーリングを掛ける前に減算する値, float ColorPreSubB = 青成分にスケーリングを掛ける前に減算する値, float ColorPreSubA = α成分にスケーリングを掛ける前に減算する値 ) ;

proc GraphBlend*(GrHandle: cint; BlendGrHandle: cint; BlendRatio: cint; ##  ブレンド効果の影響度( 0:０％  255:１００％ )
                BlendType: cint): cint {.varargs.}
  ##  DX_GRAPH_BLEND_ADD 等
##  二つの画像をブレンドする

proc GraphBlendBlt*(SrcGrHandle: cint; BlendGrHandle: cint; DestGrHandle: cint; BlendRatio: cint; ##  ブレンド効果の影響度( 0:０％  255:１００％ )
                   BlendType: cint): cint {.varargs.}
  ##  DX_GRAPH_BLEND_ADD 等
##  二つの画像をブレンドして結果を指定の画像に出力する

proc GraphBlendRectBlt*(SrcGrHandle: cint; BlendGrHandle: cint; DestGrHandle: cint;
                       SrcX1: cint; SrcY1: cint; SrcX2: cint; SrcY2: cint; BlendX: cint;
                       BlendY: cint; DestX: cint; DestY: cint; BlendRatio: cint; ##  ブレンド効果の影響度( 0:０％  255:１００％ )
                       BlendType: cint): cint {.varargs.}
  ##  DX_GRAPH_BLEND_ADD 等
##  二つの画像をブレンドして結果を指定の画像に出力する( 矩形指定 )

proc GraphBlendRectBlt2*(SrcGrHandle: cint; BlendGrHandle: cint; DestGrHandle: cint;
                        SrcX1: cint; SrcY1: cint; SrcX2: cint; SrcY2: cint;
                        BlendX1: cint; BlendY1: cint; BlendX2: cint; BlendY2: cint;
                        DestX: cint; DestY: cint; BlendRatio: cint; ##  ブレンド効果の影響度( 0:０％  255:１００％ )
                        BlendType: cint): cint {.varargs.}
  ##  DX_GRAPH_BLEND_ADD 等
##  二つの画像をブレンドして結果を指定の画像に出力する( 矩形指定、ブレンド画像も矩形指定 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_NORMAL ) ; // 通常
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_RGBA_SELECT_MIX, int SelectR = ( 出力の赤分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectG = ( 出力の緑成分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectB = ( 出力の青成分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectA = ( 出力のα成分となる成分 DX_RGBA_SELECT_SRC_R 等 ) ) ;	// RGBAの要素を選択して合成
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MULTIPLE ) ;	// 乗算
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DIFFERENCE ) ;	// 減算
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_ADD ) ;		  	// 加算
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_SCREEN ) ;	// スクリーン
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_OVERLAY ) ;	// オーバーレイ
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DODGE ) ;	// 覆い焼き
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_BURN ) ;	// 焼き込み
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DARKEN ) ;	// 比較(暗)
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_LIGHTEN ) ;	// 比較(明)
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_SOFTLIGHT ) ;	// ソフトライト
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_HARDLIGHT ) ;	// ハードライト
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_EXCLUSION ) ;	// 除外
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_NORMAL_ALPHACH ) ;	// αチャンネル付き画像の通常合成
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_ADD_ALPHACH ) ;	// αチャンネル付き画像の加算合成
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MULTIPLE_A_ONLY ) ;	// アルファチャンネルのみの乗算
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MASK ) ;	// マスク( SrcGrHandle に BlendGrHandle を通常描画した上で、SrcGrHandle の A を優先 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_NORMAL ) ; // 通常( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_RGBA_SELECT_MIX ) ; // RGBAの要素を選択して合成( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_MULTIPLE ) ; // 乗算( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_DIFFERENCE ) ; // 減算( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_ADD ) ; // 加算( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_SCREEN ) ; // スクリーン( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_OVERLAY ) ; // オーバーレイ( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_DODGE ) ; // 覆い焼き( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_BURN ) ; // 焼き込み( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_DARKEN ) ; // 比較(暗)( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_LIGHTEN ) ; // 比較(明)( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_SOFTLIGHT ) ; // ソフトライト( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_HARDLIGHT ) ; // ハードライト( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_EXCLUSION ) ; // 除外( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_NORMAL_ALPHACH ) ; // αチャンネル付き画像の通常合成( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_ADD_ALPHACH ) ; // αチャンネル付き画像の加算合成( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_MULTIPLE_A_ONLY ) ;	// アルファチャンネルのみの乗算( 乗算済みα画像用 )
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_MASK ) ;	// マスク( DX_GRAPH_BLEND_MASK の 乗算済みα画像用 )
##  ムービーグラフィック関係関数

proc PlayMovie*(FileName: cstring; ExRate: cint; PlayType: cint): cint
##  動画ファイルの再生

proc PlayMovieWithStrLen*(FileName: cstring; FileNameLength: csize_t; ExRate: cint;
                         PlayType: cint): cint
##  動画ファイルの再生

proc GetMovieImageSize_File*(FileName: cstring; SizeX: ptr cint; SizeY: ptr cint): cint
##  動画ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetMovieImageSize_File_WithStrLen*(FileName: cstring;
                                       FileNameLength: csize_t; SizeX: ptr cint;
                                       SizeY: ptr cint): cint
##  動画ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetMovieImageSize_Mem*(FileImage: pointer; FileImageSize: cint; SizeX: ptr cint;
                           SizeY: ptr cint): cint
##  メモリ上に展開された動画ファイルの横ピクセル数と縦ピクセル数を取得する

proc OpenMovieToGraph*(FileName: cstring; FullColor: cint = TRUE): cint
##  動画ファイルを開く

proc OpenMovieToGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                FullColor: cint = TRUE): cint
##  動画ファイルを開く

proc PlayMovieToGraph*(GraphHandle: cint; PlayType: cint = DX_PLAYTYPE_BACK;
                      SysPlay: cint = 0): cint
##  動画ファイルを使用するグラフィックハンドルの動画ファイルの再生を開始する

proc PauseMovieToGraph*(GraphHandle: cint; SysPause: cint = 0): cint
##  動画ファイルを使用するグラフィックハンドルの動画ファイルの再生を停止する

proc AddMovieFrameToGraph*(GraphHandle: cint; FrameNum: cuint): cint
##  動画ファイルの再生フレームを進める、戻すことは出来ない( 動画ファイルが停止状態で、且つ Ogg Theora のみ有効 )

proc SeekMovieToGraph*(GraphHandle: cint; Time: cint): cint
##  動画ファイルの再生位置を設定する(ミリ秒単位)

proc SetPlaySpeedRateMovieToGraph*(GraphHandle: cint; SpeedRate: cdouble): cint
##  動画ファイルの再生速度を設定する( 1.0 = 等倍速  2.0 = ２倍速 )、一部のファイルフォーマットのみで有効な機能です

proc GetMovieStateToGraph*(GraphHandle: cint): cint
##  動画ファイルの再生状態を得る

proc SetMovieVolumeToGraph*(Volume: cint; GraphHandle: cint): cint
##  動画ファイルの音量を設定する(0～10000)

proc GetMovieVolumeToGraph*(GraphHandle: cint): cint
##  動画ファイルの音量を取得する(0～10000)

proc ChangeMovieVolumeToGraph*(Volume: cint; GraphHandle: cint): cint
##  動画ファイルの音量を設定する(0～255)

proc GetMovieVolumeToGraph2*(GraphHandle: cint): cint
##  動画ファイルの音量を取得する(0～255)

proc GetMovieBaseImageToGraph*(GraphHandle: cint; ImageUpdateFlag: ptr cint = nil;
                              ImageUpdateFlagSetOnly: cint = FALSE): ptr BASEIMAGE
##  動画ファイルの基本イメージデータを取得する( ImageUpdateFlag に int 型変数のアドレスを渡すと、イメージが更新された場合は 1 が、更新されていない場合は 0 が格納されます、 ImageUpdateFlagSetOnly を TRUE にすると戻り値の BASEIMAGE は有効な画像データではなくなりますが、BASEIMAGE の更新処理が行われませんので、ImageUpdateFlag を利用して画像が更新されたかどうかだけをチェックしたい場合は TRUE にしてください )

proc GetMovieTotalFrameToGraph*(GraphHandle: cint): cint
##  動画ファイルの総フレーム数を得る( Ogg Theora と mp4 でのみ有効 )

proc TellMovieToGraph*(GraphHandle: cint): cint
##  動画ファイルの再生位置を取得する(ミリ秒単位)

proc TellMovieToGraphToFrame*(GraphHandle: cint): cint
##  動画ファイルの再生位置を取得する(フレーム単位)

proc SeekMovieToGraphToFrame*(GraphHandle: cint; Frame: cint): cint
##  動画ファイルの再生位置を設定する(フレーム単位)

proc GetOneFrameTimeMovieToGraph*(GraphHandle: cint): LONGLONG
##  動画ファイルの１フレームあたりの時間を取得する(戻り値：１フレームの時間(単位:マイクロ秒))

proc GetLastUpdateTimeMovieToGraph*(GraphHandle: cint): cint
##  動画ファイルのイメージを最後に更新した時間を得る(ミリ秒単位)

proc UpdateMovieToGraph*(GraphHandle: cint): cint
##  動画ファイルの更新処理を行う

proc SetMovieRightImageAlphaFlag*(Flag: cint): cint
##  読み込む動画ファイル映像の右半分の赤成分をα情報として扱うかどうかをセットする( TRUE:α情報として扱う  FALSE:α情報として扱わない( デフォルト ) )

proc SetMovieColorA8R8G8B8Flag*(Flag: cint): cint
##  読み込む動画ファイルが32bitカラーだった場合、A8R8G8B8 形式として扱うかどうかをセットする、32bitカラーではない動画ファイルに対しては無効( Flag  TRUE:A8R8G8B8として扱う  FALSE:X8R8G8B8として扱う( デフォルト ) )

proc SetMovieUseYUVFormatSurfaceFlag*(Flag: cint): cint
##  ＹＵＶフォーマットのサーフェスが使用できる場合はＹＵＶフォーマットのサーフェスを使用するかどうかを設定する( TRUE:使用する( デフォルト ) FALSE:ＲＧＢフォーマットのサーフェスを使用する )
##  カメラ関係関数

proc SetCameraNearFar*(Near: cfloat; Far: cfloat): cint
##  カメラの Nearクリップ面と Farクリップ面の距離を設定する

proc SetCameraNearFarD*(Near: cdouble; Far: cdouble): cint
##  カメラの Nearクリップ面と Farクリップ面の距離を設定する

proc SetCameraPositionAndTarget_UpVecY*(Position: VECTOR; Target: VECTOR): cint
##  カメラの視点、注視点、アップベクトルを設定する( アップベクトルはＹ軸方向から導き出す )

proc SetCameraPositionAndTarget_UpVecYD*(Position: VECTOR_D; Target: VECTOR_D): cint
##  カメラの視点、注視点、アップベクトルを設定する( アップベクトルはＹ軸方向から導き出す )

proc SetCameraPositionAndTargetAndUpVec*(Position: VECTOR; TargetPosition: VECTOR;
                                        UpVector: VECTOR): cint
##  カメラの視点、注視点、アップベクトルを設定する

proc SetCameraPositionAndTargetAndUpVecD*(Position: VECTOR_D;
    TargetPosition: VECTOR_D; UpVector: VECTOR_D): cint
##  カメラの視点、注視点、アップベクトルを設定する

proc SetCameraPositionAndAngle*(Position: VECTOR; VRotate: cfloat; HRotate: cfloat;
                               TRotate: cfloat): cint
##  カメラの視点、注視点、アップベクトルを設定する( 注視点とアップベクトルは垂直回転角度、水平回転角度、捻り回転角度から導き出す )

proc SetCameraPositionAndAngleD*(Position: VECTOR_D; VRotate: cdouble;
                                HRotate: cdouble; TRotate: cdouble): cint
##  カメラの視点、注視点、アップベクトルを設定する( 注視点とアップベクトルは垂直回転角度、水平回転角度、捻り回転角度から導き出す )

proc SetCameraViewMatrix*(ViewMatrix: MATRIX): cint
##  ビュー行列を直接設定する

proc SetCameraViewMatrixD*(ViewMatrix: MATRIX_D): cint
##  ビュー行列を直接設定する

proc SetCameraScreenCenter*(x: cfloat; y: cfloat): cint
##  画面上におけるカメラが見ている映像の中心の座標を設定する

proc SetCameraScreenCenterD*(x: cdouble; y: cdouble): cint
##  画面上におけるカメラが見ている映像の中心の座標を設定する

proc SetupCamera_Perspective*(Fov: cfloat): cint
##  遠近法カメラをセットアップする

proc SetupCamera_PerspectiveD*(Fov: cdouble): cint
##  遠近法カメラをセットアップする

proc SetupCamera_Ortho*(Size: cfloat): cint
##  正射影カメラをセットアップする

proc SetupCamera_OrthoD*(Size: cdouble): cint
##  正射影カメラをセットアップする

proc SetupCamera_ProjectionMatrix*(ProjectionMatrix: MATRIX): cint
##  射影行列を直接設定する

proc SetupCamera_ProjectionMatrixD*(ProjectionMatrix: MATRIX_D): cint
##  射影行列を直接設定する

proc SetCameraDotAspect*(DotAspect: cfloat): cint
##  カメラのドットアスペクト比を設定する

proc SetCameraDotAspectD*(DotAspect: cdouble): cint
##  カメラのドットアスペクト比を設定する

proc CheckCameraViewClip*(CheckPos: VECTOR): cint
##  指定の座標がカメラの視界に入っているかどうかを判定する( 戻り値 TRUE:視界に入っていない  FALSE:視界に入っている )

proc CheckCameraViewClipD*(CheckPos: VECTOR_D): cint
##  指定の座標がカメラの視界に入っているかどうかを判定する( 戻り値 TRUE:視界に入っていない  FALSE:視界に入っている )

proc CheckCameraViewClip_Dir*(CheckPos: VECTOR): cint
##  指定の座標がカメラの視界に入っているかどうかを判定する、戻り値で外れている方向も知ることができる( 戻り値 0:視界に入っている  0以外:視界に入っていない( DX_CAMERACLIP_LEFT や DX_CAMERACLIP_RIGHT が or 演算で混合されたもの、and 演算で方向を確認できる ) )

proc CheckCameraViewClip_DirD*(CheckPos: VECTOR_D): cint
##  指定の座標がカメラの視界に入っているかどうかを判定する、戻り値で外れている方向も知ることができる( 戻り値 0:視界に入っている  0以外:視界に入っていない( DX_CAMERACLIP_LEFT や DX_CAMERACLIP_RIGHT が or 演算で混合されたもの、and 演算で方向を確認できる ) )

proc CheckCameraViewClip_Box*(BoxPos1: VECTOR; BoxPos2: VECTOR): cint
##  二つの座標で表されるボックスがカメラの視界に入っているかどうかを判定する( 戻り値 TRUE:視界に入っていない  FALSE:視界に入っている )

proc CheckCameraViewClip_BoxD*(BoxPos1: VECTOR_D; BoxPos2: VECTOR_D): cint
##  二つの座標で表されるボックスがカメラの視界に入っているかどうかを判定する( 戻り値 TRUE:視界に入っていない  FALSE:視界に入っている )

proc GetCameraNear*(): cfloat
##  カメラの Near クリップ面の距離を取得する

proc GetCameraNearD*(): cdouble
##  カメラの Near クリップ面の距離を取得する

proc GetCameraFar*(): cfloat
##  カメラの Far クリップ面の距離を取得する

proc GetCameraFarD*(): cdouble
##  カメラの Far クリップ面の距離を取得する

proc GetCameraPosition*(): VECTOR
##  カメラの位置を取得する

proc GetCameraPositionD*(): VECTOR_D
##  カメラの位置を取得する

proc GetCameraTarget*(): VECTOR
##  カメラの注視点を取得する

proc GetCameraTargetD*(): VECTOR_D
##  カメラの注視点を取得する

proc GetCameraUpVector*(): VECTOR
##  カメラの正面方向に垂直な上方向のベクトルを取得する

proc GetCameraUpVectorD*(): VECTOR_D
##  カメラの正面方向に垂直な上方向のベクトルを取得する

proc GetCameraDownVector*(): VECTOR
##  カメラの正面方向に垂直な下方向のベクトルを取得する

proc GetCameraDownVectorD*(): VECTOR_D
##  カメラの正面方向に垂直な下方向のベクトルを取得する

proc GetCameraRightVector*(): VECTOR
##  カメラの正面方向に垂直な右方向のベクトルを取得する

proc GetCameraRightVectorD*(): VECTOR_D
##  カメラの正面方向に垂直な右方向のベクトルを取得する

proc GetCameraLeftVector*(): VECTOR
##  カメラの正面方向に垂直な左方向のベクトルを取得する

proc GetCameraLeftVectorD*(): VECTOR_D
##  カメラの正面方向に垂直な左方向のベクトルを取得する

proc GetCameraFrontVector*(): VECTOR
##  カメラの正面方向のベクトルを取得する

proc GetCameraFrontVectorD*(): VECTOR_D
##  カメラの正面方向のベクトルを取得する

proc GetCameraBackVector*(): VECTOR
##  カメラの後ろ方向のベクトルを取得する

proc GetCameraBackVectorD*(): VECTOR_D
##  カメラの後ろ方向のベクトルを取得する

proc GetCameraAngleHRotate*(): cfloat
##  カメラの水平方向の向きを取得する

proc GetCameraAngleHRotateD*(): cdouble
##  カメラの水平方向の向きを取得する

proc GetCameraAngleVRotate*(): cfloat
##  カメラの垂直方向の向きを取得する

proc GetCameraAngleVRotateD*(): cdouble
##  カメラの垂直方向の向きを取得する

proc GetCameraAngleTRotate*(): cfloat
##  カメラの向きの捻り角度を取得する

proc GetCameraAngleTRotateD*(): cdouble
##  カメラの向きの捻り角度を取得する

proc GetCameraViewMatrix*(): MATRIX
##  ビュー行列を取得する

proc GetCameraViewMatrixD*(): MATRIX_D
##  ビュー行列を取得する

proc GetCameraBillboardMatrix*(): MATRIX
##  ビルボード行列を取得する

proc GetCameraBillboardMatrixD*(): MATRIX_D
##  ビルボード行列を取得する

proc GetCameraScreenCenter*(x: ptr cfloat; y: ptr cfloat): cint
##  画面上におけるカメラが見ている映像の中心の座標を取得する

proc GetCameraScreenCenterD*(x: ptr cdouble; y: ptr cdouble): cint
##  画面上におけるカメラが見ている映像の中心の座標を取得する

proc GetCameraFov*(): cfloat
##  カメラの視野角を取得する

proc GetCameraFovD*(): cdouble
##  カメラの視野角を取得する

proc GetCameraSize*(): cfloat
##  カメラの視野サイズを取得する

proc GetCameraSizeD*(): cdouble
##  カメラの視野サイズを取得する

proc GetCameraProjectionMatrix*(): MATRIX
##  射影行列を取得する

proc GetCameraProjectionMatrixD*(): MATRIX_D
##  射影行列を取得する

proc GetCameraDotAspect*(): cfloat
##  カメラのドットアスペクト比を得る

proc GetCameraDotAspectD*(): cdouble
##  カメラのドットアスペクト比を得る

proc GetCameraViewportMatrix*(): MATRIX
##  ビューポート行列を取得する

proc GetCameraViewportMatrixD*(): MATRIX_D
##  ビューポート行列を取得する

proc GetCameraAPIViewportMatrix*(): MATRIX
##  Direct3Dで自動適用されるビューポート行列を取得する

proc GetCameraAPIViewportMatrixD*(): MATRIX_D
##  Direct3Dで自動適用されるビューポート行列を取得する
##  ライト関係関数

proc SetUseLighting*(Flag: cint): cint
##  ライティングを使用するかどうかを設定する

proc SetMaterialUseVertDifColor*(UseFlag: cint): cint
##  ３Ｄ描画のライティング計算で頂点カラーのディフューズカラーを使用するかどうかを設定する

proc SetMaterialUseVertSpcColor*(UseFlag: cint): cint
##  ３Ｄ描画のライティング計算で頂点カラーのスペキュラカラーを使用するかどうかを設定する

proc SetMaterialParam*(Material: MATERIALPARAM): cint
##  ３Ｄ描画のライティング計算で使用するマテリアルパラメータを設定する

proc SetUseSpecular*(UseFlag: cint): cint
##  ３Ｄ描画にスペキュラを使用するかどうかを設定する

proc SetGlobalAmbientLight*(Color: COLOR_F): cint
##  グローバルアンビエントライトカラーを設定する

proc SetUseLightAngleAttenuation*(UseFlag: cint): cint
##  ３Ｄ描画のライティング計算で角度減衰を行うかどうかを設定する( TRUE:角度減衰を行う( デフォルト )  FALSE:角度減衰を行わない )

proc SetUseHalfLambertLighting*(UseFlag: cint): cint
##  ３Ｄ描画のライティング計算でハーフランバートを使用するかどうかを設定する( TRUE:ハーフランバートを使用する  FALSE:ハーフランバートを使用しない( デフォルト ) )

proc ChangeLightTypeDir*(Direction: VECTOR): cint
##  デフォルトライトのタイプをディレクショナルライトにする

proc ChangeLightTypeSpot*(Position: VECTOR; Direction: VECTOR; OutAngle: cfloat;
                         InAngle: cfloat; Range: cfloat; Atten0: cfloat;
                         Atten1: cfloat; Atten2: cfloat): cint
##  デフォルトライトのタイプをスポットライトにする

proc ChangeLightTypePoint*(Position: VECTOR; Range: cfloat; Atten0: cfloat;
                          Atten1: cfloat; Atten2: cfloat): cint
##  デフォルトライトのタイプをポイントライトにする

proc GetLightType*(): cint
##  デフォルトライトのタイプを取得する( 戻り値は DX_LIGHTTYPE_DIRECTIONAL 等 )

proc SetLightEnable*(EnableFlag: cint): cint
##  デフォルトライトを使用するかどうかを設定する

proc GetLightEnable*(): cint
##  デフォルトライトを使用するかどうかを取得する( 戻り値　TRUE:有効  FALSE:無効 )

proc SetLightDifColor*(Color: COLOR_F): cint
##  デフォルトライトのディフューズカラーを設定する

proc GetLightDifColor*(): COLOR_F
##  デフォルトライトのディフューズカラーを取得する

proc SetLightSpcColor*(Color: COLOR_F): cint
##  デフォルトライトのスペキュラカラーを設定する

proc GetLightSpcColor*(): COLOR_F
##  デフォルトライトのスペキュラカラーを取得する

proc SetLightAmbColor*(Color: COLOR_F): cint
##  デフォルトライトのアンビエントカラーを設定する

proc GetLightAmbColor*(): COLOR_F
##  デフォルトライトのアンビエントカラーを取得する

proc SetLightDirection*(Direction: VECTOR): cint
##  デフォルトライトの方向を設定する

proc GetLightDirection*(): VECTOR
##  デフォルトライトの方向を取得する

proc SetLightPosition*(Position: VECTOR): cint
##  デフォルトライトの位置を設定する

proc GetLightPosition*(): VECTOR
##  デフォルトライトの位置を取得する

proc SetLightRangeAtten*(Range: cfloat; Atten0: cfloat; Atten1: cfloat; Atten2: cfloat): cint
##  デフォルトライトの距離減衰パラメータを設定する( 有効距離、距離減衰係数０、１、２ )

proc GetLightRangeAtten*(Range: ptr cfloat; Atten0: ptr cfloat; Atten1: ptr cfloat;
                        Atten2: ptr cfloat): cint
##  デフォルトライトの距離減衰パラメータを取得する( 有効距離、距離減衰係数０、１、２ )

proc SetLightAngle*(OutAngle: cfloat; InAngle: cfloat): cint
##  デフォルトライトのスポットライトのパラメータを設定する( 外部コーン角度、内部コーン角度 )

proc GetLightAngle*(OutAngle: ptr cfloat; InAngle: ptr cfloat): cint
##  デフォルトライトのスポットライトのパラメータを取得する( 外部コーン角度、内部コーン角度 )

proc SetLightUseShadowMap*(SmSlotIndex: cint; UseFlag: cint): cint
##  デフォルトライトに SetUseShadowMap で指定したシャドウマップを適用するかどうかを設定する( SmSlotIndex:シャドウマップスロット( SetUseShadowMap の第一引数に設定する値 ) UseFlag:適用にするかどうかのフラグ( TRUE:適用する( デフォルト )  FALSE:適用しない ) )

proc CreateDirLightHandle*(Direction: VECTOR): cint
##  ディレクショナルライトハンドルを作成する

proc CreateSpotLightHandle*(Position: VECTOR; Direction: VECTOR; OutAngle: cfloat;
                           InAngle: cfloat; Range: cfloat; Atten0: cfloat;
                           Atten1: cfloat; Atten2: cfloat): cint
##  スポットライトハンドルを作成する

proc CreatePointLightHandle*(Position: VECTOR; Range: cfloat; Atten0: cfloat;
                            Atten1: cfloat; Atten2: cfloat): cint
##  ポイントライトハンドルを作成する

proc DeleteLightHandle*(LHandle: cint): cint
##  ライトハンドルを削除する

proc DeleteLightHandleAll*(): cint
##  ライトハンドルを全て削除する

proc SetLightTypeHandle*(LHandle: cint; LightType: cint): cint
##  ライトハンドルのライトのタイプを変更する( DX_LIGHTTYPE_DIRECTIONAL 等 )

proc SetLightEnableHandle*(LHandle: cint; EnableFlag: cint): cint
##  ライトハンドルのライト効果の有効、無効を設定する( TRUE:有効  FALSE:無効 )

proc SetLightDifColorHandle*(LHandle: cint; Color: COLOR_F): cint
##  ライトハンドルのライトのディフューズカラーを設定する

proc SetLightSpcColorHandle*(LHandle: cint; Color: COLOR_F): cint
##  ライトハンドルのライトのスペキュラカラーを設定する

proc SetLightAmbColorHandle*(LHandle: cint; Color: COLOR_F): cint
##  ライトハンドルのライトのアンビエントカラーを設定する

proc SetLightDirectionHandle*(LHandle: cint; Direction: VECTOR): cint
##  ライトハンドルのライトの方向を設定する

proc SetLightPositionHandle*(LHandle: cint; Position: VECTOR): cint
##  ライトハンドルのライトの位置を設定する

proc SetLightRangeAttenHandle*(LHandle: cint; Range: cfloat; Atten0: cfloat;
                              Atten1: cfloat; Atten2: cfloat): cint
##  ライトハンドルのライトの距離減衰パラメータを設定する( 有効距離、距離減衰係数０、１、２ )

proc SetLightAngleHandle*(LHandle: cint; OutAngle: cfloat; InAngle: cfloat): cint
##  ライトハンドルのライトのスポットライトのパラメータを設定する( 外部コーン角度、内部コーン角度 )

proc SetLightUseShadowMapHandle*(LHandle: cint; SmSlotIndex: cint; UseFlag: cint): cint
##  ライトハンドルのライトに SetUseShadowMap で指定したシャドウマップを適用するかどうかを設定する( SmSlotIndex:シャドウマップスロット( SetUseShadowMap の第一引数に設定する値 ) UseFlag:適用にするかどうかのフラグ( TRUE:適用する( デフォルト )  FALSE:適用しない ) )

proc GetLightTypeHandle*(LHandle: cint): cint
##  ライトハンドルのライトのタイプを取得する( 戻り値は DX_LIGHTTYPE_DIRECTIONAL 等 )

proc GetLightEnableHandle*(LHandle: cint): cint
##  ライトハンドルのライト効果の有効、無効を取得する( TRUE:有効  FALSE:無効 )

proc GetLightDifColorHandle*(LHandle: cint): COLOR_F
##  ライトハンドルのライトのディフューズカラーを取得する

proc GetLightSpcColorHandle*(LHandle: cint): COLOR_F
##  ライトハンドルのライトのスペキュラカラーを取得する

proc GetLightAmbColorHandle*(LHandle: cint): COLOR_F
##  ライトハンドルのライトのアンビエントカラーを取得する

proc GetLightDirectionHandle*(LHandle: cint): VECTOR
##  ライトハンドルのライトの方向を取得する

proc GetLightPositionHandle*(LHandle: cint): VECTOR
##  ライトハンドルのライトの位置を取得する

proc GetLightRangeAttenHandle*(LHandle: cint; Range: ptr cfloat; Atten0: ptr cfloat;
                              Atten1: ptr cfloat; Atten2: ptr cfloat): cint
##  ライトハンドルのライトの距離減衰パラメータを取得する( 有効距離、距離減衰係数０、１、２ )

proc GetLightAngleHandle*(LHandle: cint; OutAngle: ptr cfloat; InAngle: ptr cfloat): cint
##  ライトハンドルのライトのスポットライトのパラメータを取得する( 外部コーン角度、内部コーン角度 )

proc GetEnableLightHandleNum*(): cint
##  有効になっているライトハンドルの数を取得する

proc GetEnableLightHandle*(Index: cint): cint
##  有効になっているライトハンドルを取得する
##  色情報取得用関数

proc GetTexFormatIndex*(Format: ptr IMAGEFORMATDESC): cint
##  テクスチャフォーマットのインデックスを得る

{.pop.}
