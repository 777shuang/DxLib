import ../DxDll
{.push dynlib: DLL, importc.}

##  DxWindow.cpp関数プロトタイプ宣言
##  便利関数

proc GetResourceInfo*(ResourceName: cstring; ResourceType: cstring;
                     DataPointerP: ptr pointer; DataSizeP: ptr csize_t): cint
##  指定の名前、タイプのリソースのアドレスとサイズを取得する( 戻り値  -1:失敗  0:成功 )

proc GetResourceInfoWithStrLen*(ResourceName: cstring;
                               ResourceNameLength: csize_t;
                               ResourceType: cstring;
                               ResourceTypeLength: csize_t;
                               DataPointerP: ptr pointer; DataSizeP: ptr csize_t): cint
##  指定の名前、タイプのリソースのアドレスとサイズを取得する( 戻り値  -1:失敗  0:成功 )

proc GetResourceIDString*(ResourceID: cint): cstring
##  リソースＩＤ値からリソース名を取得する
##  ウインドウ関係情報取得関数

proc GetWindowCRect*(RectBuf: ptr RECT): cint
##  GetWindowClientRect の旧名称

proc GetWindowClientRect*(RectBuf: ptr RECT): cint
##  メインウインドウのクライアント領域を取得する

proc GetWindowFrameRect*(RectBuf: ptr RECT): cint
##  メインウインドウの枠の部分も含めた全体の領域を取得する

proc GetWindowActiveFlag*(): cint
##  メインウインドウがアクティブかどうかを取得する( 戻り値  TRUE:アクティブ  FALSE:非アクティブ )

proc GetWindowMinSizeFlag*(): cint
##  メインウインドウが最小化されているかどうかを取得する( 戻り値  TRUE:最小化されている  FALSE:最小化されていない )

proc GetWindowMaxSizeFlag*(): cint
##  メインウインドウが最大化されているかどうかを取得する( 戻り値  TRUE:最大化されている  FALSE:最大化されていない )

proc GetActiveFlag*(): cint
##  GetWindowActiveFlag の別名関数

proc GetMainWindowHandle*(): HWND
##  メインウインドウのウインドウハンドルを取得する

proc GetWindowModeFlag*(): cint
##  ウインドウモードで起動しているかどうかを取得する( 戻り値  TRUE:ウインドウモード  FALSE:フルスクリーンモード )

proc GetDefaultState*(SizeX: ptr cint; SizeY: ptr cint; ColorBitDepth: ptr cint;
                     RefreshRate: ptr cint = nil; LeftTopX: ptr cint = nil;
                     LeftTopY: ptr cint = nil; PixelSizeX: ptr cint = nil;
                     PixelSizeY: ptr cint = nil; XDpi: ptr cint = nil;
                     YDpi: ptr cint = nil): cint
##  起動時のデスクトップの画面情報を取得する( SizeX:デスクトップの横解像度を格納する変数のポインタ  SizeY:縦解像度を格納する変数のポインタ  ColorBitDepth:画面カラービット数を格納する変数のポインタ  RefreshRate:デスクトップのリフレッシュレートを格納する変数のポインタ  LeftTopX:デスクトップの左上Ｘ座標を格納する変数のポインタ  LeftTopY:デスクトップの左上Ｙ座標を格納する変数のポインタ  PixelSizeX:OSの拡大率設定の影響を受けないデスクトップの横解像度を格納する変数のポインタ  PixelSizeY:OSの拡大率設定の影響を受けないデスクトップの縦解像度を格納する変数のポインタ  XDpi:X軸のDPI  YDpi:Y軸のDPI )

proc GetMonitorDpi*(XDpi: ptr cint; YDpi: ptr cint; MonitorIndex: cint = -1): cint
##  モニターのDPIを取得する

proc GetNoActiveState*(ResetFlag: cint = TRUE): cint
##  メインウインドウが非アクティブになり、処理が一時停止していたかどうかを取得する(引数 ResetFlag=TRUE:状態をリセット FALSE:状態をリセットしない    戻り値: 0=一時停止はしていない  1=一時停止していた )

proc GetMouseDispFlag*(): cint
##  マウスポインタを表示するかどうかの設定を取得する( 戻り値  TRUE:表示する  FALSE:表示しない )

proc GetAlwaysRunFlag*(): cint
##  メインウインドウが非アクティブになっても処理を実行し続けるかどうかの設定を取得する( TRUE:実行する  FALSE:停止する )

proc GetSystemInfo_*(DxLibVer: ptr cint; DirectXVer: ptr cint; WindowsVer: ptr cint): cint
##  ＤＸライブラリと DirectX のバージョンと Windows のバージョン番号を取得する

proc GetPcInfo*(OSString: cstring; DirectXString: cstring; CPUString: cstring; CPUSpeed: ptr cint; ##  単位MHz
               FreeMemorySize: ptr cdouble; ##  単位MByte
               TotalMemorySize: ptr cdouble; VideoDriverFileName: cstring;
               VideoDriverString: cstring; FreeVideoMemorySize: ptr cdouble; ##  単位MByte
               TotalVideoMemorySize: ptr cdouble): cint
