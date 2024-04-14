import ../DxDll
{.push dynlib: DLL, importc.}

##  DxInput.cpp関数プロトタイプ宣言

proc SetKeyExclusiveCooperativeLevelFlag*(Flag: cint): cint
##  DirectInput のキーボードの協調レベルを排他レベルにするかどうかを設定する( TRUE:排他レベルにする  FALSE:標準レベルにする( デフォルト ) )、DxLib_Init の呼び出し前でのみ実行可能　

proc SetKeyboardNotDirectInputFlag*(Flag: cint): cint
##  キーボードの入力処理に DirectInput を使わないかどうかを設定する( TRUE:DirectInput を使わず、Windows標準機能を使用する　　FALSE:DirectInput を使用する )

proc SetUseDirectInputFlag*(UseFlag: cint): cint
##  入力処理に DirectInput を使用するかどうかを設定する( TRUE:DirectInput を使用する　　FALSE:DirectInput を使わず、Windows標準機能を使用する )

proc SetDirectInputMouseMode*(Mode: cint): cint
##  マウスの入力処理に DirectInput を使用する場合の動作モードを設定する( 0:ウィンドウがアクティブな場合のみ DirectInput を使用する  1:ウィンドウのアクティブ状態に関係なく DirectInput を使用する )

proc SetUseXInputFlag*(Flag: cint): cint
##  Xbox360コントローラの入力処理に XInput を使用するかどうかを設定する( TRUE:XInput を使用する( デフォルト )　　FALSE:XInput を使用しない )

proc SetUseXboxControllerDirectInputFlag*(Flag: cint): cint
##  Xbox360コントローラや Xbox Oneコントローラを DirectInputコントローラとしても検出するかどうかを設定する( TRUE:DirectInputコントローラとしても検出する  FALSE:DirectInputコントローラとしては検出しない(デフォルト) )、DxLib_Init の呼び出し前でのみ実行可能

proc GetJoypadGUID*(PadIndex: cint; GuidInstanceBuffer: ptr GUID;
                   GuidProductBuffer: ptr GUID = nil): cint
##  ジョイパッドのＧＵIＤを得る

proc GetJoypadName*(InputType: cint; InstanceNameBuffer: cstring;
                   ProductNameBuffer: cstring): cint
##  ジョイパッドのデバイス登録名と製品登録名を取得する( InstanceNameBuffer, ProductNameBuffer 共に 260 以上のバッファサイズが必要 )

proc ConvertKeyCodeToVirtualKey*(KeyCode: cint): cint
##  ＤＸライブラリのキーコード( KEY_INPUT_A など )に対応する Windows の仮想キーコード( VK_LEFT など ) を取得する( KeyCode:変換したいＤＸライブラリのキーコード　戻り値：Windowsの仮想キーコード )

proc ConvertVirtualKeyToKeyCode*(VirtualKey: cint): cint
##   Windows の仮想キーコード( VK_LEFT など ) に対応するＤＸライブラリのキーコード( KEY_INPUT_A など )を取得する(
## VirtualKey:変換したいWindowsの仮想キーコード　戻り値：ＤＸライブラリのキーコード )
##  画像からグラフィックハンドルを作成する関数

proc LoadGraphToResource*(ResourceID: cint): cint
##  画像リソースからグラフィックハンドルを作成する

