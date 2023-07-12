import ../DxDll
{.push dynlib: DLL, importc.}

##  DxHandle.cpp関数プロトタイプ宣言

proc SetDeleteHandleFlag*(Handle: cint; DeleteFlag: ptr cint): cint
##  ハンドルが削除されたときに－１が設定される変数を登録する

proc GetHandleNum*(HandleType: cint): cint
  ##  DX_HANDLETYPE_GRAPH等
##  指定のタイプのハンドルの数を取得する

proc GetMaxHandleNum*(HandleType: cint): cint
  ##  DX_HANDLETYPE_GRAPH等
##  指定のタイプのハンドルが最大で幾つ作成できるかを取得する

proc DumpHandleInfo*(HandleType: cint): cint
  ##  DX_HANDLETYPE_GRAPH等
##  指定のタイプの全ハンドルの情報をログに出力する
##  マウス関係関数

proc SetMouseDispFlag*(DispFlag: cint): cint
##  マウスポインタの表示状態を設定する( DispFlag:マウスポインタを表示するかどうか( TRUE:表示する  FALSE:表示しない )

proc SetMouseDispIgnoreMenuFlag*(IgnoreMenuFlag: cint): cint
##  マウスポインタの表示状態についてメニューの表示状態を無視するかどうかを設定する( TRUE:メニューの表示状態を無視する  FALSE:メニューの表示状態を考慮する( デフォルト ) )

proc GetMousePoint*(XBuf: ptr cint; YBuf: ptr cint): cint
##  マウスポインタの位置を取得する

proc SetMousePoint*(PointX: cint; PointY: cint): cint
##  マウスポインタの位置を設定する

proc GetMouseInput*(): cint
##  マウスのボタンの押下状態を取得する

proc GetMouseWheelRotVol*(CounterReset: cint = TRUE): cint
##  垂直マウスホイールの回転量を取得する

proc GetMouseHWheelRotVol*(CounterReset: cint = TRUE): cint
##  水平マウスホイールの回転量を取得する

proc GetMouseWheelRotVolF*(CounterReset: cint = TRUE): cfloat
##  垂直マウスホイールの回転量を取得する( 戻り値が float 型 )

proc GetMouseHWheelRotVolF*(CounterReset: cint = TRUE): cfloat
##  水平マウスホイールの回転量を取得する( 戻り値が float 型 )

proc GetMouseInputLog*(Button: ptr cint; ClickX: ptr cint; ClickY: ptr cint;
                      LogDelete: cint = TRUE): cint
##  マウスのボタンを押した情報を一つ取得する( Button:押されたボタン( MOUSE_INPUT_LEFT 等 )を格納する変数のアドレス  ClickX:押された時のＸ座標を格納する変数のアドレス  ClickY:押された時のＹ座標を格納する変数のアドレス   LogDelete:取得した押下情報一つ分をログから削除するかどうか( TRUE:削除する  FALSE:削除しない、つまり次にこの関数が呼ばれたときに同じ値を取得することになる )　　戻り値  0:押された情報取得できた　-1:押された情報が無かった、つまり前回の呼び出し( または起動時から最初の呼び出し )の間に一度もマウスのボタンが押されなかった )

proc GetMouseInputLog2*(Button: ptr cint; ClickX: ptr cint; ClickY: ptr cint;
                       LogType: ptr cint; LogDelete: cint = TRUE): cint
##  マウスのボタンを押したり離したりした情報を一つ取得する( Button:押されたり離されたりしたボタン( MOUSE_INPUT_LEFT 等 )を格納する変数のアドレス  ClickX:押されたり離されたりした時のＸ座標を格納する変数のアドレス  ClickY:押されたり離されたりした時のＹ座標を格納する変数のアドレス  LogType：押されたのか( MOUSE_INPUT_LOG_DOWN )離されたのか( MOUSE_INPUT_LOG_UP )、等の情報を格納する変数のアドレス  LogDelete:取得した押されたり離されたりした情報一つ分をログから削除するかどうか( TRUE:削除する  FALSE:削除しない、つまり次にこの関数が呼ばれたときに同じ値を取得することになる )　　戻り値  0:押されたり離されたりした情報取得できた　-1:押されたり離されたりした情報が無かった、つまり前回の呼び出し( または起動時から最初の呼び出し )の間に一度もマウスのボタンが押されたり離されたりしなかった )
##  タッチパネル入力関係関数

proc GetTouchInputNum*(): cint
##  タッチされている数を取得する

proc GetTouchInput*(InputNo: cint; PositionX: ptr cint; PositionY: ptr cint;
                   ID: ptr cint = nil; Device: ptr cint = nil; Pressure: ptr cfloat = nil): cint
##  タッチの情報を取得する

proc GetTouchInputLogNum*(): cint
##  ストックされているタッチ情報の数を取得する

proc ClearTouchInputLog*(): cint
##  ストックされているタッチ情報をクリアする

proc GetTouchInputLogOne*(PeekFlag: cint = FALSE): TOUCHINPUTDATA
##  ストックされているタッチ情報から一番古い情報をひとつ取得する

proc GetTouchInputLog*(TouchData: ptr TOUCHINPUTDATA; GetNum: cint;
                      PeekFlag: cint = FALSE): cint
##  ストックされているタッチ情報から古い順に指定数バッファに取得する( 戻り値  -1:エラー  0以上:取得した情報の数 )

proc GetTouchInputDownLogNum*(): cint
##  ストックされているタッチされ始めた情報の数を取得する

proc ClearTouchInputDownLog*(): cint
##  ストックされているタッチされ始めた情報をクリアする

proc GetTouchInputDownLogOne*(PeekFlag: cint = FALSE): TOUCHINPUTPOINT
##  ストックされているタッチされ始めた情報から一番古い情報をひとつ取得する

proc GetTouchInputDownLog*(PointData: ptr TOUCHINPUTPOINT; GetNum: cint;
                          PeekFlag: cint = FALSE): cint
##  ストックされているタッチされ始めた情報から古い順に指定数バッファに取得する( 戻り値  -1:エラー  0以上:取得した情報の数 )

proc GetTouchInputUpLogNum*(): cint
##  ストックされているタッチが離された情報の数を取得する

proc ClearTouchInputUpLog*(): cint
##  ストックされているタッチが離された情報をクリアする

proc GetTouchInputUpLogOne*(PeekFlag: cint = FALSE): TOUCHINPUTPOINT
##  ストックされているタッチが離された情報から一番古い情報をひとつ取得する

proc GetTouchInputUpLog*(PointData: ptr TOUCHINPUTPOINT; GetNum: cint;
                        PeekFlag: cint = FALSE): cint
##  ストックされているタッチが離された情報から古い順に指定数バッファに取得する( 戻り値  -1:エラー  0以上:取得した情報の数 )

{.pop.}