##  ＰＣの情報を取得する

proc GetWindowOSVersion*(): cint
##  WindowsOSのバージョンを取得する( 戻り値 : DX_WINDOWSVERSION_10 など )

proc GetUseMMXFlag*(): cint
##  ＭＭＸが使えるかどうかの情報を得る

proc GetUseSSEFlag*(): cint
##  ＳＳＥが使えるかどうかの情報を得る

proc GetUseSSE2Flag*(): cint
##  ＳＳＥ２が使えるかどうかの情報を得る

proc GetWindowCloseFlag*(): cint
##  ウインドウを閉じようとしているかの情報を得る

proc GetTaskInstance*(): HINSTANCE
##  ソフトのインスタンスを取得する

proc GetUseWindowRgnFlag*(): cint
##  リージョンを使っているかどうかを取得する

proc GetWindowSizeChangeEnableFlag*(FitScreen: ptr cint = nil): cint
##  ウインドウのサイズを変更できる設定になっているかどうかを取得する( 戻り値  TRUE:変更できるようになっている  FALSE:変更できないようになっている )

proc GetWindowSizeExtendRate*(ExRateX: ptr cdouble = nil; ExRateY: ptr cdouble = nil): cdouble
##  描画画面のサイズに対するウインドウサイズの比率を取得する( 戻り値は ExRateX に代入される値と同じです )

proc GetWindowSize*(Width: ptr cint; Height: ptr cint): cint
##  メインウインドウのクライアント領域のサイズを取得する

proc GetWindowEdgeWidth*(LeftWidth: ptr cint; RightWidth: ptr cint; TopWidth: ptr cint;
                        BottomWidth: ptr cint): cint
##  ウインドウの上下左右の縁の幅を取得する

proc GetWindowPosition*(x: ptr cint; y: ptr cint): cint
##  メインウインドウのデスクトップ上の左上端座標を取得する( 枠も含める )

proc GetWindowUserCloseFlag*(StateResetFlag: cint = FALSE): cint
##  メインウインドウの閉じるボタンが押されたかどうかを取得する

proc CheckWindowMaximizeButtonInput*(StateResetFlag: cint = TRUE): cint
##  メインウインドウの最大化ボタンが押されたかどうかを取得する、SetWindowMaximizeButtonBehavior( 1 ); が実行されている場合のみ有効な関数( StateResetFlag  TRUE = 押された状態をリセットする   FALSE = 押された状態をリセットしない )

proc GetNotDrawFlag*(): cint
##  ＤＸライブラリの描画機能を使うかどうかの設定を取得する

proc GetPaintMessageFlag*(): cint
##  WM_PAINT メッセージが来たかどうかを取得する(戻り値  TRUE:WM_PAINTメッセージが来た(一度取得すると以後、再び WM_PAINTメッセージが来るまで FALSE が返ってくるようになる)  FALSE:WM_PAINT メッセージは来ていない)

proc GetValidHiPerformanceCounter*(): cint
##  パフォーマンスカウンタが有効かどうかを取得する(戻り値  TRUE:有効  FALSE:無効)

proc GetInputSystemChar*(DeleteFlag: cint): TCHAR
##  入力されたシステム文字を取得する
##  設定系関数

proc ChangeWindowMode*(Flag: cint): cint
##  ウインドウモードを変更する

proc SetUseCharSet*(CharSet: cint): cint
  ##  = DX_CHARSET_SHFTJIS 等
##  ＤＸライブラリの文字列処理で前提とする文字列セットを設定する

proc LoadPauseGraph*(FileName: cstring): cint
##  アクティブウインドウが他のソフトに移っている際に表示する画像をファイルから読み込む( FileName に NULL を渡すことで解除)

proc LoadPauseGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  アクティブウインドウが他のソフトに移っている際に表示する画像をファイルから読み込む( FileName に NULL を渡すことで解除)

proc LoadPauseGraphFromMem*(MemImage: pointer; MemImageSize: cint): cint
##  アクティブウインドウが他のソフトに移っている際に表示する画像をメモリから読み込む( MemImage:ファイルイメージの先頭アドレス,NULL にすることで設定解除  MemImageSize:ファイルイメージのサイズ( 単位:Byte ) )

proc SetActiveStateChangeCallBackFunction*(
    CallBackFunction: proc (ActiveState: cint; UserData: pointer): cint;
    UserData: pointer): cint
##  メインウインドウのアクティブ状態に変化があったときに呼ばれるコールバック関数を設定する( CallBackFunction:呼ばれるコールバック関数、NULL を渡すと設定解除  UserData:CallBackFunction の第２引数に渡される値 )

proc SetWindowText*(WindowText: cstring): cint
##  メインウインドウのウインドウテキストを変更する

proc SetWindowTextDX*(WindowText: cstring): cint
##  メインウインドウのウインドウテキストを変更する

proc SetWindowTextWithStrLen*(WindowText: cstring; WindowTextLength: csize_t): cint
##  メインウインドウのウインドウテキストを変更する