proc LoadDivGraphToResource*(ResourceID: cint; AllNum: cint; XNum: cint; YNum: cint;
                            XSize: cint; YSize: cint; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する

proc LoadDivGraphFToResource*(ResourceID: cint; AllNum: cint; XNum: cint; YNum: cint;
                             XSize: cfloat; YSize: cfloat; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する( float型 )

proc LoadGraphToResource*(ResourceName: cstring; ResourceType: cstring): cint
##  画像リソースからグラフィックハンドルを作成する

proc LoadGraphToResourceWithStrLen*(ResourceName: cstring;
                                   ResourceNameLength: csize_t;
                                   ResourceType: cstring;
                                   ResourceTypeLength: csize_t): cint
##  画像リソースからグラフィックハンドルを作成する

proc LoadDivGraphToResource*(ResourceName: cstring; ResourceType: cstring;
                            AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                            YSize: cint; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する

proc LoadDivGraphToResourceWithStrLen*(ResourceName: cstring;
                                      ResourceNameLength: csize_t;
                                      ResourceType: cstring;
                                      ResourceTypeLength: csize_t; AllNum: cint;
                                      XNum: cint; YNum: cint; XSize: cint;
                                      YSize: cint; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する

proc LoadDivGraphFToResource*(ResourceName: cstring; ResourceType: cstring;
                             AllNum: cint; XNum: cint; YNum: cint; XSize: cfloat;
                             YSize: cfloat; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する( float型 )

proc LoadDivGraphFToResourceWithStrLen*(ResourceName: cstring;
                                       ResourceNameLength: csize_t;
                                       ResourceType: cstring;
                                       ResourceTypeLength: csize_t; AllNum: cint;
                                       XNum: cint; YNum: cint; XSize: cfloat;
                                       YSize: cfloat; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する( float型 )

proc LoadGraphToResource2*(ResourceName: cstring; ResourceType: cstring): cint
##  画像リソースからグラフィックハンドルを作成する

proc LoadGraphToResourceWithStrLen2*(ResourceName: cstring;
                                    ResourceNameLength: csize_t;
                                    ResourceType: cstring;
                                    ResourceTypeLength: csize_t): cint
##  画像リソースからグラフィックハンドルを作成する

proc LoadDivGraphToResource2*(ResourceName: cstring; ResourceType: cstring;
                             AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                             YSize: cint; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する

proc LoadDivGraphToResourceWithStrLen2*(ResourceName: cstring;
                                       ResourceNameLength: csize_t;
                                       ResourceType: cstring;
                                       ResourceTypeLength: csize_t; AllNum: cint;
                                       XNum: cint; YNum: cint; XSize: cint;
                                       YSize: cint; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する

proc LoadDivGraphFToResource2*(ResourceName: cstring; ResourceType: cstring;
                              AllNum: cint; XNum: cint; YNum: cint; XSize: cfloat;
                              YSize: cfloat; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する( float型 )

proc LoadDivGraphFToResourceWithStrLen2*(ResourceName: cstring;
                                        ResourceNameLength: csize_t;
                                        ResourceType: cstring;
                                        ResourceTypeLength: csize_t; AllNum: cint;
                                        XNum: cint; YNum: cint; XSize: cfloat;
                                        YSize: cfloat; HandleArray: ptr cint): cint
##  画像リソースを分割してグラフィックハンドルを作成する( float型 )

proc CreateGraphFromID3D11Texture2D*(pID3D11Texture2D: pointer): cint
##  ID3D11Texture2D からグラフィックハンドルを作成する
##  画像情報関係関数

proc GetGraphID3D11Texture2D*(GrHandle: cint): pointer
##  グラフィックハンドルが持つ ID3D11Texture2D を取得する( Direct3D11 を使用している場合のみ有効 )( 戻り値を ID3D11Texture2D * にキャストしてください )

proc GetGraphID3D11RenderTargetView*(GrHandle: cint): pointer
##  グラフィックハンドルが持つ ID3D11RenderTargetView を取得する( Direct3D11 を使用していて、且つ MakeScreen で作成したグラフィックハンドルでのみ有効 )( 戻り値を ID3D11RenderTargetView * にキャストしてください )

proc GetGraphID3D11DepthStencilView*(GrHandle: cint): pointer
##  グラフィックハンドルが持つ ID3D11DepthStencilView を取得する( Direct3D11 を使用していて、且つ MakeScreen で作成したグラフィックハンドルでのみ有効 )( 戻り値を ID3D11DepthStencilView * にキャストしてください )
##  画面関係関数

proc BltBackScreenToWindow*(Window: HWND; ClientX: cint; ClientY: cint): cint
##  裏画面の内容を指定のウインドウに転送する

proc BltRectBackScreenToWindow*(Window: HWND; BackScreenRect: RECT;
                               WindowClientRect: RECT): cint
##  裏画面の指定の領域をウインドウのクライアント領域の指定の領域に転送する

proc SetScreenFlipTargetWindow*(TargetWindow: HWND; ScaleX: cdouble = 1.0;
                               ScaleY: cdouble = 1.0): cint
##  ScreenFlip で画像を転送する先のウインドウを設定する( NULL を指定すると設定解除 )

proc GetDesktopScreenGraph*(x1: cint; y1: cint; x2: cint; y2: cint; GrHandle: cint;
                           DestX: cint = 0; DestY: cint = 0): cint
##  デスクトップ画面から指定領域の画像情報をグラフィックハンドルに転送する

proc GetDesktopScreenGraphMemImage*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   Width: ptr cint; Height: ptr cint;
                                   Stride: ptr cint; ColorBitDepth: cint = 32): pointer
##  デスクトップ画面から指定領域の画像のメモリイメージの先頭アドレスとイメージの幅・高さ・ストライドを取得する( イメージのフォーマットは ColorBitDepth = 32( バイト順で B8G8R8X8 の 32bitカラー ) ColorBitDepth = 24( バイト順で B8G8R8 の 24bitカラー ) )

proc GetOtherWindowGraph*(Window: HWND; x1: cint; y1: cint; x2: cint; y2: cint;
                         GrHandle: cint; DestX: cint = 0; DestY: cint = 0): cint
##  指定のウィンドウの指定領域の画像情報をグラフィックハンドルに転送する
##  その他設定関係関数

proc SetMultiThreadFlag*(Flag: cint): cint
##  DirectDraw や Direct3D の協調レベルをマルチスレッド対応にするかどうかをセットする( TRUE:マルチスレッド対応にする  FALSE:マルチスレッド対応にしない( デフォルト ) )

proc SetUseDirectDrawDeviceIndex*(Index: cint): cint
##  使用する DirectDraw デバイスのインデックスを設定する

proc SetAeroDisableFlag*(Flag: cint): cint
##  Vista,7 の Windows Aero を無効にするかどうかを設定する( TRUE:無効にする( デフォルト )  FALSE:有効にする )( DxLib_Init の前に呼ぶ必要があります )

proc SetUseDirect3D9Ex*(Flag: cint): cint
##  Vista以降の環境で Direct3D9Ex を使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )( DxLib_Init の前に呼ぶ必要があります )

proc SetUseDirect3D11*(Flag: cint): cint
##  Direct3D11 を使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない )

proc SetUseDirect3D11MinFeatureLevel*(Level: cint): cint
  ##  DX_DIRECT3D_11_FEATURE_LEVEL_10_0 など
##  Direct3D11 で使用する最低機能レベルを指定する関数です、尚、DX_DIRECT3D_11_FEATURE_LEVEL_11_0 より低い機能レベルでの正常な動作は保証しません( デフォルトは DX_DIRECT3D_11_FEATURE_LEVEL_11_0 )

proc SetUseDirect3D11WARPDriver*(Flag: cint): cint
##  D3D_DRIVER_TYPE_WARP タイプの Direct3D 11 ドライバを使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない( デフォルト ) )

proc SetUseDirect3DVersion*(Version: cint): cint
  ##  DX_DIRECT3D_9 など
##  使用する Direct3D のバージョンを設定する、DxLib_Init 呼び出しの前でのみ使用可能　

proc GetUseDirect3DVersion*(): cint
##  使用している Direct3D のバージョンを取得する( DX_DIRECT3D_9 など )

proc GetUseDirect3D11FeatureLevel*(): cint
##  使用している Direct3D11 の FeatureLevel ( DX_DIRECT3D_11_FEATURE_LEVEL_9_1 等 )を取得する( 戻り値　-1：エラー　-1以外：Feature Level )

proc SetUseDirect3D11AdapterIndex*(Index: cint): cint
##  使用するグラフィックスデバイスのアダプターのインデックスを設定する

proc SetUseDirect3D11AdapterLUID*(UseLUID: ptr LUID): cint
##  使用する IDXGIAdapter の LUID を設定する

proc GetUseDirect3D11AdapterLUID*(): LUID
##  使用する IDXGIAdapter の LUID を取得する

proc SetUseDirect3D11BGRASupport*(Flag: cint): cint
##  D3D11Device 作成時に D3D11_CREATE_DEVICE_BGRA_SUPPORT を指定するかどうかを設定する( TRUE:指定する  FALSE:指定しない( デフォルト ) )

proc GetUseDirect3D11BGRASupport*(): cint
##  D3D11Device 作成時に D3D11_CREATE_DEVICE_BGRA_SUPPORT を指定するかどうかを取得する

proc SetUseDirectDrawFlag*(Flag: cint): cint
##  ( 同効果のSetUseSoftwareRenderModeFlag を使用して下さい )DirectDrawを使用するかどうかを設定する

proc SetUseGDIFlag*(Flag: cint): cint
##  GDI描画を使用するかどうかを設定する

proc GetUseGDIFlag*(): cint
##  GDI描画を使用するかどうかを取得する

proc SetDDrawUseGuid*(Guid: ptr GUID): cint
##  DirectDrawが使用するGUIDを設定する

proc GetUseDDrawObj*(): pointer
##  現在使用しているDirectDrawオブジェクトのアドレスを取得する( 戻り値を IDirectDraw7 * にキャストして下さい )

proc GetDirectDrawDeviceGUID*(Number: cint): ptr GUID
##  有効な DirectDraw デバイスの GUID を取得する

proc GetDirectDrawDeviceDescription*(Number: cint; StringBuffer: cstring): cint
##  有効な DirectDraw デバイスの名前を取得する

proc GetDirectDrawDeviceNum*(): cint
##  有効な DirectDraw デバイスの数を取得する

proc GetUseDirect3DDevice9*(): pointer
##  使用中のDirect3DDevice9オブジェクトを取得する( 戻り値を IDirect3DDevice9 * にキャストして下さい )

proc GetUseDirect3D9BackBufferSurface*(): pointer
##  使用中のバックバッファのDirect3DSurface9オブジェクトを取得する( 戻り値を D_IDirect3DSurface9 * にキャストしてください )

proc GetUseDirect3D11Device*(): pointer
##  使用中のID3D11Deviceオブジェクトを取得する( 戻り値を ID3D11Device * にキャストして下さい )

proc GetUseDirect3D11DeviceContext*(): pointer
##  使用中のID3D11DeviceContextオブジェクトを取得する( 戻り値を ID3D11DeviceContext * にキャストして下さい )

proc GetUseDirect3D11BackBufferTexture2D*(): pointer
##  使用中のバックバッファのID3D11Texture2Dオブジェクトを取得する( 戻り値を ID3D11Texture2D * にキャストしてください )

proc GetUseDirect3D11BackBufferRenderTargetView*(): pointer
##  使用中のバックバッファのID3D11RenderTargetViewオブジェクトを取得する( 戻り値を ID3D11RenderTargetView * にキャストしてください )

proc GetUseDirect3D11DepthStencilTexture2D*(): pointer
##  使用中の深度ステンシルバッファのID3D11Texture2Dオブジェクトを取得する( 戻り値を ID3D11Texture2D * にキャストしてください )

proc SetDrawScreen_ID3D11RenderTargetView*(pID3D11RenderTargetView: pointer;
    pID3D11DepthStencilView: pointer = nil): cint
##  指定の ID3D11RenderTargetView を描画対象にする( pID3D11DepthStencilView が NULL の場合はデフォルトの深度ステンシルバッファを使用する )

proc RefreshDxLibDirect3DSetting*(): cint
##  ＤＸライブラリが行ったDirect3Dの設定を再度行う( 特殊用途 )

proc SetUseMediaFoundationFlag*(Flag: cint): cint
##  Media Foundation を使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )
##  色情報取得用関数

proc ColorKaiseki*(PixelData: pointer; ColorData: ptr COLORDATA): cint
##  色ビット情報解析

{.pop.}