proc SetMainWindowText*(WindowText: cstring): cint
##  SetWindowText の別名関数

proc SetMainWindowTextWithStrLen*(WindowText: cstring; WindowTextLength: csize_t): cint
##  SetWindowText の別名関数

proc SetMainWindowClassName*(ClassName: cstring): cint
##  メインウインドウのクラス名を設定する( DxLib_Init の前でのみ使用可能 )

proc SetMainWindowClassNameWithStrLen*(ClassName: cstring;
                                      ClassNameLength: csize_t): cint
##  メインウインドウのクラス名を設定する( DxLib_Init の前でのみ使用可能 )

proc SetWindowIconID*(ID: cint): cint
##  メインウインドウで使用するアイコンのＩＤをセットする

proc SetWindowIconHandle*(Icon: HICON): cint
##  メインウインドウで使用するアイコンのハンドルをセットする

proc SetUseASyncChangeWindowModeFunction*(Flag: cint;
    CallBackFunction: proc (a1: pointer); Data: pointer): cint
##  最大化ボタンやALT+ENTERキーによる非同期なウインドウモードの変更の機能の設定を行う( Flag:非同期ウインドウモード変更を有効にするかどうかのフラグ( TRUE:有効にする  FALSE:無効にする( デフォルト ) )   CallBackFunction:非同期ウインドウモード変更が行われた場合に呼ばれるコールバック関数のアドレス   Data:CallBackFunction の引数に渡される void 型のポインタ )

proc SetShutdownCallbackFunction*(CallbackFunction: proc (a1: pointer);
                                 Data: pointer; Message: cstring): cint
##  シャットダウンによるソフトの強制終了の際に呼ばれるコールバック関数を登録する( Message はコールバック関数の終了を待つ間表示されるメッセージ )

proc SetWindowStyleMode*(Mode: cint): cint
##  メインウインドウのスタイルを変更する

proc SetWindowZOrder*(ZType: cint; ##  = DX_WIN_ZTYPE_TOP 等
                     WindowActivateFlag: cint = TRUE): cint
##  メインウインドウの奥行き位置を変更する

proc SetWindowSizeChangeEnableFlag*(Flag: cint; FitScreen: cint = TRUE): cint
##  メインウインドウの端を掴んでウインドウのサイズを変更できるようにするかどうかの設定を行う( Flag:変更を可能にするかどうか( TRUE:可能にする  FALSE:不可能にする( デフォルト ) )  FitScreen:ウインドウのクライアント領域に画面をフィットさせる(拡大させる)かどうか  TRUE:フィットさせる  FALSE:フィットさせない )

proc SetWindowSizeExtendRate*(ExRateX: cdouble; ExRateY: cdouble = -1.0): cint
##  描画画面のサイズに対するメインウインドウサイズの比率を設定する( ExRateY がマイナスの場合は ExRateX の値が ExRateY にも使用されます )

proc SetWindowSize*(Width: cint; Height: cint): cint
##  メインウインドウのクライアント領域のサイズを設定する

proc SetWindowMaxSize*(MaxWidth: cint; MaxHeight: cint): cint
##  メインウインドウのクライアント領域の最大サイズを設定する( SetWindowSizeChangeEnableFlag の第一引数を TRUE で呼び出して、ウインドウのサイズが変更できる状態でのみ使用されるパラメータです )

proc SetWindowMinSize*(MinWidth: cint; MinHeight: cint): cint
##  メインウインドウのクライアント領域の最小サイズを設定する( SetWindowSizeChangeEnableFlag の第一引数を TRUE で呼び出して、ウインドウのサイズが変更できる状態でのみ使用されるパラメータです )

proc SetWindowPosition*(x: cint; y: cint): cint
##  メインウインドウの位置を設定する( 枠も含めた左上座標 )

proc SetSysCommandOffFlag*(Flag: cint; HookDllPath: cstring = nil): cint
##  タスクスイッチを有効にするかどうかを設定する

proc SetSysCommandOffFlagWithStrLen*(Flag: cint; HookDllPath: cstring = nil;
                                    HookDllPathLength: csize_t = 0): cint
##  タスクスイッチを有効にするかどうかを設定する

proc SetWindowMaximizeButtonBehavior*(BehaviorType: cint): cint
##  メインウインドウの最大化ボタンが押されたときの挙動を設定する( BehaviorType 0=標準動作 1=標準動作は行わず、最大化ボタンが押されたかどうかは CheckWindowMaximizeButtonInput で判定する )

proc SetHookWinProc*(WinProc: WNDPROC): cint
##  メインウインドウへのメッセージをフックするウインドウプロージャを登録する

proc SetUseHookWinProcReturnValue*(UseFlag: cint): cint
##  SetHookWinProc で設定したウインドウプロージャの戻り値を使用するかどうかを設定する、SetHookWinProc で設定したウインドウプロージャの中でのみ使用可能( UseFlag TRUE:戻り値を使用して、ＤＸライブラリのウインドウプロージャの処理は行わない  FALSE:戻り値は使用せず、ウインドウプロージャから出た後、ＤＸライブラリのウインドウプロージャの処理を行う )

proc SetDoubleStartValidFlag*(Flag: cint): cint
##  ＤＸライブラリを使用したソフトの二重起動を可能にするかどうかの設定を行う( TRUE:可能にする  FALSE:不可能にする( デフォルト ) )

proc CheckDoubleStart*(): cint
##  ＤＸライブラリを使用したソフトが既に起動しているかどうかを取得する( TRUE:既に起動している  FALSE:起動していない )

proc AddMessageTakeOverWindow*(Window: HWND): cint
##  メッセージ処理をＤＸライブラリに肩代わりしてもらうウインドウを追加する

proc SubMessageTakeOverWindow*(Window: HWND): cint
##  メッセージ処理をＤＸライブラリに肩代わりしてもらうウインドウを減らす

proc SetWindowInitPosition*(x: cint; y: cint): cint
##  メインウインドウの初期位置を設定する

proc SetNotWinFlag*(Flag: cint): cint
##  ＤＸライブラリのウインドウ関連の機能を使用しないかどうかを設定する( TRUE:使用しない  FALSE:使用する( デフォルト ) )

proc SetNotDrawFlag*(Flag: cint): cint
##  ＤＸライブラリの描画機能を使うかどうかを設定する( TRUE:使用しない  FALSE:使用する( デフォルト ) )

proc SetNotSoundFlag*(Flag: cint): cint
##  ＤＸライブラリのサウンド機能を使うかどうかを設定する( TRUE:使用しない  FALSE:使用する( デフォルト ) )

proc SetNotInputFlag*(Flag: cint): cint
##  ＤＸライブラリの入力状態の取得機能を使うかどうかを設定する( TRUE:使用しない  FALSE:使用する( デフォルト ) )

proc SetDialogBoxHandle*(WindowHandle: HWND): cint
##  ＤＸライブラリでメッセージ処理を行うダイアログボックスを登録する

proc SetWindowVisibleFlag*(Flag: cint): cint
##  メインウインドウを表示するかどうかを設定する( TRUE:表示する  FALSE:表示しない )

proc SetWindowMinimizeFlag*(Flag: cint): cint
##  メインウインドウを最小化するかどうかを設定する( TRUE:最小化する  FALSE:最小化を解除 )

proc SetWindowUserCloseEnableFlag*(Flag: cint): cint
##  メインウインドウの×ボタンを押した時にＤＸライブラリが自動的にウインドウを閉じるかどうかを設定する( TRUE:自動的に閉じる( デフォルト )  FALSE:閉じない )

proc SetUseBorderlessWindowFlag*(Flag: cint): cint
##  メインウインドウをボーダーレスウィンドウにするかどうかを設定する( TRUE:ボーダーレスウィンドウ　FALSE:通常ウィンドウ )

proc SetDxLibEndPostQuitMessageFlag*(Flag: cint): cint
##  ＤＸライブラリ終了時に PostQuitMessage を呼ぶかどうかを設定する( TRUE:PostQuitMessage を呼ぶ( デフォルト )  FALSE:呼ばない )

proc SetUserWindow*(WindowHandle: HWND): cint
##  ＤＸライブラリで使用するウインドウのハンドルをセットする( DxLib_Init を実行する以前でのみ有効 )

proc SetUserChildWindow*(WindowHandle: HWND): cint
##  ＤＸライブラリで使用する表示用の子ウインドウのハンドルをセットする( DxLib_Init を実行する以前でのみ有効 )

proc SetUserWindowMessageProcessDXLibFlag*(Flag: cint): cint
##  SetUseWindow で設定したウインドウのメッセージループ処理をＤＸライブラリで行うかどうかを設定する( TRUE:ＤＸライブラリで行う( デフォルト )  FALSE:ＤＸライブラリでは行わない )

proc SetUseFPUPreserveFlag*(Flag: cint): cint
##  FPUの精度を落とさない設定を使用するかどうかを設定する、DxLib_Init を呼び出す前のみ有効( TRUE:使用する(精度が落ちない)  FALSE:使用しない(精度を落とす(デフォルト) )

proc SetValidMousePointerWindowOutClientAreaMoveFlag*(Flag: cint): cint
##  マウスポインタがウインドウのクライアントエリアの外にいけるかどうかを設定する( TRUE:いける( デフォルト設定 )  FALSE:いけない )

proc SetUseBackBufferTransColorFlag*(Flag: cint): cint
##  バックバッファの透過色の部分を透過させるかどうかを設定する( TRUE:透過させる  FALSE:透過させない( デフォルト ) )

proc SetUseUpdateLayerdWindowFlag*(Flag: cint): cint
##  UpdateLayerdWindowForBaseImage や UpdateLayerdWindowForSoftImage を使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない )

proc SetUseMouseEventTransparentWindowFlag*(Flag: cint): cint
##  SetUseBackBufferTransColorFlag( TRUE ); 又は SetUseUpdateLayerdWindowFlag( TRUE ); を設定の際にマウス関係のイベントを背後のウィンドウに透過させるかを設定する( TRUE:透過する   FALSE:透過しない( デフォルト ) )

proc SetResourceModule*(ResourceModule: HMODULE): cint
##  リソースを読み込む際に使用するモジュールを設定する( NULL を指定すると初期状態に戻ります、デフォルトでは NULL )

proc SetUseDxLibWM_PAINTProcess*(Flag: cint): cint
##  WM_PAINT メッセージが来た際に『ＤＸライブラリの WM_PAINTメッセージが来た際の処理』を行うかどうかを設定する( 別スレッドで描画処理を行う場合などで使用 )

proc SetWindows10_WM_CHAR_CancelTime*(MilliSecond: cint): cint
##  Windows10 で WM_CHAR で短時間に連続して同じ文字が入力された場合の無効扱いにする時間を設定する( MilliSecond のミリ秒以内に連続して同じ文字が入力された場合に無効にする、MilliSecond の値をマイナスにするとデフォルトの設定に戻る )

proc SetUseWindows10_WM_CHAR_CancelTime*(Flag: cint): cint
##  Windows10 で WM_CHAR で短時間に連続して同じ文字が入力された場合の無効扱いにするかどうかを設定する( TRUE:短時間連続入力は無効扱いにする(デフォルト)  FALSE:短時間連続入力も無効にしない )
##  ドラッグ＆ドロップされたファイル関係

proc SetDragFileValidFlag*(Flag: cint): cint
##  ファイルのメインウインドウへのドラッグ＆ドロップ機能を有効にするかどうかのフラグをセットする

proc DragFileInfoClear*(): cint
##  メインウインドウへドラッグ＆ドロップされたファイルの情報をリセットする

proc GetDragFilePath*(FilePathBuffer: cstring; FilePathBufferBytes: cint = -1): cint
##  メインウインドウへドラッグ＆ドロップされたファイル名を取得する( FilePathBuffer:ファイル名を格納するバッファの先頭アドレス　　戻り値　-1:取得できなかった  0:取得できた )

proc GetDragFileNum*(): cint
##  メインウインドウへドラッグ＆ドロップされたファイルの数を取得する
##  ウインドウ描画領域設定系関数

proc CreateRgnFromGraph*(Width: cint; Height: cint; MaskData: pointer; Pitch: cint;
                        Byte: cint): HRGN
##  任意の画像イメージからRGNハンドルを作成する( Width:横ドット数  Height:縦ドット数  MaskData:ドット情報配列の先頭アドレス  Pitch:１ラインあたりのbyteサイズ  Byte:１ドット辺りのbyteサイズ( 対応しているのは 1～4 )、ドットの数値が0かそれ以外かで判別 )

proc CreateRgnFromBaseImage*(BaseImage: ptr BASEIMAGE; TransColorR: cint;
                            TransColorG: cint; TransColorB: cint): HRGN
##  任意の基本イメージデータと透過色からRGNハンドルを作成する( BaseImage:基本イメージデータのアドレス  TransColorR,TransColorG,TransColorB:透過色( それぞれ０～２５５ )

proc SetWindowRgnGraph*(FileName: cstring): cint
##  任意の画像ファイルからＲＧＮをセットする

proc SetWindowRgnGraphWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  任意の画像ファイルからＲＧＮをセットする

proc UpdateTransColorWindowRgn*(): cint
##  描画先の画面の透過色の部分を透過させるＲＧＮをセットする( 使用される透過色は関数 SetTransColor で設定した色 )
##  ツールバー関係

proc SetupToolBar*(BitmapName: cstring; DivNum: cint; ResourceID: cint = -1): cint
##  ツールバーの準備、BitmapName に NULL, ResourceID に -1 を渡すとツールバーを解除( BitmapName:ツールバーのボタンに使用する画像ファイルパス、ResourceID に -1 以外を渡す場合は NULL にする  DivNum:ボタン画像中のボタンの数  ResourceID:ツールバーのボタンに使用するビットマップリソースのＩＤ、BitmapName に NULL を渡すとこの引数が使用される )

proc SetupToolBarWithStrLen*(BitmapName: cstring; BitmapNameLength: csize_t;
                            DivNum: cint; ResourceID: cint = -1): cint
##  ツールバーの準備、BitmapName に NULL, ResourceID に -1 を渡すとツールバーを解除( BitmapName:ツールバーのボタンに使用する画像ファイルパス、ResourceID に -1 以外を渡す場合は NULL にする  DivNum:ボタン画像中のボタンの数  ResourceID:ツールバーのボタンに使用するビットマップリソースのＩＤ、BitmapName に NULL を渡すとこの引数が使用される )

proc AddToolBarButton*(Type: cint; ##  TOOLBUTTON_TYPE_NORMAL 等
                      State: cint; ##  TOOLBUTTON_STATE_ENABLE 等
                      ImageIndex: cint; ID: cint): cint
##  ツールバーにボタンを追加する( Type:ボタンタイプ( TOOLBUTTON_TYPE_NORMAL 等( 解説は #define の定義を参照してください ) )  State:初期状態( TOOLBUTTON_STATE_ENABLE 等( 解説は #define の定義を参照してください ) )  ImageIndex:使用するボタンの画像番号  ID:ボタンに割り当てる識別番号  )

proc AddToolBarSep*(): cint
##  ツールバーに隙間を追加する

proc GetToolBarButtonState*(ID: cint): cint
##  ツールバーのボタンの状態を取得する( ID:AddToolBarButtonで設定したボタンの識別番号　　戻り値　TRUE:押されている or 押された  FALSE:押されていない )

proc SetToolBarButtonState*(ID: cint; State: cint): cint
  ##  TOOLBUTTON_STATE_ENABLE 等
##  ツールバーのボタンの状態を設定する( ID:AddToolBarButtonで設定したボタンの識別番号　State:設定する状態( TOOLBUTTON_STATE_ENABLE 等( 解説は #define の定義を参照してください ) )

proc DeleteAllToolBarButton*(): cint
##  ツールバーのボタンを全て削除する
##  メニュー関係

proc SetUseMenuFlag*(Flag: cint): cint
##  メニューを有効にするかどうかを設定する( TRUE:使用する  FALSE:使用しない )

proc SetUseKeyAccelFlag*(Flag: cint): cint
##  キーボードアクセラレーターを使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない )

proc AddKeyAccel*(ItemName: cstring; ItemID: cint; KeyCode: cint; CtrlFlag: cint;
                 AltFlag: cint; ShiftFlag: cint): cint
##  ショートカットキーを追加する( ItemName:ショートカットキーを割り当てるメニューのアイテム名( AddMenuItem で NewItemName に渡した名前 )、ItemID を使用する場合は NULL を渡す  ItemID:メニュー項目の識別番号( AddMenuItem の引数 NewItemID で指定したもの )、ItemName を使用する場合は -1 を渡す  KeyCode:ショートカットキーのキー( KEY_INPUT_L 等 )  CtrlFlag:同時にCTRLキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )  AltFlag:同時にALTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )  ShiftFlag:同時にSHIFTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )

proc AddKeyAccelWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                           ItemID: cint; KeyCode: cint; CtrlFlag: cint; AltFlag: cint;
                           ShiftFlag: cint): cint
##  ショートカットキーを追加する( ItemName:ショートカットキーを割り当てるメニューのアイテム名( AddMenuItem で NewItemName に渡した名前 )、ItemID を使用する場合は NULL を渡す  ItemID:メニュー項目の識別番号( AddMenuItem の引数 NewItemID で指定したもの )、ItemName を使用する場合は -1 を渡す  KeyCode:ショートカットキーのキー( KEY_INPUT_L 等 )  CtrlFlag:同時にCTRLキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )  AltFlag:同時にALTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )  ShiftFlag:同時にSHIFTキーを押す必要があるようにするかどうか( TRUE:押す必要がある  FALSE:押さなくても良い )

proc AddKeyAccel_Name*(ItemName: cstring; KeyCode: cint; CtrlFlag: cint;
                      AltFlag: cint; ShiftFlag: cint): cint
##  ショートカットキーを追加する( 各引数の解説は AddKeyAccel と同じ、ItemID が無くなっただけ )

proc AddKeyAccel_NameWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                                KeyCode: cint; CtrlFlag: cint; AltFlag: cint;
                                ShiftFlag: cint): cint
##  ショートカットキーを追加する( 各引数の解説は AddKeyAccel と同じ、ItemID が無くなっただけ )

proc AddKeyAccel_ID*(ItemID: cint; KeyCode: cint; CtrlFlag: cint; AltFlag: cint;
                    ShiftFlag: cint): cint
##  ショートカットキーを追加する( 各引数の解説は AddKeyAccel と同じ、ItemName が無くなっただけ )

proc ClearKeyAccel*(): cint
##  ショートカットキーの情報をリセットする

proc AddMenuItem*(AddType: cint; ##  MENUITEM_ADD_CHILD等
                 ItemName: cstring; ItemID: cint; SeparatorFlag: cint;
                 NewItemName: cstring = nil; NewItemID: cint = -1): cint
##  メニューに項目を追加する( AddType:項目タイプ( MENUITEM_ADD_CHILD 等( 解説は #define の定義を参照してください ) )    ItemName:AddType が MENUITEM_ADD_CHILDの場合は親となる項目の名前、MENUITEM_ADD_INSERTの場合は挿入位置となる項目の名前、NULL を指定すると ItemID が使用される   ItemID:ItemName の代わりに識別番号で指定するもの、AddType毎の違いは ItemName の解説の通り、-1を指定すると ItemName が使用される　　SeparatorFlag:区切り線を追加するかどうか( TRUE:区切り線を追加、この場合 NewItemName と NewItemID は無視される  FALSE:追加するのは区切り線ではない )　　NewItemName:新しい項目の名前  NewItemID:新しい項目の識別番号、-1を指定すると内部で適当な番号が割り当てられる )

proc AddMenuItemWithStrLen*(AddType: cint; ##  MENUITEM_ADD_CHILD等
                           ItemName: cstring; ItemNameLength: csize_t;
                           ItemID: cint; SeparatorFlag: cint;
                           NewItemName: cstring = nil;
                           NewItemNameLength: csize_t = 0; NewItemID: cint = -1): cint
##  メニューに項目を追加する( AddType:項目タイプ( MENUITEM_ADD_CHILD 等( 解説は #define の定義を参照してください ) )    ItemName:AddType が MENUITEM_ADD_CHILDの場合は親となる項目の名前、MENUITEM_ADD_INSERTの場合は挿入位置となる項目の名前、NULL を指定すると ItemID が使用される   ItemID:ItemName の代わりに識別番号で指定するもの、AddType毎の違いは ItemName の解説の通り、-1を指定すると ItemName が使用される　　SeparatorFlag:区切り線を追加するかどうか( TRUE:区切り線を追加、この場合 NewItemName と NewItemID は無視される  FALSE:追加するのは区切り線ではない )　　NewItemName:新しい項目の名前  NewItemID:新しい項目の識別番号、-1を指定すると内部で適当な番号が割り当てられる )

proc DeleteMenuItem*(ItemName: cstring; ItemID: cint): cint
##  メニューから選択項目を削除する( ItemName:削除する項目の名前( AddMenuItem で NewItemName に渡した名前 )、NULL を指定すると ItemID が使用される  ItemID:削除する項目の識別番号( AddMenuItem で NewItemID に渡した番号 )、-1 を指定すると ItemName が使用される )

proc DeleteMenuItemWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                              ItemID: cint): cint
##  メニューから選択項目を削除する( ItemName:削除する項目の名前( AddMenuItem で NewItemName に渡した名前 )、NULL を指定すると ItemID が使用される  ItemID:削除する項目の識別番号( AddMenuItem で NewItemID に渡した番号 )、-1 を指定すると ItemName が使用される )

proc CheckMenuItemSelect*(ItemName: cstring; ItemID: cint): cint
##  メニューが選択されたかどうかを取得する( 戻り値　 0:選択されていない  1:選択された   ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )

proc CheckMenuItemSelectWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                                   ItemID: cint): cint
##  メニューが選択されたかどうかを取得する( 戻り値　 0:選択されていない  1:選択された   ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )

proc SetMenuItemEnable*(ItemName: cstring; ItemID: cint; EnableFlag: cint): cint
##  メニューの項目を選択出来るかどうかを設定する( EnableFlag:項目が選択できるかどうか( TRUE:選択できる   FALSE:選択できない )   ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )

proc SetMenuItemEnableWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                                 ItemID: cint; EnableFlag: cint): cint
##  メニューの項目を選択出来るかどうかを設定する( EnableFlag:項目が選択できるかどうか( TRUE:選択できる   FALSE:選択できない )   ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください )

proc SetMenuItemMark*(ItemName: cstring; ItemID: cint; Mark: cint): cint
##  メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( Mark:設定するマーク( MENUITEM_MARK_NONE 等( 解説は #define の定義を参照してください )    ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください ) )

proc SetMenuItemMarkWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                               ItemID: cint; Mark: cint): cint
##  メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( Mark:設定するマーク( MENUITEM_MARK_NONE 等( 解説は #define の定義を参照してください )    ItemName と ItemID については関数 DeleteMenuItem の注釈を参照してください ) )

proc CheckMenuItemSelectAll*(): cint
##  メニューの項目がどれか選択されたかどうかを取得する( 戻り値  TRUE:どれか選択された  FALSE:選択されていない )

proc AddMenuItem_Name*(ParentItemName: cstring; NewItemName: cstring): cint
##  メニューに選択項目を追加する( ParentItemName:親となる項目の名前、親が持つリストの末端に新しい項目を追加します  NewItemName:新しい項目の名前 )

proc AddMenuItem_NameWithStrLen*(ParentItemName: cstring;
                                ParentItemNameLength: csize_t;
                                NewItemName: cstring; NewItemNameLength: csize_t): cint
##  メニューに選択項目を追加する( ParentItemName:親となる項目の名前、親が持つリストの末端に新しい項目を追加します  NewItemName:新しい項目の名前 )

proc AddMenuLine_Name*(ParentItemName: cstring): cint
##  メニューのリストに区切り線を追加する( ParentItemName:区切り線を付ける項目リストの親の名前、リストの末端に区切り線を追加します )

proc AddMenuLine_NameWithStrLen*(ParentItemName: cstring;
                                ParentItemNameLength: csize_t): cint
##  メニューのリストに区切り線を追加する( ParentItemName:区切り線を付ける項目リストの親の名前、リストの末端に区切り線を追加します )

proc InsertMenuItem_Name*(ItemName: cstring; NewItemName: cstring): cint
##  指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する

proc InsertMenuItem_NameWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                                   NewItemName: cstring;
                                   NewItemNameLength: csize_t): cint
##  指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する

proc InsertMenuLine_Name*(ItemName: cstring): cint
##  指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する

proc InsertMenuLine_NameWithStrLen*(ItemName: cstring; ItemNameLength: csize_t): cint
##  指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する

proc DeleteMenuItem_Name*(ItemName: cstring): cint
##  メニューから選択項目を削除する

proc DeleteMenuItem_NameWithStrLen*(ItemName: cstring; ItemNameLength: csize_t): cint
##  メニューから選択項目を削除する

proc CheckMenuItemSelect_Name*(ItemName: cstring): cint
##  メニューが選択されたかどうかを取得する( 戻り値　0:選択されていない  1:選択された )

proc CheckMenuItemSelect_NameWithStrLen*(ItemName: cstring;
                                        ItemNameLength: csize_t): cint
##  メニューが選択されたかどうかを取得する( 戻り値　0:選択されていない  1:選択された )

proc SetMenuItemEnable_Name*(ItemName: cstring; EnableFlag: cint): cint
##  メニューの項目を選択出来るかどうかを設定する( EnableFlag　1:選択できる  0:選択できない )

proc SetMenuItemEnable_NameWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                                      EnableFlag: cint): cint
##  メニューの項目を選択出来るかどうかを設定する( EnableFlag　1:選択できる  0:選択できない )

proc SetMenuItemMark_Name*(ItemName: cstring; Mark: cint): cint
##  メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( Mark:設定するマーク( MENUITEM_MARK_NONE 等 ) )

proc SetMenuItemMark_NameWithStrLen*(ItemName: cstring; ItemNameLength: csize_t;
                                    Mark: cint): cint
##  メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( Mark:設定するマーク( MENUITEM_MARK_NONE 等 ) )

proc AddMenuItem_ID*(ParentItemID: cint; NewItemName: cstring; NewItemID: cint = -1): cint
##  メニューに選択項目を追加する

proc AddMenuItem_IDWithStrLen*(ParentItemID: cint; NewItemName: cstring;
                              NewItemNameLength: csize_t; NewItemID: cint = -1): cint
##  メニューに選択項目を追加する

proc AddMenuLine_ID*(ParentItemID: cint): cint
##  メニューのリストに区切り線を追加する

proc InsertMenuItem_ID*(ItemID: cint; NewItemID: cint): cint
##  指定の項目と、指定の項目の一つ上の項目との間に新しい項目を追加する

proc InsertMenuLine_ID*(ItemID: cint; NewItemID: cint): cint
##  指定の項目と、指定の項目の一つ上の項目との間に区切り線を追加する

proc DeleteMenuItem_ID*(ItemID: cint): cint
##  メニューから選択項目を削除する

proc CheckMenuItemSelect_ID*(ItemID: cint): cint
##  メニューが選択されたかどうかを取得する( 戻り値　　0:選択されていない  1:選択された )

proc SetMenuItemEnable_ID*(ItemID: cint; EnableFlag: cint): cint
##  メニューの項目を選択出来るかどうかを設定する( EnableFlag　1:選択できる  0:選択できない )

proc SetMenuItemMark_ID*(ItemID: cint; Mark: cint): cint
##  メニューの項目にチェックマークやラジオボタンを表示するかどうかを設定する( Mark:設定するマーク( MENUITEM_MARK_NONE 等 ) )

proc DeleteMenuItemAll*(): cint
##  メニューの全ての選択項目を削除する

proc ClearMenuItemSelect*(): cint
##  メニューが選択されたかどうかの情報をリセット

proc GetMenuItemID*(ItemName: cstring): cint
##  メニューの項目名から項目識別番号を取得する

proc GetMenuItemIDDX*(ItemName: cstring): cint
##  メニューの項目名から項目識別番号を取得する

proc GetMenuItemIDWithStrLen*(ItemName: cstring; ItemNameLength: csize_t): cint
##  メニューの項目名から項目識別番号を取得する

proc GetMenuItemName*(ItemID: cint; NameBuffer: cstring): cint
##  メニューの項目識別番号から項目名を取得する

proc LoadMenuResource*(MenuResourceID: cint): cint
##  メニューをリソースから読み込む

proc SetMenuItemSelectCallBackFunction*(CallBackFunction: proc (
    ItemName: cstring; ItemID: cint)): cint
##  メニューの選択項目が選択されたときに呼ばれるコールバック関数を設定する( CallBackFunction:項目が選択されたときに呼ばれるコールバック関数、引数に項目名と項目の識別番号を渡されて呼ばれる )

proc SetWindowMenu*(MenuID: cint; MenuProc: proc (ID: WORD): cint): cint
##  (古い関数)ウインドウにメニューを設定する

proc SetDisplayMenuFlag*(Flag: cint): cint
##  (古い関数)メニューを表示するかどうかをセットする

proc GetDisplayMenuFlag*(): cint
##  (古い関数)メニューを表示しているかどうかを取得する

proc GetUseMenuFlag*(): cint
##  メニューを使用しているかどうかを得る

proc SetAutoMenuDisplayFlag*(Flag: cint): cint
##  フルスクリーン時にメニューを自動で表示したり非表示にしたりするかどうかのフラグをセットする

{.pop.}
