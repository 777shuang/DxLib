import winim
import DxStruct
import DxDll

{.push header: DLL.}
##  DxSystem.cpp関数プロトタイプ宣言
##  初期化終了系関数

proc DxLib_Init*(): cint
##  ライブラリ初期化を行う

proc DxLib_End*(): cint
##  ライブラリ使用の後始末を行う

proc DxLib_GlobalStructInitialize*(): cint
##  ライブラリの内部で使用している構造体をゼロ初期化して、DxLib_Init の前に行った設定を無効化する( DxLib_Init の前でのみ有効 )

proc DxLib_IsInit*(): cint
##  ライブラリが初期化されているかどうかを取得する( 戻り値: TRUE=初期化されている  FALSE=されていない )
##  エラー関係関数

proc GetLastErrorCode*(): cint
##  最後に発生したエラーのエラーコードを取得する( 戻り値　0:エラーが発生していない、又はエラーコード出力に対応したエラーが発生していない　　0以外：エラーコード、DX_ERRORCODE_WIN_DESKTOP_24BIT_COLOR など )

proc GetLastErrorMessage*(StringBuffer: ptr TCHAR; StringBufferBytes: cint): cint
##  最後に発生したエラーのエラーメッセージを指定の文字列バッファに取得する
##  メッセージ処理関数

proc ProcessMessage*(): cint
##  ウインドウズのメッセージループに代わる処理を行う
##  設定系関数

proc SetAlwaysRunFlag*(Flag: cint): cint
##  アプリが非アクティブ状態でも処理を実行するかどうかを設定する( TRUE:実行する  FALSE:停止する( デフォルト ) )
##  ウエイト系関数

proc WaitTimer*(WaitTime: cint): cint
##  指定の時間だけ処理をとめる

proc WaitKey*(): cint
##  キーの入力待ちを行う

proc SleepThread*(WaitTime: cint): cint
##  指定の時間だけスレッドを眠らせる
##  カウンタ及び時刻取得系関数

proc GetNowCount*(UseRDTSCFlag: cint = FALSE): cint
##  ミリ秒単位の精度を持つカウンタの現在の値を得る

proc GetNowHiPerformanceCount*(UseRDTSCFlag: cint = FALSE): LONGLONG
##  GetNowCountの高精度バージョン( μ秒単位の精度を持つカウンタの現在の値を得る )

proc GetNowSysPerformanceCount*(): ULONGLONG
##  OSが提供する高精度カウンタの現在の値を得る

proc GetSysPerformanceFrequency*(): ULONGLONG
##  OSが提供する高精度カウンタの周波数( 1秒辺りのカウント数 )を得る

proc ConvSysPerformanceCountToSeconds*(Count: ULONGLONG): ULONGLONG
##  OSが提供する高精度カウンタの値を秒の値に変換する

proc ConvSysPerformanceCountToMilliSeconds*(Count: ULONGLONG): ULONGLONG
##  OSが提供する高精度カウンタの値をミリ秒の値に変換する

proc ConvSysPerformanceCountToMicroSeconds*(Count: ULONGLONG): ULONGLONG
##  OSが提供する高精度カウンタの値をマイクロ秒の値に変換する

proc ConvSysPerformanceCountToNanoSeconds*(Count: ULONGLONG): ULONGLONG
##  OSが提供する高精度カウンタの値をナノ秒の値に変換する

proc ConvSecondsToSysPerformanceCount*(Seconds: ULONGLONG): ULONGLONG
##  秒の値をOSが提供する高精度カウンタの値に変換する

proc ConvMilliSecondsToSysPerformanceCount*(MilliSeconds: ULONGLONG): ULONGLONG
##  ミリ秒の値をOSが提供する高精度カウンタの値に変換する

proc ConvMicroSecondsToSysPerformanceCount*(MicroSeconds: ULONGLONG): ULONGLONG
##  マイクロ秒の値をOSが提供する高精度カウンタの値に変換する

proc ConvNanoSecondsToSysPerformanceCount*(NanoSeconds: ULONGLONG): ULONGLONG
##  ナノ秒の値をOSが提供する高精度カウンタの値に変換する

proc GetDateTime*(DateBuf: ptr DATEDATA): cint
##  現在時刻を取得する
##  乱数取得

proc GetRand*(RandMax: cint): cint
##  乱数を取得する( RandMax : 返って来る値の最大値 )

proc SRand*(Seed: cint): cint
##  乱数の初期値を設定する

proc GetMersenneTwisterRand*(): DWORD
##  メルセンヌ・ツイスターアルゴリズムで生成された乱数値を無加工で取得する

proc CreateRandHandle*(Seed: cint = -1): DWORD_PTR
##  乱数ハンドルを作成する( 戻り値　0以外:乱数ハンドル　0:エラー )

proc DeleteRandHandle*(RandHandle: DWORD_PTR): cint
##  乱数ハンドルを削除する

proc SRandHandle*(RandHandle: DWORD_PTR; Seed: cint): cint
##  乱数ハンドルの初期値を再設定する

proc GetRandHandle*(RandHandle: DWORD_PTR; RandMax: cint): cint
##  乱数ハンドルを使用して乱数を取得する( RandMax : 返って来る値の最大値 )

proc GetMersenneTwisterRandHandle*(RandHandle: DWORD_PTR): DWORD
##  乱数ハンドルを使用してメルセンヌ・ツイスターアルゴリズムで生成された乱数値を無加工で取得する
##  バッテリー関連

proc GetBatteryLifePercent*(): cint
##  電池の残量を % で取得する( 戻り値： 100=フル充電状態  0=充電残量無し )
##  クリップボード関係

proc GetClipboardText*(DestBuffer: ptr TCHAR): cint
##  クリップボードに格納されているテキストデータを読み出す( DestBuffer:文字列を格納するバッファの先頭アドレス   戻り値  -1:クリップボードにテキストデータが無い  -1以外:クリップボードに格納されている文字列データのサイズ( 単位:byte ) )

proc SetClipboardText*(Text: ptr TCHAR): cint
##  クリップボードにテキストデータを格納する

proc SetClipboardTextWithStrLen*(Text: ptr TCHAR; TextLength: csize_t): cint
##  クリップボードにテキストデータを格納する
##  iniファイル関係

proc GetPrivateProfileStringDx*(AppName: ptr TCHAR; KeyName: ptr TCHAR;
                               Default: ptr TCHAR; ReturnedStringBuffer: ptr TCHAR;
                               ReturnedStringBufferBytes: csize_t;
                               IniFilePath: ptr TCHAR;
                               IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileString のＤＸライブラリ版

proc GetPrivateProfileStringDxWithStrLen*(AppName: ptr TCHAR;
    AppNameLength: csize_t; KeyName: ptr TCHAR; KeyNameLength: csize_t;
    Default: ptr TCHAR; DefaultLength: csize_t; ReturnedStringBuffer: ptr TCHAR;
    ReturnedStringBufferBytes: csize_t; IniFilePath: ptr TCHAR;
    IniFilePathLength: csize_t; IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileString のＤＸライブラリ版

proc GetPrivateProfileIntDx*(AppName: ptr TCHAR; KeyName: ptr TCHAR; Default: cint;
                            IniFilePath: ptr TCHAR;
                            IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileInt のＤＸライブラリ版

proc GetPrivateProfileIntDxWithStrLen*(AppName: ptr TCHAR; AppNameLength: csize_t;
                                      KeyName: ptr TCHAR; KeyNameLength: csize_t;
                                      Default: cint; IniFilePath: ptr TCHAR;
                                      IniFilePathLength: csize_t;
                                      IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileInt のＤＸライブラリ版

proc GetPrivateProfileStringDxForMem*(AppName: ptr TCHAR; KeyName: ptr TCHAR;
                                     Default: ptr TCHAR;
                                     ReturnedStringBuffer: ptr TCHAR;
                                     ReturnedStringBufferBytes: csize_t;
                                     IniFileImage: pointer;
                                     IniFileImageBytes: csize_t;
                                     IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileStringDx のメモリから読み込む版

proc GetPrivateProfileStringDxForMemWithStrLen*(AppName: ptr TCHAR;
    AppNameLength: csize_t; KeyName: ptr TCHAR; KeyNameLength: csize_t;
    Default: ptr TCHAR; DefaultLength: csize_t; ReturnedStringBuffer: ptr TCHAR;
    ReturnedStringBufferBytes: csize_t; IniFileImage: pointer;
    IniFileImageBytes: csize_t; IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileStringDx のメモリから読み込む版

proc GetPrivateProfileIntDxForMem*(AppName: ptr TCHAR; KeyName: ptr TCHAR;
                                  Default: cint; IniFileImage: pointer;
                                  IniFileImageBytes: csize_t;
                                  IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileIntDx のメモリから読み込む版

proc GetPrivateProfileIntDxForMemWithStrLen*(AppName: ptr TCHAR;
    AppNameLength: csize_t; KeyName: ptr TCHAR; KeyNameLength: csize_t; Default: cint;
    IniFileImage: pointer; IniFileImageBytes: csize_t;
    IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileIntDx のメモリから読み込む版
##  メールアプリを送信メール編集状態で起動する
##  MailAddr    : 宛先( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  MailCCAddr  : CC の宛先( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  MailBCCAddr : BCC の宛先( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  Subject     : タイトル( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  Text        : 本文( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください

proc MailApp_Send*(MailAddr: ptr TCHAR = nil; MailCCAddr: ptr TCHAR = nil;
                  MailBCCAddr: ptr TCHAR = nil; Subject: ptr TCHAR = nil;
                  Text: ptr TCHAR = nil): cint
proc MailApp_SendWithStrLen*(MailAddr: ptr TCHAR = nil; MailAddrLength: csize_t = 0;
                            MailCCAddr: ptr TCHAR = nil;
                            MailCCAddrLength: csize_t = 0;
                            MailBCCAddr: ptr TCHAR = nil;
                            MailBCCAddrLength: csize_t = 0;
                            Subject: ptr TCHAR = nil; SubjectLength: csize_t = 0;
                            Text: ptr TCHAR = nil; TextLength: csize_t = 0): cint
##  DxLog.cpp関数プロトタイプ宣言
##  ログファイル関数

proc LogFileAdd*(String: ptr TCHAR): cint
##  ログファイル( Log.txt ) に文字列を出力する

proc LogFileAddWithStrLen*(String: ptr TCHAR; StringLength: csize_t): cint
##  ログファイル( Log.txt ) に文字列を出力する

proc LogFileFmtAdd*(FormatString: ptr TCHAR): cint {.varargs.}
##  書式付きで ログファイル( Log.txt ) に文字列を出力する( 書式は printf と同じ )

proc LogFileTabAdd*(): cint
##  ログファイル( Log.txt ) に出力する文字列の前に付けるタブの数を一つ増やす

proc LogFileTabSub*(): cint
##  ログファイル( Log.txt ) に出力する文字列の前に付けるタブの数を一つ減らす

proc ErrorLogAdd*(String: ptr TCHAR): cint
##  LogFileAdd の旧名称関数

proc ErrorLogFmtAdd*(FormatString: ptr TCHAR): cint {.varargs.}
##  LogFileFmtAdd の旧名称関数

proc ErrorLogTabAdd*(): cint
##  LogFileTabAdd の旧名称関数

proc ErrorLogTabSub*(): cint
##  LogFileTabSub の旧名称関数

proc SetUseTimeStampFlag*(UseFlag: cint): cint
##  ログファイル( Log.txt ) に出力する文字列の前に起動してからの時間を付けるかどうかを設定する( TRUE:付ける( デフォルト)  FALSE:付けない )

proc AppLogAdd*(String: ptr TCHAR): cint {.varargs.}
##  LogFileFmtAdd と同じ機能の関数
##  ログ出力設定関数

proc SetOutApplicationLogValidFlag*(Flag: cint): cint
##  ログファイル( Log.txt ) を作成するかどうかを設定する( TRUE:作成する( デフォルト )  FALSE:作成しない )、DxLib_Init の前でのみ使用可能　

proc SetOutApplicationSystemLogValidFlag*(Flag: cint): cint
##  ログファイル( Log.txt ) にＤＸライブラリ内部のログ出力を行うかどうか設定する( TRUE:ＤＸライブラリ内部のログ出力を行う( デフォルト )  FALSE:ＤＸライブラリ内部のログ出力を行わない )

proc SetApplicationLogFileName*(FileName: ptr TCHAR): cint
##  ログファイルの名前を設定する( Log.txt 以外にしたい場合に使用 )

proc SetApplicationLogFileNameWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t): cint
##  ログファイルの名前を設定する( Log.txt 以外にしたい場合に使用 )

proc SetApplicationLogSaveDirectory*(DirectoryPath: ptr TCHAR): cint
##  ログファイル( Log.txt ) を保存するディレクトリパスを設定する

proc SetApplicationLogSaveDirectoryWithStrLen*(DirectoryPath: ptr TCHAR;
    DirectoryPathLength: csize_t): cint
##  ログファイル( Log.txt ) を保存するディレクトリパスを設定する

proc SetUseDateNameLogFile*(Flag: cint): cint
##  ログファイル名に日付をつけるかどうかをセットする( TRUE:付ける  FALSE:付けない( デフォルト ) )
##  ログ出力機能関数

proc SetLogDrawOutFlag*(DrawFlag: cint): cint
##  printfDx の結果を画面に出力するかどうかを設定する、TRUE:出力を行う  FALSE:出力を行わない( printfDx を実行すると内部で SetLogDrawOutFlag( TRUE ) ; が呼ばれます )

proc GetLogDrawFlag*(): cint
##  printfDx の結果を画面に出力するかどうかの設定を取得する( 戻り値  TRUE:出力を行う  FALSE:出力を行わない )

proc SetLogFontSize*(Size: cint): cint
##  printfDx の結果を画面に出力する際に使用するフォントのサイズを設定する

proc SetLogFontHandle*(FontHandle: cint): cint
##  printfDx の結果を画面に出力する際に使用するフォントのハンドルを変更する

proc SetLogDrawArea*(x1: cint; y1: cint; x2: cint; y2: cint): cint
##  printfDx の結果を画面に出力する際の描画する領域を設定する
##  簡易画面出力関数

proc printfDx*(FormatString: ptr TCHAR): cint {.varargs.}
##  printf と同じ引数で画面に文字列を表示するための関数

proc putsDx*(String: ptr TCHAR; NewLine: cint = TRUE): cint
##  puts と同じ引数で画面に文字列を表示するための関数

proc putsDxWithStrLen*(String: ptr TCHAR; StringLength: csize_t; NewLine: cint = TRUE): cint
##  puts と同じ引数で画面に文字列を表示するための関数

proc clsDx*(): cint
##  printfDx の結果をリセットするための関数

proc setPrintColorDx*(Color: cint; EdgeColor: cint = 0): cint
##  printf や puts で表示する文字列の色を指定する
##  DxASyncLoad.cpp関数プロトタイプ宣言
##  非同期読み込み関係

proc SetUseASyncLoadFlag*(Flag: cint): cint
##  読み込み処理系の関数で非同期読み込みを行うかどうかを設定する( 非同期読み込みに対応している関数のみ有効 )( TRUE:非同期読み込みを行う  FALSE:非同期読み込みを行わない( デフォルト ) )

proc GetUseASyncLoadFlag*(): cint
##  読み込み処理系の関数で非同期読み込みを行うかどうかを取得する( 非同期読み込みに対応している関数のみ有効 )( TRUE:非同期読み込みを行う  FALSE:非同期読み込みを行わない( デフォルト ) )

proc CheckHandleASyncLoad*(Handle: cint): cint
##  ハンドルの非同期読み込みが完了しているかどうかを取得する( TRUE:まだ完了していない  FALSE:完了している  -1:エラー )

proc GetHandleASyncLoadResult*(Handle: cint): cint
##  ハンドルの非同期読み込み処理の戻り値を取得する( 非同期読み込み中の場合は一つ前の非同期読み込み処理の戻り値が返ってきます )

proc SetASyncLoadFinishDeleteFlag*(Handle: cint): cint
##  ハンドルの非同期読み込み処理が完了したらハンドルを削除するフラグを立てる

proc SetASyncLoadFinishCallback*(Handle: cint;
                                Callback: proc (Handle: cint; Data: pointer);
                                Data: pointer): cint
##  ハンドルの非同期読み込み処理が完了したら呼ばれる関数をセットする

proc WaitHandleASyncLoad*(Handle: cint): cint
##  指定のハンドルの非同期読み込み処理が終了するまで待つ

proc WaitHandleASyncLoadAll*(): cint
##  全ての非同期読み込みデータが読み込み終わるまで待つ

proc GetASyncLoadNum*(): cint
##  非同期読み込み中の処理の数を取得する

proc SetASyncLoadThreadNum*(ThreadNum: cint): cint
##  非同期読み込み処理を行うスレッドの数を設定する( ThreadNum に指定できる数は 1 ～ 32 )
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
##  DxMemory.cpp関数プロトタイプ宣言
##  メモリ確保系関数

proc DxAlloc*(AllocSize: csize_t; File: cstring = nil; Line: cint = -1): pointer
##  指定のサイズのメモリを確保する( AllocSize:確保するメモリのサイズ( 単位:byte )  File:DxAllocを呼んだソースファイル名( デバッグ用 )  Line:DxAllocを呼んだソースファイル中の行番号( デバッグ用 )　　戻り値  NULL:メモリの確保失敗   NULL以外:確保したメモリ領域の先頭アドレス )

proc DxAllocAligned*(AllocSize: csize_t; Alignment: csize_t; File: cstring = nil;
                    Line: cint = -1): pointer
##  指定のサイズのメモリを確保する( アライン指定版 )( AllocSize:確保するメモリのサイズ( 単位:byte )  Alignment:確保するメモリ領域のアドレス値の倍数  File:DxAllocを呼んだソースファイル名( デバッグ用 )  Line:DxAllocを呼んだソースファイル中の行番号( デバッグ用 )　　戻り値  NULL:メモリの確保失敗   NULL以外:確保したメモリ領域の先頭アドレス )

proc DxCalloc*(AllocSize: csize_t; File: cstring = nil; Line: cint = -1): pointer
##  指定のサイズのメモリを確保して、０で埋める、初期化後に０で埋める以外は DxAlloc と動作は同じ

proc DxCallocAligned*(AllocSize: csize_t; Alignment: csize_t; File: cstring = nil;
                     Line: cint = -1): pointer
##  指定のサイズのメモリを確保して、０で埋める、初期化後に０で埋める以外は DxAllocAligned と動作は同じ

proc DxRealloc*(Memory: pointer; AllocSize: csize_t; File: cstring = nil;
               Line: cint = -1): pointer
##  メモリの再確保を行う( Memory:再確保を行うメモリ領域の先頭アドレス( DxAlloc の戻り値 )  AllocSize:新しい確保サイズ　FileとLine の説明は DxAlloc の注釈の通り 　戻り値 NULL:メモリの再確保失敗　NULL以外:再確保した新しいメモリ領域の先頭アドレス　)

proc DxReallocAligned*(Memory: pointer; AllocSize: csize_t; Alignment: csize_t;
                      File: cstring = nil; Line: cint = -1): pointer
##  メモリの再確保を行う( アライン指定版 )( Memory:再確保を行うメモリ領域の先頭アドレス( DxAlloc の戻り値 )  AllocSize:新しい確保サイズ   Alignment:新しく確保するメモリ領域のアドレス値の倍数　FileとLine の説明は DxAlloc の注釈の通り 　戻り値 NULL:メモリの再確保失敗　NULL以外:再確保した新しいメモリ領域の先頭アドレス　)

proc DxFree*(Memory: pointer)
##  メモリを解放する( Memory:解放するメモリ領域の先頭アドレス( DxAlloc の戻り値 ) )

proc DxSetAllocSizeTrap*(Size: csize_t): csize_t
##  列挙対象にするメモリの確保容量をセットする

proc DxSetAllocPrintFlag*(Flag: cint): cint
##  ＤＸライブラリ内でメモリ確保が行われる時に情報を出力するかどうかをセットする

proc DxGetAllocSize*(): csize_t
##  DxAlloc や DxCalloc で確保しているメモリサイズを取得する

proc DxGetAllocNum*(): cint
##  DxAlloc や DxCalloc で確保しているメモリの数を取得する

proc DxDumpAlloc*()
##  DxAlloc や DxCalloc で確保しているメモリを列挙する

proc DxDrawAlloc*(x: cint; y: cint; Width: cint; Height: cint)
##  DxAlloc や DxCalloc で確保しているメモリの状況を描画する

proc DxErrorCheckAlloc*(): cint
##  確保したメモリ情報が破壊されていないか調べる( -1:破壊あり  0:なし )

proc DxSetAllocSizeOutFlag*(Flag: cint): cint
##  メモリが確保、解放が行われる度に確保しているメモリの容量を出力するかどうかのフラグをセットする

proc DxSetAllocMemoryErrorCheckFlag*(Flag: cint): cint
##  メモリの確保、解放が行われる度に確保しているメモリ確保情報が破損していないか調べるかどうかのフラグをセットする
##  DxBaseFunc.cpp 関数プロトタイプ宣言
##  文字コード関係

proc GetCharBytes*(CharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                  String: pointer): cint
##  文字列の先頭の文字のバイト数を取得する

proc ConvertStringCharCodeFormat*(SrcCharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                                 SrcString: pointer; DestCharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                                 DestStringBuffer: pointer): cint
##  文字列の文字コード形式を別の文字コード形式に変換する

proc SetUseCharCodeFormat*(CharCodeFormat: cint): cint
  ##  DX_CHARCODEFORMAT_SHIFTJIS 等
##  文字列の引数の文字コード形式を設定する( 文字列描画系関数とその他一部関数を除く )( UNICODE版では無効 )

proc GetUseCharCodeFormat*(): cint
##  文字列の引数の文字コード形式を取得する( 戻り値：文字コード形式( DX_CHARCODEFORMAT_SHIFTJIS 等 ) )( UNICODE版では無効 )

proc Get_wchar_t_CharCodeFormat*(): cint
##  wchar_t型の文字コード形式を取得する( 戻り値： DX_CHARCODEFORMAT_UTF16LE など )
##  文字列関係

proc strcpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR)
##  strcpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR)
##  strcpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy、Pos はコピー開始位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy_s、Pos はコピー開始位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy、Pos はコピー開始位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpcpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint)
##  位置指定付き strcpy_s、Pos はコピー開始位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s の Num が文字数( 全角文字も 1 扱い )になったもの、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s の文字列の終端からの文字数指定版( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Num: cint)
##  strncpy の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrncpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Num: cint)
##  strncpy_s の文字列の終端からの文字数( 全角文字も 1 扱い )指定版、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpyDx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint; Num: cint)
##  strncpy のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint;
                  Num: cint)
##  strncpy_s のコピー開始位置指定版、Pos はコピー開始位置、Num は文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy2Dx*(Dest: ptr TCHAR; Src: ptr TCHAR; Pos: cint; Num: cint)
##  strncpy のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncpy2_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR; Pos: cint;
                   Num: cint)
##  strncpy_s のコピー開始位置指定版、Pos はコピー開始位置( 全角文字も 1 扱い )、Num は文字数( 全角文字も 1 扱い )、終端に必ずヌル文字が代入される( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcatDx*(Dest: ptr TCHAR; Src: ptr TCHAR)
##  strcat と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcat_sDx*(Dest: ptr TCHAR; DestBytes: csize_t; Src: ptr TCHAR)
##  strcat_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strlenDx*(Str: ptr TCHAR): csize_t
##  strlen と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strlen2Dx*(Str: ptr TCHAR): csize_t
##  strlen の戻り値が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strcmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  strcmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc stricmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  stricmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Num: cint): cint
##  strncmp と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strncmp2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Num: cint): cint
##  strncmp の Num が文字数( 全角文字も 1 扱い )になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncmpDx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Pos: cint; Num: cint): cint
##  strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置、Num が文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpncmp2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR; Pos: cint; Num: cint): cint
##  strncmp の比較開始位置指定版、Pos が Str1 の比較開始位置( 全角文字も 1 扱い )、Num が文字数( 全角文字も 1 扱い )( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strgetchrDx*(Str: ptr TCHAR; Pos: cint; CharNums: ptr cint = nil): DWORD
##  文字列の指定の位置の文字コードを取得する、Pos は取得する位置、CharNums は文字数を代入する変数のアドレス、戻り値は文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strgetchr2Dx*(Str: ptr TCHAR; Pos: cint; CharNums: ptr cint = nil): DWORD
##  文字列の指定の位置の文字コードを取得する、Pos は取得する位置( 全角文字も 1 扱い )、CharNums は文字数を代入する変数のアドレス、戻り値は文字コード( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strputchrDx*(Str: ptr TCHAR; Pos: cint; CharCode: DWORD): cint
##  文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置、CharCode は文字コード、戻り値は書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strputchr2Dx*(Str: ptr TCHAR; Pos: cint; CharCode: DWORD): cint
##  文字列の指定の位置に文字コードを書き込む、Pos は書き込む位置( 全角文字も 1 扱い )、CharCode は文字コード、戻り値は書き込んだ文字数( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strposDx*(Str: ptr TCHAR; Pos: cint): ptr TCHAR
##  文字列の指定の位置のアドレスを取得する、Pos は取得する位置　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strpos2Dx*(Str: ptr TCHAR; Pos: cint): ptr TCHAR
##  文字列の指定の位置のアドレスを取得する、Pos は取得する位置( 全角文字も 1 扱い )　( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strstrDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): ptr TCHAR
##  strstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strstr2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  strstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrstrDx*(Str1: ptr TCHAR; Str2: ptr TCHAR): ptr TCHAR
##  strrstr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrstr2Dx*(Str1: ptr TCHAR; Str2: ptr TCHAR): cint
##  strrstr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strchrDx*(Str: ptr TCHAR; CharCode: DWORD): ptr TCHAR
##  strchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strchr2Dx*(Str: ptr TCHAR; CharCode: DWORD): cint
##  strchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrchrDx*(Str: ptr TCHAR; CharCode: DWORD): ptr TCHAR
##  strrchr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc strrchr2Dx*(Str: ptr TCHAR; CharCode: DWORD): cint
##  strrchr の戻り値が文字列先頭からの文字数( 全角文字も 1 扱い ) になったもの( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc struprDx*(Str: ptr TCHAR): ptr TCHAR
##  strupr と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsprintfDx*(Buffer: ptr TCHAR; FormatString: ptr TCHAR; Arg: va_list): cint
##  vsprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsnprintfDx*(Buffer: ptr TCHAR; BufferSize: csize_t; FormatString: ptr TCHAR;
                 Arg: va_list): cint
##  vsnprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc sprintfDx*(Buffer: ptr TCHAR; FormatString: ptr TCHAR): cint {.varargs.}
##  sprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc snprintfDx*(Buffer: ptr TCHAR; BufferSize: csize_t; FormatString: ptr TCHAR): cint {.
    varargs.}
##  snprintf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc itoaDx*(Value: cint; Buffer: ptr TCHAR; Radix: cint): ptr TCHAR
##  itoa と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc itoa_sDx*(Value: cint; Buffer: ptr TCHAR; BufferBytes: csize_t; Radix: cint): ptr TCHAR
##  itoa_s と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc atoiDx*(Str: ptr TCHAR): cint
##  atoi と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc atofDx*(Str: ptr TCHAR): cdouble
##  atof と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc vsscanfDx*(String: ptr TCHAR; FormatString: ptr TCHAR; Arg: va_list): cint
##  vsscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )

proc sscanfDx*(String: ptr TCHAR; FormatString: ptr TCHAR): cint {.varargs.}
##  sscanf と同等の機能( マルチバイト文字列版では文字コード形式として SetUseCharCodeFormat で設定した形式が使用されます )
##  DxNetwork.cpp関数プロトタイプ宣言
##  通信関係

proc ProcessNetMessage*(RunReleaseProcess: cint = FALSE): cint
##  通信メッセージの処理をする関数

proc GetHostIPbyName*(HostName: ptr TCHAR; IPDataBuf: ptr IPDATA;
                     IPDataBufLength: cint = 1; IPDataGetNum: ptr cint = nil): cint
##  ＤＮＳサーバーを使ってホスト名からＩＰアドレスを取得する( IPv4版 )

proc GetHostIPbyNameWithStrLen*(HostName: ptr TCHAR; HostNameLength: csize_t;
                               IPDataBuf: ptr IPDATA; IPDataBufLength: cint = 1;
                               IPDataGetNum: ptr cint = nil): cint
##  ＤＮＳサーバーを使ってホスト名からＩＰアドレスを取得する( IPv4版 )

proc GetHostIPbyName_IPv6*(HostName: ptr TCHAR; IPDataBuf: ptr IPDATA_IPv6;
                          IPDataBufLength: cint = 1; IPDataGetNum: ptr cint = nil): cint
##  ＤＮＳサーバーを使ってホスト名からＩＰアドレスを取得する( IPv6版 )

proc GetHostIPbyName_IPv6WithStrLen*(HostName: ptr TCHAR; HostNameLength: csize_t;
                                    IPDataBuf: ptr IPDATA_IPv6;
                                    IPDataBufLength: cint = 1;
                                    IPDataGetNum: ptr cint = nil): cint
##  ＤＮＳサーバーを使ってホスト名からＩＰアドレスを取得する( IPv6版 )

proc ConnectNetWork*(IPData: IPDATA; Port: cint = -1): cint
##  他マシンに接続する( IPv4版 )

proc ConnectNetWork_IPv6*(IPData: IPDATA_IPv6; Port: cint = -1): cint
##  他マシンに接続する( IPv6版 )

proc ConnectNetWork_ASync*(IPData: IPDATA; Port: cint = -1): cint
##  他マシンに接続する( IPv4版 )、非同期版

proc ConnectNetWork_IPv6_ASync*(IPData: IPDATA_IPv6; Port: cint = -1): cint
##  他マシンに接続する( IPv6版 )、非同期版

proc PreparationListenNetWork*(Port: cint = -1): cint
##  接続を受けられる状態にする( IPv4版 )

proc PreparationListenNetWork_IPv6*(Port: cint = -1): cint
##  接続を受けられる状態にする( IPv6版 )

proc StopListenNetWork*(): cint
##  接続を受けつけ状態の解除

proc CloseNetWork*(NetHandle: cint): cint
##  接続を終了する

proc GetNetWorkAcceptState*(NetHandle: cint): cint
##  接続状態を取得する

proc GetNetWorkDataLength*(NetHandle: cint): cint
##  受信データの量を得る

proc GetNetWorkSendDataLength*(NetHandle: cint): cint
##  未送信のデータの量を得る

proc GetNewAcceptNetWork*(): cint
##  新たに接続した通信回線を得る

proc GetLostNetWork*(): cint
##  接続を切断された通信回線を得る

proc GetNetWorkIP*(NetHandle: cint; IpBuf: ptr IPDATA): cint
##  接続先のＩＰを得る( IPv4版 )

proc GetNetWorkIP_IPv6*(NetHandle: cint; IpBuf: ptr IPDATA_IPv6): cint
##  接続先のＩＰを得る( IPv6版 )

proc GetMyIPAddress*(IpBuf: ptr IPDATA; IpBufLength: cint = 1; IpNum: ptr cint = nil): cint
##  自分のIPv4を得る

proc GetMyIPAddress_IPv6*(IpBuf: ptr IPDATA_IPv6; IpBufLength: cint = 1;
                         IpNum: ptr cint = nil): cint
##  自分のIPv6を得る

proc SetConnectTimeOutWait*(Time: cint): cint
##  接続のタイムアウトまでの時間を設定する

proc SetUseDXNetWorkProtocol*(Flag: cint): cint
##  ＤＸライブラリの通信形態を使うかどうかをセットする

proc GetUseDXNetWorkProtocol*(): cint
##  ＤＸライブラリの通信形態を使うかどうかを取得する

proc SetUseDXProtocol*(Flag: cint): cint
##  SetUseDXNetWorkProtocol の別名

proc GetUseDXProtocol*(): cint
##  GetUseDXNetWorkProtocol の別名

proc SetNetWorkCloseAfterLostFlag*(Flag: cint): cint
##  接続が切断された直後に接続ハンドルを解放するかどうかのフラグをセットする

proc GetNetWorkCloseAfterLostFlag*(): cint
##  接続が切断された直後に接続ハンドルを解放するかどうかのフラグを取得する
## extern	int			SetProxySetting( int UseFlag, const char *Address, int Port ) ;														// ＨＴＴＰ通信で使用するプロキシ設定を行う
## extern	int			GetProxySetting( int *UseFlagBuffer, char *AddressBuffer, int *PortBuffer ) ;										// ＨＴＴＰ通信で使用するプロキシ設定を取得する
## extern	int			SetIEProxySetting( void ) ;																							// ＩＥのプロキシ設定を適応する

proc NetWorkRecv*(NetHandle: cint; Buffer: pointer; Length: cint): cint
##  受信したデータを読み込む

proc NetWorkRecvToPeek*(NetHandle: cint; Buffer: pointer; Length: cint): cint
##  受信したデータを読み込む、読み込んだデータはバッファから削除されない

proc NetWorkRecvBufferClear*(NetHandle: cint): cint
##  受信したデータをクリアする

proc NetWorkSend*(NetHandle: cint; Buffer: pointer; Length: cint): cint
##  データを送信する

proc MakeUDPSocket*(RecvPort: cint = -1): cint
##  UDPを使用した通信を行うソケットハンドルを作成する( RecvPort を -1 にすると送信専用のソケットハンドルになります )

proc MakeUDPSocket_IPv6*(RecvPort: cint = -1): cint
##  UDPを使用した通信を行うソケットハンドルを作成する( RecvPort を -1 にすると送信専用のソケットハンドルになります )( IPv6版 )

proc DeleteUDPSocket*(NetUDPHandle: cint): cint
##  UDPを使用した通信を行うソケットハンドルを削除する

proc NetWorkSendUDP*(NetUDPHandle: cint; SendIP: IPDATA; SendPort: cint;
                    Buffer: pointer; Length: cint): cint
##  UDPを使用した通信で指定のＩＰにデータを送信する、Length は最大65507、SendPort を -1 にすると MakeUDPSocket に RecvPort で渡したポートが使用されます( 戻り値  0以上;送信できたデータサイズ  -1:エラー  -2:送信データが大きすぎる  -3:送信準備ができていない  )

proc NetWorkSendUDP_IPv6*(NetUDPHandle: cint; SendIP: IPDATA_IPv6; SendPort: cint;
                         Buffer: pointer; Length: cint): cint
##  UDPを使用した通信で指定のＩＰにデータを送信する、Length は最大65507、SendPort を -1 にすると MakeUDPSocket に RecvPort で渡したポートが使用されます( 戻り値  0以上;送信できたデータサイズ  -1:エラー  -2:送信データが大きすぎる  -3:送信準備ができていない  )( IPv6版 )

proc NetWorkRecvUDP*(NetUDPHandle: cint; RecvIP: ptr IPDATA; RecvPort: ptr cint;
                    Buffer: pointer; Length: cint; Peek: cint): cint
##  UDPを使用した通信でデータを受信する、Peek に TRUE を渡すと受信に成功してもデータを受信キューから削除しません( 戻り値  0以上:受信したデータのサイズ  -1:エラー  -2:バッファのサイズが足りない  -3:受信データがない )

proc NetWorkRecvUDP_IPv6*(NetUDPHandle: cint; RecvIP: ptr IPDATA_IPv6;
                         RecvPort: ptr cint; Buffer: pointer; Length: cint; Peek: cint): cint
##  UDPを使用した通信でデータを受信する、Peek に TRUE を渡すと受信に成功してもデータを受信キューから削除しません( 戻り値  0以上:受信したデータのサイズ  -1:エラー  -2:バッファのサイズが足りない  -3:受信データがない )( IPv6版 )
## extern int		CheckNetWorkSendUDP(	int NetUDPHandle ) ;																			// UDPを使用した通信でデータが送信できる状態かどうかを調べる( 戻り値  -1:エラー  TRUE:送信可能  FALSE:送信不可能 )

proc CheckNetWorkRecvUDP*(NetUDPHandle: cint): cint
##  UDPを使用した通信で新たな受信データが存在するかどうかを調べる( 戻り値  -1:エラー  TRUE:受信データあり  FALSE:受信データなし )
## 	使用不可
## extern	int			HTTP_FileDownload(			const char *FileURL, const char *SavePath  = NULL  , void **SaveBufferP  = NULL  , int *FileSize  = NULL  , char **ParamList  = NULL  ) ;						// HTTP を使用してネットワーク上のファイルをダウンロードする
## extern	int			HTTP_GetFileSize(			const char *FileURL ) ;																		// HTTP を使用してネットワーク上のファイルのサイズを得る
##
## extern	int			HTTP_StartFileDownload(		const char *FileURL, const char *SavePath, void **SaveBufferP  = NULL  , char **ParamList  = NULL  ) ;	// HTTP を使用したネットワーク上のファイルをダウンロードする処理を開始する
## extern	int			HTTP_StartGetFileSize(		const char *FileURL ) ;																		// HTTP を使用したネットワーク上のファイルのサイズを得る処理を開始する
## extern	int			HTTP_Close(					int HttpHandle ) ;																			// HTTP の処理を終了し、ハンドルを解放する
## extern	int			HTTP_CloseAll(				void ) ;																					// 全てのハンドルに対して HTTP_Close を行う
## extern	int			HTTP_GetState(				int HttpHandle ) ;																			// HTTP 処理の現在の状態を得る( NET_RES_COMPLETE 等 )
## extern	int			HTTP_GetError(				int HttpHandle ) ;																			// HTTP 処理でエラーが発生した場合、エラーの内容を得る( HTTP_ERR_NONE 等 )
## extern	int			HTTP_GetDownloadFileSize(	int HttpHandle ) ;																			// HTTP 処理で対象となっているファイルのサイズを得る( 戻り値: -1 = エラー・若しくはまだファイルのサイズを取得していない  0以上 = ファイルのサイズ )
## extern	int			HTTP_GetDownloadedFileSize( int HttpHandle ) ;																			// HTTP 処理で既にダウンロードしたファイルのサイズを取得する
##
## extern	int			fgetsForNetHandle(			int NetHandle, char *strbuffer ) ;															// fgets のネットワークハンドル版( -1:取得できず 0:取得できた )
## extern	int			URLAnalys(					const char *URL, char *HostBuf  = NULL  , char *PathBuf  = NULL  , char *FileNameBuf  = NULL  , int *PortBuf  = NULL  ) ;	// ＵＲＬを解析する
## extern	int			URLConvert(					char *URL, int ParamConvert  = TRUE  , int NonConvert  = FALSE  ) ;				// HTTP に渡せない記号が使われた文字列を渡せるような文字列に変換する( 戻り値: -1 = エラー  0以上 = 変換後の文字列のサイズ )
## extern	int			URLParamAnalysis(			char **ParamList, char **ParamStringP ) ;													// HTTP 用パラメータリストから一つのパラメータ文字列を作成する( 戻り値:  -1 = エラー  0以上 = パラメータの文字列の長さ )
##
##  DxInputString.cpp関数プロトタイプ宣言
##  文字コードバッファ操作関係

proc StockInputChar*(CharCode: TCHAR): cint
##  文字コードバッファに文字コードをストックする

proc ClearInputCharBuf*(): cint
##  文字コードバッファをクリアする

proc GetInputChar*(DeleteFlag: cint): TCHAR
##  文字コードバッファに溜まったデータから文字コードを一つ取得する

proc GetInputCharWait*(DeleteFlag: cint): TCHAR
##  文字コードバッファに溜まったデータから文字コードを一つ取得する、バッファになにも文字コードがない場合は文字コードがバッファに一文字分溜まるまで待つ

proc GetOneChar*(CharBuffer: ptr TCHAR; DeleteFlag: cint): cint
##  文字コードバッファに溜まったデータから１文字分取得する

proc GetOneCharWait*(CharBuffer: ptr TCHAR; DeleteFlag: cint): cint
##  文字コードバッファに溜まったデータから１文字分取得する、バッファに何も文字コードがない場合は文字コードがバッファに一文字分溜まるまで待つ

proc GetCtrlCodeCmp*(Char: TCHAR): cint
##  指定の文字コードがアスキーコントロールコードか調べる

proc DrawIMEInputString*(x: cint; y: cint; SelectStringNum: cint;
                        DrawCandidateList: cint = TRUE): cint
##  画面上に入力中の文字列を描画する

proc DrawIMEInputExtendString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              SelectStringNum: cint;
                              DrawCandidateList: cint = TRUE): cint
##  画面上に入力中の文字列を描画する( 拡大率付き )

proc SetUseIMEFlag*(UseFlag: cint): cint
##  ＩＭＥを使用するかどうかを設定する

proc GetUseIMEFlag*(): cint
##  ＩＭＥを使用するかどうかの設定を取得する

proc SetInputStringMaxLengthIMESync*(Flag: cint): cint
##  ＩＭＥで入力できる最大文字数を MakeKeyInput の設定に合わせるかどうかをセットする( TRUE:あわせる  FALSE:あわせない(デフォルト) )

proc SetIMEInputStringMaxLength*(Length: cint): cint
##  ＩＭＥで一度に入力できる最大文字数を設定する( 0:制限なし  1以上:指定の文字数で制限 )

proc GetStringPoint*(String: ptr TCHAR; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の文字数での半角文字数を得る

proc GetStringPointWithStrLen*(String: ptr TCHAR; StringLength: csize_t; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の文字数での半角文字数を得る

proc GetStringPoint2*(String: ptr TCHAR; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の半角文字数での文字数を得る

proc GetStringPoint2WithStrLen*(String: ptr TCHAR; StringLength: csize_t; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の半角文字数での文字数を得る

proc GetStringLength*(String: ptr TCHAR): cint
##  全角文字、半角文字入り乱れる中から文字数を取得する

proc DrawObtainsString*(x: cint; y: cint; AddY: cint; String: ptr TCHAR; StrColor: cuint;
                       StrEdgeColor: cuint = 0; FontHandle: cint = -1;
                       SelectBackColor: cuint = 0xffffffff;
                       SelectStrColor: cuint = 0;
                       SelectStrEdgeColor: cuint = 0xffffffff;
                       SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画

proc DrawObtainsNString*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                        StringLength: csize_t; StrColor: cuint;
                        StrEdgeColor: cuint = 0; FontHandle: cint = -1;
                        SelectBackColor: cuint = 0xffffffff;
                        SelectStrColor: cuint = 0;
                        SelectStrEdgeColor: cuint = 0xffffffff;
                        SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画

proc DrawObtainsString_CharClip*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                                StrColor: cuint; StrEdgeColor: cuint = 0;
                                FontHandle: cint = -1;
                                SelectBackColor: cuint = 0xffffffff'u32;
                                SelectStrColor: cuint = 0;
                                SelectStrEdgeColor: cuint = 0xffffffff;
                                SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画( クリップが文字単位 )

proc DrawObtainsNString_CharClip*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                                 StringLength: csize_t; StrColor: cuint;
                                 StrEdgeColor: cuint = 0; FontHandle: cint = -1;
                                 SelectBackColor: cuint = 0xffffffff;
                                 SelectStrColor: cuint = 0;
                                 SelectStrEdgeColor: cuint = 0xffffffff;
                                 SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画( クリップが文字単位 )

proc GetObtainsStringCharPosition*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                                  StrLen: cint; PosX: ptr cint; PosY: ptr cint;
                                  FontHandle: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画した場合の文字列の末端の座標を取得する

proc GetObtainsStringCharPosition_CharClip*(x: cint; y: cint; AddY: cint;
    String: ptr TCHAR; StrLen: cint; PosX: ptr cint; PosY: ptr cint; FontHandle: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画した場合の文字列の末端の座標を取得する( クリップが文字単位 )

proc DrawObtainsBox*(x1: cint; y1: cint; x2: cint; y2: cint; AddY: cint; Color: cuint;
                    FillFlag: cint): cint
##  描画可能領域に収まるように補正を加えながら矩形を描画

proc InputStringToCustom*(x: cint; y: cint; BufLength: csize_t; StrBuffer: ptr TCHAR;
                         CancelValidFlag: cint; SingleCharOnlyFlag: cint;
                         NumCharOnlyFlag: cint; DoubleCharOnlyFlag: cint = FALSE;
                         EnableNewLineFlag: cint = FALSE;
                         DisplayCandidateList: cint = TRUE): cint
##  文字列の入力取得

proc KeyInputString*(x: cint; y: cint; CharMaxLength: csize_t; StrBuffer: ptr TCHAR;
                    CancelValidFlag: cint): cint
##  文字列の入力取得

proc KeyInputSingleCharString*(x: cint; y: cint; CharMaxLength: csize_t;
                              StrBuffer: ptr TCHAR; CancelValidFlag: cint): cint
##  半角文字列のみの入力取得

proc KeyInputNumber*(x: cint; y: cint; MaxNum: cint; MinNum: cint; CancelValidFlag: cint): cint
##  数値の入力取得

proc GetIMEInputModeStr*(GetBuffer: ptr TCHAR): cint
##  IMEの入力モード文字列を取得する

proc GetIMEInputData*(): ptr IMEINPUTDATA
##  IMEで入力中の文字列の情報を取得する

proc SetIMEInputString*(String: ptr TCHAR): cint
##  IMEで入力中の文字列を変更する( IMEで文字列を入力中ではなかった場合は何も起こりません )

proc SetIMEInputStringWithStrLen*(String: ptr TCHAR; StringLength: csize_t): cint
##  IMEで入力中の文字列を変更する( IMEで文字列を入力中ではなかった場合は何も起こりません )

proc SetKeyInputStringColor*(NmlStr: ULONGLONG; NmlCur: ULONGLONG;
                            IMEStrBack: ULONGLONG; IMECur: ULONGLONG;
                            IMELine: ULONGLONG; IMESelectStr: ULONGLONG;
                            IMEModeStr: ULONGLONG; NmlStrE: ULONGLONG = 0;
                            IMESelectStrE: ULONGLONG = 0;
                            IMEModeStrE: ULONGLONG = 0; IMESelectWinE: ULONGLONG = ULL_PARAM(
    0xffffffffffffffff'u); IMESelectWinF: ULONGLONG = ULL_PARAM(0xffffffffffffffff'u);
    SelectStrBackColor: ULONGLONG = ULL_PARAM(0xffffffffffffffff'u); SelectStrColor: ULONGLONG = ULL_PARAM(
    0xffffffffffffffff'u); SelectStrEdgeColor: ULONGLONG = ULL_PARAM(
    0xffffffffffffffff'u); IMEStr: ULONGLONG = ULL_PARAM(0xffffffffffffffff'u);
    IMEStrE: ULONGLONG = ULL_PARAM(0xffffffffffffffff'u)): cint
##  ( SetKeyInputStringColor2 の旧関数 )InputString関数使用時の文字の各色を変更する

proc SetKeyInputStringColor2*(TargetColor: cint; ##  DX_KEYINPSTRCOLOR_NORMAL_STR 等
                             Color: cuint): cint
##  InputString関数使用時の文字の各色を変更する

proc ResetKeyInputStringColor2*(TargetColor: cint): cint
  ##  DX_KEYINPSTRCOLOR_NORMAL_STR 等
##  SetKeyInputStringColor2 で設定した色をデフォルトに戻す

proc SetKeyInputStringFont*(FontHandle: cint): cint
##  キー入力文字列描画関連で使用するフォントのハンドルを変更する(-1でデフォルトのフォントハンドル)

proc SetKeyInputStringEndCharaMode*(EndCharaMode: cint): cint
  ##  DX_KEYINPSTR_ENDCHARAMODE_OVERWRITE 等
##  キー入力文字列処理の入力文字数が限界に達している状態で、文字列の末端部分で入力が行われた場合の処理モードを変更する

proc DrawKeyInputModeString*(x: cint; y: cint): cint
##  入力モード文字列を描画する

proc InitKeyInput*(): cint
##  キー入力データ初期化

proc MakeKeyInput*(MaxStrLength: csize_t; CancelValidFlag: cint;
                  SingleCharOnlyFlag: cint; NumCharOnlyFlag: cint;
                  DoubleCharOnlyFlag: cint = FALSE; EnableNewLineFlag: cint = FALSE): cint
##  新しいキー入力ハンドルの作成

proc DeleteKeyInput*(InputHandle: cint): cint
##  キー入力ハンドルの削除

proc SetActiveKeyInput*(InputHandle: cint): cint
##  指定のキー入力ハンドルをアクティブにする( -1 を指定するとアクティブなキー入力ハンドルが無い状態になります )

proc GetActiveKeyInput*(): cint
##  現在アクティブになっているキー入力ハンドルを取得する

proc CheckKeyInput*(InputHandle: cint): cint
##  キー入力ハンドルの入力が終了しているか取得する

proc ReStartKeyInput*(InputHandle: cint): cint
##  入力が完了したキー入力ハンドルを再度編集状態に戻す

proc ProcessActKeyInput*(): cint
##  キー入力ハンドル処理関数

proc DrawKeyInputString*(x: cint; y: cint; InputHandle: cint;
                        DrawCandidateList: cint = TRUE): cint
##  キー入力ハンドルの入力中情報の描画

proc DrawKeyInputExtendString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              InputHandle: cint; DrawCandidateList: cint = TRUE): cint
##  キー入力ハンドルの入力中情報の描画( 拡大率指定付き )

proc SetKeyInputDrawArea*(x1: cint; y1: cint; x2: cint; y2: cint; InputHandle: cint): cint
##  キー入力ハンドルの入力中文字列を描画する際の描画範囲を設定する

proc SetKeyInputSelectArea*(SelectStart: cint; SelectEnd: cint; InputHandle: cint): cint
##  キー入力ハンドルの指定の領域を選択状態にする( SelectStart と SelectEnd に -1 を指定すると選択状態が解除されます )

proc GetKeyInputSelectArea*(SelectStart: ptr cint; SelectEnd: ptr cint;
                           InputHandle: cint): cint
##  キー入力ハンドルの選択領域を取得する

proc SetKeyInputDrawStartPos*(DrawStartPos: cint; InputHandle: cint): cint
##  キー入力ハンドルの描画開始文字位置を設定する

proc GetKeyInputDrawStartPos*(InputHandle: cint): cint
##  キー入力ハンドルの描画開始文字位置を取得する

proc SetKeyInputCursorBrinkTime*(Time: cint): cint
##  キー入力ハンドルのキー入力時のカーソルの点滅する早さをセットする

proc SetKeyInputCursorBrinkFlag*(Flag: cint): cint
##  キー入力ハンドルのキー入力時のカーソルを点滅させるかどうかをセットする

proc SetKeyInputString*(String: ptr TCHAR; InputHandle: cint): cint
##  キー入力ハンドルに指定の文字列をセットする

proc SetKeyInputStringWithStrLen*(String: ptr TCHAR; StringLength: csize_t;
                                 InputHandle: cint): cint
##  キー入力ハンドルに指定の文字列をセットする

proc SetKeyInputNumber*(Number: cint; InputHandle: cint): cint
##  キー入力ハンドルに指定の数値を文字に置き換えてセットする

proc SetKeyInputNumberToFloat*(Number: cfloat; InputHandle: cint): cint
##  キー入力ハンドルに指定の浮動小数点値を文字に置き換えてセットする

proc GetKeyInputString*(StrBuffer: ptr TCHAR; InputHandle: cint): cint
##  キー入力ハンドルの入力中の文字列を取得する

proc GetKeyInputNumber*(InputHandle: cint): cint
##  キー入力ハンドルの入力中の文字列を整数値として取得する

proc GetKeyInputNumberToFloat*(InputHandle: cint): cfloat
##  キー入力ハンドルの入力中の文字列を浮動小数点値として取得する

proc SetKeyInputCursorPosition*(Position: cint; InputHandle: cint): cint
##  キー入力ハンドルの現在のカーソル位置を設定する

proc GetKeyInputCursorPosition*(InputHandle: cint): cint
##  キー入力ハンドルの現在のカーソル位置を取得する
##  DxFile.cpp関数プロトタイプ宣言
##  ファイルアクセス関数

proc FileRead_open*(FilePath: ptr TCHAR; ASync: cint = FALSE): cint
##  ファイルを開く

proc FileRead_open_WithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                              ASync: cint = FALSE): cint
##  ファイルを開く

proc FileRead_open_mem*(FileImage: pointer; FileImageSize: csize_t): cint
##  メモリに展開されたファイルを開く

proc FileRead_size*(FilePath: ptr TCHAR): LONGLONG
##  ファイルのサイズを取得する

proc FileRead_size_WithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t): LONGLONG
##  ファイルのサイズを取得する

proc FileRead_size_handle*(FileHandle: cint): LONGLONG
##  ファイルのサイズを取得する( ファイルハンドル使用版 )

proc FileRead_close*(FileHandle: cint): cint
##  ファイルを閉じる

proc FileRead_tell*(FileHandle: cint): LONGLONG
##  ファイルポインタの読み込み位置を取得する

proc FileRead_seek*(FileHandle: cint; Offset: LONGLONG; Origin: cint): cint
##  ファイルポインタの読み込み位置を変更する

proc FileRead_read*(Buffer: pointer; ReadSize: cint; FileHandle: cint): cint
##  ファイルからデータを読み込む

proc FileRead_idle_chk*(FileHandle: cint): cint
##  ファイル読み込みが完了しているかどうかを取得する

proc FileRead_eof*(FileHandle: cint): cint
##  ファイルの読み込み位置が終端に達しているかどうかを取得する

proc FileRead_set_format*(FileHandle: cint; CharCodeFormat: cint): cint
  ##  DX_CHARCODEFORMAT_SHIFTJIS 等
##  ファイルの文字コード形式を設定する( テキストファイル用 )

proc FileRead_gets*(Buffer: ptr TCHAR; BufferSize: cint; FileHandle: cint): cint
##  ファイルから文字列を読み出す

proc FileRead_getc*(FileHandle: cint): TCHAR
##  ファイルから一文字読み出す

proc FileRead_scanf*(FileHandle: cint; Format: ptr TCHAR): cint {.varargs.}
##  ファイルから書式化されたデータを読み出す

proc FileRead_createInfo*(ObjectPath: ptr TCHAR): DWORD_PTR
##  ファイル情報ハンドルを作成する( 戻り値  -1:エラー  -1以外:ファイル情報ハンドル )

proc FileRead_createInfo_WithStrLen*(ObjectPath: ptr TCHAR;
                                    ObjectPathLength: csize_t): DWORD_PTR
##  ファイル情報ハンドルを作成する( 戻り値  -1:エラー  -1以外:ファイル情報ハンドル )

proc FileRead_getInfoNum*(FileInfoHandle: DWORD_PTR): cint
##  ファイル情報ハンドル中のファイルの数を取得する

proc FileRead_getInfo*(Index: cint; Buffer: ptr FILEINFO; FileInfoHandle: DWORD_PTR): cint
##  ファイル情報ハンドル中のファイルの情報を取得する

proc FileRead_deleteInfo*(FileInfoHandle: DWORD_PTR): cint
##  ファイル情報ハンドルを削除する

proc FileRead_findFirst*(FilePath: ptr TCHAR; Buffer: ptr FILEINFO): DWORD_PTR
##  指定のファイル又はフォルダの情報を取得し、ファイル検索ハンドルも作成する( 戻り値: -1=エラー  -1以外=ファイル検索ハンドル )

proc FileRead_findFirst_WithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                   Buffer: ptr FILEINFO): DWORD_PTR
##  指定のファイル又はフォルダの情報を取得し、ファイル検索ハンドルも作成する( 戻り値: -1=エラー  -1以外=ファイル検索ハンドル )

proc FileRead_findNext*(FindHandle: DWORD_PTR; Buffer: ptr FILEINFO): cint
##  条件の合致する次のファイルの情報を取得する( 戻り値: -1=エラー  0=成功 )

proc FileRead_findClose*(FindHandle: DWORD_PTR): cint
##  ファイル検索ハンドルを閉じる( 戻り値: -1=エラー  0=成功 )

proc FileRead_fullyLoad*(FilePath: ptr TCHAR): cint
##  指定のファイルの内容を全てメモリに読み込み、その情報のアクセスに必要なハンドルを返す( 戻り値  -1:エラー  -1以外:ハンドル )、使い終わったらハンドルは FileRead_fullyLoad_delete で削除する必要があります

proc FileRead_fullyLoad_WithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  指定のファイルの内容を全てメモリに読み込み、その情報のアクセスに必要なハンドルを返す( 戻り値  -1:エラー  -1以外:ハンドル )、使い終わったらハンドルは FileRead_fullyLoad_delete で削除する必要があります

proc FileRead_fullyLoad_delete*(FLoadHandle: cint): cint
##  FileRead_fullyLoad で読み込んだファイルのハンドルを削除する

proc FileRead_fullyLoad_getImage*(FLoadHandle: cint): pointer
##  FileRead_fullyLoad で読み込んだファイルの内容を格納したメモリアドレスを取得する

proc FileRead_fullyLoad_getSize*(FLoadHandle: cint): LONGLONG
##  FileRead_fullyLoad で読み込んだファイルのサイズを取得する
##  設定関係関数

proc GetStreamFunctionDefault*(): cint
##  ＤＸライブラリでストリームデータアクセスに使用する関数がデフォルトのものか調べる( TRUE:デフォルトのもの  FALSE:デフォルトではない )

proc ChangeStreamFunction*(StreamThread: ptr STREAMDATASHREDTYPE2): cint
##  ＤＸライブラリでストリームデータアクセスに使用する関数を変更する

proc ChangeStreamFunctionW*(StreamThreadW: ptr STREAMDATASHREDTYPE2W): cint
##  ＤＸライブラリでストリームデータアクセスに使用する関数を変更する( wchar_t 使用版 )
##  補助関係関数

proc ConvertFullPath*(Src: ptr TCHAR; Dest: ptr TCHAR; CurrentDir: ptr TCHAR = nil): cint
##  フルパスではないパス文字列をフルパスに変換する( CurrentDir はフルパスである必要がある(語尾に『\』があっても無くても良い) )( CurrentDir が NULL の場合は現在のカレントディレクトリを使用する )

proc ConvertFullPathWithStrLen*(Src: ptr TCHAR; SrcLength: csize_t; Dest: ptr TCHAR;
                               CurrentDir: ptr TCHAR = nil;
                               CurrentDirLength: csize_t = 0): cint
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

proc DeleteGraph*(GrHandle: cint; LogOutFlag: cint = FALSE): cint
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

proc InitGraph*(LogOutFlag: cint = FALSE): cint
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

proc LoadBmpToGraph*(FileName: ptr TCHAR; TextureFlag: cint; ReverseFlag: cint;
                    SurfaceMode: cint = DX_MOVIESURFACE_NORMAL): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadBmpToGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                              TextureFlag: cint; ReverseFlag: cint;
                              SurfaceMode: cint = DX_MOVIESURFACE_NORMAL): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadGraph*(FileName: ptr TCHAR; NotUse3DFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                         NotUse3DFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルを作成する

proc LoadReverseGraph*(FileName: ptr TCHAR; NotUse3DFlag: cint = FALSE): cint
##  画像ファイルを反転したものでグラフィックハンドルを作成する

proc LoadReverseGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                NotUse3DFlag: cint = FALSE): cint
##  画像ファイルを反転したものでグラフィックハンドルを作成する

proc LoadDivGraph*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                  YSize: cint; HandleArray: ptr cint; NotUse3DFlag: cint = FALSE;
                  XStride: cint = 0; YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                            AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                            YSize: cint; HandleArray: ptr cint;
                            NotUse3DFlag: cint = FALSE; XStride: cint = 0;
                            YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivGraphF*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                   XSize: cfloat; YSize: cfloat; HandleArray: ptr cint;
                   NotUse3DFlag: cint = FALSE; XStride: cfloat = 0; YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivGraphFWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                             AllNum: cint; XNum: cint; YNum: cint; XSize: cfloat;
                             YSize: cfloat; HandleArray: ptr cint;
                             NotUse3DFlag: cint = FALSE; XStride: cfloat = 0;
                             YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraph*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                       SizeX: cint; SizeY: cint; HandleArray: ptr cint;
                       TextureFlag: cint; ReverseFlag: cint; XStride: cint = 0;
                       YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                 AllNum: cint; XNum: cint; YNum: cint; SizeX: cint;
                                 SizeY: cint; HandleArray: ptr cint;
                                 TextureFlag: cint; ReverseFlag: cint;
                                 XStride: cint = 0; YStride: cint = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraphF*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                        SizeX: cfloat; SizeY: cfloat; HandleArray: ptr cint;
                        TextureFlag: cint; ReverseFlag: cint; XStride: cfloat = 0;
                        YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadDivBmpToGraphFWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                  AllNum: cint; XNum: cint; YNum: cint; SizeX: cfloat;
                                  SizeY: cfloat; HandleArray: ptr cint;
                                  TextureFlag: cint; ReverseFlag: cint;
                                  XStride: cfloat = 0; YStride: cfloat = 0): cint
##  画像ファイルを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraph*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                         XSize: cint; YSize: cint; HandleArray: ptr cint;
                         NotUse3DFlag: cint = FALSE; XStride: cint = 0;
                         YStride: cint = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                   AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                                   YSize: cint; HandleArray: ptr cint;
                                   NotUse3DFlag: cint = FALSE; XStride: cint = 0;
                                   YStride: cint = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraphF*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                          XSize: cfloat; YSize: cfloat; HandleArray: ptr cint;
                          NotUse3DFlag: cint = FALSE; XStride: cfloat = 0;
                          YStride: cfloat = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadReverseDivGraphFWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                    AllNum: cint; XNum: cint; YNum: cint;
                                    XSize: cfloat; YSize: cfloat;
                                    HandleArray: ptr cint;
                                    NotUse3DFlag: cint = FALSE; XStride: cfloat = 0;
                                    YStride: cfloat = 0): cint
##  画像ファイルを反転したものを分割してグラフィックハンドルを作成する

proc LoadBlendGraph*(FileName: ptr TCHAR): cint
##  画像ファイルからブレンド用グラフィックハンドルを作成する

proc LoadBlendGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
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

proc ReloadGraph*(FileName: ptr TCHAR; GrHandle: cint; ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルへ画像データを転送する

proc ReloadGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                           GrHandle: cint; ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルへ画像データを転送する

proc ReloadDivGraph*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                    XSize: cint; YSize: cint; HandleArray: ptr cint;
                    ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する

proc ReloadDivGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                              AllNum: cint; XNum: cint; YNum: cint; XSize: cint;
                              YSize: cint; HandleArray: ptr cint;
                              ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する

proc ReloadDivGraphF*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                     XSize: cfloat; YSize: cfloat; HandleArray: ptr cint;
                     ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する( float版 )

proc ReloadDivGraphFWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                               AllNum: cint; XNum: cint; YNum: cint; XSize: cfloat;
                               YSize: cfloat; HandleArray: ptr cint;
                               ReverseFlag: cint = FALSE): cint
##  画像ファイルからグラフィックハンドルたちへ画像データを分割転送する( float版 )

proc ReloadReverseGraph*(FileName: ptr TCHAR; GrHandle: cint): cint
##  ReloadGraph の画像反転処理追加版

proc ReloadReverseGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                  GrHandle: cint): cint
##  ReloadGraph の画像反転処理追加版

proc ReloadReverseDivGraph*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                           XSize: cint; YSize: cint; HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版

proc ReloadReverseDivGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                     AllNum: cint; XNum: cint; YNum: cint;
                                     XSize: cint; YSize: cint; HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版

proc ReloadReverseDivGraphF*(FileName: ptr TCHAR; AllNum: cint; XNum: cint; YNum: cint;
                            XSize: cfloat; YSize: cfloat; HandleArray: ptr cint): cint
##  ReloadDivGraph の画像反転処理追加版( float版 )

proc ReloadReverseDivGraphFWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
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
##  作成するグラフィックハンドルのハンドル値を取得する、LoadDivGraph 等の分割画像読み込み用、戻り値は SetCreateDivGraphHandle の引数 HandleNum に渡した値、HandleArray を NULL にすることが可能

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

proc GetGraphFilePath*(GrHandle: cint; FilePathBuffer: ptr TCHAR): cint
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

proc DrawBox*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint; FillFlag: cint): cint
##  四角形を描画する

proc DrawBoxAA*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; Color: cuint;
               FillFlag: cint; LineThickness: cfloat = 1.0f): cint
##  四角形を描画する( アンチエイリアス付き )

proc DrawFillBox*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint): cint
##  中身を塗りつぶす四角形を描画する

proc DrawLineBox*(x1: cint; y1: cint; x2: cint; y2: cint; Color: cuint): cint
##  枠だけの四角形の描画 する

proc DrawCircle*(x: cint; y: cint; r: cint; Color: cuint; FillFlag: cint = TRUE;
                LineThickness: cint = 1): cint
##  円を描画する

proc DrawCircleAA*(x: cfloat; y: cfloat; r: cfloat; posnum: cint; Color: cuint;
                  FillFlag: cint = TRUE; LineThickness: cfloat = 1.0f): cint
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
           BoundaryColor: ULONGLONG = ULL_PARAM(0xffffffffffffffff'u)): cint
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

proc DrawCone3D*(TopPos: VECTOR; BottomPos: VECTOR; r: cfloat; DivNum: cint;
                DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの円錐を描画する

proc DrawCone3DD*(TopPos: VECTOR_D; BottomPos: VECTOR_D; r: cdouble; DivNum: cint;
                 DifColor: cuint; SpcColor: cuint; FillFlag: cint): cint
##  ３Ｄの円錐を描画する
##  画像描画関数

proc LoadGraphScreen*(x: cint; y: cint; GraphName: ptr TCHAR; TransFlag: cint): cint
##  画像ファイルを読みこんで画面に描画する

proc LoadGraphScreenWithStrLen*(x: cint; y: cint; GraphName: ptr TCHAR;
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

proc DrawExtendGraphF*(x1f: cfloat; y1f: cfloat; x2f: cfloat; y2: cfloat; GrHandle: cint;
                      TransFlag: cint): cint
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

proc DrawPolygonIndexed3DBase*(VertexArray: ptr VERTEX_3D; VertexNum: cint;
                              IndexArray: ptr cushort; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                              GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 頂点インデックスを使用 )( 旧バージョン用 )

proc DrawPolygon32bitIndexed3DBase*(VertexArray: ptr VERTEX_3D; VertexNum: cint;
                                   IndexArray: ptr cuint; IndexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                                   GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 頂点インデックスを使用 )( 旧バージョン用 )

proc DrawPolygon3DBase*(VertexArray: ptr VERTEX_3D; VertexNum: cint; PrimitiveType: cint; ##  DX_PRIMTYPE_TRIANGLELIST 等
                       GrHandle: cint; TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 旧バージョン用 )

proc DrawPolygon3D*(VertexArray: ptr VERTEX_3D; PolygonNum: cint; GrHandle: cint;
                   TransFlag: cint): cint
##  ３Ｄポリゴンを描画する( 旧バージョン用 )

proc DrawPolygon3D2*(VertexArray: ptr VERTEX_3D; PolygonNum: cint; GrHandle: cint;
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

proc SetEmulation320x240*(Flag: cint): cint
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
                    DesktopSizeY: ptr cint; IsPrimary: ptr cint): cint
##  ディスプレイのデスクトップ上での矩形位置を取得する

proc GetDisplayModeNum*(DisplayIndex: cint = 0): cint
##  変更可能なディスプレイモードの数を取得する

proc GetDisplayMode*(ModeIndex: cint; DisplayIndex: cint = 0): DISPLAYMODEDATA
##  変更可能なディスプレイモードの情報を取得する( ModeIndex は 0 ～ GetDisplayModeNum の戻り値-1 )

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

proc SaveDrawScreen*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: ptr TCHAR;
                    SaveType: cint = DX_IMAGESAVETYPE_BMP; Jpeg_Quality: cint = 80;
                    Jpeg_Sample2x1: cint = TRUE; Png_CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をファイルで保存する

proc SaveDrawScreenWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                              FileName: ptr TCHAR; FileNameLength: csize_t;
                              SaveType: cint = DX_IMAGESAVETYPE_BMP;
                              Jpeg_Quality: cint = 80; Jpeg_Sample2x1: cint = TRUE;
                              Png_CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をファイルで保存する

proc SaveDrawScreenToBMP*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: ptr TCHAR): cint
##  現在描画対象になっている画面をＢＭＰ形式で保存する

proc SaveDrawScreenToBMPWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  現在描画対象になっている画面をＢＭＰ形式で保存する

proc SaveDrawScreenToDDS*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: ptr TCHAR): cint
##  現在描画対象になっている画面をＤＤＳ形式で保存する

proc SaveDrawScreenToDDSWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  現在描画対象になっている画面をＤＤＳ形式で保存する

proc SaveDrawScreenToJPEG*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: ptr TCHAR;
                          Quality: cint = 80; Sample2x1: cint = TRUE): cint
##  現在描画対象になっている画面をＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawScreenToJPEGWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                    FileName: ptr TCHAR; FileNameLength: csize_t;
                                    Quality: cint = 80; Sample2x1: cint = TRUE): cint
##  現在描画対象になっている画面をＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawScreenToPNG*(x1: cint; y1: cint; x2: cint; y2: cint; FileName: ptr TCHAR;
                         CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveDrawScreenToPNGWithStrLen*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   FileName: ptr TCHAR; FileNameLength: csize_t;
                                   CompressionLevel: cint = -1): cint
##  現在描画対象になっている画面をＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9
##  描画対象にできるグラフィックハンドル保存関数
##  Jpeg_Quality         = 0:低画質～100:高画質
##  Png_CompressionLevel = 0:無圧縮～  9:最高圧縮

proc SaveDrawValidGraph*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                        FileName: ptr TCHAR; SaveType: cint = DX_IMAGESAVETYPE_BMP;
                        Jpeg_Quality: cint = 80; Jpeg_Sample2x1: cint = TRUE;
                        Png_CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをファイルで保存する

proc SaveDrawValidGraphWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                  y2: cint; FileName: ptr TCHAR;
                                  FileNameLength: csize_t;
                                  SaveType: cint = DX_IMAGESAVETYPE_BMP;
                                  Jpeg_Quality: cint = 80;
                                  Jpeg_Sample2x1: cint = TRUE;
                                  Png_CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをファイルで保存する

proc SaveDrawValidGraphToBMP*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                             FileName: ptr TCHAR): cint
##  描画対象にできるグラフィックハンドルをＢＭＰ形式で保存する

proc SaveDrawValidGraphToBMPWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                       y2: cint; FileName: ptr TCHAR;
                                       FileNameLength: csize_t): cint
##  描画対象にできるグラフィックハンドルをＢＭＰ形式で保存する

proc SaveDrawValidGraphToDDS*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                             FileName: ptr TCHAR): cint
##  描画対象にできるグラフィックハンドルをＤＤＳ形式で保存する

proc SaveDrawValidGraphToDDSWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                       y2: cint; FileName: ptr TCHAR;
                                       FileNameLength: csize_t): cint
##  描画対象にできるグラフィックハンドルをＤＤＳ形式で保存する

proc SaveDrawValidGraphToJPEG*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                              FileName: ptr TCHAR; Quality: cint = 80;
                              Sample2x1: cint = TRUE): cint
##  描画対象にできるグラフィックハンドルをＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawValidGraphToJPEGWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                        y2: cint; FileName: ptr TCHAR;
                                        FileNameLength: csize_t;
                                        Quality: cint = 80; Sample2x1: cint = TRUE): cint
##  描画対象にできるグラフィックハンドルをＪＰＥＧ形式で保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveDrawValidGraphToPNG*(GrHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint;
                             FileName: ptr TCHAR; CompressionLevel: cint = -1): cint
##  描画対象にできるグラフィックハンドルをＰＮＧ形式で保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveDrawValidGraphToPNGWithStrLen*(GrHandle: cint; x1: cint; y1: cint; x2: cint;
                                       y2: cint; FileName: ptr TCHAR;
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

proc LoadVertexShader*(FileName: ptr TCHAR): cint
##  頂点シェーダーバイナリをファイルから読み込み頂点シェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadVertexShaderWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  頂点シェーダーバイナリをファイルから読み込み頂点シェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadGeometryShader*(FileName: ptr TCHAR): cint
##  ジオメトリシェーダーバイナリをファイルから読み込みジオメトリシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadGeometryShaderWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  ジオメトリシェーダーバイナリをファイルから読み込みジオメトリシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadPixelShader*(FileName: ptr TCHAR): cint
##  ピクセルシェーダーバイナリをファイルから読み込みピクセルシェーダーハンドルを作成する( 戻り値 -1:エラー  -1以外:シェーダーハンドル )

proc LoadPixelShaderWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
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

proc GetConstIndexToShader*(ConstantName: ptr TCHAR; ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の番号を取得する

proc GetConstIndexToShaderWithStrLen*(ConstantName: ptr TCHAR;
                                     ConstantNameLength: csize_t;
                                     ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の番号を取得する

proc GetConstCountToShader*(ConstantName: ptr TCHAR; ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の数を取得する

proc GetConstCountToShaderWithStrLen*(ConstantName: ptr TCHAR;
                                     ConstantNameLength: csize_t;
                                     ShaderHandle: cint): cint
##  指定の名前を持つ定数が使用するシェーダー定数の数を取得する

proc GetConstDefaultParamFToShader*(ConstantName: ptr TCHAR; ShaderHandle: cint): ptr FLOAT4
##  指定の名前を持つ浮動小数点数定数のデフォルトパラメータが格納されているメモリアドレスを取得する

proc GetConstDefaultParamFToShaderWithStrLen*(ConstantName: ptr TCHAR;
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
## 		int			GraphFilter( int GrHandle, int FilterType = DX_GRAPH_FILTER_DOWN_SCALE, int DivNum = 元のサイズの何分の１か、という値( 2 , 4 , 8 の何れか ) ) ;
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
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_NORMAL ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_RGBA_SELECT_MIX, int SelectR = ( 出力の赤分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectG = ( 出力の緑成分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectB = ( 出力の青成分となる成分 DX_RGBA_SELECT_SRC_R 等 ), int SelectA = ( 出力のα成分となる成分 DX_RGBA_SELECT_SRC_R 等 ) ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MULTIPLE ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DIFFERENCE ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_ADD ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_SCREEN ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_OVERLAY ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DODGE ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_BURN ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_DARKEN ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_LIGHTEN ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_SOFTLIGHT ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_HARDLIGHT ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_EXCLUSION ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_NORMAL_ALPHACH ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_ADD_ALPHACH ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_MULTIPLE_A_ONLY ) ;
## 		int			GraphBlend( int GrHandle, int BlendGrHandle, int BlendRatio, int BlendType = DX_GRAPH_BLEND_PMA_MULTIPLE_A_ONLY ) ;
##  ムービーグラフィック関係関数

proc PlayMovie*(FileName: ptr TCHAR; ExRate: cint; PlayType: cint): cint
##  動画ファイルの再生

proc PlayMovieWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t; ExRate: cint;
                         PlayType: cint): cint
##  動画ファイルの再生

proc GetMovieImageSize_File*(FileName: ptr TCHAR; SizeX: ptr cint; SizeY: ptr cint): cint
##  動画ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetMovieImageSize_File_WithStrLen*(FileName: ptr TCHAR;
                                       FileNameLength: csize_t; SizeX: ptr cint;
                                       SizeY: ptr cint): cint
##  動画ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetMovieImageSize_Mem*(FileImage: pointer; FileImageSize: cint; SizeX: ptr cint;
                           SizeY: ptr cint): cint
##  メモリ上に展開された動画ファイルの横ピクセル数と縦ピクセル数を取得する

proc OpenMovieToGraph*(FileName: ptr TCHAR; FullColor: cint = TRUE): cint
##  動画ファイルを開く

proc OpenMovieToGraphWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
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

proc ChangeMovieVolumeToGraph*(Volume: cint; GraphHandle: cint): cint
##  動画ファイルの音量を設定する(0～255)

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
##  DxFont.cpp 関数プロトタイプ宣言
##  フォント、文字列描画関係関数

proc EnumFontName*(NameBuffer: ptr TCHAR; NameBufferNum: cint;
                  JapanOnlyFlag: cint = TRUE): cint
##  使用可能なフォントの名前を列挙する( NameBuffer に 64バイト区切りで名前が格納されます )

proc EnumFontNameEx*(NameBuffer: ptr TCHAR; NameBufferNum: cint; CharSet: cint = -1): cint
##  使用可能なフォントの名前を列挙する( NameBuffer に 64バイト区切りで名前が格納されます )( 文字セット指定版 )

proc EnumFontNameEx2*(NameBuffer: ptr TCHAR; NameBufferNum: cint;
                     EnumFontName: ptr TCHAR; CharSet: cint = -1): cint
##  指定のフォント名のフォントを列挙する

proc EnumFontNameEx2WithStrLen*(NameBuffer: ptr TCHAR; NameBufferNum: cint;
                               EnumFontName: ptr TCHAR;
                               EnumFontNameLength: csize_t; CharSet: cint = -1): cint
##  指定のフォント名のフォントを列挙する

proc CheckFontName*(FontName: ptr TCHAR; CharSet: cint = -1): cint
##  指定のフォント名のフォントが存在するかどうかをチェックする( 戻り値  TRUE:存在する  FALSE:存在しない )

proc CheckFontNameWithStrLen*(FontName: ptr TCHAR; FontNameLength: csize_t;
                             CharSet: cint = -1): cint
##  指定のフォント名のフォントが存在するかどうかをチェックする( 戻り値  TRUE:存在する  FALSE:存在しない )

proc InitFontToHandle*(): cint
##  全てのフォントハンドルを削除する

proc CreateFontToHandle*(FontName: ptr TCHAR; Size: cint; Thick: cint;
                        FontType: cint = -1; CharSet: cint = -1; EdgeSize: cint = -1;
                        Italic: cint = FALSE; Handle: cint = -1): cint
##  フォントハンドルを作成する

proc CreateFontToHandleWithStrLen*(FontName: ptr TCHAR; FontNameLength: csize_t;
                                  Size: cint; Thick: cint; FontType: cint = -1;
                                  CharSet: cint = -1; EdgeSize: cint = -1;
                                  Italic: cint = FALSE; Handle: cint = -1): cint
##  フォントハンドルを作成する

proc LoadFontDataToHandle*(FileName: ptr TCHAR; EdgeSize: cint = 0): cint
##  フォントデータファイルからフォントハンドルを作成する

proc LoadFontDataToHandleWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                    EdgeSize: cint = 0): cint
##  フォントデータファイルからフォントハンドルを作成する

proc LoadFontDataFromMemToHandle*(FontDataImage: pointer; FontDataImageSize: cint;
                                 EdgeSize: cint = 0): cint
##  メモリ上のフォントデータファイルイメージからフォントハンドルを作成する

proc SetFontSpaceToHandle*(Pixel: cint; FontHandle: cint): cint
##  フォントハンドルの字間を変更する

proc SetFontLineSpaceToHandle*(Pixel: cint; FontHandle: cint): cint
##  フォントハンドルの行間を変更する

proc SetFontCharCodeFormatToHandle*(CharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                                   FontHandle: cint): cint
##  指定のフォントハンドルを使用する関数の引数に渡す文字列の文字コード形式を設定する( UNICODE版では無効 )

proc DeleteFontToHandle*(FontHandle: cint): cint
##  フォントハンドルを削除する

proc SetFontLostFlag*(FontHandle: cint; LostFlag: ptr cint): cint
##  フォントハンドルを削除した際に TRUE を代入する変数のアドレスを設定する

proc AddFontImageToHandle*(FontHandle: cint; Char: ptr TCHAR; GrHandle: cint;
                          DrawX: cint; DrawY: cint; AddX: cint): cint
##  指定の文字の代わりに描画するグラフィックハンドルを登録する

proc AddFontImageToHandleWithStrLen*(FontHandle: cint; Char: ptr TCHAR;
                                    CharLength: csize_t; GrHandle: cint;
                                    DrawX: cint; DrawY: cint; AddX: cint): cint
##  指定の文字の代わりに描画するグラフィックハンドルを登録する

proc SubFontImageToHandle*(FontHandle: cint; Char: ptr TCHAR): cint
##  指定の文字の代わりに描画するグラフィックハンドルの登録を解除する

proc SubFontImageToHandleWithStrLen*(FontHandle: cint; Char: ptr TCHAR;
                                    CharLength: csize_t): cint
##  指定の文字の代わりに描画するグラフィックハンドルの登録を解除する

proc AddSubstitutionFontToHandle*(FontHandle: cint; SubstitutionFontHandle: cint;
                                 DrawX: cint; DrawY: cint): cint
##  代替フォントハンドル( FontHandle に無い文字を描画しようとしたときに代わりに使用されるフォントハンドル )を登録する

proc SubSubstitutionFontToHandle*(FontHandle: cint; SubstitutionFontHandle: cint): cint
##  代替フォントハンドルの登録を解除する

proc ChangeFont*(FontName: ptr TCHAR; CharSet: cint = -1): cint
##  デフォルトフォントハンドルで使用するフォントを変更

proc ChangeFontWithStrLen*(FontName: ptr TCHAR; FontNameLength: csize_t;
                          CharSet: cint = -1): cint
##  デフォルトフォントハンドルで使用するフォントを変更

proc ChangeFontFromHandle*(FontHandle: cint): cint
##  デフォルトフォントハンドルとして使用するフォントハンドルを変更する

proc ChangeFontType*(FontType: cint): cint
##  デフォルトフォントハンドルのフォントタイプの変更

proc GetFontName*(): ptr TCHAR
##  デフォルトフォントハンドルのフォント名を取得する

proc SetFontSize*(FontSize: cint): cint
##  デフォルトフォントハンドルのサイズを設定する

proc GetFontSize*(): cint
##  デフォルトフォントハンドルのサイズを取得する

proc GetFontEdgeSize*(): cint
##  デフォルトフォントハンドルの縁サイズを取得する

proc SetFontThickness*(ThickPal: cint): cint
##  デフォルトフォントハンドルの太さを設定する

proc SetFontSpace*(Pixel: cint): cint
##  デフォルトフォントハンドルの字間を変更する

proc GetFontSpace*(): cint
##  デフォルトフォントハンドルの字間を取得する

proc SetFontLineSpace*(Pixel: cint): cint
##  デフォルトフォントハンドルの行間を変更する

proc GetFontLineSpace*(): cint
##  デフォルトフォントハンドルの行間を取得する

proc SetFontCharCodeFormat*(CharCodeFormat: cint): cint
  ##  DX_CHARCODEFORMAT_SHIFTJIS 等
##  デフォルトフォントハンドルを使用する関数の引数に渡す文字列の文字コード形式を設定する( UNICODE版では無効 )

proc SetDefaultFontState*(FontName: ptr TCHAR; Size: cint; Thick: cint;
                         FontType: cint = -1; CharSet: cint = -1; EdgeSize: cint = -1;
                         Italic: cint = FALSE): cint
##  デフォルトフォントハンドルの設定を変更する

proc SetDefaultFontStateWithStrLen*(FontName: ptr TCHAR; FontNameLength: csize_t;
                                   Size: cint; Thick: cint; FontType: cint = -1;
                                   CharSet: cint = -1; EdgeSize: cint = -1;
                                   Italic: cint = FALSE): cint
##  デフォルトフォントハンドルの設定を変更する

proc GetDefaultFontHandle*(): cint
##  デフォルトフォントハンドルを取得する

proc GetFontMaxCacheCharNum*(): cint
##  デフォルトフォントハンドルのキャッシュできる文字の数を取得する

proc GetFontMaxWidth*(): cint
##  デフォルトフォントハンドルの文字の最大幅を取得する

proc GetFontAscent*(): cint
##  デフォルトフォントハンドルの描画位置からベースラインまでの高さを取得する

proc GetDrawStringWidth*(String: ptr TCHAR; StrLen: cint; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawNStringWidth*(String: ptr TCHAR; StringLength: csize_t;
                         VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawFormatStringWidth*(FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅を取得する

proc GetDrawExtendStringWidth*(ExRateX: cdouble; String: ptr TCHAR; StrLen: cint;
                              VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する( 拡大率付き )

proc GetDrawExtendNStringWidth*(ExRateX: cdouble; String: ptr TCHAR;
                               StringLength: csize_t; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する( 拡大率付き )

proc GetDrawExtendFormatStringWidth*(ExRateX: cdouble; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅を取得する( 拡大率付き )

proc GetDrawStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                       String: ptr TCHAR; StrLen: cint; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawNStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                        String: ptr TCHAR; StringLength: csize_t;
                        VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawFormatStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                             FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                             ExRateX: cdouble; ExRateY: cdouble; String: ptr TCHAR;
                             StrLen: cint; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する( 拡大率付き )

proc GetDrawExtendNStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                              ExRateX: cdouble; ExRateY: cdouble; String: ptr TCHAR;
                              StringLength: csize_t; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する( 拡大率付き )

proc GetDrawExtendFormatStringSize*(SizeX: ptr cint; SizeY: ptr cint;
                                   LineCount: ptr cint; ExRateX: cdouble;
                                   ExRateY: cdouble; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する( 拡大率付き )

proc GetDrawStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO; InfoBufferSize: csize_t;
                           String: ptr TCHAR; StrLen: cint;
                           VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawNStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO; InfoBufferSize: csize_t;
                            String: ptr TCHAR; StringLength: csize_t;
                            VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawFormatStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                 InfoBufferSize: csize_t; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawExtendStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                 InfoBufferSize: csize_t; ExRateX: cdouble;
                                 ExRateY: cdouble; String: ptr TCHAR; StrLen: cint;
                                 VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendNStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                  InfoBufferSize: csize_t; ExRateX: cdouble;
                                  ExRateY: cdouble; String: ptr TCHAR;
                                  StringLength: csize_t;
                                  VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendFormatStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                       InfoBufferSize: csize_t; ExRateX: cdouble;
                                       ExRateY: cdouble; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawStringKerningPairInfo*(PairChar: ptr TCHAR; KernAmount: ptr cint): cint
##  デフォルトフォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetDrawStringKerningPairInfoWithStrLen*(PairChar: ptr TCHAR;
    PairCharLength: csize_t; KernAmount: ptr cint): cint
##  デフォルトフォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetFontNameToHandle*(FontHandle: cint): ptr TCHAR
##  フォントハンドルのフォント名を取得する

proc GetFontMaxCacheCharNumToHandle*(FontHandle: cint): cint
##  フォントハンドルのキャッシュできる文字の数を取得する

proc GetFontMaxWidthToHandle*(FontHandle: cint): cint
##  フォントハンドルの文字の最大幅を取得する

proc GetFontAscentToHandle*(FontHandle: cint): cint
##  フォントハンドルの描画位置からベースラインまでの高さを取得する

proc GetFontSizeToHandle*(FontHandle: cint): cint
##  フォントハンドルのサイズを取得する

proc GetFontEdgeSizeToHandle*(FontHandle: cint): cint
##  フォントハンドルの縁サイズを取得する

proc GetFontSpaceToHandle*(FontHandle: cint): cint
##  フォントハンドルの字間を取得する

proc GetFontLineSpaceToHandle*(FontHandle: cint): cint
##  フォントハンドルの行間を取得する

proc GetFontCharInfo*(FontHandle: cint; Char: ptr TCHAR; DrawX: ptr cint;
                     DrawY: ptr cint; NextCharX: ptr cint; SizeX: ptr cint;
                     SizeY: ptr cint): cint
##  フォントハンドルの指定の文字の描画情報を取得する

proc GetFontCharInfoWithStrLen*(FontHandle: cint; Char: ptr TCHAR;
                               CharLength: csize_t; DrawX: ptr cint; DrawY: ptr cint;
                               NextCharX: ptr cint; SizeX: ptr cint; SizeY: ptr cint): cint
##  フォントハンドルの指定の文字の描画情報を取得する

proc GetDrawStringWidthToHandle*(String: ptr TCHAR; StrLen: cint; FontHandle: cint;
                                VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawNStringWidthToHandle*(String: ptr TCHAR; StringLength: csize_t;
                                 FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawFormatStringWidthToHandle*(FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅を取得する

proc GetDrawExtendStringWidthToHandle*(ExRateX: cdouble; String: ptr TCHAR;
                                      StrLen: cint; FontHandle: cint;
                                      VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawExtendNStringWidthToHandle*(ExRateX: cdouble; String: ptr TCHAR;
                                       StringLength: csize_t; FontHandle: cint;
                                       VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawExtendFormatStringWidthToHandle*(ExRateX: cdouble; FontHandle: cint;
    FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅を取得する

proc GetDrawStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                               String: ptr TCHAR; StrLen: cint; FontHandle: cint;
                               VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawNStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                                String: ptr TCHAR; StringLength: csize_t;
                                FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawFormatStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
                                     LineCount: ptr cint; FontHandle: cint;
                                     FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
                                     LineCount: ptr cint; ExRateX: cdouble;
                                     ExRateY: cdouble; String: ptr TCHAR;
                                     StrLen: cint; FontHandle: cint;
                                     VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendNStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
                                      LineCount: ptr cint; ExRateX: cdouble;
                                      ExRateY: cdouble; String: ptr TCHAR;
                                      StringLength: csize_t; FontHandle: cint;
                                      VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendFormatStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
    LineCount: ptr cint; ExRateX: cdouble; ExRateY: cdouble; FontHandle: cint;
    FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する

proc GetDrawStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
                                   InfoBufferSize: csize_t; String: ptr TCHAR;
                                   StrLen: cint; FontHandle: cint;
                                   VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawNStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
                                    InfoBufferSize: csize_t; String: ptr TCHAR;
                                    StringLength: csize_t; FontHandle: cint;
                                    VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawFormatStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; FontHandle: cint; FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawExtendStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; ExRateX: cdouble; ExRateY: cdouble; String: ptr TCHAR;
    StrLen: cint; FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendNStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; ExRateX: cdouble; ExRateY: cdouble; String: ptr TCHAR;
    StringLength: csize_t; FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendFormatStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; ExRateX: cdouble; ExRateY: cdouble; FontHandle: cint;
    FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawStringKerningPairInfoToHandle*(PairChar: ptr TCHAR;
    KernAmount: ptr cint; FontHandle: cint): cint
##  フォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetDrawStringKerningPairInfoToHandleWithStrLen*(PairChar: ptr TCHAR;
    PairCharLength: csize_t; KernAmount: ptr cint; FontHandle: cint): cint
##  フォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetFontStateToHandle*(FontName: ptr TCHAR; Size: ptr cint; Thick: ptr cint;
                          FontHandle: cint; FontType: ptr cint = nil;
                          CharSet: ptr cint = nil; EdgeSize: ptr cint = nil;
                          Italic: ptr cint = nil): cint
##  フォントハンドルの情報を取得する

proc CheckFontCacheToTextureFlag*(FontHandle: cint): cint
##  フォントハンドルがテクスチャキャッシュを使用しているかどうかを取得する

proc CheckFontChacheToTextureFlag*(FontHandle: cint): cint
##  CheckFontCacheToTextureFlag の誤字版

proc CheckFontHandleValid*(FontHandle: cint): cint
##  フォントハンドルが有効かどうかを取得する

proc ClearFontCacheToHandle*(FontHandle: cint): cint
##  フォントハンドルのキャッシュ情報を初期化する

proc SetFontCacheToTextureFlag*(Flag: cint): cint
##  フォントのキャッシュにテクスチャを使用するかどうかを設定する( TRUE:テクスチャを使用する( デフォルト )  FALSE:テクスチャは使用しない )

proc GetFontCacheToTextureFlag*(): cint
##  フォントのキャッシュにテクスチャを使用するかどうかを設定する

proc SetFontChacheToTextureFlag*(Flag: cint): cint
##  SetFontCacheToTextureFlag の誤字版

proc GetFontChacheToTextureFlag*(): cint
##  GetFontCacheToTextureFlag の誤字版

proc SetFontCacheTextureColorBitDepth*(ColorBitDepth: cint): cint
##  フォントのキャッシュとして使用するテクスチャのカラービット深度を設定する( 16 又は 32 のみ指定可能  デフォルトは 32 )

proc GetFontCacheTextureColorBitDepth*(): cint
##  フォントのキャッシュとして使用するテクスチャのカラービット深度を取得する

proc SetFontCacheCharNum*(CharNum: cint): cint
##  フォントキャッシュでキャッシュできる文字数を設定する

proc GetFontCacheCharNum*(): cint
##  フォントキャッシュでキャッシュできる文字数を取得する( 戻り値  0:デフォルト  1以上:指定文字数 )

proc SetFontCacheUsePremulAlphaFlag*(Flag: cint): cint
##  フォントキャッシュとして保存する画像の形式を乗算済みαチャンネル付き画像にするかどうかを設定する( TRUE:乗算済みαを使用する  FLASE:乗算済みαを使用しない( デフォルト ) )

proc GetFontCacheUsePremulAlphaFlag*(): cint
##  フォントキャッシュとして保存する画像の形式を乗算済みαチャンネル付き画像にするかどうかを取得する

proc SetFontUseAdjustSizeFlag*(Flag: cint): cint
##  フォントのサイズを補正する処理を行うかどうかを設定する( Flag  TRUE:行う( デフォルト )  FALSE:行わない )

proc GetFontUseAdjustSizeFlag*(): cint
##  フォントのサイズを補正する処理を行うかどうかを取得する

proc SetFontOnlyDrawType*(OnlyType: cint): cint
##  フォントの描画で縁のみ、又は本体のみ描画を行うかどうかを設定する( OnlyType  0:通常描画 1:本体のみ描画 2:縁のみ描画 )

proc GetFontOnlyDrawType*(): cint
##  フォントの描画で縁のみ、又は本体のみ描画を行うかどうかを取得する( 戻り値  0:通常描画 1:本体のみ描画 2:縁のみ描画 )
##  FontCacheStringDraw の代わりに DrawString を使ってください

proc FontCacheStringDrawToHandle*(x: cint; y: cint; StrData: ptr TCHAR; Color: cuint;
                                 EdgeColor: cuint; DestImage: ptr BASEIMAGE; ClipRect: ptr RECT; ##  NULL 可
                                 FontHandle: cint; VerticalFlag: cint = FALSE;
                                 DrawSizeP: ptr SIZE = nil): cint
proc FontCacheStringDrawToHandleWithStrLen*(x: cint; y: cint; StrData: ptr TCHAR;
    StrDataLength: csize_t; Color: cuint; EdgeColor: cuint; DestImage: ptr BASEIMAGE; ClipRect: ptr RECT; ##  NULL 可
    FontHandle: cint; VerticalFlag: cint = FALSE; DrawSizeP: ptr SIZE = nil): cint
proc FontBaseImageBlt*(x: cint; y: cint; StrData: ptr TCHAR; DestImage: ptr BASEIMAGE;
                      DestEdgeImage: ptr BASEIMAGE; VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する( デフォルトフォントハンドルを使用する )

proc FontBaseImageBltWithStrLen*(x: cint; y: cint; StrData: ptr TCHAR;
                                StrDataLength: csize_t; DestImage: ptr BASEIMAGE;
                                DestEdgeImage: ptr BASEIMAGE;
                                VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する( デフォルトフォントハンドルを使用する )

proc FontBaseImageBltToHandle*(x: cint; y: cint; StrData: ptr TCHAR;
                              DestImage: ptr BASEIMAGE;
                              DestEdgeImage: ptr BASEIMAGE; FontHandle: cint;
                              VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する

proc FontBaseImageBltToHandleWithStrLen*(x: cint; y: cint; StrData: ptr TCHAR;
                                        StrDataLength: csize_t;
                                        DestImage: ptr BASEIMAGE;
                                        DestEdgeImage: ptr BASEIMAGE;
                                        FontHandle: cint;
                                        VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する

proc MultiByteCharCheck*(Buf: cstring; CharSet: cint): cint
  ##  DX_CHARSET_SHFTJIS
##  ２バイト文字か調べる( TRUE:２バイト文字  FALSE:１バイト文字 )
##  文字列描画関数

proc DrawString*(x: cint; y: cint; String: ptr TCHAR; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する

proc DrawNString*(x: cint; y: cint; String: ptr TCHAR; StringLength: csize_t;
                 Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する

proc DrawVString*(x: cint; y: cint; String: ptr TCHAR; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawNVString*(x: cint; y: cint; String: ptr TCHAR; StringLength: csize_t;
                  Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawFormatString*(x: cint; y: cint; Color: cuint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する

proc DrawFormatVString*(x: cint; y: cint; Color: cuint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縦書き )

proc DrawFormatString2*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                       FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )

proc DrawFormatVString2*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                        FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )

proc DrawExtendString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                      String: ptr TCHAR; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画

proc DrawExtendNString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                       String: ptr TCHAR; StringLength: csize_t; Color: cuint;
                       EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画

proc DrawExtendVString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                       String: ptr TCHAR; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )

proc DrawExtendNVString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                        String: ptr TCHAR; StringLength: csize_t; Color: cuint;
                        EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )

proc DrawExtendFormatString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                            Color: cuint; FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する

proc DrawExtendFormatVString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             Color: cuint; FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )

proc DrawExtendFormatString2*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             Color: cuint; EdgeColor: cuint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )

proc DrawExtendFormatVString2*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              Color: cuint; EdgeColor: cuint;
                              FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )

proc DrawRotaString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                    RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                    Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                    String: ptr TCHAR = nil): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する

proc DrawRotaNString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                     RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                     Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                     String: ptr TCHAR = nil; StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する

proc DrawRotaFormatString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                          RotCenterX: cdouble; RotCenterY: cdouble;
                          RotAngle: cdouble; Color: cuint; EdgeColor: cuint = 0;
                          VerticalFlag: cint = FALSE; FormatString: ptr TCHAR = nil): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を回転描画する

proc DrawModiString*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                    y4: cint; Color: cuint; EdgeColor: cuint = 0;
                    VerticalFlag: cint = FALSE; String: ptr TCHAR = nil): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する

proc DrawModiNString*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                     y4: cint; Color: cuint; EdgeColor: cuint = 0;
                     VerticalFlag: cint = FALSE; String: ptr TCHAR = nil;
                     StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する

proc DrawModiFormatString*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                          x4: cint; y4: cint; Color: cuint; EdgeColor: cuint = 0;
                          VerticalFlag: cint = FALSE; FormatString: ptr TCHAR = nil): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を変形描画する

proc DrawStringF*(x: cfloat; y: cfloat; String: ptr TCHAR; Color: cuint;
                 EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawNStringF*(x: cfloat; y: cfloat; String: ptr TCHAR; StringLength: csize_t;
                  Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawVStringF*(x: cfloat; y: cfloat; String: ptr TCHAR; Color: cuint;
                  EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawNVStringF*(x: cfloat; y: cfloat; String: ptr TCHAR; StringLength: csize_t;
                   Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatStringF*(x: cfloat; y: cfloat; Color: cuint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 座標指定が float 版 )

proc DrawFormatVStringF*(x: cfloat; y: cfloat; Color: cuint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatString2F*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                        FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawFormatVString2F*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                         FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawExtendStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                       String: ptr TCHAR; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 座標指定が float 版 )

proc DrawExtendNStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                        String: ptr TCHAR; StringLength: csize_t; Color: cuint;
                        EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 座標指定が float 版 )

proc DrawExtendVStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                        String: ptr TCHAR; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )( 座標指定が float 版 )

proc DrawExtendNVStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                         String: ptr TCHAR; StringLength: csize_t; Color: cuint;
                         EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                             Color: cuint; FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendFormatVStringF*(x: cfloat; y: cfloat; ExRateX: cdouble;
                              ExRateY: cdouble; Color: cuint;
                              FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatString2F*(x: cfloat; y: cfloat; ExRateX: cdouble;
                              ExRateY: cdouble; Color: cuint; EdgeColor: cuint;
                              FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawExtendFormatVString2F*(x: cfloat; y: cfloat; ExRateX: cdouble;
                               ExRateY: cdouble; Color: cuint; EdgeColor: cuint;
                               FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawRotaStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                     RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                     Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                     String: ptr TCHAR = nil): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaNStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                      RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                      Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                      String: ptr TCHAR = nil; StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaFormatStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                           RotCenterX: cdouble; RotCenterY: cdouble;
                           RotAngle: cdouble; Color: cuint; EdgeColor: cuint = 0;
                           VerticalFlag: cint = FALSE; FormatString: ptr TCHAR = nil): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を回転描画する( 座標指定が float 版 )

proc DrawModiStringF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                     y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                     EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                     String: ptr TCHAR = nil): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiNStringF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                      y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                      EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                      String: ptr TCHAR = nil; StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiFormatStringF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                           y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                           EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                           FormatString: ptr TCHAR = nil): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を変形描画する( 座標指定が float 版 )

proc DrawNumberToI*(x: cint; y: cint; Num: cint; RisesNum: cint; Color: cuint;
                   EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して整数型の数値を描画する

proc DrawNumberToF*(x: cint; y: cint; Num: cdouble; Length: cint; Color: cuint;
                   EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して浮動小数点型の数値を描画する

proc DrawNumberPlusToI*(x: cint; y: cint; NoteString: ptr TCHAR; Num: cint;
                       RisesNum: cint; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して整数型の数値とその説明の文字列を一度に描画する

proc DrawNumberPlusToF*(x: cint; y: cint; NoteString: ptr TCHAR; Num: cdouble;
                       Length: cint; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して浮動小数点型の数値とその説明の文字列を一度に描画する

proc DrawStringToZBuffer*(x: cint; y: cint; String: ptr TCHAR; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawNStringToZBuffer*(x: cint; y: cint; String: ptr TCHAR; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawVStringToZBuffer*(x: cint; y: cint; String: ptr TCHAR; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawNVStringToZBuffer*(x: cint; y: cint; String: ptr TCHAR; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawFormatStringToZBuffer*(x: cint; y: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                               FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を描画する

proc DrawFormatVStringToZBuffer*(x: cint; y: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を描画する( 縦書き )

proc DrawExtendStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                               String: ptr TCHAR; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendNStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                String: ptr TCHAR; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendVStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                String: ptr TCHAR; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendNVStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                 String: ptr TCHAR; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendFormatStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                     FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する

proc DrawExtendFormatVStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                      ExRateY: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                      FormatString: ptr TCHAR): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する( 縦書き )

proc DrawRotaStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             RotCenterX: cdouble; RotCenterY: cdouble;
                             RotAngle: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                             VerticalFlag: cint; String: ptr TCHAR): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaNStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              RotCenterX: cdouble; RotCenterY: cdouble;
                              RotAngle: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                              VerticalFlag: cint; String: ptr TCHAR;
                              StringLength: csize_t): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaFormatStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                   ExRateY: cdouble; RotCenterX: cdouble;
                                   RotCenterY: cdouble; RotAngle: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                   VerticalFlag: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を回転描画する

proc DrawModiStringToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                             x4: cint; y4: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                             VerticalFlag: cint; String: ptr TCHAR): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiNStringToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                              x4: cint; y4: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                              VerticalFlag: cint; String: ptr TCHAR;
                              StringLength: csize_t): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiFormatStringToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                   y3: cint; x4: cint; y4: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                   VerticalFlag: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を変形描画する

proc DrawStringToHandle*(x: cint; y: cint; String: ptr TCHAR; Color: cuint;
                        FontHandle: cint; EdgeColor: cuint = 0;
                        VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する

proc DrawNStringToHandle*(x: cint; y: cint; String: ptr TCHAR; StringLength: csize_t;
                         Color: cuint; FontHandle: cint; EdgeColor: cuint = 0;
                         VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する

proc DrawVStringToHandle*(x: cint; y: cint; String: ptr TCHAR; Color: cuint;
                         FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawNVStringToHandle*(x: cint; y: cint; String: ptr TCHAR; StringLength: csize_t;
                          Color: cuint; FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawFormatStringToHandle*(x: cint; y: cint; Color: cuint; FontHandle: cint;
                              FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する

proc DrawFormatVStringToHandle*(x: cint; y: cint; Color: cuint; FontHandle: cint;
                               FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縦書き )

proc DrawFormatString2ToHandle*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                               FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )

proc DrawFormatVString2ToHandle*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                                FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )

proc DrawExtendStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              String: ptr TCHAR; Color: cuint; FontHandle: cint;
                              EdgeColor: cuint = 0; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する

proc DrawExtendNStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                               String: ptr TCHAR; StringLength: csize_t;
                               Color: cuint; FontHandle: cint; EdgeColor: cuint = 0;
                               VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する

proc DrawExtendVStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                               String: ptr TCHAR; Color: cuint; FontHandle: cint;
                               EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )

proc DrawExtendNVStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                String: ptr TCHAR; StringLength: csize_t;
                                Color: cuint; FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )

proc DrawExtendFormatStringToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                    ExRateY: cdouble; Color: cuint;
                                    FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する

proc DrawExtendFormatVStringToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; Color: cuint;
                                     FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )

proc DrawExtendFormatString2ToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; Color: cuint;
                                     EdgeColor: cuint; FontHandle: cint;
                                     FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )

proc DrawExtendFormatVString2ToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                      ExRateY: cdouble; Color: cuint;
                                      EdgeColor: cuint; FontHandle: cint;
                                      FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )

proc DrawRotaStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                            RotCenterX: cdouble; RotCenterY: cdouble;
                            RotAngle: cdouble; Color: cuint; FontHandle: cint;
                            EdgeColor: cuint; VerticalFlag: cint; String: ptr TCHAR): cint
##  フォントハンドルを使用して文字列を回転描画する

proc DrawRotaNStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             RotCenterX: cdouble; RotCenterY: cdouble;
                             RotAngle: cdouble; Color: cuint; FontHandle: cint;
                             EdgeColor: cuint; VerticalFlag: cint;
                             String: ptr TCHAR; StringLength: csize_t): cint
##  フォントハンドルを使用して文字列を回転描画する

proc DrawRotaFormatStringToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                  ExRateY: cdouble; RotCenterX: cdouble;
                                  RotCenterY: cdouble; RotAngle: cdouble;
                                  Color: cuint; FontHandle: cint; EdgeColor: cuint;
                                  VerticalFlag: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を回転描画する

proc DrawModiStringToHandle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                            x4: cint; y4: cint; Color: cuint; FontHandle: cint;
                            EdgeColor: cuint; VerticalFlag: cint; String: ptr TCHAR): cint
##  フォントハンドルを使用して文字列を変形描画する

proc DrawModiNStringToHandle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                             x4: cint; y4: cint; Color: cuint; FontHandle: cint;
                             EdgeColor: cuint; VerticalFlag: cint;
                             String: ptr TCHAR; StringLength: csize_t): cint
##  フォントハンドルを使用して文字列を変形描画する

proc DrawModiFormatStringToHandle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                  y3: cint; x4: cint; y4: cint; Color: cuint;
                                  FontHandle: cint; EdgeColor: cuint;
                                  VerticalFlag: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を変形描画する

proc DrawStringFToHandle*(x: cfloat; y: cfloat; String: ptr TCHAR; Color: cuint;
                         FontHandle: cint; EdgeColor: cuint = 0;
                         VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawNStringFToHandle*(x: cfloat; y: cfloat; String: ptr TCHAR;
                          StringLength: csize_t; Color: cuint; FontHandle: cint;
                          EdgeColor: cuint = 0; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawVStringFToHandle*(x: cfloat; y: cfloat; String: ptr TCHAR; Color: cuint;
                          FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawNVStringFToHandle*(x: cfloat; y: cfloat; String: ptr TCHAR;
                           StringLength: csize_t; Color: cuint; FontHandle: cint;
                           EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatStringFToHandle*(x: cfloat; y: cfloat; Color: cuint; FontHandle: cint;
                               FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 座標指定が float 版 )

proc DrawFormatVStringFToHandle*(x: cfloat; y: cfloat; Color: cuint; FontHandle: cint;
                                FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatString2FToHandle*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                                FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawFormatVString2FToHandle*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                                 FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawExtendStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                               ExRateY: cdouble; String: ptr TCHAR; Color: cuint;
                               FontHandle: cint; EdgeColor: cuint = 0;
                               VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendNStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                ExRateY: cdouble; String: ptr TCHAR;
                                StringLength: csize_t; Color: cuint;
                                FontHandle: cint; EdgeColor: cuint = 0;
                                VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendVStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                ExRateY: cdouble; String: ptr TCHAR; Color: cuint;
                                FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendNVStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                 ExRateY: cdouble; String: ptr TCHAR;
                                 StringLength: csize_t; Color: cuint;
                                 FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                     ExRateY: cdouble; Color: cuint;
                                     FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendFormatVStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                      ExRateY: cdouble; Color: cuint;
                                      FontHandle: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatString2FToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                      ExRateY: cdouble; Color: cuint;
                                      EdgeColor: cuint; FontHandle: cint;
                                      FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawExtendFormatVString2FToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                       ExRateY: cdouble; Color: cuint;
                                       EdgeColor: cuint; FontHandle: cint;
                                       FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawRotaStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                             RotCenterX: cdouble; RotCenterY: cdouble;
                             RotAngle: cdouble; Color: cuint; FontHandle: cint;
                             EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                             String: ptr TCHAR = nil): cint
##  フォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaNStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                              ExRateY: cdouble; RotCenterX: cdouble;
                              RotCenterY: cdouble; RotAngle: cdouble; Color: cuint;
                              FontHandle: cint; EdgeColor: cuint = 0;
                              VerticalFlag: cint = FALSE; String: ptr TCHAR = nil;
                              StringLength: csize_t = 0): cint
##  フォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaFormatStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                   ExRateY: cdouble; RotCenterX: cdouble;
                                   RotCenterY: cdouble; RotAngle: cdouble;
                                   Color: cuint; FontHandle: cint;
                                   EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                                   FormatString: ptr TCHAR = nil): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を回転描画する( 座標指定が float 版 )

proc DrawModiStringFToHandle*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                             y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                             FontHandle: cint; EdgeColor: cuint; VerticalFlag: cint;
                             String: ptr TCHAR): cint
##  フォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiNStringFToHandle*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
                              x3: cfloat; y3: cfloat; x4: cfloat; y4: cfloat;
                              Color: cuint; FontHandle: cint; EdgeColor: cuint;
                              VerticalFlag: cint; String: ptr TCHAR;
                              StringLength: csize_t): cint
##  フォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiFormatStringFToHandle*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
                                   x3: cfloat; y3: cfloat; x4: cfloat; y4: cfloat;
                                   Color: cuint; FontHandle: cint; EdgeColor: cuint;
                                   VerticalFlag: cint; FormatString: ptr TCHAR): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を変形描画する( 座標指定が float 版 )

proc DrawNumberToIToHandle*(x: cint; y: cint; Num: cint; RisesNum: cint; Color: cuint;
                           FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して整数型の数値を描画する

proc DrawNumberToFToHandle*(x: cint; y: cint; Num: cdouble; Length: cint; Color: cuint;
                           FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して浮動小数点型の数値を描画する

proc DrawNumberPlusToIToHandle*(x: cint; y: cint; NoteString: ptr TCHAR; Num: cint;
                               RisesNum: cint; Color: cuint; FontHandle: cint;
                               EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して整数型の数値とその説明の文字列を一度に描画する

proc DrawNumberPlusToFToHandle*(x: cint; y: cint; NoteString: ptr TCHAR; Num: cdouble;
                               Length: cint; Color: cuint; FontHandle: cint;
                               EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して浮動小数点型の数値とその説明の文字列を一度に描画する

proc DrawStringToHandleToZBuffer*(x: cint; y: cint; String: ptr TCHAR; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                 VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawNStringToHandleToZBuffer*(x: cint; y: cint; String: ptr TCHAR;
                                  StringLength: csize_t; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                  VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawVStringToHandleToZBuffer*(x: cint; y: cint; String: ptr TCHAR;
                                  FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawNVStringToHandleToZBuffer*(x: cint; y: cint; String: ptr TCHAR;
                                   StringLength: csize_t; FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawFormatStringToHandleToZBuffer*(x: cint; y: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                       FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を描画する

proc DrawFormatVStringToHandleToZBuffer*(x: cint; y: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                        FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を描画する( 縦書き )

proc DrawExtendStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                       ExRateY: cdouble; String: ptr TCHAR;
                                       FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                       VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendNStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                        ExRateY: cdouble; String: ptr TCHAR;
                                        StringLength: csize_t; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                        VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendVStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                        ExRateY: cdouble; String: ptr TCHAR;
                                        FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendNVStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; String: ptr TCHAR; StringLength: csize_t; FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendFormatStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する

proc DrawExtendFormatVStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する( 縦書き )

proc DrawRotaStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; RotCenterX: cdouble;
                                     RotCenterY: cdouble; RotAngle: cdouble;
                                     FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                     VerticalFlag: cint; String: ptr TCHAR): cint
##  フォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaNStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                      ExRateY: cdouble; RotCenterX: cdouble;
                                      RotCenterY: cdouble; RotAngle: cdouble;
                                      FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                      VerticalFlag: cint; String: ptr TCHAR;
                                      StringLength: csize_t): cint
##  フォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaFormatStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
    FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    VerticalFlag: cint; FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を回転描画する

proc DrawModiStringToHandleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                     y3: cint; x4: cint; y4: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                     VerticalFlag: cint; String: ptr TCHAR): cint
##  フォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiNStringToHandleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                      y3: cint; x4: cint; y4: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                      VerticalFlag: cint; String: ptr TCHAR;
                                      StringLength: csize_t): cint
##  フォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiFormatStringToHandleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint;
    x3: cint; y3: cint; x4: cint; y4: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    VerticalFlag: cint; FormatString: ptr TCHAR): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を変形描画する
##  DxMath.cpp 関数プロトタイプ宣言
##  演算ライブラリ

proc ConvertMatrixFtoD*(Out: ptr MATRIX_D; In: ptr MATRIX): cint
##  float型要素の行列をdouble型要素の行列に変換する

proc ConvertMatrixDtoF*(Out: ptr MATRIX; In: ptr MATRIX_D): cint
##  double型要素の行列をfloat型要素の行列に変換する

proc CreateIdentityMatrix*(Out: ptr MATRIX): cint
##  単位行列を作成する

proc CreateIdentityMatrixD*(Out: ptr MATRIX_D): cint
##  単位行列を作成する

proc CreateLookAtMatrix*(Out: ptr MATRIX; Eye: ptr VECTOR; At: ptr VECTOR; Up: ptr VECTOR): cint
##  ビュー行列を作成する

proc CreateLookAtMatrixD*(Out: ptr MATRIX_D; Eye: ptr VECTOR_D; At: ptr VECTOR_D;
                         Up: ptr VECTOR_D): cint
##  ビュー行列を作成する

proc CreateLookAtMatrix2*(Out: ptr MATRIX; Eye: ptr VECTOR; XZAngle: cdouble;
                         Oira: cdouble): cint
##  ビュー行列を作成する(方向を回転値で指定)

proc CreateLookAtMatrix2D*(Out: ptr MATRIX_D; Eye: ptr VECTOR_D; XZAngle: cdouble;
                          Oira: cdouble): cint
##  ビュー行列を作成する(方向を回転値で指定)

proc CreateLookAtMatrixRH*(Out: ptr MATRIX; Eye: ptr VECTOR; At: ptr VECTOR;
                          Up: ptr VECTOR): cint
##  ビュー行列を作成する(右手座標系用)

proc CreateLookAtMatrixRHD*(Out: ptr MATRIX_D; Eye: ptr VECTOR_D; At: ptr VECTOR_D;
                           Up: ptr VECTOR_D): cint
##  ビュー行列を作成する(右手座標系用)

proc CreateMultiplyMatrix*(Out: ptr MATRIX; In1: ptr MATRIX; In2: ptr MATRIX): cint
##  行列の積を求める

proc CreateMultiplyMatrixD*(Out: ptr MATRIX_D; In1: ptr MATRIX_D; In2: ptr MATRIX_D): cint
##  行列の積を求める

proc CreatePerspectiveFovMatrix*(Out: ptr MATRIX; fov: cfloat; zn: cfloat; zf: cfloat;
                                aspect: cfloat = -1.0f): cint
##  射影行列を作成する

proc CreatePerspectiveFovMatrixD*(Out: ptr MATRIX_D; fov: cdouble; zn: cdouble;
                                 zf: cdouble; aspect: cdouble = -1.0f): cint
##  射影行列を作成する

proc CreatePerspectiveFovMatrixRH*(Out: ptr MATRIX; fov: cfloat; zn: cfloat; zf: cfloat;
                                  aspect: cfloat = -1.0f): cint
##  射影行列を作成する(右手座標系用)

proc CreatePerspectiveFovMatrixRHD*(Out: ptr MATRIX_D; fov: cdouble; zn: cdouble;
                                   zf: cdouble; aspect: cdouble = -1.0f): cint
##  射影行列を作成する(右手座標系用)

proc CreateOrthoMatrix*(Out: ptr MATRIX; size: cfloat; zn: cfloat; zf: cfloat;
                       aspect: cfloat = -1.0f): cint
##  正射影行列を作成する

proc CreateOrthoMatrixD*(Out: ptr MATRIX_D; size: cdouble; zn: cdouble; zf: cdouble;
                        aspect: cdouble = -1.0f): cint
##  正射影行列を作成する

proc CreateOrthoMatrixRH*(Out: ptr MATRIX; size: cfloat; zn: cfloat; zf: cfloat;
                         aspect: cfloat = -1.0f): cint
##  正射影行列を作成する(右手座標系用)

proc CreateOrthoMatrixRHD*(Out: ptr MATRIX_D; size: cdouble; zn: cdouble; zf: cdouble;
                          aspect: cdouble = -1.0f): cint
##  正射影行列を作成する(右手座標系用)

proc CreateScalingMatrix*(Out: ptr MATRIX; sx: cfloat; sy: cfloat; sz: cfloat): cint
##  スケーリング行列を作成する

proc CreateScalingMatrixD*(Out: ptr MATRIX_D; sx: cdouble; sy: cdouble; sz: cdouble): cint
##  スケーリング行列を作成する

proc CreateRotationXMatrix*(Out: ptr MATRIX; Angle: cfloat): cint
##  Ｘ軸を中心とした回転行列を作成する

proc CreateRotationXMatrixD*(Out: ptr MATRIX_D; Angle: cdouble): cint
##  Ｘ軸を中心とした回転行列を作成する

proc CreateRotationYMatrix*(Out: ptr MATRIX; Angle: cfloat): cint
##  Ｙ軸を中心とした回転行列を作成する

proc CreateRotationYMatrixD*(Out: ptr MATRIX_D; Angle: cdouble): cint
##  Ｙ軸を中心とした回転行列を作成する

proc CreateRotationZMatrix*(Out: ptr MATRIX; Angle: cfloat): cint
##  Ｚ軸を中心とした回転行列を作成する

proc CreateRotationZMatrixD*(Out: ptr MATRIX_D; Angle: cdouble): cint
##  Ｚ軸を中心とした回転行列を作成する

proc CreateTranslationMatrix*(Out: ptr MATRIX; x: cfloat; y: cfloat; z: cfloat): cint
##  平行移動行列を作成する

proc CreateTranslationMatrixD*(Out: ptr MATRIX_D; x: cdouble; y: cdouble; z: cdouble): cint
##  平行移動行列を作成する

proc CreateTransposeMatrix*(Out: ptr MATRIX; In: ptr MATRIX): cint
##  転置行列を作成する

proc CreateTransposeMatrixD*(Out: ptr MATRIX_D; In: ptr MATRIX_D): cint
##  転置行列を作成する

proc CreateInverseMatrix*(Out: ptr MATRIX; In: ptr MATRIX): cint
##  逆行列を作成する

proc CreateInverseMatrixD*(Out: ptr MATRIX_D; In: ptr MATRIX_D): cint
##  逆行列を作成する

proc CreateViewportMatrix*(Out: ptr MATRIX; CenterX: cfloat; CenterY: cfloat;
                          Width: cfloat; Height: cfloat): cint
##  ビューポート行列を作成する

proc CreateViewportMatrixD*(Out: ptr MATRIX_D; CenterX: cdouble; CenterY: cdouble;
                           Width: cdouble; Height: cdouble): cint
##  ビューポート行列を作成する

proc CreateRotationXYZMatrix*(Out: ptr MATRIX; XRot: cfloat; YRot: cfloat; ZRot: cfloat): cint
##  Ｘ軸回転→Ｙ軸回転→Ｚ軸回転を合成した行列を作成する

proc CreateRotationXYZMatrixD*(Out: ptr MATRIX_D; XRot: cdouble; YRot: cdouble;
                              ZRot: cdouble): cint
##  Ｘ軸回転→Ｙ軸回転→Ｚ軸回転を合成した行列を作成する

proc CreateRotationXZYMatrix*(Out: ptr MATRIX; XRot: cfloat; YRot: cfloat; ZRot: cfloat): cint
##  Ｘ軸回転→Ｚ軸回転→Ｙ軸回転を合成した行列を作成する

proc CreateRotationXZYMatrixD*(Out: ptr MATRIX_D; XRot: cdouble; YRot: cdouble;
                              ZRot: cdouble): cint
##  Ｘ軸回転→Ｚ軸回転→Ｙ軸回転を合成した行列を作成する

proc CreateRotationYXZMatrix*(Out: ptr MATRIX; XRot: cfloat; YRot: cfloat; ZRot: cfloat): cint
##  Ｙ軸回転→Ｘ軸回転→Ｚ軸回転を合成した行列を作成する

proc CreateRotationYXZMatrixD*(Out: ptr MATRIX_D; XRot: cdouble; YRot: cdouble;
                              ZRot: cdouble): cint
##  Ｙ軸回転→Ｘ軸回転→Ｚ軸回転を合成した行列を作成する

proc CreateRotationYZXMatrix*(Out: ptr MATRIX; XRot: cfloat; YRot: cfloat; ZRot: cfloat): cint
##  Ｙ軸回転→Ｚ軸回転→Ｘ軸回転を合成した行列を作成する

proc CreateRotationYZXMatrixD*(Out: ptr MATRIX_D; XRot: cdouble; YRot: cdouble;
                              ZRot: cdouble): cint
##  Ｙ軸回転→Ｚ軸回転→Ｘ軸回転を合成した行列を作成する

proc CreateRotationZXYMatrix*(Out: ptr MATRIX; XRot: cfloat; YRot: cfloat; ZRot: cfloat): cint
##  Ｚ軸回転→Ｘ軸回転→Ｙ軸回転を合成した行列を作成する

proc CreateRotationZXYMatrixD*(Out: ptr MATRIX_D; XRot: cdouble; YRot: cdouble;
                              ZRot: cdouble): cint
##  Ｚ軸回転→Ｘ軸回転→Ｙ軸回転を合成した行列を作成する

proc CreateRotationZYXMatrix*(Out: ptr MATRIX; XRot: cfloat; YRot: cfloat; ZRot: cfloat): cint
##  Ｚ軸回転→Ｙ軸回転→Ｘ軸回転を合成した行列を作成する

proc CreateRotationZYXMatrixD*(Out: ptr MATRIX_D; XRot: cdouble; YRot: cdouble;
                              ZRot: cdouble): cint
##  Ｚ軸回転→Ｙ軸回転→Ｘ軸回転を合成した行列を作成する

proc GetMatrixXYZRotation*(In: ptr MATRIX; OutXRot: ptr cfloat; OutYRot: ptr cfloat;
                          OutZRot: ptr cfloat): cint
##  行列からＸＹＺ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixXYZRotationD*(In: ptr MATRIX_D; OutXRot: ptr cdouble;
                           OutYRot: ptr cdouble; OutZRot: ptr cdouble): cint
##  行列からＸＹＺ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixXZYRotation*(In: ptr MATRIX; OutXRot: ptr cfloat; OutYRot: ptr cfloat;
                          OutZRot: ptr cfloat): cint
##  行列からＸＺＹ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixXZYRotationD*(In: ptr MATRIX_D; OutXRot: ptr cdouble;
                           OutYRot: ptr cdouble; OutZRot: ptr cdouble): cint
##  行列からＸＺＹ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixYXZRotation*(In: ptr MATRIX; OutXRot: ptr cfloat; OutYRot: ptr cfloat;
                          OutZRot: ptr cfloat): cint
##  行列からＹＸＺ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixYXZRotationD*(In: ptr MATRIX_D; OutXRot: ptr cdouble;
                           OutYRot: ptr cdouble; OutZRot: ptr cdouble): cint
##  行列からＹＸＺ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixYZXRotation*(In: ptr MATRIX; OutXRot: ptr cfloat; OutYRot: ptr cfloat;
                          OutZRot: ptr cfloat): cint
##  行列からＹＺＸ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixYZXRotationD*(In: ptr MATRIX_D; OutXRot: ptr cdouble;
                           OutYRot: ptr cdouble; OutZRot: ptr cdouble): cint
##  行列からＹＺＸ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixZXYRotation*(In: ptr MATRIX; OutXRot: ptr cfloat; OutYRot: ptr cfloat;
                          OutZRot: ptr cfloat): cint
##  行列からＺＸＹ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixZXYRotationD*(In: ptr MATRIX_D; OutXRot: ptr cdouble;
                           OutYRot: ptr cdouble; OutZRot: ptr cdouble): cint
##  行列からＺＸＹ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixZYXRotation*(In: ptr MATRIX; OutXRot: ptr cfloat; OutYRot: ptr cfloat;
                          OutZRot: ptr cfloat): cint
##  行列からＺＹＸ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc GetMatrixZYXRotationD*(In: ptr MATRIX_D; OutXRot: ptr cdouble;
                           OutYRot: ptr cdouble; OutZRot: ptr cdouble): cint
##  行列からＺＹＸ軸回転の値を取得する( 戻り値　-1:ジンバルロック発生  0:成功 )

proc VectorConvertFtoD*(Out: ptr VECTOR_D; In: ptr VECTOR): cint
##  float型のベクトルをdouble型のベクトルに変換する

proc VectorConvertDtoF*(Out: ptr VECTOR; In: ptr VECTOR_D): cint
##  double型のベクトルをfloat型のベクトルに変換する

proc VectorNormalize*(Out: ptr VECTOR; In: ptr VECTOR): cint
##  ベクトルを正規化する

proc VectorNormalizeD*(Out: ptr VECTOR_D; In: ptr VECTOR_D): cint
##  ベクトルを正規化する

proc VectorScale*(Out: ptr VECTOR; In: ptr VECTOR; Scale: cfloat): cint
##  ベクトルをスカラー倍する

proc VectorScaleD*(Out: ptr VECTOR_D; In: ptr VECTOR_D; Scale: cdouble): cint
##  ベクトルをスカラー倍する

proc VectorMultiply*(Out: ptr VECTOR; In1: ptr VECTOR; In2: ptr VECTOR): cint
##  ベクトルの掛け算をする

proc VectorMultiplyD*(Out: ptr VECTOR_D; In1: ptr VECTOR_D; In2: ptr VECTOR_D): cint
##  ベクトルの掛け算をする

proc VectorSub*(Out: ptr VECTOR; In1: ptr VECTOR; In2: ptr VECTOR): cint
##  Out = In1 - In2 のベクトル計算をする

proc VectorSubD*(Out: ptr VECTOR_D; In1: ptr VECTOR_D; In2: ptr VECTOR_D): cint
##  Out = In1 - In2 のベクトル計算をする

proc VectorAdd*(Out: ptr VECTOR; In1: ptr VECTOR; In2: ptr VECTOR): cint
##  Out = In1 + In2 のベクトル計算をする

proc VectorAddD*(Out: ptr VECTOR_D; In1: ptr VECTOR_D; In2: ptr VECTOR_D): cint
##  Out = In1 + In2 のベクトル計算をする

proc VectorOuterProduct*(Out: ptr VECTOR; In1: ptr VECTOR; In2: ptr VECTOR): cint
##  In1とIn2の外積を計算する

proc VectorOuterProductD*(Out: ptr VECTOR_D; In1: ptr VECTOR_D; In2: ptr VECTOR_D): cint
##  In1とIn2の外積を計算する

proc VectorInnerProduct*(In1: ptr VECTOR; In2: ptr VECTOR): cfloat
##  In1とIn2の内積を計算する

proc VectorInnerProductD*(In1: ptr VECTOR_D; In2: ptr VECTOR_D): cdouble
##  In1とIn2の内積を計算する

proc VectorRotationX*(Out: ptr VECTOR; In: ptr VECTOR; Angle: cdouble): cint
##  ベクトルのＸ軸を軸にした回転を行う

proc VectorRotationXD*(Out: ptr VECTOR_D; In: ptr VECTOR_D; Angle: cdouble): cint
##  ベクトルのＸ軸を軸にした回転を行う

proc VectorRotationY*(Out: ptr VECTOR; In: ptr VECTOR; Angle: cdouble): cint
##  ベクトルのＹ軸を軸にした回転を行う

proc VectorRotationYD*(Out: ptr VECTOR_D; In: ptr VECTOR_D; Angle: cdouble): cint
##  ベクトルのＹ軸を軸にした回転を行う

proc VectorRotationZ*(Out: ptr VECTOR; In: ptr VECTOR; Angle: cdouble): cint
##  ベクトルのＺ軸を軸にした回転を行う

proc VectorRotationZD*(Out: ptr VECTOR_D; In: ptr VECTOR_D; Angle: cdouble): cint
##  ベクトルのＺ軸を軸にした回転を行う

proc VectorTransform*(Out: ptr VECTOR; InVec: ptr VECTOR; InMatrix: ptr MATRIX): cint
##  ベクトル行列と4x4正方行列を乗算する( w は 1 と仮定 )

proc VectorTransformD*(Out: ptr VECTOR_D; InVec: ptr VECTOR_D; InMatrix: ptr MATRIX_D): cint
##  ベクトル行列と4x4正方行列を乗算する( w は 1 と仮定 )

proc VectorTransformSR*(Out: ptr VECTOR; InVec: ptr VECTOR; InMatrix: ptr MATRIX): cint
##  ベクトル行列と4x4正方行列の回転部分のみを乗算する

proc VectorTransformSRD*(Out: ptr VECTOR_D; InVec: ptr VECTOR_D; InMatrix: ptr MATRIX_D): cint
##  ベクトル行列と4x4正方行列の回転部分のみを乗算する

proc VectorTransform4*(Out: ptr VECTOR; V4Out: ptr cfloat; InVec: ptr VECTOR;
                      V4In: ptr cfloat; InMatrix: ptr MATRIX): cint
##  ベクトル行列と4x4正方行列を乗算する( w の要素を渡す )

proc VectorTransform4D*(Out: ptr VECTOR_D; V4Out: ptr cdouble; InVec: ptr VECTOR_D;
                       V4In: ptr cdouble; InMatrix: ptr MATRIX_D): cint
##  ベクトル行列と4x4正方行列を乗算する( w の要素を渡す )

proc Segment_Segment_Analyse*(SegmentAPos1: ptr VECTOR; SegmentAPos2: ptr VECTOR;
                             SegmentBPos1: ptr VECTOR; SegmentBPos2: ptr VECTOR;
                             Result: ptr SEGMENT_SEGMENT_RESULT): cint
##  二つの線分の最接近点情報を解析する

proc Segment_Segment_AnalyseD*(SegmentAPos1: ptr VECTOR_D;
                              SegmentAPos2: ptr VECTOR_D;
                              SegmentBPos1: ptr VECTOR_D;
                              SegmentBPos2: ptr VECTOR_D;
                              Result: ptr SEGMENT_SEGMENT_RESULT_D): cint
##  二つの線分の最接近点情報を解析する

proc Segment_Point_Analyse*(SegmentPos1: ptr VECTOR; SegmentPos2: ptr VECTOR;
                           PointPos: ptr VECTOR; Result: ptr SEGMENT_POINT_RESULT): cint
##  線分と点の最接近点情報を解析する

proc Segment_Point_AnalyseD*(SegmentPos1: ptr VECTOR_D; SegmentPos2: ptr VECTOR_D;
                            PointPos: ptr VECTOR_D;
                            Result: ptr SEGMENT_POINT_RESULT_D): cint
##  線分と点の最接近点情報を解析する

proc Segment_Triangle_Analyse*(SegmentPos1: ptr VECTOR; SegmentPos2: ptr VECTOR;
                              TrianglePos1: ptr VECTOR; TrianglePos2: ptr VECTOR;
                              TrianglePos3: ptr VECTOR;
                              Result: ptr SEGMENT_TRIANGLE_RESULT): cint
##  線分と三角形の最接近点情報を解析する

proc Segment_Triangle_AnalyseD*(SegmentPos1: ptr VECTOR_D;
                               SegmentPos2: ptr VECTOR_D;
                               TrianglePos1: ptr VECTOR_D;
                               TrianglePos2: ptr VECTOR_D;
                               TrianglePos3: ptr VECTOR_D;
                               Result: ptr SEGMENT_TRIANGLE_RESULT_D): cint
##  線分と三角形の最接近点情報を解析する

proc Triangle_Point_Analyse*(TrianglePos1: ptr VECTOR; TrianglePos2: ptr VECTOR;
                            TrianglePos3: ptr VECTOR; PointPos: ptr VECTOR;
                            Result: ptr TRIANGLE_POINT_RESULT): cint
##  三角形と点の最接近点情報を解析する

proc Triangle_Point_AnalyseD*(TrianglePos1: ptr VECTOR_D;
                             TrianglePos2: ptr VECTOR_D;
                             TrianglePos3: ptr VECTOR_D; PointPos: ptr VECTOR_D;
                             Result: ptr TRIANGLE_POINT_RESULT_D): cint
##  三角形と点の最接近点情報を解析する

proc Plane_Point_Analyse*(PlanePos: ptr VECTOR; PlaneNormal: ptr VECTOR;
                         PointPos: ptr VECTOR; Result: ptr PLANE_POINT_RESULT): cint
##  平面と点の最近点情報を解析する

proc Plane_Point_AnalyseD*(PlanePos: ptr VECTOR_D; PlaneNormal: ptr VECTOR_D;
                          PointPos: ptr VECTOR_D; Result: ptr PLANE_POINT_RESULT_D): cint
##  平面と点の最近点情報を解析する

proc TriangleBarycenter*(TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                        TrianglePos3: VECTOR; Position: VECTOR;
                        TrianglePos1Weight: ptr cfloat;
                        TrianglePos2Weight: ptr cfloat;
                        TrianglePos3Weight: ptr cfloat)
##  指定の座標から三角形の重心を求める

proc TriangleBarycenterD*(TrianglePos1: VECTOR_D; TrianglePos2: VECTOR_D;
                         TrianglePos3: VECTOR_D; Position: VECTOR_D;
                         TrianglePos1Weight: ptr cdouble;
                         TrianglePos2Weight: ptr cdouble;
                         TrianglePos3Weight: ptr cdouble)
##  指定の座標から三角形の重心を求める

proc Segment_Segment_MinLength*(SegmentAPos1: VECTOR; SegmentAPos2: VECTOR;
                               SegmentBPos1: VECTOR; SegmentBPos2: VECTOR): cfloat
##  二つの線分の最近点間の距離を得る

proc Segment_Segment_MinLengthD*(SegmentAPos1: VECTOR_D; SegmentAPos2: VECTOR_D;
                                SegmentBPos1: VECTOR_D; SegmentBPos2: VECTOR_D): cdouble
##  二つの線分の最近点間の距離を得る

proc Segment_Segment_MinLength_Square*(SegmentAPos1: VECTOR; SegmentAPos2: VECTOR;
                                      SegmentBPos1: VECTOR; SegmentBPos2: VECTOR): cfloat
##  二つの線分の最近点間の距離の二乗を得る

proc Segment_Segment_MinLength_SquareD*(SegmentAPos1: VECTOR_D;
                                       SegmentAPos2: VECTOR_D;
                                       SegmentBPos1: VECTOR_D;
                                       SegmentBPos2: VECTOR_D): cdouble
##  二つの線分の最近点間の距離の二乗を得る

proc Segment_Triangle_MinLength*(SegmentPos1: VECTOR; SegmentPos2: VECTOR;
                                TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                                TrianglePos3: VECTOR): cfloat
##  線分と三角形の最近点間の距離を得る

proc Segment_Triangle_MinLengthD*(SegmentPos1: VECTOR_D; SegmentPos2: VECTOR_D;
                                 TrianglePos1: VECTOR_D; TrianglePos2: VECTOR_D;
                                 TrianglePos3: VECTOR_D): cdouble
##  線分と三角形の最近点間の距離を得る

proc Segment_Triangle_MinLength_Square*(SegmentPos1: VECTOR; SegmentPos2: VECTOR;
                                       TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                                       TrianglePos3: VECTOR): cfloat
##  線分と三角形の最近点間の距離の二乗を得る

proc Segment_Triangle_MinLength_SquareD*(SegmentPos1: VECTOR_D;
                                        SegmentPos2: VECTOR_D;
                                        TrianglePos1: VECTOR_D;
                                        TrianglePos2: VECTOR_D;
                                        TrianglePos3: VECTOR_D): cdouble
##  線分と三角形の最近点間の距離の二乗を得る

proc Segment_Point_MinLength*(SegmentPos1: VECTOR; SegmentPos2: VECTOR;
                             PointPos: VECTOR): cfloat
##  線分と点の一番近い距離を得る

proc Segment_Point_MinLengthD*(SegmentPos1: VECTOR_D; SegmentPos2: VECTOR_D;
                              PointPos: VECTOR_D): cdouble
##  線分と点の一番近い距離を得る

proc Segment_Point_MinLength_Square*(SegmentPos1: VECTOR; SegmentPos2: VECTOR;
                                    PointPos: VECTOR): cfloat
##  線分と点の一番近い距離の二乗を得る

proc Segment_Point_MinLength_SquareD*(SegmentPos1: VECTOR_D; SegmentPos2: VECTOR_D;
                                     PointPos: VECTOR_D): cdouble
##  線分と点の一番近い距離の二乗を得る

proc Triangle_Point_MinLength*(TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                              TrianglePos3: VECTOR; PointPos: VECTOR): cfloat
##  三角形と点の一番近い距離を得る

proc Triangle_Point_MinLengthD*(TrianglePos1: VECTOR_D; TrianglePos2: VECTOR_D;
                               TrianglePos3: VECTOR_D; PointPos: VECTOR_D): cdouble
##  三角形と点の一番近い距離を得る

proc Triangle_Point_MinLength_Square*(TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                                     TrianglePos3: VECTOR; PointPos: VECTOR): cfloat
##  三角形と点の一番近い距離の二乗を得る

proc Triangle_Point_MinLength_SquareD*(TrianglePos1: VECTOR_D;
                                      TrianglePos2: VECTOR_D;
                                      TrianglePos3: VECTOR_D; PointPos: VECTOR_D): cdouble
##  三角形と点の一番近い距離の二乗を得る

proc Triangle_Triangle_MinLength*(Triangle1Pos1: VECTOR; Triangle1Pos2: VECTOR;
                                 Triangle1Pos3: VECTOR; Triangle2Pos1: VECTOR;
                                 Triangle2Pos2: VECTOR; Triangle2Pos3: VECTOR): cfloat
##  二つの三角形の最近点間の距離を得る

proc Triangle_Triangle_MinLengthD*(Triangle1Pos1: VECTOR_D;
                                  Triangle1Pos2: VECTOR_D;
                                  Triangle1Pos3: VECTOR_D;
                                  Triangle2Pos1: VECTOR_D;
                                  Triangle2Pos2: VECTOR_D; Triangle2Pos3: VECTOR_D): cdouble
##  二つの三角形の最近点間の距離を得る

proc Triangle_Triangle_MinLength_Square*(Triangle1Pos1: VECTOR;
                                        Triangle1Pos2: VECTOR;
                                        Triangle1Pos3: VECTOR;
                                        Triangle2Pos1: VECTOR;
                                        Triangle2Pos2: VECTOR;
                                        Triangle2Pos3: VECTOR): cfloat
##  二つの三角形の最近点間の距離の二乗を得る

proc Triangle_Triangle_MinLength_SquareD*(Triangle1Pos1: VECTOR_D;
    Triangle1Pos2: VECTOR_D; Triangle1Pos3: VECTOR_D; Triangle2Pos1: VECTOR_D;
    Triangle2Pos2: VECTOR_D; Triangle2Pos3: VECTOR_D): cdouble
##  二つの三角形の最近点間の距離の二乗を得る

proc Plane_Point_MinLength_Position*(PlanePos: VECTOR; PlaneNormal: VECTOR;
                                    PointPos: VECTOR): VECTOR
##  点に一番近い平面上の座標を得る

proc Plane_Point_MinLength_PositionD*(PlanePos: VECTOR_D; PlaneNormal: VECTOR_D;
                                     PointPos: VECTOR_D): VECTOR_D
##  点に一番近い平面上の座標を得る

proc Plane_Point_MinLength*(PlanePos: VECTOR; PlaneNormal: VECTOR; PointPos: VECTOR): cfloat
##  平面と点の一番近い距離を得る

proc Plane_Point_MinLengthD*(PlanePos: VECTOR_D; PlaneNormal: VECTOR_D;
                            PointPos: VECTOR_D): cdouble
##  平面と点の一番近い距離を得る

proc HitCheck_Line_Triangle*(LinePos1: VECTOR; LinePos2: VECTOR;
                            TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                            TrianglePos3: VECTOR): HITRESULT_LINE
##  三角形と線の当たり判定

proc HitCheck_Line_TriangleD*(LinePos1: VECTOR_D; LinePos2: VECTOR_D;
                             TrianglePos1: VECTOR_D; TrianglePos2: VECTOR_D;
                             TrianglePos3: VECTOR_D): HITRESULT_LINE_D
##  三角形と線の当たり判定

proc HitCheck_Triangle_Triangle*(Triangle1Pos1: VECTOR; Triangle1Pos2: VECTOR;
                                Triangle1Pos3: VECTOR; Triangle2Pos1: VECTOR;
                                Triangle2Pos2: VECTOR; Triangle2Pos3: VECTOR): cint
##  三角形と三角形の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Triangle_TriangleD*(Triangle1Pos1: VECTOR_D; Triangle1Pos2: VECTOR_D;
                                 Triangle1Pos3: VECTOR_D; Triangle2Pos1: VECTOR_D;
                                 Triangle2Pos2: VECTOR_D; Triangle2Pos3: VECTOR_D): cint
##  三角形と三角形の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Triangle_Triangle_2D*(Triangle1Pos1: VECTOR; Triangle1Pos2: VECTOR;
                                   Triangle1Pos3: VECTOR; Triangle2Pos1: VECTOR;
                                   Triangle2Pos2: VECTOR; Triangle2Pos3: VECTOR): cint
##  三角形と三角形の当たり判定( ２Ｄ版 )( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Triangle_TriangleD_2D*(Triangle1Pos1: VECTOR_D;
                                    Triangle1Pos2: VECTOR_D;
                                    Triangle1Pos3: VECTOR_D;
                                    Triangle2Pos1: VECTOR_D;
                                    Triangle2Pos2: VECTOR_D;
                                    Triangle2Pos3: VECTOR_D): cint
##  三角形と三角形の当たり判定( ２Ｄ版 )( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Line_Cube*(LinePos1: VECTOR; LinePos2: VECTOR; CubePos1: VECTOR;
                        CubePos2: VECTOR): HITRESULT_LINE
##  線と箱の当たり判定

proc HitCheck_Line_CubeD*(LinePos1: VECTOR_D; LinePos2: VECTOR_D; CubePos1: VECTOR_D;
                         CubePos2: VECTOR_D): HITRESULT_LINE_D
##  線と箱の当たり判定

proc HitCheck_Point_Cone*(PointPos: VECTOR; ConeTopPos: VECTOR;
                         ConeBottomPos: VECTOR; ConeR: cfloat): cint
##  点と円錐の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Point_ConeD*(PointPos: VECTOR_D; ConeTopPos: VECTOR_D;
                          ConeBottomPos: VECTOR_D; ConeR: cdouble): cint
##  点と円錐の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Line_Sphere*(LinePos1: VECTOR; LinePos2: VECTOR;
                          SphereCenterPos: VECTOR; SphereR: cfloat): cint
##  線と球の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Line_SphereD*(LinePos1: VECTOR_D; LinePos2: VECTOR_D;
                           SphereCenterPos: VECTOR_D; SphereR: cdouble): cint
##  線と球の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Sphere_Sphere*(Sphere1CenterPos: VECTOR; Sphere1R: cfloat;
                            Sphere2CenterPos: VECTOR; Sphere2R: cfloat): cint
##  球と球の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Sphere_SphereD*(Sphere1CenterPos: VECTOR_D; Sphere1R: cdouble;
                             Sphere2CenterPos: VECTOR_D; Sphere2R: cdouble): cint
##  球と球の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Sphere_Capsule*(SphereCenterPos: VECTOR; SphereR: cfloat;
                             CapPos1: VECTOR; CapPos2: VECTOR; CapR: cfloat): cint
##  球とカプセルの当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Sphere_CapsuleD*(SphereCenterPos: VECTOR_D; SphereR: cdouble;
                              CapPos1: VECTOR_D; CapPos2: VECTOR_D; CapR: cdouble): cint
##  球とカプセルの当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Sphere_Triangle*(SphereCenterPos: VECTOR; SphereR: cfloat;
                              TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                              TrianglePos3: VECTOR): cint
##  球と三角形の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Sphere_TriangleD*(SphereCenterPos: VECTOR_D; SphereR: cdouble;
                               TrianglePos1: VECTOR_D; TrianglePos2: VECTOR_D;
                               TrianglePos3: VECTOR_D): cint
##  球と三角形の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Capsule_Capsule*(Cap1Pos1: VECTOR; Cap1Pos2: VECTOR; Cap1R: cfloat;
                              Cap2Pos1: VECTOR; Cap2Pos2: VECTOR; Cap2R: cfloat): cint
##  カプセル同士の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Capsule_CapsuleD*(Cap1Pos1: VECTOR_D; Cap1Pos2: VECTOR_D;
                               Cap1R: cdouble; Cap2Pos1: VECTOR_D;
                               Cap2Pos2: VECTOR_D; Cap2R: cdouble): cint
##  カプセル同士の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Capsule_Triangle*(CapPos1: VECTOR; CapPos2: VECTOR; CapR: cfloat;
                               TrianglePos1: VECTOR; TrianglePos2: VECTOR;
                               TrianglePos3: VECTOR): cint
##  カプセルと三角形の当たり判定( TRUE:当たっている  FALSE:当たっていない )

proc HitCheck_Capsule_TriangleD*(CapPos1: VECTOR_D; CapPos2: VECTOR_D; CapR: cdouble;
                                TrianglePos1: VECTOR_D; TrianglePos2: VECTOR_D;
                                TrianglePos3: VECTOR_D): cint
##  カプセルと三角形の当たり判定( TRUE:当たっている  FALSE:当たっていない )
##  その他

proc RectClipping*(Rect: ptr RECT; ClippuRect: ptr RECT): cint
##  矩形のクリッピング

proc RectAdjust*(Rect: ptr RECT): cint
##  矩形の left が right より値が大きい場合などの誤りを補正する

proc GetRectSize*(Rect: ptr RECT; Width: ptr cint; Height: ptr cint): cint
##  矩形の幅と高さを求める
##  表記簡略版

proc MGetIdent*(): MATRIX
##  単位行列を取得する

proc MGetIdentD*(): MATRIX_D
##  単位行列を取得する

proc MMult*(In1: MATRIX; In2: MATRIX): MATRIX
##  行列の乗算を行う

proc MMultD*(In1: MATRIX_D; In2: MATRIX_D): MATRIX_D
##  行列の乗算を行う

proc MScale*(InM: MATRIX; Scale: cfloat): MATRIX
##  行列のスケーリングを行う

proc MScaleD*(InM: MATRIX_D; Scale: cdouble): MATRIX_D
##  行列のスケーリングを行う

proc MAdd*(In1: MATRIX; In2: MATRIX): MATRIX
##  行列の足し算を行う

proc MAddD*(In1: MATRIX_D; In2: MATRIX_D): MATRIX_D
##  行列の足し算を行う

proc MGetScale*(Scale: VECTOR): MATRIX
##  拡大行列を取得する

proc MGetScaleD*(Scale: VECTOR_D): MATRIX_D
##  拡大行列を取得する

proc MGetRotX*(XAxisRotate: cfloat): MATRIX
##  Ｘ軸回転行列を取得する

proc MGetRotXD*(XAxisRotate: cdouble): MATRIX_D
##  Ｘ軸回転行列を取得する

proc MGetRotY*(YAxisRotate: cfloat): MATRIX
##  Ｙ軸回転行列を取得する

proc MGetRotYD*(YAxisRotate: cdouble): MATRIX_D
##  Ｙ軸回転行列を取得する

proc MGetRotZ*(ZAxisRotate: cfloat): MATRIX
##  Ｚ軸回転行列を取得する

proc MGetRotZD*(ZAxisRotate: cdouble): MATRIX_D
##  Ｚ軸回転行列を取得する

proc MGetRotAxis*(RotateAxis: VECTOR; Rotate: cfloat): MATRIX
##  指定軸で指定角度回転する行列を取得する

proc MGetRotAxisD*(RotateAxis: VECTOR_D; Rotate: cdouble): MATRIX_D
##  指定軸で指定角度回転する行列を取得する

proc MGetRotVec2*(In1: VECTOR; In2: VECTOR): MATRIX
##  In1 の向きから In2 の向きへ変換する回転行列を取得する( In2 と In1 が真逆のベクトルの場合は回転軸は不定 )

proc MGetRotVec2D*(In1: VECTOR_D; In2: VECTOR_D): MATRIX_D
##  In1 の向きから In2 の向きへ変換する回転行列を取得する( In2 と In1 が真逆のベクトルの場合は回転軸は不定 )

proc MGetTranslate*(Trans: VECTOR): MATRIX
##  平行移動行列を取得する

proc MGetTranslateD*(Trans: VECTOR_D): MATRIX_D
##  平行移動行列を取得する

proc MGetAxis1*(XAxis: VECTOR; YAxis: VECTOR; ZAxis: VECTOR; Pos: VECTOR): MATRIX
##  指定の３軸ローカルのベクトルを基本軸上のベクトルに変換する行列を取得する( x' = XAxis.x * x + YAixs.x * y + ZAxis.z * z + Pos.x   y' = XAxis.y * x + YAixs.y * y + ZAxis.y * z + Pos.y      z' = XAxis.z * x + YAixs.z * y + ZAxis.z * z + Pos.z )

proc MGetAxis1D*(XAxis: VECTOR_D; YAxis: VECTOR_D; ZAxis: VECTOR_D; Pos: VECTOR_D): MATRIX_D
##  指定の３軸ローカルのベクトルを基本軸上のベクトルに変換する行列を取得する( x' = XAxis.x * x + YAixs.x * y + ZAxis.z * z + Pos.x   y' = XAxis.y * x + YAixs.y * y + ZAxis.y * z + Pos.y      z' = XAxis.z * x + YAixs.z * y + ZAxis.z * z + Pos.z )

proc MGetAxis2*(XAxis: VECTOR; YAxis: VECTOR; ZAxis: VECTOR; Pos: VECTOR): MATRIX
##  基本軸上のベクトルを指定の３軸上に投影したベクトルに変換する行列を取得する( x' = XAxis.x * ( x - Pos.x ) + XAxis.y * ( x - Pos.x ) + XAxis.z * ( x - Pos.x )    y' = YAxis.x * ( x - Pos.x ) + YAxis.y * ( x - Pos.x ) + YAxis.z * ( x - Pos.x )    z' = ZAxis.x * ( x - Pos.x ) + ZAxis.y * ( x - Pos.x ) + ZAxis.z * ( x - Pos.x ) )

proc MGetAxis2D*(XAxis: VECTOR_D; YAxis: VECTOR_D; ZAxis: VECTOR_D; Pos: VECTOR_D): MATRIX_D
##  基本軸上のベクトルを指定の３軸上に投影したベクトルに変換する行列を取得する( x' = XAxis.x * ( x - Pos.x ) + XAxis.y * ( x - Pos.x ) + XAxis.z * ( x - Pos.x )    y' = YAxis.x * ( x - Pos.x ) + YAxis.y * ( x - Pos.x ) + YAxis.z * ( x - Pos.x )    z' = ZAxis.x * ( x - Pos.x ) + ZAxis.y * ( x - Pos.x ) + ZAxis.z * ( x - Pos.x ) )

proc MTranspose*(InM: MATRIX): MATRIX
##  転置行列を取得する

proc MTransposeD*(InM: MATRIX_D): MATRIX_D
##  転置行列を取得する

proc MInverse*(InM: MATRIX): MATRIX
##  逆行列を取得する

proc MInverseD*(InM: MATRIX_D): MATRIX_D
##  逆行列を取得する

proc MGetSize*(InM: MATRIX): VECTOR
##  拡大行列のＸ軸、Ｙ軸、Ｚ軸の拡大率を取得する

proc MGetSizeD*(InM: MATRIX_D): VECTOR_D
##  拡大行列のＸ軸、Ｙ軸、Ｚ軸の拡大率を取得する

proc MGetRotElem*(InM: MATRIX): MATRIX
##  行列の回転成分を取得する

proc MGetRotElemD*(InM: MATRIX_D): MATRIX_D
##  行列の回転成分を取得する
##  行列の平行移動成分を取得する

proc MGetTranslateElem*(InM: var MATRIX): VECTOR =
  discard

##  行列の平行移動成分を取得する

proc MGetTranslateElemD*(InM: var MATRIX_D): VECTOR_D =
  discard

##  ベクトル値の変換

proc VConvFtoD*(In: VECTOR): VECTOR_D =
  discard

proc VConvDtoF*(In: VECTOR_D): VECTOR =
  discard

##  ベクトル値の生成

proc VGet*(x: cfloat; y: cfloat; z: cfloat): VECTOR =
  discard

proc VGetD*(x: cdouble; y: cdouble; z: cdouble): VECTOR_D =
  discard

proc F2Get*(u: cfloat; v: cfloat): FLOAT2 =
  discard

##  ４要素ベクトル値の生成

proc F4Get*(x: cfloat; y: cfloat; z: cfloat; w: cfloat): FLOAT4 =
  discard

proc D4Get*(x: cdouble; y: cdouble; z: cdouble; w: cdouble): DOUBLE4 =
  discard

##  ベクトルの加算

proc VAdd*(In1: VECTOR; In2: VECTOR): VECTOR =
  discard

proc VAddD*(In1: VECTOR_D; In2: VECTOR_D): VECTOR_D =
  discard

##  ベクトルの減算

proc VSub*(In1: VECTOR; In2: VECTOR): VECTOR =
  discard

proc VSubD*(In1: VECTOR_D; In2: VECTOR_D): VECTOR_D =
  discard

proc F2Add*(In1: FLOAT2; In2: FLOAT2): FLOAT2 =
  discard

##  ４要素ベクトルの加算

proc F4Add*(In1: FLOAT4; In2: FLOAT4): FLOAT4 =
  discard

proc D4Add*(In1: DOUBLE4; In2: DOUBLE4): DOUBLE4 =
  discard

proc F2Sub*(In1: FLOAT2; In2: FLOAT2): FLOAT2 =
  discard

##  ４要素ベクトルの減算

proc F4Sub*(In1: FLOAT4; In2: FLOAT4): FLOAT4 =
  discard

proc D4Sub*(In1: DOUBLE4; In2: DOUBLE4): DOUBLE4 =
  discard

##  ベクトルの内積

proc VDot*(In1: VECTOR; In2: VECTOR): cfloat =
  discard

proc VDotD*(In1: VECTOR_D; In2: VECTOR_D): cdouble =
  discard

##  ベクトルの外積

proc VCross*(In1: VECTOR; In2: VECTOR): VECTOR =
  discard

proc VCrossD*(In1: VECTOR_D; In2: VECTOR_D): VECTOR_D =
  discard

##  ベクトルのスケーリング

proc VScale*(In: VECTOR; Scale: cfloat): VECTOR =
  discard

proc VScaleD*(In: VECTOR_D; Scale: cdouble): VECTOR_D =
  discard

proc F2Scale*(In: FLOAT2; Scale: cfloat): FLOAT2 =
  discard

##  ４要素ベクトルのスケーリング

proc F4Scale*(In: FLOAT4; Scale: cfloat): FLOAT4 =
  discard

proc D4Scale*(In: DOUBLE4; Scale: cdouble): DOUBLE4 =
  discard

##  ベクトルの正規化

proc VNorm*(In: VECTOR): VECTOR
proc VNormD*(In: VECTOR_D): VECTOR_D
##  ベクトルのサイズ

proc VSize*(In: VECTOR): cfloat
proc VSizeD*(In: VECTOR_D): cdouble
##  ベクトルのサイズの２乗

proc VSquareSize*(In: VECTOR): cfloat =
  discard

proc VSquareSizeD*(In: VECTOR_D): cdouble =
  discard

##  行列を使った座標変換

proc VTransform*(InV: VECTOR; InM: MATRIX): VECTOR =
  discard

proc VTransformD*(InV: VECTOR_D; InM: MATRIX_D): VECTOR_D =
  discard

##  行列を使った座標変換( スケーリング＋回転成分のみ )

proc VTransformSR*(InV: VECTOR; InM: MATRIX): VECTOR =
  discard

proc VTransformSRD*(InV: VECTOR_D; InM: MATRIX_D): VECTOR_D =
  discard

##  二つのベクトルが成す角のコサイン値を得る

proc VCos*(In1: VECTOR; In2: VECTOR): cfloat
proc VCosD*(In1: VECTOR_D; In2: VECTOR_D): cdouble
##  二つのベクトルが成す角の角度を得る( 単位：ラジアン )

proc VRad*(In1: VECTOR; In2: VECTOR): cfloat
proc VRadD*(In1: VECTOR_D; In2: VECTOR_D): cdouble
##  2つのクォータニオンの乗算の結果を返す

proc QTCross*(A: FLOAT4; B: FLOAT4): FLOAT4 =
  discard

proc QTCrossD*(A: DOUBLE4; B: DOUBLE4): DOUBLE4 =
  discard

##  共役クォータニオンを返す

proc QTConj*(A: FLOAT4): FLOAT4 =
  discard

proc QTConjD*(A: DOUBLE4): DOUBLE4 =
  discard

##  回転を表すクォータニオンを返す

proc QTRot*(Axis: VECTOR; Angle: cfloat): FLOAT4
proc QTRotD*(Axis: VECTOR_D; Angle: cdouble): DOUBLE4
##  3次元空間上の点を任意の軸の周りに任意の角度だけ回転させる関数

proc VRotQ*(P: VECTOR; Axis: VECTOR; Angle: cfloat): VECTOR
proc VRotQD*(P: VECTOR_D; Axis: VECTOR_D; Angle: cdouble): VECTOR_D
##  DxBaseImage.cpp 関数プロトタイプ宣言
##  基本イメージデータのロード＋ＤＩＢ関係

proc CreateGraphImageOrDIBGraph*(FileName: ptr TCHAR; DataImage: pointer;
                                DataImageSize: cint; DataImageType: cint; ##  LOADIMAGE_TYPE_FILE 等
                                BmpFlag: cint; ReverseFlag: cint;
                                BaseImage: ptr BASEIMAGE;
                                BmpInfo: ptr ptr BITMAPINFO; GraphData: ptr pointer): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータ若しくはＢＭＰデータを構築する

proc CreateGraphImageOrDIBGraphWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; DataImage: pointer; DataImageSize: cint; DataImageType: cint; ##  LOADIMAGE_TYPE_FILE 等
    BmpFlag: cint; ReverseFlag: cint; BaseImage: ptr BASEIMAGE;
    BmpInfo: ptr ptr BITMAPINFO; GraphData: ptr pointer): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータ若しくはＢＭＰデータを構築する

proc CreateGraphImageType2*(Src: ptr STREAMDATA; Dest: ptr BASEIMAGE): cint
##  画像データから構築したストリーム読み込み用データを使用して基本イメージデータを構築する

proc CreateBmpInfo*(BmpInfo: ptr BITMAPINFO; Width: cint; Height: cint; Pitch: cint;
                   SrcGrData: pointer; DestGrData: ptr pointer): cint
##  24bitカラー形式のビットマップデータからＢＭＰデータを構築する

proc GetImageSize_File*(FileName: ptr TCHAR; SizeX: ptr cint; SizeY: ptr cint): cint
##  画像ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetImageSize_FileWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                 SizeX: ptr cint; SizeY: ptr cint): cint
##  画像ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetImageSize_Mem*(FileImage: pointer; FileImageSize: cint; SizeX: ptr cint;
                      SizeY: ptr cint): cint
##  メモリ上に展開された画像ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetGraphImageFullColorCode*(GraphImage: ptr BASEIMAGE; x: cint; y: cint): cuint
##  基本イメージデータの指定座標のフルカラーコードを取得する

proc CreateGraphImage_plus_Alpha*(FileName: ptr TCHAR; RgbImage: pointer;
                                 RgbImageSize: cint; RgbImageType: cint;
                                 AlphaImage: pointer; AlphaImageSize: cint;
                                 AlphaImageType: cint;
                                 RgbGraphImage: ptr BASEIMAGE;
                                 AlphaGraphImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータを構築する

proc CreateGraphImage_plus_AlphaWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; RgbImage: pointer; RgbImageSize: cint;
    RgbImageType: cint; AlphaImage: pointer; AlphaImageSize: cint;
    AlphaImageType: cint; RgbGraphImage: ptr BASEIMAGE;
    AlphaGraphImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータを構築する

proc ReverseGraphImage*(GraphImage: ptr BASEIMAGE): cint
##  基本イメージデータを左右反転する
## extern int		AddUserGraphLoadFunction( int ( *UserLoadFunc )( FILE *fp, BITMAPINFO **BmpInfo, void **GraphData ) ) ;																						// ユーザー定義の画像データ読み込み関数を登録する
## extern int		AddUserGraphLoadFunction2( int ( *UserLoadFunc )( void *Image, int ImageSize, int ImageType, BITMAPINFO **BmpInfo, void **GraphData ) ) ;													// ユーザー定義の画像データ読み込み関数を登録する
## extern int		AddUserGraphLoadFunction3( int ( *UserLoadFunc )( void *DataImage, int DataImageSize, int DataImageType, int BmpFlag, BASEIMAGE *BaseImage, BITMAPINFO **BmpInfo, void **GraphData ) ) ;	// ユーザー定義の画像データ読み込み関数Ver3を登録する

proc AddUserGraphLoadFunction4*(UserLoadFunc: proc (Src: ptr STREAMDATA;
    BaseImage: ptr BASEIMAGE): cint): cint
##  ユーザー定義の画像データ読み込み関数Ver4を登録する
## extern int		SubUserGraphLoadFunction( int ( *UserLoadFunc )( FILE *fp, BITMAPINFO **BmpInfo, void **GraphData ) ) ;																						// ユーザー定義の画像データ読み込み関数を登録から抹消する
## extern int		SubUserGraphLoadFunction2( int ( *UserLoadFunc )( void *Image, int ImageSize, int ImageType, BITMAPINFO **BmpInfo, void **GraphData ) ) ;													// ユーザー定義の画像データ読み込み関数を登録から抹消する
## extern int		SubUserGraphLoadFunction3( int ( *UserLoadFunc )( void *DataImage, int DataImageSize, int DataImageType, int BmpFlag, BASEIMAGE *BaseImage, BITMAPINFO **BmpInfo, void **GraphData ) ) ;	// ユーザー定義の画像データ読み込み関数Ver3を登録から抹消する

proc SubUserGraphLoadFunction4*(UserLoadFunc: proc (Src: ptr STREAMDATA;
    BaseImage: ptr BASEIMAGE): cint): cint
##  ユーザー定義の画像データ読み込み関数Ver4を登録から抹消する

proc SetUseFastLoadFlag*(Flag: cint): cint
##  高速読み込みルーチンを使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )

proc SetGraphDataShavedMode*(ShavedMode: cint): cint
  ##  DX_SHAVEDMODE_NONE 等
##  画像減色時の画像劣化緩和処理モードを設定する( デフォルトでは緩和処理無しの DX_SHAVEDMODE_NONE )

proc GetGraphDataShavedMode*(): cint
##  画像減色時の画像劣化緩和処理モードを取得する

proc SetUsePremulAlphaConvertLoad*(UseFlag: cint): cint
##  画像ファイル読み込み時に乗算済みアルファ画像に変換するかどうかを設定する( TRUE:変換処理を行う  FALSE:変換処理を行わない( デフォルト ) )

proc GetUsePremulAlphaConvertLoad*(): cint
##  画像ファイル読み込み時に乗算済みアルファ画像に変換するかどうかを取得する( TRUE:変換処理を行う  FALSE:変換処理を行わない( デフォルト ) )

proc SetUseConvertNormalFormatLoad*(UseFlag: cint): cint
##  画像ファイル読み込み時に DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換するかどうかを設定する( TRUE:変換処理を行う  FALSE:変換処理を行なわない( デフォルト ) )

proc GetUseConvertNormalFormatLoad*(): cint
##  画像ファイル読み込み時に DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換するかどうかを取得する( TRUE:変換処理を行う  FALSE:変換処理を行なわない( デフォルト ) )
##  基本イメージデータ構造体関係

proc CreateBaseImage*(FileName: ptr TCHAR; FileImage: pointer; FileImageSize: cint; DataType: cint; ## =LOADIMAGE_TYPE_FILE
                     BaseImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージから基本イメージデータを構築する

proc CreateBaseImageWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                               FileImage: pointer; FileImageSize: cint; DataType: cint; ## =LOADIMAGE_TYPE_FILE
                               BaseImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージから基本イメージデータを構築する

proc CreateGraphImage*(FileName: ptr TCHAR; DataImage: pointer; DataImageSize: cint;
                      DataImageType: cint; GraphImage: ptr BASEIMAGE;
                      ReverseFlag: cint): cint
##  CreateBaseImage の旧名称

proc CreateBaseImageToFile*(FileName: ptr TCHAR; BaseImage: ptr BASEIMAGE;
                           ReverseFlag: cint = FALSE): cint
##  画像ファイルから基本イメージデータを構築する

proc CreateBaseImageToFileWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                     BaseImage: ptr BASEIMAGE;
                                     ReverseFlag: cint = FALSE): cint
##  画像ファイルから基本イメージデータを構築する

proc CreateBaseImageToMem*(FileImage: pointer; FileImageSize: cint;
                          BaseImage: ptr BASEIMAGE; ReverseFlag: cint = FALSE): cint
##  メモリ上に展開された画像ファイルイメージから基本イメージデータを構築する

proc CreateARGBF32ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ各チャンネル 32bit 浮動小数点型 カラーの基本イメージデータを作成する

proc CreateARGBF16ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ各チャンネル 16bit 浮動小数点型 カラーの基本イメージデータを作成する

proc CreateXRGB8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＸＲＧＢ８カラーの基本イメージデータを作成する

proc CreateARGB8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ８カラーの基本イメージデータを作成する

proc CreateRGBA8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＲＧＢＡ８カラーの基本イメージデータを作成する

proc CreateABGR8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＢＧＲ８カラーの基本イメージデータを作成する

proc CreateBGRA8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＢＧＲＡ８カラーの基本イメージデータを作成する

proc CreateARGB4ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ４カラーの基本イメージデータを作成する

proc CreateA1R5G5B5ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ａ１Ｒ５Ｇ５Ｂ５カラーの基本イメージデータを作成する

proc CreateX1R5G5B5ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ｘ１Ｒ５Ｇ５Ｂ５カラーの基本イメージデータを作成する

proc CreateR5G5B5A1ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ｒ５Ｇ５Ｂ５Ａ１カラーの基本イメージデータを作成する

proc CreateR5G6B5ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ｒ５Ｇ６Ｂ５カラーの基本イメージデータを作成する

proc CreateRGB8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＲＧＢ８カラーの基本イメージデータを作成する

proc CreatePAL8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE;
                              UseAlpha: cint = FALSE): cint
##  パレット８ビットカラーの基本イメージデータを作成する

proc CreateColorDataBaseImage*(SizeX: cint; SizeY: cint; ColorData: ptr COLORDATA;
                              BaseImage: ptr BASEIMAGE): cint
##  指定のカラーフォーマットの基本イメージデータを作成する

proc GetBaseImageGraphDataSize*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータのイメージサイズを取得する( 単位：byte )

proc DerivationBaseImage*(BaseImage: ptr BASEIMAGE; x1: cint; y1: cint; x2: cint;
                         y2: cint; NewBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータの指定の部分だけを使う基本イメージデータの情報を作成する( BaseImage にはフォーマットが DX_BASEIMAGE_FORMAT_NORMAL でミップマップを使用していない画像のみ使用可能 )

proc ReleaseBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータの後始末を行う

proc ReleaseGraphImage*(GraphImage: ptr BASEIMAGE): cint
##  ReleaseBaseImage の旧名称

proc ConvertNormalFormatBaseImage*(BaseImage: ptr BASEIMAGE;
                                  ReleaseOrigGraphData: cint = TRUE): cint
##  DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換する

proc ConvertPremulAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  通常のαチャンネル付き画像を乗算済みαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc ConvertInterpAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  乗算済みαチャンネル付き画像を通常のαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc GetDrawScreenBaseImage*(x1: cint; y1: cint; x2: cint; y2: cint;
                            BaseImage: ptr BASEIMAGE): cint
##  描画対象の画面から指定領域を基本イメージデータに転送する

proc GetDrawScreenBaseImageDestPos*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   BaseImage: ptr BASEIMAGE; DestX: cint; DestY: cint): cint
##  描画対象の画面から指定領域を基本イメージデータに転送する( 転送先座標指定版 )

proc FillBaseImage*(BaseImage: ptr BASEIMAGE; r: cint; g: cint; b: cint; a: cint): cint
##  基本イメージデータを指定の色で塗りつぶす

proc FillRectBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; w: cint; h: cint;
                       r: cint; g: cint; b: cint; a: cint): cint
##  基本イメージデータの指定の領域を指定の色で塗りつぶす

proc ClearRectBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; w: cint; h: cint): cint
##  基本イメージデータの指定の領域を０クリアする

proc GetPaletteBaseImage*(BaseImage: ptr BASEIMAGE; PaletteNo: cint; r: ptr cint;
                         g: ptr cint; b: ptr cint; a: ptr cint): cint
##  基本イメージデータのパレットを取得する

proc SetPaletteBaseImage*(BaseImage: ptr BASEIMAGE; PaletteNo: cint; r: cint; g: cint;
                         b: cint; a: cint): cint
##  基本イメージデータのパレットをセットする

proc SetPixelPalCodeBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; palNo: cint): cint
##  基本イメージデータの指定の座標の色コードを変更する(パレット画像用)

proc GetPixelPalCodeBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint): cint
##  基本イメージデータの指定の座標の色コードを取得する(パレット画像用)

proc SetPixelBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: cint; g: cint;
                       b: cint; a: cint): cint
##  基本イメージデータの指定の座標の色を変更する(各色要素は０～２５５)

proc SetPixelBaseImageF*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: cfloat; g: cfloat;
                        b: cfloat; a: cfloat): cint
##  基本イメージデータの指定の座標の色を変更する(各色要素は浮動小数点数)

proc GetPixelBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: ptr cint;
                       g: ptr cint; b: ptr cint; a: ptr cint): cint
##  基本イメージデータの指定の座標の色を取得する(各色要素は０～２５５)

proc GetPixelBaseImageF*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: ptr cfloat;
                        g: ptr cfloat; b: ptr cfloat; a: ptr cfloat): cint
##  基本イメージデータの指定の座標の色を取得する(各色要素は浮動小数点数)

proc DrawLineBaseImage*(BaseImage: ptr BASEIMAGE; x1: cint; y1: cint; x2: cint; y2: cint;
                       r: cint; g: cint; b: cint; a: cint): cint
##  基本イメージデータの指定の座標に線を描画する(各色要素は０～２５５)

proc DrawCircleBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; radius: cint;
                         r: cint; g: cint; b: cint; a: cint; FillFlag: cint = TRUE): cint
##  基本イメージデータの指定の座標に円を描画する(各色要素は０～２５５)

proc BltBaseImage*(SrcX: cint; SrcY: cint; SrcSizeX: cint; SrcSizeY: cint; DestX: cint;
                  DestY: cint; SrcBaseImage: ptr BASEIMAGE;
                  DestBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを別の基本イメージデータに転送する

proc BltBaseImage*(DestX: cint; DestY: cint; SrcBaseImage: ptr BASEIMAGE;
                  DestBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを別の基本イメージデータに転送する

proc BltBaseImage2*(DestX: cint; DestY: cint; SrcBaseImage: ptr BASEIMAGE;
                   DestBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを別の基本イメージデータに転送する

proc BltBaseImageWithTransColor*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; DestX: cint; DestY: cint;
                                SrcBaseImage: ptr BASEIMAGE;
                                DestBaseImage: ptr BASEIMAGE; Tr: cint; Tg: cint;
                                Tb: cint; Ta: cint): cint
##  基本イメージデータを別の基本イメージデータに透過色処理付きで転送する

proc BltBaseImageWithAlphaBlend*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; DestX: cint; DestY: cint;
                                SrcBaseImage: ptr BASEIMAGE;
                                DestBaseImage: ptr BASEIMAGE; Opacity: cint = 255): cint
##  基本イメージデータを別の基本イメージデータにアルファ値のブレンドを考慮した上で転送する( Opacity は透明度 : 0( 完全透明 ) ～ 255( 完全不透明 ) )( 出力先が ARGB8 形式以外の場合はエラーになります )

proc ReverseBaseImageH*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを左右反転する

proc ReverseBaseImageV*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを上下反転する

proc ReverseBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを上下左右反転する

proc CheckPixelAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータに含まれるピクセルのアルファ値をチェックする( 戻り値   -1:エラー  0:画像にアルファ成分が無い  1:画像にアルファ成分があり、すべて最大(255)値  2:画像にアルファ成分があり、存在するアルファ値は最小(0)と最大(255)もしくは最小(0)のみ　3:画像にアルファ成分があり、最小と最大以外の中間の値がある )

proc GetBaseImageUseMaxPaletteNo*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータで使用されているパレット番号の最大値を取得する( パレット画像では無い場合は -1 が返る )

proc ReadJpegExif*(JpegFilePath: ptr TCHAR; ExifBuffer_Array: ptr BYTE;
                  ExifBufferSize: csize_t): cint
##  JPEGファイルの Exif情報を取得する、ExifBuffer を NULL に渡すと、戻り値の情報のサイズのみ取得できます( 戻り値  -1:エラー  -1以外：Exif情報のサイズ )

proc ReadJpegExifWithStrLen*(JpegFilePath: ptr TCHAR; JpegFilePathLength: csize_t;
                            ExifBuffer_Array: ptr BYTE; ExifBufferSize: csize_t): cint
##  JPEGファイルの Exif情報を取得する、ExifBuffer を NULL に渡すと、戻り値の情報のサイズのみ取得できます( 戻り値  -1:エラー  -1以外：Exif情報のサイズ )

proc SaveBaseImageToBmp*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＢＭＰ画像として保存する

proc SaveBaseImageToBmpWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＢＭＰ画像として保存する

proc SaveBaseImageToDds*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＤＤＳ画像として保存する

proc SaveBaseImageToDdsWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＤＤＳ画像として保存する

proc SaveBaseImageToPng*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE;
                        CompressionLevel: cint): cint
##  基本イメージデータをＰＮＧ画像として保存する

proc SaveBaseImageToPngWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  BaseImage: ptr BASEIMAGE; CompressionLevel: cint): cint
##  基本イメージデータをＰＮＧ画像として保存する

proc SaveBaseImageToJpeg*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE; Quality: cint;
                         Sample2x1: cint): cint
##  基本イメージデータをＪＰＥＧ画像として保存する

proc SaveBaseImageToJpegWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                   BaseImage: ptr BASEIMAGE; Quality: cint;
                                   Sample2x1: cint): cint
##  基本イメージデータをＪＰＥＧ画像として保存する
##  基本イメージ描画

proc DrawBaseImage*(x: cint; y: cint; BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを描画する
##  カラーマッチングしながらイメージデータ間転送を行う Ver2

proc GraphColorMatchBltVer2*(DestGraphData: pointer; DestPitch: cint;
                            DestColorData: ptr COLORDATA; SrcGraphData: pointer;
                            SrcPitch: cint; SrcColorData: ptr COLORDATA;
                            AlphaMask: pointer; AlphaPitch: cint;
                            AlphaColorData: ptr COLORDATA; DestPoint: POINT;
                            SrcRect: ptr RECT; ReverseFlag: cint;
                            TransColorAlphaTestFlag: cint; TransColor: cuint;
                            ImageShavedMode: cint; AlphaOnlyFlag: cint = FALSE;
                            RedIsAlphaFlag: cint = FALSE;
                            TransColorNoMoveFlag: cint = FALSE;
                            Pal8ColorMatch: cint = FALSE): cint
##  色情報取得関係

proc GetColorF*(Red: cfloat; Green: cfloat; Blue: cfloat; Alpha: cfloat): COLOR_F
##  浮動小数点型のカラー値を作成する

proc GetColorU8*(Red: cint; Green: cint; Blue: cint; Alpha: cint): COLOR_U8
##  符号なし整数８ビットのカラー値を作成する

proc GetColor*(Red: cint; Green: cint; Blue: cint): cuint
##  DrawPixel 等の描画関数で使用するカラー値を取得する

proc GetColor2*(Color: cuint; Red: ptr cint; Green: ptr cint; Blue: ptr cint): cint
##  カラー値から赤、緑、青の値を取得する

proc GetColor3*(ColorData: ptr COLORDATA; Red: cint; Green: cint; Blue: cint;
               Alpha: cint = 255): cuint
##  指定のピクセルフォーマットに対応したカラー値を得る

proc GetColor4*(DestColorData: ptr COLORDATA; SrcColorData: ptr COLORDATA;
               SrcColor: cuint): cuint
##  指定のカラーフォーマットのカラー値を別のカラーフォーマットのカラー値に変換する

proc GetColor5*(ColorData: ptr COLORDATA; Color: cuint; Red: ptr cint; Green: ptr cint;
               Blue: ptr cint; Alpha: ptr cint = nil): cint
##  指定のカラーフォーマットのカラー値を赤、緑、青、アルファの値を取得する

proc CreatePaletteColorData*(ColorDataBuf: ptr COLORDATA): cint
##  パレットカラーのカラーフォーマットを構築する

proc CreateARGBF32ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ各チャンネル 32bit 浮動小数点型カラーのカラーフォーマットを構築する

proc CreateARGBF16ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ各チャンネル 16bit 浮動小数点型カラーのカラーフォーマットを構築する

proc CreateXRGB8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＸＲＧＢ８カラーのカラーフォーマットを構築する

proc CreateARGB8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ８カラーのカラーフォーマットを構築する

proc CreateRGBA8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＲＧＢＡ８カラーのカラーフォーマットを構築する

proc CreateABGR8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＢＧＲ８カラーのカラーフォーマットを構築する

proc CreateBGRA8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＢＧＲＡ８カラーのカラーフォーマットを構築する

proc CreateBGR8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＢＧＲ８カラーのカラーフォーマットを構築する

proc CreateARGB4ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ４カラーのカラーフォーマットを構築する

proc CreateA1R5G5B5ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ａ１Ｒ５Ｇ５Ｂ５カラーのカラーフォーマットを構築する

proc CreateX1R5G5B5ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ｘ１Ｒ５Ｇ５Ｂ５カラーのカラーフォーマットを構築する

proc CreateR5G5B5A1ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ｒ５Ｇ５Ｂ５Ａ１カラーのカラーフォーマットを構築する

proc CreateR5G6B5ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ｒ５Ｇ６Ｂ５カラーのカラーフォーマットを構築する

proc CreateFullColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ２４ビットカラーのカラーフォーマットを構築する

proc CreateGrayColorData*(ColorDataBuf: ptr COLORDATA): cint
##  グレースケールのカラーフォーマットを構築する

proc CreatePal8ColorData*(ColorDataBuf: ptr COLORDATA; UseAlpha: cint = FALSE): cint
##  パレット２５６色のカラーフォーマットを構築する

proc CreateColorData*(ColorDataBuf: ptr COLORDATA; ColorBitDepth: cint;
                     RedMask: DWORD; GreenMask: DWORD; BlueMask: DWORD;
                     AlphaMask: DWORD; ChannelNum: cint = 0;
                     ChannelBitDepth: cint = 0; FloatTypeFlag: cint = FALSE): cint
##  カラーフォーマットを作成する

proc SetColorDataNoneMask*(ColorData: ptr COLORDATA)
##  NoneMask 以外の要素を埋めた COLORDATA 構造体の情報を元に NoneMask をセットする

proc CmpColorData*(ColorData1: ptr COLORDATA; ColorData2: ptr COLORDATA): cint
##  二つのカラーフォーマットが等しいかどうか調べる( 戻り値　TRUE:等しい  FALSE:等しくない )
##  DxSoftImage.cpp関数プロトタイプ宣言

proc InitSoftImage*(): cint
##  ソフトウエアイメージハンドルを全て削除する

proc LoadSoftImage*(FileName: ptr TCHAR): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )

proc LoadSoftImageWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )

proc LoadARGB8ColorSoftImage*(FileName: ptr TCHAR): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )

proc LoadARGB8ColorSoftImageWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )

proc LoadXRGB8ColorSoftImage*(FileName: ptr TCHAR): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )

proc LoadXRGB8ColorSoftImageWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )

proc LoadSoftImageToMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )

proc LoadARGB8ColorSoftImageToMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )

proc LoadXRGB8ColorSoftImageToMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )

proc MakeSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( -1:エラー  -1以外:イメージハンドル )

proc MakeARGBF32ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA 各チャンネル 32bit 浮動小数点型 カラー )

proc MakeARGBF16ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA 各チャンネル 16bit 浮動小数点型 カラー )

proc MakeXRGB8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( XRGB8 カラー )

proc MakeARGB8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA8 カラー )

proc MakeRGBA8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA8 カラー )

proc MakeABGR8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( ABGR8 カラー )

proc MakeBGRA8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( BGRA8 カラー )

proc MakeARGB4ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( ARGB4 カラー )

proc MakeA1R5G5B5ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( A1R5G5B5 カラー )

proc MakeX1R5G5B5ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( X1R5G5B5 カラー )

proc MakeR5G5B5A1ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( R5G5B5A1 カラー )

proc MakeR5G6B5ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( R5G6B5 カラー )

proc MakeRGB8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGB8 カラー )

proc MakePAL8ColorSoftImage*(SizeX: cint; SizeY: cint; UseAlpha: cint = FALSE): cint
##  ソフトウエアイメージハンドルの作成( パレット２５６色 カラー )

proc MakeColorDataSoftImage*(SizeX: cint; SizeY: cint; ColorData: ptr COLORDATA): cint
##  ソフトウエアイメージハンドルの作成( COLORDATA でフォーマット指定 )

proc DeleteSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルの削除する

proc GetSoftImageSize*(SIHandle: cint; Width: ptr cint; Height: ptr cint): cint
##  ソフトウエアイメージハンドルのサイズを取得する

proc CheckPaletteSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルがパレット画像かどうかを取得する( TRUE:パレット画像  FALSE:パレット画像じゃない )

proc CheckAlphaSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルのフォーマットにα要素があるかどうかを取得する( TRUE:ある  FALSE:ない )

proc CheckPixelAlphaSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルに含まれるピクセルのα値をチェックする( 戻り値   -1:エラー  0:画像にα成分が無い  1:画像にα成分があり、すべて最大(255)値  2:画像にα成分があり、存在するα値は最小(0)と最大(255)もしくは最小(0)のみ　3:画像にα成分があり、最小と最大以外の中間の値がある )

proc GetDrawScreenSoftImage*(x1: cint; y1: cint; x2: cint; y2: cint; SIHandle: cint): cint
##  描画対象の画面から指定領域をソフトウエアイメージハンドルに転送する

proc GetDrawScreenSoftImageDestPos*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   SIHandle: cint; DestX: cint; DestY: cint): cint
##  描画対象の画面から指定領域をソフトウエアイメージハンドルに転送する( 転送先座標指定版 )

proc FillSoftImage*(SIHandle: cint; r: cint; g: cint; b: cint; a: cint): cint
##  ソフトウエアイメージハンドルを指定色で塗りつぶす(各色要素は０～２５５)

proc ClearRectSoftImage*(SIHandle: cint; x: cint; y: cint; w: cint; h: cint): cint
##  ソフトウエアイメージハンドルの指定の領域を０クリアする

proc GetPaletteSoftImage*(SIHandle: cint; PaletteNo: cint; r: ptr cint; g: ptr cint;
                         b: ptr cint; a: ptr cint): cint
##  ソフトウエアイメージハンドルのパレットを取得する(各色要素は０～２５５)

proc SetPaletteSoftImage*(SIHandle: cint; PaletteNo: cint; r: cint; g: cint; b: cint;
                         a: cint): cint
##  ソフトウエアイメージハンドルのパレットを設定する(各色要素は０～２５５)

proc DrawPixelPalCodeSoftImage*(SIHandle: cint; x: cint; y: cint; palNo: cint): cint
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(パレット画像用、有効値は０～２５５)

proc GetPixelPalCodeSoftImage*(SIHandle: cint; x: cint; y: cint): cint
##  ソフトウエアイメージハンドルの指定座標の色コードを取得する(パレット画像用、戻り値は０～２５５)

proc GetImageAddressSoftImage*(SIHandle: cint): pointer
##  ソフトウエアイメージハンドルの画像が格納されているメモリ領域の先頭アドレスを取得する

proc GetPitchSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルのメモリに格納されている画像データの1ライン辺りのバイト数を取得する

proc DrawPixelSoftImage*(SIHandle: cint; x: cint; y: cint; r: cint; g: cint; b: cint; a: cint): cint
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は０～２５５)

proc DrawPixelSoftImageF*(SIHandle: cint; x: cint; y: cint; r: cfloat; g: cfloat;
                         b: cfloat; a: cfloat): cint
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は浮動小数点数)

proc DrawPixelSoftImage_Unsafe_XRGB8*(SIHandle: cint; x: cint; y: cint; r: cint; g: cint;
                                     b: cint)
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や ARGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc DrawPixelSoftImage_Unsafe_ARGB8*(SIHandle: cint; x: cint; y: cint; r: cint; g: cint;
                                     b: cint; a: cint)
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や XRGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc GetPixelSoftImage*(SIHandle: cint; x: cint; y: cint; r: ptr cint; g: ptr cint;
                       b: ptr cint; a: ptr cint): cint
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は０～２５５)

proc GetPixelSoftImageF*(SIHandle: cint; x: cint; y: cint; r: ptr cfloat; g: ptr cfloat;
                        b: ptr cfloat; a: ptr cfloat): cint
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は浮動小数点数)

proc GetPixelSoftImage_Unsafe_XRGB8*(SIHandle: cint; x: cint; y: cint; r: ptr cint;
                                    g: ptr cint; b: ptr cint)
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や XRGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc GetPixelSoftImage_Unsafe_ARGB8*(SIHandle: cint; x: cint; y: cint; r: ptr cint;
                                    g: ptr cint; b: ptr cint; a: ptr cint)
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や ARGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc DrawLineSoftImage*(SIHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint; r: cint;
                       g: cint; b: cint; a: cint): cint
##  ソフトウエアイメージハンドルの指定座標に線を描画する(各色要素は０～２５５)

proc DrawCircleSoftImage*(SIHandle: cint; x: cint; y: cint; radius: cint; r: cint; g: cint;
                         b: cint; a: cint; FillFlag: cint = TRUE): cint
##  ソフトウエアイメージハンドルの指定座標に円を描画する(各色要素は０～２５５)

proc BltSoftImage*(SrcX: cint; SrcY: cint; SrcSizeX: cint; SrcSizeY: cint;
                  SrcSIHandle: cint; DestX: cint; DestY: cint; DestSIHandle: cint): cint
##  ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルに転送する

proc BltSoftImageWithTransColor*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; SrcSIHandle: cint; DestX: cint;
                                DestY: cint; DestSIHandle: cint; Tr: cint; Tg: cint;
                                Tb: cint; Ta: cint): cint
##  ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルに透過色処理付きで転送する

proc BltSoftImageWithAlphaBlend*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; SrcSIHandle: cint; DestX: cint;
                                DestY: cint; DestSIHandle: cint; Opacity: cint = 255): cint
##  ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルにアルファ値のブレンドを考慮した上で転送する( Opacity は透明度 : 0( 完全透明 ) ～ 255( 完全不透明 ) )( 出力先が ARGB8 形式以外の場合はエラーになります )

proc ReverseSoftImageH*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを左右反転する

proc ReverseSoftImageV*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを上下反転する

proc ReverseSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを上下左右反転する

proc ConvertPremulAlphaSoftImage*(SIHandle: cint): cint
##  通常のαチャンネル付き画像を乗算済みαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc ConvertInterpAlphaSoftImage*(SIHandle: cint): cint
##  乗算済みαチャンネル付き画像を通常のαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc BltStringSoftImage*(x: cint; y: cint; StrData: ptr TCHAR; DestSIHandle: cint;
                        DestEdgeSIHandle: cint = -1; VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( デフォルトフォントハンドルを使用する )

proc BltStringSoftImageWithStrLen*(x: cint; y: cint; StrData: ptr TCHAR;
                                  StrDataLength: csize_t; DestSIHandle: cint;
                                  DestEdgeSIHandle: cint = -1;
                                  VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( デフォルトフォントハンドルを使用する )

proc BltStringSoftImageToHandle*(x: cint; y: cint; StrData: ptr TCHAR;
                                DestSIHandle: cint; DestEdgeSIHandle: cint; ##  縁が必要ない場合は -1
                                FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( フォントハンドル使用版 )

proc BltStringSoftImageToHandleWithStrLen*(x: cint; y: cint; StrData: ptr TCHAR;
    StrDataLength: csize_t; DestSIHandle: cint; DestEdgeSIHandle: cint; ##  縁が必要ない場合は -1
    FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( フォントハンドル使用版 )

proc DrawSoftImage*(x: cint; y: cint; SIHandle: cint): cint
##  ソフトウエアイメージハンドルを画面に描画する

proc SaveSoftImageToBmp*(FilePath: ptr TCHAR; SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＢＭＰ画像ファイルとして保存する

proc SaveSoftImageToBmpWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＢＭＰ画像ファイルとして保存する

proc SaveSoftImageToDds*(FilePath: ptr TCHAR; SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＤＤＳ画像ファイルとして保存する

proc SaveSoftImageToDdsWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＤＤＳ画像ファイルとして保存する

proc SaveSoftImageToPng*(FilePath: ptr TCHAR; SIHandle: cint; CompressionLevel: cint): cint
##  ソフトウエアイメージハンドルをＰＮＧ画像ファイルとして保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveSoftImageToPngWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  SIHandle: cint; CompressionLevel: cint): cint
##  ソフトウエアイメージハンドルをＰＮＧ画像ファイルとして保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveSoftImageToJpeg*(FilePath: ptr TCHAR; SIHandle: cint; Quality: cint;
                         Sample2x1: cint): cint
##  ソフトウエアイメージハンドルをＪＰＥＧ画像ファイルとして保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveSoftImageToJpegWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                   SIHandle: cint; Quality: cint; Sample2x1: cint): cint
##  ソフトウエアイメージハンドルをＪＰＥＧ画像ファイルとして保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100
##  DxSound.cpp関数プロトタイプ宣言
##  サウンドデータ管理系関数

proc InitSoundMem*(LogOutFlag: cint = FALSE): cint
##  全てのサウンドハンドルを削除する

proc AddSoundData*(Handle: cint = -1): cint
##  サウンドハンドルを作成する

proc AddStreamSoundMem*(Stream: ptr STREAMDATA; LoopNum: cint; SoundHandle: cint;
                       StreamDataType: cint; CanStreamCloseFlag: ptr cint;
                       UnionHandle: cint = -1): cint
##  ストリーム再生タイプのサウンドハンドルにストリームデータを再生対象に追加する

proc AddStreamSoundMemToMem*(FileImage: pointer; FileImageSize: csize_t;
                            LoopNum: cint; SoundHandle: cint; StreamDataType: cint;
                            UnionHandle: cint = -1): cint
##  ストリーム再生タイプのサウンドハンドルにメモリ上に展開したサウンドファイルイメージを再生対象に追加する

proc AddStreamSoundMemToFile*(WaveFile: ptr TCHAR; LoopNum: cint; SoundHandle: cint;
                             StreamDataType: cint; UnionHandle: cint = -1): cint
##  ストリーム再生タイプのサウンドハンドルにサウンドファイルを再生対象に追加する

proc AddStreamSoundMemToFileWithStrLen*(WaveFile: ptr TCHAR;
                                       WaveFilePathLength: csize_t; LoopNum: cint;
                                       SoundHandle: cint; StreamDataType: cint;
                                       UnionHandle: cint = -1): cint
##  ストリーム再生タイプのサウンドハンドルにサウンドファイルを再生対象に追加する

proc SetupStreamSoundMem*(SoundHandle: cint): cint
##  ストリーム再生タイプのサウンドハンドルの再生準備をする

proc PlayStreamSoundMem*(SoundHandle: cint; PlayType: cint = DX_PLAYTYPE_LOOP;
                        TopPositionFlag: cint = TRUE): cint
##  ストリーム再生タイプのサウンドハンドルの再生を開始する

proc CheckStreamSoundMem*(SoundHandle: cint): cint
##  ストリーム再生タイプのサウンドハンドルの再生状態を取得する

proc StopStreamSoundMem*(SoundHandle: cint; IsNextLoopEnd: cint = FALSE): cint
##  ストリーム再生タイプのサウンドハンドルの再生を停止する

proc SetStreamSoundCurrentPosition*(Byte: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルの再生位置をバイト単位で変更する(再生が止まっている時のみ有効)

proc GetStreamSoundCurrentPosition*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの再生位置をバイト単位で取得する

proc SetStreamSoundCurrentTime*(Time: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルの再生位置をミリ秒単位で設定する(圧縮形式の場合は正しく設定されない場合がある)

proc GetStreamSoundCurrentTime*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの再生位置をミリ秒単位で取得する(圧縮形式の場合は正しい値が返ってこない場合がある)

proc ProcessStreamSoundMem*(SoundHandle: cint): cint
##  ストリーム再生タイプのサウンドハンドルの周期的な処理を行う関数( 内部で自動的に呼ばれます )

proc ProcessStreamSoundMemAll*(): cint
##  有効なストリーム再生タイプのサウンドハンドルに対して ProcessStreamSoundMem を実行する( 内部で自動的に呼ばれます )

proc LoadSoundMem2*(FileName1: ptr TCHAR; FileName2: ptr TCHAR): cint
##  前奏部とループ部に分かれたサウンドファイルを読み込みサウンドハンドルを作成する

proc LoadSoundMem2WithStrLen*(FileName1: ptr TCHAR; FileName1Length: csize_t;
                             FileName2: ptr TCHAR; FileName2Length: csize_t): cint
##  前奏部とループ部に分かれたサウンドファイルを読み込みサウンドハンドルを作成する

proc LoadBGM*(FileName: ptr TCHAR): cint
##  主にＢＧＭを読み込みサウンドハンドルを作成するのに適した関数

proc LoadBGMWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  主にＢＧＭを読み込みサウンドハンドルを作成するのに適した関数

proc LoadSoundMemBase*(FileName: ptr TCHAR; BufferNum: cint; UnionHandle: cint = -1): cint
##  サウンドファイルからサウンドハンドルを作成する

proc LoadSoundMemBaseWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                BufferNum: cint; UnionHandle: cint = -1): cint
##  サウンドファイルからサウンドハンドルを作成する

proc LoadSoundMem*(FileName: ptr TCHAR; BufferNum: cint = 3; UnionHandle: cint = -1): cint
##  LoadSoundMemBase の別名関数

proc LoadSoundMemWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                            BufferNum: cint = 3; UnionHandle: cint = -1): cint
##  LoadSoundMemBase の別名関数

proc LoadSoundMemToBufNumSitei*(FileName: ptr TCHAR; BufferNum: cint): cint
##  LoadSoundMem を使用して下さい

proc LoadSoundMemToBufNumSiteiWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; BufferNum: cint): cint
##  LoadSoundMem を使用して下さい

proc DuplicateSoundMem*(SrcSoundHandle: cint; BufferNum: cint = 3): cint
##  同じサウンドデータを使用するサウンドハンドルを作成する( DX_SOUNDDATATYPE_MEMNOPRESS タイプのサウンドハンドルのみ可能 )

proc LoadSoundMemByMemImageBase*(FileImage: pointer; FileImageSize: csize_t;
                                BufferNum: cint; UnionHandle: cint = -1): cint
##  メモリ上に展開されたサウンドファイルイメージからサウンドハンドルを作成する

proc LoadSoundMemByMemImage*(FileImage: pointer; FileImageSize: csize_t;
                            BufferNum: cint = 3; UnionHandle: cint = -1): cint
##  LoadSoundMemByMemImageBase の別名関数

proc LoadSoundMemByMemImage2*(WaveImage: pointer; WaveImageSize: csize_t;
                             WaveFormat: ptr WAVEFORMATEX; WaveHeaderSize: csize_t): cint
##  メモリ上に展開されたＰＣＭデータからサウンドハンドルを作成する

proc LoadSoundMemByMemImageToBufNumSitei*(FileImage: pointer;
    FileImageSize: csize_t; BufferNum: cint): cint
##  LoadSoundMemByMemImageBase を使用して下さい

proc LoadSoundMem2ByMemImage*(FileImage1: pointer; FileImageSize1: csize_t;
                             FileImage2: pointer; FileImageSize2: csize_t): cint
##  前奏部とループ部に分かれた二つのメモリ上に展開されたサウンドファイルイメージからサウンドハンドルを作成する

proc LoadSoundMemFromSoftSound*(SoftSoundHandle: cint; BufferNum: cint = 3): cint
##  ソフトウエアサウンドハンドルが持つサウンドデータからサウンドハンドルを作成する

proc DeleteSoundMem*(SoundHandle: cint; LogOutFlag: cint = FALSE): cint
##  サウンドハンドルを削除する

proc PlaySoundMem*(SoundHandle: cint; PlayType: cint; TopPositionFlag: cint = TRUE): cint
##  サウンドハンドルを再生する

proc StopSoundMem*(SoundHandle: cint; IsNextLoopEnd: cint = FALSE): cint
##  サウンドハンドルの再生を停止する( IsNextLoopEnd を TRUE にすると次回のループ終了のタイミングで音を止める )

proc CheckSoundMem*(SoundHandle: cint): cint
##  サウンドハンドルが再生中かどうかを取得する

proc SetPanSoundMem*(PanPal: cint; SoundHandle: cint): cint
##  サウンドハンドルのパンを設定する( 100分の1デシベル単位 0 ～ 10000 )

proc ChangePanSoundMem*(PanPal: cint; SoundHandle: cint): cint
##  サウンドハンドルのパンを設定する( -255 ～ 255 )

proc GetPanSoundMem*(SoundHandle: cint): cint
##  サウンドハンドルのパンを取得する

proc SetVolumeSoundMem*(VolumePal: cint; SoundHandle: cint): cint
##  サウンドハンドルのボリュームを設定する( 100分の1デシベル単位 0 ～ 10000 )

proc ChangeVolumeSoundMem*(VolumePal: cint; SoundHandle: cint): cint
##  サウンドハンドルのボリュームを設定する( 0 ～ 255 )

proc GetVolumeSoundMem*(SoundHandle: cint): cint
##  サウンドハンドルのボリュームを取得する( 100分の1デシベル単位 0 ～ 10000 )

proc GetVolumeSoundMem2*(SoundHandle: cint): cint
##  サウンドハンドルのボリュームを取得する( 0 ～ 255 )

proc SetChannelVolumeSoundMem*(Channel: cint; VolumePal: cint; SoundHandle: cint): cint
##  サウンドハンドルの指定のチャンネルのボリュームを設定する( 100分の1デシベル単位 0 ～ 10000 )

proc ChangeChannelVolumeSoundMem*(Channel: cint; VolumePal: cint; SoundHandle: cint): cint
##  サウンドハンドルの指定のチャンネルのボリュームを設定する( 0 ～ 255 )

proc GetChannelVolumeSoundMem*(Channel: cint; SoundHandle: cint): cint
##  サウンドハンドルの指定のチャンネルのボリュームを取得する( 100分の1デシベル単位 0 ～ 10000 )

proc GetChannelVolumeSoundMem2*(Channel: cint; SoundHandle: cint): cint
##  サウンドハンドルの指定のチャンネルのボリュームを取得する( 0 ～ 255 )

proc SetFrequencySoundMem*(FrequencyPal: cint; SoundHandle: cint): cint
##  サウンドハンドルの再生周波数を設定する

proc GetFrequencySoundMem*(SoundHandle: cint): cint
##  サウンドハンドルの再生周波数を取得する

proc ResetFrequencySoundMem*(SoundHandle: cint): cint
##  サウンドハンドルの再生周波数を読み込み直後の状態に戻す

proc SetNextPlayPanSoundMem*(PanPal: cint; SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用するパンを設定する( 100分の1デシベル単位 0 ～ 10000 )

proc ChangeNextPlayPanSoundMem*(PanPal: cint; SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用するパンを設定する( -255 ～ 255 )

proc SetNextPlayVolumeSoundMem*(VolumePal: cint; SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用するボリュームを設定する( 100分の1デシベル単位 0 ～ 10000 )

proc ChangeNextPlayVolumeSoundMem*(VolumePal: cint; SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用するボリュームを設定する( 0 ～ 255 )

proc SetNextPlayChannelVolumeSoundMem*(Channel: cint; VolumePal: cint;
                                      SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用するチャンネルのボリュームを設定する( 100分の1デシベル単位 0 ～ 10000 )

proc ChangeNextPlayChannelVolumeSoundMem*(Channel: cint; VolumePal: cint;
    SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用するチャンネルのボリュームを設定する( 0 ～ 255 )

proc SetNextPlayFrequencySoundMem*(FrequencyPal: cint; SoundHandle: cint): cint
##  サウンドハンドルの次の再生にのみ使用する再生周波数を設定する

proc SetCurrentPositionSoundMem*(SamplePosition: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルの再生位置をサンプル単位で設定する(再生が止まっている時のみ有効)

proc GetCurrentPositionSoundMem*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの再生位置をサンプル単位で取得する

proc SetSoundCurrentPosition*(Byte: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルの再生位置をバイト単位で設定する(再生が止まっている時のみ有効)

proc GetSoundCurrentPosition*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの再生位置をバイト単位で取得する

proc SetSoundCurrentTime*(Time: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルの再生位置をミリ秒単位で設定する(圧縮形式の場合は正しく設定されない場合がある)

proc GetSoundCurrentTime*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの再生位置をミリ秒単位で取得する(圧縮形式の場合は正しい値が返ってこない場合がある)

proc GetSoundTotalSample*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの音の総時間をサンプル単位で取得する

proc GetSoundTotalTime*(SoundHandle: cint): LONGLONG
##  サウンドハンドルの音の総時間をミリ秒単位で取得する

proc SetLoopPosSoundMem*(LoopTime: LONGLONG; SoundHandle: cint): cint
##  SetLoopTimePosSoundMem の別名関数

proc SetLoopTimePosSoundMem*(LoopTime: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルにループ位置を設定する(ミリ秒単位)

proc SetLoopSamplePosSoundMem*(LoopSamplePosition: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルにループ位置を設定する(サンプル単位)

proc SetLoopStartTimePosSoundMem*(LoopStartTime: LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルにループ開始位置を設定する(ミリ秒単位)

proc SetLoopStartSamplePosSoundMem*(LoopStartSamplePosition: LONGLONG;
                                   SoundHandle: cint): cint
##  サウンドハンドルにループ開始位置を設定する(サンプル単位)

proc SetLoopAreaTimePosSoundMem*(LoopStartTime: LONGLONG; LoopEndTime: LONGLONG;
                                SoundHandle: cint): cint
##  サウンドハンドルにループ範囲を設定する(ミリ秒単位)

proc GetLoopAreaTimePosSoundMem*(LoopStartTime: ptr LONGLONG;
                                LoopEndTime: ptr LONGLONG; SoundHandle: cint): cint
##  サウンドハンドルにループ範囲を取得する(ミリ秒単位)

proc SetLoopAreaSamplePosSoundMem*(LoopStartSamplePosition: LONGLONG;
                                  LoopEndSamplePosition: LONGLONG;
                                  SoundHandle: cint): cint
##  サウンドハンドルにループ範囲を設定する(サンプル単位)

proc GetLoopAreaSamplePosSoundMem*(LoopStartSamplePosition: ptr LONGLONG;
                                  LoopEndSamplePosition: ptr LONGLONG;
                                  SoundHandle: cint): cint
##  サウンドハンドルにループ範囲を取得する(サンプル単位)

proc SetPlayFinishDeleteSoundMem*(DeleteFlag: cint; SoundHandle: cint): cint
##  サウンドハンドルの再生が終了したら自動的にハンドルを削除するかどうかを設定する

proc Set3DReverbParamSoundMem*(Param: ptr SOUND3D_REVERB_PARAM; SoundHandle: cint): cint
##  サウンドハンドルの３Ｄサウンド用のリバーブパラメータを設定する

proc Set3DPresetReverbParamSoundMem*(PresetNo: cint; ##  DX_REVERB_PRESET_DEFAULT 等
                                    SoundHandle: cint): cint
##  サウンドハンドルの３Ｄサウンド用のリバーブパラメータをプリセットを使用して設定する

proc Set3DReverbParamSoundMemAll*(Param: ptr SOUND3D_REVERB_PARAM;
                                 PlaySoundOnly: cint = FALSE): cint
##  全ての３Ｄサウンドのサウンドハンドルにリバーブパラメータを設定する( PlaySoundOnly TRUE:再生中のサウンドにのみ設定する  FALSE:再生していないサウンドにも設定する )

proc Set3DPresetReverbParamSoundMemAll*(PresetNo: cint; ##  DX_REVERB_PRESET_DEFAULT 等
                                       PlaySoundOnly: cint = FALSE): cint
##  全ての３Ｄサウンドのサウンドハンドルにリバーブパラメータをプリセットを使用して設定する( PlaySoundOnly TRUE:再生中のサウンドにのみ設定する  FALSE:再生していないサウンドにも設定する )

proc Get3DReverbParamSoundMem*(ParamBuffer: ptr SOUND3D_REVERB_PARAM;
                              SoundHandle: cint): cint
##  サウンドハンドルに設定されている３Ｄサウンド用のリバーブパラメータを取得する

proc Get3DPresetReverbParamSoundMem*(ParamBuffer: ptr SOUND3D_REVERB_PARAM; PresetNo: cint): cint
  ##  DX_REVERB_PRESET_DEFAULT 等
##  プリセットの３Ｄサウンド用のリバーブパラメータを取得する

proc Set3DPositionSoundMem*(Position: VECTOR; SoundHandle: cint): cint
##  サウンドハンドルの３Ｄサウンド用の再生位置を設定する

proc Set3DRadiusSoundMem*(Radius: cfloat; SoundHandle: cint): cint
##  サウンドハンドルの３Ｄサウンド用の音が聞こえる距離を設定する

proc Set3DVelocitySoundMem*(Velocity: VECTOR; SoundHandle: cint): cint
##  サウンドハンドルの３Ｄサウンド用の移動速度を設定する

proc SetNextPlay3DPositionSoundMem*(Position: VECTOR; SoundHandle: cint): cint
##  サウンドハンドルの次の再生のみに使用する３Ｄサウンド用の再生位置を設定する

proc SetNextPlay3DRadiusSoundMem*(Radius: cfloat; SoundHandle: cint): cint
##  サウンドハンドルの次の再生のみに使用する３Ｄサウンド用の音が聞こえる距離を設定する

proc SetNextPlay3DVelocitySoundMem*(Velocity: VECTOR; SoundHandle: cint): cint
##  サウンドハンドルの次の再生のみに使用する３Ｄサウンド用の移動速度を設定する
##  特殊関数

proc GetMP3TagInfo*(FileName: ptr TCHAR; TitleBuffer: ptr TCHAR;
                   TitleBufferBytes: csize_t; ArtistBuffer: ptr TCHAR;
                   ArtistBufferBytes: csize_t; AlbumBuffer: ptr TCHAR;
                   AlbumBufferBytes: csize_t; YearBuffer: ptr TCHAR;
                   YearBufferBytes: csize_t; CommentBuffer: ptr TCHAR;
                   CommentBufferBytes: csize_t; TrackBuffer: ptr TCHAR;
                   TrackBufferBytes: csize_t; GenreBuffer: ptr TCHAR;
                   GenreBufferBytes: csize_t; PictureGrHandle: ptr cint): cint
##  MP3ファイルのタグ情報を取得する

proc GetMP3TagInfoWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                             TitleBuffer: ptr TCHAR; TitleBufferBytes: csize_t;
                             ArtistBuffer: ptr TCHAR; ArtistBufferBytes: csize_t;
                             AlbumBuffer: ptr TCHAR; AlbumBufferBytes: csize_t;
                             YearBuffer: ptr TCHAR; YearBufferBytes: csize_t;
                             CommentBuffer: ptr TCHAR; CommentBufferBytes: csize_t;
                             TrackBuffer: ptr TCHAR; TrackBufferBytes: csize_t;
                             GenreBuffer: ptr TCHAR; GenreBufferBytes: csize_t;
                             PictureGrHandle: ptr cint): cint
##  MP3ファイルのタグ情報を取得する

proc GetOggCommentNum*(FileName: ptr TCHAR): cint
##  Oggファイルのコメント情報の数を取得する

proc GetOggCommentNumWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  Oggファイルのコメント情報の数を取得する

proc GetOggComment*(FileName: ptr TCHAR; CommentIndex: cint;
                   CommentNameBuffer: ptr TCHAR; CommentNameBufferBytes: csize_t;
                   CommentBuffer: ptr TCHAR; CommentBufferBytes: csize_t): cint
##  Oggファイルのコメント情報を取得する

proc GetOggCommentWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                             CommentIndex: cint; CommentNameBuffer: ptr TCHAR;
                             CommentNameBufferBytes: csize_t;
                             CommentBuffer: ptr TCHAR; CommentBufferBytes: csize_t): cint
##  Oggファイルのコメント情報を取得する
##  設定関係関数

proc SetCreateSoundDataType*(SoundDataType: cint): cint
##  作成するサウンドハンドルの再生タイプを設定する( DX_SOUNDDATATYPE_MEMNOPRESS 等 )

proc GetCreateSoundDataType*(): cint
##  作成するサウンドハンドルの再生タイプを取得する( DX_SOUNDDATATYPE_MEMNOPRESS 等 )

proc SetCreateSoundPitchRate*(Cents: cfloat): cint
##  作成するサウンドハンドルのピッチ( 音の長さを変えずに音程を変更する )レートを設定する( 単位はセント( 100.0fで半音、1200.0fで１オクターヴ )、プラスの値で音程が高く、マイナスの値で音程が低くなります )

proc GetCreateSoundPitchRate*(): cfloat
##  作成するサウンドハンドルのピッチ( 音の長さを変えずに音程を変更する )レートを取得する( 単位はセント( 100.0fで半音、1200.0fで１オクターヴ )、プラスの値で音程が高く、マイナスの値で音程が低くなります )

proc SetCreateSoundTimeStretchRate*(Rate: cfloat): cint
##  作成するサウンドハンドルのタイムストレッチ( 音程を変えずに音の長さを変更する )レートを設定する( 単位は倍率、2.0f で音の長さが２倍に、0.5f で音の長さが半分になります )

proc GetCreateSoundTimeStretchRate*(): cfloat
##  作成するサウンドハンドルのタイムストレッチ( 音程を変えずに音の長さを変更する )レートを取得する( 単位は倍率、2.0f で音の長さが２倍に、0.5f で音の長さが半分になります )

proc SetCreateSoundLoopAreaTimePos*(LoopStartTime: LONGLONG; LoopEndTime: LONGLONG): cint
##  作成するサウンドハンドルのループ範囲を設定する( ミリ秒単位 )

proc GetCreateSoundLoopAreaTimePos*(LoopStartTime: ptr LONGLONG;
                                   LoopEndTime: ptr LONGLONG): cint
##  作成するサウンドハンドルのループ範囲を取得する( ミリ秒単位 )

proc SetCreateSoundLoopAreaSamplePos*(LoopStartSamplePosition: LONGLONG;
                                     LoopEndSamplePosition: LONGLONG): cint
##  作成するサウンドハンドルのループ範囲を設定する( サンプル単位 )

proc GetCreateSoundLoopAreaSamplePos*(LoopStartSamplePosition: ptr LONGLONG;
                                     LoopEndSamplePosition: ptr LONGLONG): cint
##  作成するサウンドハンドルのループ範囲を取得する( サンプル単位 )

proc SetCreateSoundIgnoreLoopAreaInfo*(IgnoreFlag: cint): cint
##  LoadSoundMem などで読み込むサウンドデータにループ範囲情報があっても無視するかどうかを設定する( TRUE:無視する  FALSE:無視しない( デフォルト ) )

proc GetCreateSoundIgnoreLoopAreaInfo*(): cint
##  LoadSoundMem などで読み込むサウンドデータにループ範囲情報があっても無視するかどうかを取得する( TRUE:無視する  FALSE:無視しない( デフォルト ) )

proc SetDisableReadSoundFunctionMask*(Mask: cint): cint
##  使用しないサウンドデータ読み込み処理のマスクを設定する( DX_READSOUNDFUNCTION_PCM 等 )

proc GetDisableReadSoundFunctionMask*(): cint
##  使用しないサウンドデータ読み込み処理のマスクを取得する( DX_READSOUNDFUNCTION_PCM 等 )

proc SetEnableSoundCaptureFlag*(Flag: cint): cint
##  サウンドキャプチャを前提とした動作をするかどうかを設定する

proc SetUseOldVolumeCalcFlag*(Flag: cint): cint
##  ChangeVolumeSoundMem, ChangeNextPlayVolumeSoundMem, ChangeMovieVolumeToGraph の音量計算式を Ver3.10c以前のものを使用するかどうかを設定する( TRUE:Ver3.10c以前の計算式を使用  FALSE:3.10d以降の計算式を使用( デフォルト ) )

proc SetSoundCurrentTimeType*(Type: cint): cint
  ##  DX_SOUNDCURRENTTIME_TYPE_LOW_LEVEL など
##  GetSoundCurrentTime などを使用した場合に取得できる再生時間のタイプを設定する

proc GetSoundCurrentTimeType*(): cint
##  GetSoundCurrentTime などを使用した場合に取得できる再生時間のタイプを取得する

proc SetCreate3DSoundFlag*(Flag: cint): cint
##  次に作成するサウンドハンドルを３Ｄサウンド用にするかどうかを設定する( TRUE:３Ｄサウンド用にする  FALSE:３Ｄサウンド用にしない( デフォルト ) )

proc Set3DSoundOneMetre*(Distance: cfloat): cint
##  ３Ｄ空間の１メートルに相当する距離を設定する、DxLib_Init を呼び出す前でのみ呼び出し可能( デフォルト:1.0f )

proc Set3DSoundListenerPosAndFrontPos_UpVecY*(Position: VECTOR;
    FrontPosition: VECTOR): cint
##  ３Ｄサウンドのリスナーの位置とリスナーの前方位置を設定する( リスナーの上方向はＹ軸固定 )

proc Set3DSoundListenerPosAndFrontPosAndUpVec*(Position: VECTOR;
    FrontPosition: VECTOR; UpVector: VECTOR): cint
##  ３Ｄサウンドのリスナーの位置とリスナーの前方位置とリスナーの上方向を設定する

proc Set3DSoundListenerVelocity*(Velocity: VECTOR): cint
##  ３Ｄサウンドのリスナーの移動速度を設定する

proc Set3DSoundListenerConeAngle*(InnerAngle: cfloat; OuterAngle: cfloat): cint
##  ３Ｄサウンドのリスナーの可聴角度範囲を設定する

proc Set3DSoundListenerConeVolume*(InnerAngleVolume: cfloat;
                                  OuterAngleVolume: cfloat): cint
##  ３Ｄサウンドのリスナーの可聴角度範囲の音量倍率を設定する
##  BEEP音再生用命令

proc SetBeepFrequency*(Freq: cint): cint
##  ビープ音周波数設定関数

proc PlayBeep*(): cint
##  ビープ音を再生する

proc StopBeep*(): cint
##  ビープ音を止める
##  ラッパー関数

proc PlaySoundFile*(FileName: ptr TCHAR; PlayType: cint): cint
##  サウンドファイルを再生する

proc PlaySoundFileWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                             PlayType: cint): cint
##  サウンドファイルを再生する

proc PlaySound*(FileName: ptr TCHAR; PlayType: cint): cint
##  PlaySoundFile の旧名称

proc PlaySoundWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t; PlayType: cint): cint
##  PlaySoundFile の旧名称

proc PlaySoundDX*(FileName: ptr TCHAR; PlayType: cint): cint
##  PlaySoundFile の旧名称

proc PlaySoundDXWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                           PlayType: cint): cint
##  PlaySoundFile の旧名称

proc CheckSoundFile*(): cint
##  サウンドファイルの再生中かどうかを取得する

proc CheckSound*(): cint
##  CheckSoundFile の旧名称

proc StopSoundFile*(): cint
##  サウンドファイルの再生を停止する

proc StopSound*(): cint
##  StopSoundFile の旧名称

proc SetVolumeSoundFile*(VolumePal: cint): cint
##  サウンドファイルの音量を設定する

proc SetVolumeSound*(VolumePal: cint): cint
##  SetVolumeSound の旧名称
##  ソフトウエア制御サウンド系関数

proc InitSoftSound*(): cint
##  ソフトウエアで扱う波形データハンドルをすべて削除する

proc LoadSoftSound*(FileName: ptr TCHAR): cint
##  ソフトウエアで扱う波形データハンドルをサウンドファイルから作成する

proc LoadSoftSoundWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  ソフトウエアで扱う波形データハンドルをサウンドファイルから作成する

proc LoadSoftSoundFromMemImage*(FileImage: pointer; FileImageSize: csize_t): cint
##  ソフトウエアで扱う波形データハンドルをメモリ上に展開されたサウンドファイルイメージから作成する

proc MakeSoftSound*(UseFormat_SoftSoundHandle: cint; SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( フォーマットは引数のソフトウエアサウンドハンドルと同じものにする )

proc MakeSoftSound2Ch16Bit44KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:44.1KHz )

proc MakeSoftSound2Ch16Bit22KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:22KHz )

proc MakeSoftSound2Ch8Bit44KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数: 8bit サンプリング周波数:44.1KHz )

proc MakeSoftSound2Ch8Bit22KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:2 量子化ビット数: 8bit サンプリング周波数:22KHz )

proc MakeSoftSound1Ch16Bit44KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:44.1KHz )

proc MakeSoftSound1Ch16Bit22KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:22KHz )

proc MakeSoftSound1Ch8Bit44KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数: 8bit サンプリング周波数:44.1KHz )

proc MakeSoftSound1Ch8Bit22KHz*(SampleNum: LONGLONG): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する( チャンネル数:1 量子化ビット数: 8bit サンプリング周波数:22KHz )

proc MakeSoftSoundCustom*(ChannelNum: cint; BitsPerSample: cint; SamplesPerSec: cint;
                         SampleNum: LONGLONG; IsFloatType: cint = 0): cint
##  ソフトウエアで扱う空の波形データハンドルを作成する

proc DeleteSoftSound*(SoftSoundHandle: cint): cint
##  ソフトウエアで扱う波形データハンドルを削除する

proc SaveSoftSound*(SoftSoundHandle: cint; FileName: ptr TCHAR): cint
##  ソフトウエアで扱う波形データハンドルをWAVEファイル(PCM)形式で保存する

proc SaveSoftSoundWithStrLen*(SoftSoundHandle: cint; FileName: ptr TCHAR;
                             FileNameLength: csize_t): cint
##  ソフトウエアで扱う波形データハンドルをWAVEファイル(PCM)形式で保存する

proc GetSoftSoundSampleNum*(SoftSoundHandle: cint): LONGLONG
##  ソフトウエアで扱う波形データハンドルのサンプル数を取得する

proc GetSoftSoundFormat*(SoftSoundHandle: cint; Channels: ptr cint;
                        BitsPerSample: ptr cint; SamplesPerSec: ptr cint;
                        IsFloatType: ptr cint = nil): cint
##  ソフトウエアで扱う波形データハンドルのフォーマットを取得する

proc ReadSoftSoundData*(SoftSoundHandle: cint; SamplePosition: LONGLONG;
                       Channel1: ptr cint; Channel2: ptr cint): cint
##  ソフトウエアで扱う波形データハンドルのサンプルを読み取る

proc ReadSoftSoundDataF*(SoftSoundHandle: cint; SamplePosition: LONGLONG;
                        Channel1: ptr cfloat; Channel2: ptr cfloat): cint
##  ソフトウエアで扱う波形データハンドルのサンプルを読み取る( float型版 )

proc WriteSoftSoundData*(SoftSoundHandle: cint; SamplePosition: LONGLONG;
                        Channel1: cint; Channel2: cint): cint
##  ソフトウエアで扱う波形データハンドルのサンプルを書き込む

proc WriteSoftSoundDataF*(SoftSoundHandle: cint; SamplePosition: LONGLONG;
                         Channel1: cfloat; Channel2: cfloat): cint
##  ソフトウエアで扱う波形データハンドルのサンプルを書き込む( float型版 )

proc WriteTimeStretchSoftSoundData*(SrcSoftSoundHandle: cint;
                                   DestSoftSoundHandle: cint): cint
##  ソフトウエアで扱う波形データハンドルの波形データを音程を変えずにデータの長さを変更する

proc WritePitchShiftSoftSoundData*(SrcSoftSoundHandle: cint;
                                  DestSoftSoundHandle: cint): cint
##  ソフトウエアで扱う波形データハンドルの波形データの長さを変更する

proc GetSoftSoundDataImage*(SoftSoundHandle: cint): pointer
##  ソフトウエアで扱う波形データハンドルの波形イメージが格納されているメモリアドレスを取得する

proc GetFFTVibrationSoftSound*(SoftSoundHandle: cint; Channel: cint;
                              SamplePosition: LONGLONG; SampleNum: cint;
                              Buffer_Array: ptr cfloat; BufferLength: cint): cint
##  ソフトウエアで扱う波形データハンドルの指定の範囲を高速フーリエ変換を行い、各周波数域の振幅を取得する( SampleNum は 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536 の何れかである必要があります、Channel を -1 にすると二つのチャンネルを合成した結果になります )

proc GetFFTVibrationSoftSoundBase*(SoftSoundHandle: cint; Channel: cint;
                                  SamplePosition: LONGLONG; SampleNum: cint;
                                  RealBuffer_Array: ptr cfloat;
                                  ImagBuffer_Array: ptr cfloat; BufferLength: cint): cint
##  ソフトウエアで扱う波形データハンドルの指定の範囲を高速フーリエ変換を行い、各周波数域の振幅を取得する、結果の実数と虚数を別々に取得することができるバージョン( SampleNum は 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536 の何れかである必要があります、Channel を -1 にすると二つのチャンネルを合成した結果になります )

proc InitSoftSoundPlayer*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルをすべて解放する

proc MakeSoftSoundPlayer*(UseFormat_SoftSoundHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( フォーマットは引数のソフトウエアサウンドハンドルと同じものにする )

proc MakeSoftSoundPlayer2Ch16Bit44KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:44.1KHz )

proc MakeSoftSoundPlayer2Ch16Bit22KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数:16bit サンプリング周波数:22KHz )

proc MakeSoftSoundPlayer2Ch8Bit44KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数: 8bit サンプリング周波数:44.1KHz )

proc MakeSoftSoundPlayer2Ch8Bit22KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:2 量子化ビット数: 8bit サンプリング周波数:22KHz )

proc MakeSoftSoundPlayer1Ch16Bit44KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:44.1KHz )

proc MakeSoftSoundPlayer1Ch16Bit22KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数:16bit サンプリング周波数:22KHz )

proc MakeSoftSoundPlayer1Ch8Bit44KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数: 8bit サンプリング周波数:44.1KHz )

proc MakeSoftSoundPlayer1Ch8Bit22KHz*(): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する( チャンネル数:1 量子化ビット数: 8bit サンプリング周波数:22KHz )

proc MakeSoftSoundPlayerCustom*(ChannelNum: cint; BitsPerSample: cint;
                               SamplesPerSec: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを作成する

proc DeleteSoftSoundPlayer*(SSoundPlayerHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルを削除する

proc AddDataSoftSoundPlayer*(SSoundPlayerHandle: cint; SoftSoundHandle: cint;
                            AddSamplePosition: LONGLONG; AddSampleNum: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルに波形データを追加する( フォーマットが同じではない場合はエラー )

proc AddDirectDataSoftSoundPlayer*(SSoundPlayerHandle: cint; SoundData: pointer;
                                  AddSampleNum: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルにプレイヤーが対応したフォーマットの生波形データを追加する

proc AddOneDataSoftSoundPlayer*(SSoundPlayerHandle: cint; Channel1: cint;
                               Channel2: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルに波形データを一つ追加する

proc GetSoftSoundPlayerFormat*(SSoundPlayerHandle: cint; Channels: ptr cint;
                              BitsPerSample: ptr cint; SamplesPerSec: ptr cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルが扱うデータフォーマットを取得する

proc StartSoftSoundPlayer*(SSoundPlayerHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルの再生処理を開始する

proc CheckStartSoftSoundPlayer*(SSoundPlayerHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルの再生処理が開始されているか取得する( TRUE:開始している  FALSE:停止している )

proc StopSoftSoundPlayer*(SSoundPlayerHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルの再生処理を停止する

proc ResetSoftSoundPlayer*(SSoundPlayerHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルの状態を初期状態に戻す( 追加された波形データは削除され、再生状態だった場合は停止する )

proc GetStockDataLengthSoftSoundPlayer*(SSoundPlayerHandle: cint;
                                       SoundBufferStockSamples: ptr cint = nil): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルに追加した波形データでまだ再生用サウンドバッファに転送されていない波形データのサンプル数を取得する、SoundBufferStockSamples を指定すると再生用サウンドバッファで未再生のサウンドデータのサンプル数が代入されます

proc CheckSoftSoundPlayerNoneData*(SSoundPlayerHandle: cint): cint
##  ソフトウエアで扱う波形データのプレイヤーハンドルに再生用サウンドバッファに転送していない波形データが無く、再生用サウンドバッファにも無音データ以外無いかどうかを取得する( TRUE:無音データ以外無い  FALSE:有効データがある )
##  ＭＩＤＩ制御関数

proc DeleteMusicMem*(MusicHandle: cint): cint
##  ＭＩＤＩハンドルを削除する

proc LoadMusicMem*(FileName: ptr TCHAR): cint
##  ＭＩＤＩファイルを読み込みＭＩＤＩハンドルを作成する

proc LoadMusicMemWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  ＭＩＤＩファイルを読み込みＭＩＤＩハンドルを作成する

proc LoadMusicMemByMemImage*(FileImage: pointer; FileImageSize: csize_t): cint
##  メモリ上に展開されたＭＩＤＩファイルイメージからＭＩＤＩハンドルを作成する

proc PlayMusicMem*(MusicHandle: cint; PlayType: cint): cint
##  ＭＩＤＩハンドルの演奏を開始する

proc StopMusicMem*(MusicHandle: cint): cint
##  ＭＩＤＩハンドルの演奏を停止する

proc CheckMusicMem*(MusicHandle: cint): cint
##  ＭＩＤＩハンドルが演奏中かどうかを取得する( TRUE:演奏中  FALSE:停止中 )

proc SetVolumeMusicMem*(Volume: cint; MusicHandle: cint): cint
##  ＭＩＤＩハンドルの再生音量をセットする

proc GetMusicMemPosition*(MusicHandle: cint): cint
##  ＭＩＤＩハンドルの現在の再生位置を取得する

proc InitMusicMem*(): cint
##  ＭＩＤＩハンドルをすべて削除する

proc ProcessMusicMem*(): cint
##  ＭＩＤＩハンドルの周期的処理( 内部で呼ばれます )

proc PlayMusic*(FileName: ptr TCHAR; PlayType: cint): cint
##  ＭＩＤＩファイルを演奏する

proc PlayMusicWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t; PlayType: cint): cint
##  ＭＩＤＩファイルを演奏する

proc PlayMusicByMemImage*(FileImage: pointer; FileImageSize: csize_t; PlayType: cint): cint
##  メモリ上に展開されているＭＩＤＩファイルを演奏する

proc SetVolumeMusic*(Volume: cint): cint
##  ＭＩＤＩの再生音量をセットする

proc StopMusic*(): cint
##  ＭＩＤＩファイルの演奏停止

proc CheckMusic*(): cint
##  ＭＩＤＩファイルが演奏中か否か情報を取得する

proc GetMusicPosition*(): cint
##  ＭＩＤＩの現在の再生位置を取得する

proc SelectMidiMode*(Mode: cint): cint
##  ＭＩＤＩの再生形式を設定する
##  DxArchive_.cpp 関数 プロトタイプ宣言

proc SetUseDXArchiveFlag*(Flag: cint): cint
##  ＤＸアーカイブファイルの読み込み機能を使うかどうかを設定する( FALSE:使用しない  TRUE:使用する )

proc SetDXArchivePriority*(Priority: cint = 0): cint
##  同名のＤＸアーカイブファイルとフォルダが存在した場合、どちらを優先させるかを設定する( 1:フォルダを優先　 0:ＤＸアーカイブファイルを優先( デフォルト ) )

proc SetDXArchiveExtension*(Extension: ptr TCHAR = nil): cint
##  検索するＤＸアーカイブファイルの拡張子を設定する( Extension:拡張子名文字列 )

proc SetDXArchiveExtensionWithStrLen*(Extension: ptr TCHAR = nil;
                                     ExtensionLength: csize_t = 0): cint
##  検索するＤＸアーカイブファイルの拡張子を設定する( Extension:拡張子名文字列 )

proc SetDXArchiveKeyString*(KeyString: ptr TCHAR = nil): cint
##  ＤＸアーカイブファイルの鍵文字列を設定する( KeyString:鍵文字列 )

proc SetDXArchiveKeyStringWithStrLen*(KeyString: ptr TCHAR = nil;
                                     KeyStringLength: csize_t = 0): cint
##  ＤＸアーカイブファイルの鍵文字列を設定する( KeyString:鍵文字列 )

proc DXArchivePreLoad*(FilePath: ptr TCHAR; ASync: cint = FALSE): cint
##  指定のＤＸＡファイルを丸ごとメモリに読み込む( 戻り値  -1:エラー  0:成功 )

proc DXArchivePreLoadWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                ASync: cint = FALSE): cint
##  指定のＤＸＡファイルを丸ごとメモリに読み込む( 戻り値  -1:エラー  0:成功 )

proc DXArchiveCheckIdle*(FilePath: ptr TCHAR): cint
##  指定のＤＸＡファイルの事前読み込みが完了したかどうかを取得する( 戻り値  TRUE:完了した FALSE:まだ )

proc DXArchiveCheckIdleWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  指定のＤＸＡファイルの事前読み込みが完了したかどうかを取得する( 戻り値  TRUE:完了した FALSE:まだ )

proc DXArchiveRelease*(FilePath: ptr TCHAR): cint
##  指定のＤＸＡファイルをメモリから解放する

proc DXArchiveReleaseWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  指定のＤＸＡファイルをメモリから解放する

proc DXArchiveCheckFile*(FilePath: ptr TCHAR; TargetFilePath: ptr TCHAR): cint
##  ＤＸＡファイルの中に指定のファイルが存在するかどうかを調べる、TargetFilePath はＤＸＡファイルをカレントフォルダとした場合のパス( 戻り値:  -1=エラー  0:無い  1:ある )

proc DXArchiveCheckFileWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  TargetFilePath: ptr TCHAR;
                                  TargetFilePathLength: csize_t): cint
##  ＤＸＡファイルの中に指定のファイルが存在するかどうかを調べる、TargetFilePath はＤＸＡファイルをカレントフォルダとした場合のパス( 戻り値:  -1=エラー  0:無い  1:ある )

proc DXArchiveSetMemImage*(ArchiveImage: pointer; ArchiveImageSize: cint;
                          EmulateFilePath: ptr TCHAR;
                          ArchiveImageCopyFlag: cint = FALSE;
                          ArchiveImageReadOnly: cint = TRUE): cint
##  メモリ上に展開されたＤＸＡファイルを指定のファイルパスにあることにする( EmulateFilePath は見立てる dxa ファイルのパス、例えばＤＸＡファイルイメージを Image.dxa というファイル名で c:\Temp にあることにしたい場合は EmulateFilePath に "c:\\Temp\\Image.dxa" を渡す、SetDXArchiveExtension で拡張子を変更している場合は EmulateFilePath に渡すファイルパスの拡張子もそれに合わせる必要あり )

proc DXArchiveSetMemImageWithStrLen*(ArchiveImage: pointer; ArchiveImageSize: cint;
                                    EmulateFilePath: ptr TCHAR;
                                    EmulateFilePathLength: csize_t;
                                    ArchiveImageCopyFlag: cint = FALSE;
                                    ArchiveImageReadOnly: cint = TRUE): cint
##  メモリ上に展開されたＤＸＡファイルを指定のファイルパスにあることにする( EmulateFilePath は見立てる dxa ファイルのパス、例えばＤＸＡファイルイメージを Image.dxa というファイル名で c:\Temp にあることにしたい場合は EmulateFilePath に "c:\\Temp\\Image.dxa" を渡す、SetDXArchiveExtension で拡張子を変更している場合は EmulateFilePath に渡すファイルパスの拡張子もそれに合わせる必要あり )

proc DXArchiveReleaseMemImage*(ArchiveImage: pointer): cint
##  DXArchiveSetMemImage の設定を解除する

proc HashCRC32*(SrcData: pointer; SrcDataSize: csize_t): DWORD
##  バイナリデータを元に CRC32 のハッシュ値を計算する
##  DxModel.cpp 関数 プロトタイプ宣言
##  モデルの読み込み・複製関係

proc MV1LoadModel*(FileName: ptr TCHAR): cint
##  モデルの読み込み( -1:エラー  0以上:モデルハンドル )

proc MV1LoadModelWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t): cint
##  モデルの読み込み( -1:エラー  0以上:モデルハンドル )

proc MV1LoadModelFromMem*(FileImage: pointer; FileSize: cint; FileReadFunc: proc (
    FilePath: ptr TCHAR; FileImageAddr: ptr pointer; FileSize: ptr cint;
    FileReadFuncData: pointer): cint; FileReleaseFunc: proc (MemoryAddr: pointer;
    FileReadFuncData: pointer): cint; FileReadFuncData: pointer = nil): cint
##  メモリ上のモデルファイルイメージと独自の読み込みルーチンを使用してモデルを読み込む

proc MV1DuplicateModel*(SrcMHandle: cint): cint
##  指定のモデルと同じモデル基本データを使用してモデルを作成する( -1:エラー  0以上:モデルハンドル )

proc MV1CreateCloneModel*(SrcMHandle: cint): cint
##  指定のモデルをモデル基本データも含め複製する( MV1DuplicateModel はモデル基本データは共有しますが、こちらは複製元のモデルとは一切共有データの無いモデルハンドルを作成します )( -1:エラー  0以上:モデルハンドル )

proc MV1DeleteModel*(MHandle: cint): cint
##  モデルを削除する

proc MV1InitModel*(): cint
##  すべてのモデルを削除する

proc MV1SetLoadModelReMakeNormal*(Flag: cint): cint
##  モデルを読み込む際に法線の再計算を行うかどうかを設定する( TRUE:行う  FALSE:行わない( デフォルト ) )

proc MV1SetLoadModelReMakeNormalSmoothingAngle*(
    SmoothingAngle: cfloat = 1.562069f): cint
##  モデルを読み込む際に行う法泉の再計算で使用するスムージング角度を設定する( 単位はラジアン )

proc MV1SetLoadModelIgnoreScaling*(Flag: cint): cint
##  モデルを読み込む際にスケーリングデータを無視するかどうかを設定する( TRUE:無視する  FALSE:無視しない( デフォルト ) )

proc MV1SetLoadModelPositionOptimize*(Flag: cint): cint
##  モデルを読み込む際に座標データの最適化を行うかどうかを設定する( TRUE:行う  FALSE:行わない( デフォルト ) )

proc MV1SetLoadModelNotEqNormalSide_AddZeroAreaPolygon*(Flag: cint): cint
##  モデルを読み込む際にポリゴンの辺が接していて、且つ法線の方向が異なる辺に面積０のポリゴンを埋め込むかどうかを設定する( TRUE:埋め込む　FALSE:埋め込まない( デフォルト ) )、( MV1ファイルの読み込みではこの関数の設定は無視され、ポリゴンの埋め込みは実行されません )

proc MV1SetLoadModelUsePhysicsMode*(PhysicsMode: cint): cint
  ##  DX_LOADMODEL_PHYSICS_LOADCALC 等
##  読み込むモデルの物理演算モードを設定する

proc MV1SetLoadModelPhysicsWorldGravity*(Gravity: cfloat): cint
##  読み込むモデルの物理演算に適用する重力パラメータを設定する

proc MV1GetLoadModelPhysicsWorldGravity*(): cfloat
##  読み込むモデルの物理演算に適用する重力パラメータを取得する

proc MV1SetLoadCalcPhysicsWorldGravity*(GravityNo: cint; Gravity: VECTOR): cint
##  読み込むモデルの物理演算モードが事前計算( DX_LOADMODEL_PHYSICS_LOADCALC )だった場合に適用される重力の設定をする

proc MV1GetLoadCalcPhysicsWorldGravity*(GravityNo: cint): VECTOR
##  読み込むモデルの物理演算モードが事前計算( DX_LOADMODEL_PHYSICS_LOADCALC )だった場合に適用される重力を取得する

proc MV1SetLoadModelPhysicsCalcPrecision*(Precision: cint): cint
##  読み込むモデルの物理演算モードが事前計算( DX_LOADMODEL_PHYSICS_LOADCALC )だった場合に適用される物理演算の時間進行の精度を設定する( 0:60FPS  1:120FPS  2:240FPS  3:480FPS  4:960FPS  5:1920FPS )

proc MV1SetLoadModel_PMD_PMX_AnimationFPSMode*(FPSMode: cint): cint
  ##  DX_LOADMODEL_PMD_PMX_ANIMATION_FPSMODE_30 等
##  PMD, PMX ファイルを読み込んだ際のアニメーションの FPS モードを設定する

proc MV1AddLoadModelDisablePhysicsNameWord*(NameWord: ptr TCHAR): cint
##  読み込むモデルの物理演算を特定の剛体のみ無効にするための名前のワードを追加する、追加できるワード文字列の最大長は 63 文字、追加できるワードの数は最大 256 個

proc MV1AddLoadModelDisablePhysicsNameWordWithStrLen*(NameWord: ptr TCHAR;
    NameWordLength: csize_t): cint
##  読み込むモデルの物理演算を特定の剛体のみ無効にするための名前のワードを追加する、追加できるワード文字列の最大長は 63 文字、追加できるワードの数は最大 256 個

proc MV1ResetLoadModelDisablePhysicsNameWord*(): cint
##  MV1AddLoadModelDisablePhysicsNameWord で追加した剛体の無効ワードをリセットして無効ワード無しの初期状態に戻す

proc MV1SetLoadModelDisablePhysicsNameWordMode*(DisableNameWordMode: cint): cint
  ##  DX_LOADMODEL_PHYSICS_DISABLENAMEWORD_ALWAYS 等
##  MV1AddLoadModelDisablePhysicsNameWord で追加した剛体の無効ワードの適用ルールを変更する

proc MV1SetLoadModelAnimFilePath*(FileName: ptr TCHAR): cint
##  読み込むモデルに適用するアニメーションファイルのパスを設定する、NULLを渡すと設定リセット( 現在は PMD,PMX のみに効果あり )

proc MV1SetLoadModelAnimFilePathWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t): cint
##  読み込むモデルに適用するアニメーションファイルのパスを設定する、NULLを渡すと設定リセット( 現在は PMD,PMX のみに効果あり )

proc MV1SetLoadModelUsePackDraw*(Flag: cint): cint
##  読み込むモデルを同時複数描画に対応させるかどうかを設定する( TRUE:対応させる  FALSE:対応させない( デフォルト ) )、( 「対応させる」にすると描画が高速になる可能性がある代わりに消費VRAMが増えます )

proc MV1SetLoadModelTriangleListUseMaxBoneNum*(UseMaxBoneNum: cint): cint
##  読み込むモデルのひとつのトライアングルリストで使用できる最大ボーン数を設定する( UseMaxBoneNum で指定できる値の範囲は 8 ～ 54、 0 を指定するとデフォルト動作に戻る )

proc MV1SetLoadModelTextureLoad*(Flag: cint): cint
##  読み込むモデルで使用するテクスチャファイルを読み込むかどうかを設定する( TRUE:読み込む(デフォルト) FALSE:読み込まない )

proc MV1SetLoadModelIgnoreIK*(IgnoreFlag: cint): cint
##  読み込むモデルのIK情報を無視するかどうかを設定する( TRUE:無視する  FALSE:無視しない(デフォルト) )
##  モデル保存関係

proc MV1SaveModelToMV1File*(MHandle: cint; FileName: ptr TCHAR;
                           SaveType: cint = MV1_SAVETYPE_NORMAL;
                           AnimMHandle: cint = -1; AnimNameCheck: cint = TRUE;
                           Normal8BitFlag: cint = 1; Position16BitFlag: cint = 1;
                           Weight8BitFlag: cint = 0; Anim16BitFlag: cint = 1): cint
##  指定のパスにモデルを保存する( 戻り値  0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった )

proc MV1SaveModelToMV1FileWithStrLen*(MHandle: cint; FileName: ptr TCHAR;
                                     FileNameLength: csize_t;
                                     SaveType: cint = MV1_SAVETYPE_NORMAL;
                                     AnimMHandle: cint = -1;
                                     AnimNameCheck: cint = TRUE;
                                     Normal8BitFlag: cint = 1;
                                     Position16BitFlag: cint = 1;
                                     Weight8BitFlag: cint = 0;
                                     Anim16BitFlag: cint = 1): cint
##  指定のパスにモデルを保存する( 戻り値  0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった )

proc MV1SaveModelToXFile*(MHandle: cint; FileName: ptr TCHAR;
                         SaveType: cint = MV1_SAVETYPE_NORMAL;
                         AnimMHandle: cint = -1; AnimNameCheck: cint = TRUE): cint
##  指定のパスにモデルをＸファイル形式で保存する( 戻り値  0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった )

proc MV1SaveModelToXFileWithStrLen*(MHandle: cint; FileName: ptr TCHAR;
                                   FileNameLength: csize_t;
                                   SaveType: cint = MV1_SAVETYPE_NORMAL;
                                   AnimMHandle: cint = -1;
                                   AnimNameCheck: cint = TRUE): cint
##  指定のパスにモデルをＸファイル形式で保存する( 戻り値  0:成功  -1:メモリ不足  -2:使われていないアニメーションがあった )
##  モデル描画関係

proc MV1DrawModel*(MHandle: cint): cint
##  モデルを描画する

proc MV1DrawFrame*(MHandle: cint; FrameIndex: cint): cint
##  モデルの指定のフレームを描画する

proc MV1DrawMesh*(MHandle: cint; MeshIndex: cint): cint
##  モデルの指定のメッシュを描画する

proc MV1DrawTriangleList*(MHandle: cint; TriangleListIndex: cint): cint
##  モデルの指定のトライアングルリストを描画する

proc MV1DrawModelDebug*(MHandle: cint; Color: cuint; IsNormalLine: cint;
                       NormalLineLength: cfloat; IsPolyLine: cint;
                       IsCollisionBox: cint): cint
##  モデルのデバッグ描画
##  描画設定関係

proc MV1SetUseOrigShader*(UseFlag: cint): cint
##  モデルの描画に SetUseVertexShader, SetUsePixelShader で指定したシェーダーを使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない( デフォルト ) )

proc MV1SetDrawMode*(DrawMode: cint): cint
  ##  DX_MV1_DRAWMODE_NORMAL 等
##  モデルの描画モードの設定

proc MV1SetSemiTransDrawMode*(DrawMode: cint): cint
  ##  DX_SEMITRANSDRAWMODE_ALWAYS 等
##  モデルの半透明要素がある部分についての描画モードを設定する
##  モデル基本制御関係

proc MV1GetLocalWorldMatrix*(MHandle: cint): MATRIX
##  モデルのローカル座標からワールド座標に変換する行列を得る

proc MV1GetLocalWorldMatrixD*(MHandle: cint): MATRIX_D
##  モデルのローカル座標からワールド座標に変換する行列を得る

proc MV1SetPosition*(MHandle: cint; Position: VECTOR): cint
##  モデルの座標をセット

proc MV1SetPositionD*(MHandle: cint; Position: VECTOR_D): cint
##  モデルの座標をセット

proc MV1GetPosition*(MHandle: cint): VECTOR
##  モデルの座標を取得

proc MV1GetPositionD*(MHandle: cint): VECTOR_D
##  モデルの座標を取得

proc MV1SetScale*(MHandle: cint; Scale: VECTOR): cint
##  モデルの拡大値をセット

proc MV1GetScale*(MHandle: cint): VECTOR
##  モデルの拡大値を取得

proc MV1SetRotationXYZ*(MHandle: cint; Rotate: VECTOR): cint
##  モデルの回転値をセット( X軸回転→Y軸回転→Z軸回転方式 )

proc MV1GetRotationXYZ*(MHandle: cint): VECTOR
##  モデルの回転値を取得( X軸回転→Y軸回転→Z軸回転方式 )

proc MV1SetRotationZYAxis*(MHandle: cint; ZAxisDirection: VECTOR;
                          YAxisDirection: VECTOR; ZAxisTwistRotate: cfloat): cint
##  モデルのＺ軸とＹ軸の向きをセットする

proc MV1SetRotationYUseDir*(MHandle: cint; Direction: VECTOR; OffsetYAngle: cfloat): cint
##  モデルのＹ軸の回転値を指定のベクトルの向きを元に設定する、モデルはZ軸のマイナス方向を向いていることを想定するので、そうではない場合は OffsetYAngle で補正する、Ｘ軸回転、Ｚ軸回転は０で固定

proc MV1SetRotationMatrix*(MHandle: cint; Matrix: MATRIX): cint
##  モデルの回転用行列をセットする

proc MV1GetRotationMatrix*(MHandle: cint): MATRIX
##  モデルの回転用行列を取得する

proc MV1SetMatrix*(MHandle: cint; Matrix: MATRIX): cint
##  モデルの変形用行列をセットする

proc MV1SetMatrixD*(MHandle: cint; Matrix: MATRIX_D): cint
##  モデルの変形用行列をセットする

proc MV1GetMatrix*(MHandle: cint): MATRIX
##  モデルの変形用行列を取得する

proc MV1GetMatrixD*(MHandle: cint): MATRIX_D
##  モデルの変形用行列を取得する

proc MV1SetVisible*(MHandle: cint; VisibleFlag: cint): cint
##  モデルの表示、非表示状態を変更する( TRUE:表示  FALSE:非表示 )

proc MV1GetVisible*(MHandle: cint): cint
##  モデルの表示、非表示状態を取得する( TRUE:表示  FALSE:非表示 )

proc MV1SetMeshCategoryVisible*(MHandle: cint; MeshCategory: cint; VisibleFlag: cint): cint
##  モデルのメッシュの種類( DX_MV1_MESHCATEGORY_NORMAL など )毎の表示、非表示を設定する( TRUE:表示  FALSE:非表示 )

proc MV1GetMeshCategoryVisible*(MHandle: cint; MeshCategory: cint): cint
##  モデルのメッシュの種類( DX_MV1_MESHCATEGORY_NORMAL など )毎の表示、非表示を取得する( TRUE:表示  FALSE:非表示 )

proc MV1SetDifColorScale*(MHandle: cint; Scale: COLOR_F): cint
##  モデルのディフューズカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1GetDifColorScale*(MHandle: cint): COLOR_F
##  モデルのディフューズカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1SetSpcColorScale*(MHandle: cint; Scale: COLOR_F): cint
##  モデルのスペキュラカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1GetSpcColorScale*(MHandle: cint): COLOR_F
##  モデルのスペキュラカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1SetEmiColorScale*(MHandle: cint; Scale: COLOR_F): cint
##  モデルのエミッシブカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1GetEmiColorScale*(MHandle: cint): COLOR_F
##  モデルのエミッシブカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1SetAmbColorScale*(MHandle: cint; Scale: COLOR_F): cint
##  モデルのアンビエントカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1GetAmbColorScale*(MHandle: cint): COLOR_F
##  モデルのアンビエントカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetSemiTransState*(MHandle: cint): cint
##  モデルに半透明要素があるかどうかを取得する( 戻り値 TRUE:ある  FALSE:ない )

proc MV1SetOpacityRate*(MHandle: cint; Rate: cfloat): cint
##  モデルの不透明度を設定する( 不透明 1.0f ～ 透明 0.0f )

proc MV1GetOpacityRate*(MHandle: cint): cfloat
##  モデルの不透明度を取得する( 不透明 1.0f ～ 透明 0.0f )

proc MV1SetUseDrawMulAlphaColor*(MHandle: cint; Flag: cint): cint
##  モデルを描画する際にRGB値に対してA値を乗算するかどうかを設定する( 描画結果が乗算済みアルファ画像になります )( Flag   TRUE:RGB値に対してA値を乗算する  FALSE:乗算しない(デフォルト) )

proc MV1GetUseDrawMulAlphaColor*(MHandle: cint): cint
##  モデルを描画する際にRGB値に対してA値を乗算するかどうかを取得する( 描画結果が乗算済みアルファ画像になります )( 戻り値 TRUE:RGB値に対してA値を乗算する  FALSE:乗算しない(デフォルト) )

proc MV1SetUseZBuffer*(MHandle: cint; Flag: cint): cint
##  モデルを描画する際にＺバッファを使用するかどうかを設定する

proc MV1SetWriteZBuffer*(MHandle: cint; Flag: cint): cint
##  モデルを描画する際にＺバッファに書き込みを行うかどうかを設定する

proc MV1SetZBufferCmpType*(MHandle: cint; CmpType: cint): cint
  ##  DX_CMP_NEVER 等
##  モデルの描画時のＺ値の比較モードを設定する

proc MV1SetZBias*(MHandle: cint; Bias: cint): cint
##  モデルの描画時の書き込むＺ値のバイアスを設定する

proc MV1SetUseVertDifColor*(MHandle: cint; UseFlag: cint): cint
##  モデルの含まれるメッシュの頂点ディフューズカラーをマテリアルのディフューズカラーの代わりに使用するかどうかを設定する( TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する )

proc MV1SetUseVertSpcColor*(MHandle: cint; UseFlag: cint): cint
##  モデルに含まれるメッシュの頂点スペキュラカラーをマテリアルのスペキュラカラーの代わりに使用するかどうかを設定する( TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する )

proc MV1SetSampleFilterMode*(MHandle: cint; FilterMode: cint): cint
##  モデルのテクスチャのサンプルフィルターモードを変更する( FilterMode は DX_DRAWMODE_NEAREST 等 )

proc MV1SetMaxAnisotropy*(MHandle: cint; MaxAnisotropy: cint): cint
##  モデルの異方性フィルタリングの最大次数を設定する

proc MV1SetWireFrameDrawFlag*(MHandle: cint; Flag: cint): cint
##  モデルをワイヤーフレームで描画するかどうかを設定する

proc MV1RefreshVertColorFromMaterial*(MHandle: cint): cint
##  モデルの頂点カラーを現在設定されているマテリアルのカラーにする

proc MV1SetPhysicsWorldGravity*(MHandle: cint; Gravity: VECTOR): cint
##  モデルの物理演算の重力を設定する

proc MV1PhysicsCalculation*(MHandle: cint; MillisecondTime: cfloat): cint
##  モデルの物理演算を指定時間分経過したと仮定して計算する( MillisecondTime で指定する時間の単位はミリ秒 )

proc MV1PhysicsResetState*(MHandle: cint): cint
##  モデルの物理演算の状態をリセットする( 位置がワープしたとき用 )

proc MV1SetPrioritizePhysicsOverAnimFlag*(MHandle: cint; Flag: cint): cint
##  モデルの物理演算をアニメーションより優先するかどうかを設定する( TRUE:物理演算を優先する  FALSE:アニメーションを優先する( デフォルト ) )

proc MV1SetUseShapeFlag*(MHandle: cint; UseFlag: cint): cint
##  モデルのシェイプ機能を使用するかどうかを設定する( UseFlag  TRUE:使用する( デフォルト )  FALSE:使用しない )

proc MV1GetMaterialNumberOrderFlag*(MHandle: cint): cint
##  モデルのマテリアル番号順にメッシュを描画するかどうかのフラグを取得する( TRUE:マテリアル番号順に描画  FALSE:不透明メッシュの後半透明メッシュ )
##  アニメーション関係

proc MV1AttachAnim*(MHandle: cint; AnimIndex: cint; AnimSrcMHandle: cint = -1;
                   NameCheck: cint = TRUE): cint
##  アニメーションをアタッチする( 戻り値  -1:エラー  0以上:アタッチインデックス )

proc MV1DetachAnim*(MHandle: cint; AttachIndex: cint): cint
##  アニメーションをデタッチする

proc MV1SetAttachAnimTime*(MHandle: cint; AttachIndex: cint; Time: cfloat): cint
##  アタッチしているアニメーションの再生時間を設定する

proc MV1GetAttachAnimTime*(MHandle: cint; AttachIndex: cint): cfloat
##  アタッチしているアニメーションの再生時間を取得する

proc MV1GetAttachAnimTotalTime*(MHandle: cint; AttachIndex: cint): cfloat
##  アタッチしているアニメーションの総時間を得る

proc MV1SetAttachAnimBlendRate*(MHandle: cint; AttachIndex: cint; Rate: cfloat = 1.0f): cint
##  アタッチしているアニメーションのブレンド率を設定する

proc MV1GetAttachAnimBlendRate*(MHandle: cint; AttachIndex: cint): cfloat
##  アタッチしているアニメーションのブレンド率を取得する

proc MV1SetAttachAnimBlendRateToFrame*(MHandle: cint; AttachIndex: cint;
                                      FrameIndex: cint; Rate: cfloat;
                                      SetChild: cint = TRUE): cint
##  アタッチしているアニメーションのブレンド率を設定する( フレーム単位 )

proc MV1GetAttachAnimBlendRateToFrame*(MHandle: cint; AttachIndex: cint;
                                      FrameIndex: cint): cfloat
##  アタッチしているアニメーションのブレンド率を取得する( フレーム単位 )

proc MV1SetAttachAnimTimeToFrame*(MHandle: cint; AttachIndex: cint; FrameIndex: cint;
                                 Time: cfloat; SetChild: cint = TRUE): cint
##  アタッチしているアニメーションの再生時間を設定する( フレーム単位 )( Time にマイナスの値を渡すと設定を解除 )

proc MV1GetAttachAnimTimeToFrame*(MHandle: cint; AttachIndex: cint; FrameIndex: cint): cfloat
##  アタッチしているアニメーションの再生時間を取得する( フレーム単位 )

proc MV1GetAttachAnim*(MHandle: cint; AttachIndex: cint): cint
##  アタッチしているアニメーションのアニメーションインデックスを取得する

proc MV1SetAttachAnimUseShapeFlag*(MHandle: cint; AttachIndex: cint; UseFlag: cint): cint
##  アタッチしているアニメーションのシェイプを使用するかどうかを設定する( UseFlag  TRUE:使用する( デフォルト )  FALSE:使用しない )

proc MV1GetAttachAnimUseShapeFlag*(MHandle: cint; AttachIndex: cint): cint
##  アタッチしているアニメーションのシェイプを使用するかどうかを取得する

proc MV1GetAttachAnimFrameLocalPosition*(MHandle: cint; AttachIndex: cint;
                                        FrameIndex: cint): VECTOR
##  アタッチしているアニメーションの指定のフレームの現在のローカル座標を取得する

proc MV1GetAttachAnimFrameLocalMatrix*(MHandle: cint; AttachIndex: cint;
                                      FrameIndex: cint): MATRIX
##  アタッチしているアニメーションの指定のフレームの現在のローカル変換行列を取得する

proc MV1GetAnimNum*(MHandle: cint): cint
##  アニメーションの数を取得する

proc MV1GetAnimName*(MHandle: cint; AnimIndex: cint): ptr TCHAR
##  指定番号のアニメーション名を取得する( NULL:エラー )

proc MV1SetAnimName*(MHandle: cint; AnimIndex: cint; AnimName: ptr TCHAR): cint
##  指定番号のアニメーション名を変更する

proc MV1SetAnimNameWithStrLen*(MHandle: cint; AnimIndex: cint; AnimName: ptr TCHAR;
                              AnimNameLength: csize_t): cint
##  指定番号のアニメーション名を変更する

proc MV1GetAnimIndex*(MHandle: cint; AnimName: ptr TCHAR): cint
##  指定名のアニメーション番号を取得する( -1:エラー )

proc MV1GetAnimIndexWithStrLen*(MHandle: cint; AnimName: ptr TCHAR;
                               AnimNameLength: csize_t): cint
##  指定名のアニメーション番号を取得する( -1:エラー )

proc MV1GetAnimTotalTime*(MHandle: cint; AnimIndex: cint): cfloat
##  指定番号のアニメーションの総時間を得る

proc MV1GetAnimTargetFrameNum*(MHandle: cint; AnimIndex: cint): cint
##  指定のアニメーションがターゲットとするフレームの数を取得する

proc MV1GetAnimTargetFrameName*(MHandle: cint; AnimIndex: cint; AnimFrameIndex: cint): ptr TCHAR
##  指定のアニメーションがターゲットとするフレームの名前を取得する

proc MV1GetAnimTargetFrame*(MHandle: cint; AnimIndex: cint; AnimFrameIndex: cint): cint
##  指定のアニメーションがターゲットとするフレームの番号を取得する

proc MV1GetAnimTargetFrameKeySetNum*(MHandle: cint; AnimIndex: cint;
                                    AnimFrameIndex: cint): cint
##  指定のアニメーションがターゲットとするフレーム用のアニメーションキーセットの数を取得する

proc MV1GetAnimTargetFrameKeySet*(MHandle: cint; AnimIndex: cint;
                                 AnimFrameIndex: cint; Index: cint): cint
##  指定のアニメーションがターゲットとするフレーム用のアニメーションキーセットキーセットインデックスを取得する

proc MV1GetAnimKeySetNum*(MHandle: cint): cint
##  モデルに含まれるアニメーションキーセットの総数を得る

proc MV1GetAnimKeySetType*(MHandle: cint; AnimKeySetIndex: cint): cint
##  指定のアニメーションキーセットのタイプを取得する( MV1_ANIMKEY_TYPE_QUATERNION 等 )

proc MV1GetAnimKeySetDataType*(MHandle: cint; AnimKeySetIndex: cint): cint
##  指定のアニメーションキーセットのデータタイプを取得する( MV1_ANIMKEY_DATATYPE_ROTATE 等 )

proc MV1GetAnimKeySetTimeType*(MHandle: cint; AnimKeySetIndex: cint): cint
##  指定のアニメーションキーセットのキーの時間データタイプを取得する( MV1_ANIMKEY_TIME_TYPE_ONE 等 )

proc MV1GetAnimKeySetDataNum*(MHandle: cint; AnimKeySetIndex: cint): cint
##  指定のアニメーションキーセットのキーの数を取得する

proc MV1GetAnimKeyDataTime*(MHandle: cint; AnimKeySetIndex: cint; Index: cint): cfloat
##  指定のアニメーションキーセットのキーの時間を取得する

proc MV1GetAnimKeyDataIndexFromTime*(MHandle: cint; AnimKeySetIndex: cint;
                                    Time: cfloat): cint
##  指定のアニメーションキーセットの指定の時間でのキーの番号を取得する

proc MV1GetAnimKeyDataToQuaternion*(MHandle: cint; AnimKeySetIndex: cint; Index: cint): FLOAT4
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_QUATERNION では無かった場合は失敗する

proc MV1GetAnimKeyDataToQuaternionFromTime*(MHandle: cint; AnimKeySetIndex: cint;
    Time: cfloat): FLOAT4
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_QUATERNION では無かった場合は失敗する( 時間指定版 )

proc MV1GetAnimKeyDataToVector*(MHandle: cint; AnimKeySetIndex: cint; Index: cint): VECTOR
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_VECTOR では無かった場合は失敗する

proc MV1GetAnimKeyDataToVectorFromTime*(MHandle: cint; AnimKeySetIndex: cint;
                                       Time: cfloat): VECTOR
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_VECTOR では無かった場合は失敗する( 時間指定版 )

proc MV1GetAnimKeyDataToMatrix*(MHandle: cint; AnimKeySetIndex: cint; Index: cint): MATRIX
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_MATRIX4X4C か MV1_ANIMKEY_TYPE_MATRIX3X3 では無かった場合は失敗する

proc MV1GetAnimKeyDataToMatrixFromTime*(MHandle: cint; AnimKeySetIndex: cint;
                                       Time: cfloat): MATRIX
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_MATRIX4X4C か MV1_ANIMKEY_TYPE_MATRIX3X3 では無かった場合は失敗する( 時間指定版 )

proc MV1GetAnimKeyDataToFlat*(MHandle: cint; AnimKeySetIndex: cint; Index: cint): cfloat
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_FLAT では無かった場合は失敗する

proc MV1GetAnimKeyDataToFlatFromTime*(MHandle: cint; AnimKeySetIndex: cint;
                                     Time: cfloat): cfloat
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_FLAT では無かった場合は失敗する( 時間指定版 )

proc MV1GetAnimKeyDataToLinear*(MHandle: cint; AnimKeySetIndex: cint; Index: cint): cfloat
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_LINEAR では無かった場合は失敗する

proc MV1GetAnimKeyDataToLinearFromTime*(MHandle: cint; AnimKeySetIndex: cint;
                                       Time: cfloat): cfloat
##  指定のアニメーションキーセットのキーを取得する、キータイプが MV1_ANIMKEY_TYPE_LINEAR では無かった場合は失敗する( 時間指定版 )
##  マテリアル関係

proc MV1GetMaterialNum*(MHandle: cint): cint
##  モデルで使用しているマテリアルの数を取得する

proc MV1GetMaterialName*(MHandle: cint; MaterialIndex: cint): ptr TCHAR
##  指定のマテリアルの名前を取得する

proc MV1SetMaterialTypeAll*(MHandle: cint; Type: cint): cint
##  全てのマテリアルのタイプを変更する( Type : DX_MATERIAL_TYPE_NORMAL など )

proc MV1SetMaterialType*(MHandle: cint; MaterialIndex: cint; Type: cint): cint
##  指定のマテリアルのタイプを変更する( Type : DX_MATERIAL_TYPE_NORMAL など )

proc MV1GetMaterialType*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルのタイプを取得する( 戻り値 : DX_MATERIAL_TYPE_NORMAL など )

proc MV1SetMaterialTypeParamAll*(MHandle: cint): cint {.varargs.}
##  全てのマテリアルのタイプ別パラメータを変更する( マテリアルタイプ DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_TWO_COLOR などで使用 )

proc MV1SetMaterialTypeParam*(MHandle: cint; MaterialIndex: cint): cint {.varargs.}
##  指定のマテリアルのタイプ別パラメータを変更する( マテリアルタイプ DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_TWO_COLOR などで使用 )
## 		int			MV1SetMaterialTypeParam(			int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_UNORM            の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ) ) ;
## 		int			MV1SetMaterialTypeParam(			int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CLIP_UNORM       の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ), float ClipParam = 閾値( この値未満が 0.0f になる ) ) ;
## 		int			MV1SetMaterialTypeParam(			int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_LUMINANCE_CMP_GREATEREQUAL の場合 */ float CmpParam = 比較値( この値以上の場合は 1.0f が、未満の場合は 0.0f が書き込まれる ) ) ;
## 		int			MV1SetMaterialTypeParam(			int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_POWER_UNORM                の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ) ) ;
## 		int			MV1SetMaterialTypeParam(			int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_POWER_CLIP_UNORM           の場合 */ float MinParam = 正規化の下限値( この値以下が 0.0f になる ), float MaxParam = 正規化の上限値( この値以上が 1.0f になる ), float ClipParam = 閾値( この値未満が 0.0f になる ) ) ;
## 		int			MV1SetMaterialTypeParam(			int MHandle, int MaterialIndex, /* DX_MATERIAL_TYPE_MAT_SPEC_POWER_CMP_GREATEREQUAL     の場合 */ float CmpParam = 比較値( この値以上の場合は 1.0f が、未満の場合は 0.0f が書き込まれる ) ) ;

proc MV1SetMaterialDifColor*(MHandle: cint; MaterialIndex: cint; Color: COLOR_F): cint
##  指定のマテリアルのディフューズカラーを設定する

proc MV1GetMaterialDifColor*(MHandle: cint; MaterialIndex: cint): COLOR_F
##  指定のマテリアルのディフューズカラーを取得する

proc MV1SetMaterialSpcColor*(MHandle: cint; MaterialIndex: cint; Color: COLOR_F): cint
##  指定のマテリアルのスペキュラカラーを設定する

proc MV1GetMaterialSpcColor*(MHandle: cint; MaterialIndex: cint): COLOR_F
##  指定のマテリアルのスペキュラカラーを取得する

proc MV1SetMaterialEmiColor*(MHandle: cint; MaterialIndex: cint; Color: COLOR_F): cint
##  指定のマテリアルのエミッシブカラーを設定する

proc MV1GetMaterialEmiColor*(MHandle: cint; MaterialIndex: cint): COLOR_F
##  指定のマテリアルのエミッシブカラーを取得する

proc MV1SetMaterialAmbColor*(MHandle: cint; MaterialIndex: cint; Color: COLOR_F): cint
##  指定のマテリアルのアンビエントカラーを設定する

proc MV1GetMaterialAmbColor*(MHandle: cint; MaterialIndex: cint): COLOR_F
##  指定のマテリアルのアンビエントカラーを取得する

proc MV1SetMaterialSpcPower*(MHandle: cint; MaterialIndex: cint; Power: cfloat): cint
##  指定のマテリアルのスペキュラの強さを設定する

proc MV1GetMaterialSpcPower*(MHandle: cint; MaterialIndex: cint): cfloat
##  指定のマテリアルのスペキュラの強さを取得する

proc MV1SetMaterialDifMapTexture*(MHandle: cint; MaterialIndex: cint; TexIndex: cint): cint
##  指定のマテリアルでディフューズマップとして使用するテクスチャを指定する

proc MV1GetMaterialDifMapTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルでディフューズマップとして使用されているテクスチャのインデックスを取得する

proc MV1SetMaterialSubDifMapTexture*(MHandle: cint; MaterialIndex: cint;
                                    TexIndex: cint): cint
##  指定のマテリアルでサブディフューズマップとして使用するテクスチャを指定する

proc MV1GetMaterialSubDifMapTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルでサブディフューズマップとして使用されているテクスチャのインデックスを取得する

proc MV1SetMaterialSpcMapTexture*(MHandle: cint; MaterialIndex: cint; TexIndex: cint): cint
##  指定のマテリアルでスペキュラマップとして使用するテクスチャを指定する

proc MV1GetMaterialSpcMapTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルでスペキュラマップとして使用されているテクスチャのインデックスを取得する

proc MV1GetMaterialNormalMapTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルで法線マップとして使用されているテクスチャのインデックスを取得する

proc MV1SetMaterialDifGradTexture*(MHandle: cint; MaterialIndex: cint; TexIndex: cint): cint
##  指定のマテリアルでトゥーンレンダリングのディフューズグラデーションマップとして使用するテクスチャを設定する

proc MV1GetMaterialDifGradTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルでトゥーンレンダリングのディフューズグラデーションマップとして使用するテクスチャを取得する

proc MV1SetMaterialSpcGradTexture*(MHandle: cint; MaterialIndex: cint; TexIndex: cint): cint
##  指定のマテリアルでトゥーンレンダリングのスペキュラグラデーションマップとして使用するテクスチャを設定する

proc MV1GetMaterialSpcGradTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルでトゥーンレンダリングのスペキュラグラデーションマップとして使用するテクスチャを取得する

proc MV1SetMaterialSphereMapTexture*(MHandle: cint; MaterialIndex: cint;
                                    TexIndex: cint): cint
##  指定のマテリアルでトゥーンレンダリングのスフィアマップとして使用するテクスチャを設定する

proc MV1GetMaterialSphereMapTexture*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルでトゥーンレンダリングのスフィアマップとして使用するテクスチャを取得する

proc MV1SetMaterialDifGradBlendTypeAll*(MHandle: cint; BlendType: cint): cint
##  全てのマテリアルのトゥーンレンダリングで使用するディフューズグラデーションマップとディフューズカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1SetMaterialDifGradBlendType*(MHandle: cint; MaterialIndex: cint;
                                    BlendType: cint): cint
##  指定のマテリアルのトゥーンレンダリングで使用するディフューズグラデーションマップとディフューズカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1GetMaterialDifGradBlendType*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルのトゥーンレンダリングで使用するディフューズグラデーションマップとディフューズカラーの合成方法を取得する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1SetMaterialSpcGradBlendTypeAll*(MHandle: cint; BlendType: cint): cint
##  全てのマテリアルのトゥーンレンダリングで使用するスペキュラグラデーションマップとスペキュラカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1SetMaterialSpcGradBlendType*(MHandle: cint; MaterialIndex: cint;
                                    BlendType: cint): cint
##  指定のマテリアルのトゥーンレンダリングで使用するスペキュラグラデーションマップとスペキュラカラーの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1GetMaterialSpcGradBlendType*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルのトゥーンレンダリングで使用するスペキュラグラデーションマップとスペキュラカラーの合成方法を取得する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1SetMaterialSphereMapBlendTypeAll*(MHandle: cint; BlendType: cint): cint
##  全てのマテリアルのトゥーンレンダリングで使用するスフィアマップの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1SetMaterialSphereMapBlendType*(MHandle: cint; MaterialIndex: cint;
                                      BlendType: cint): cint
##  指定のマテリアルのトゥーンレンダリングで使用するスフィアマップの合成方法を設定する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1GetMaterialSphereMapBlendType*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルのトゥーンレンダリングで使用するスフィアマップの合成方法を取得する( DX_MATERIAL_BLENDTYPE_ADDITIVE など )

proc MV1SetMaterialOutLineWidthAll*(MHandle: cint; Width: cfloat): cint
##  全てのマテリアルのトゥーンレンダリングで使用する輪郭線の太さを設定する

proc MV1SetMaterialOutLineWidth*(MHandle: cint; MaterialIndex: cint; Width: cfloat): cint
##  指定のマテリアルのトゥーンレンダリングで使用する輪郭線の太さを設定する

proc MV1GetMaterialOutLineWidth*(MHandle: cint; MaterialIndex: cint): cfloat
##  指定のマテリアルのトゥーンレンダリングで使用する輪郭線の太さを取得する

proc MV1SetMaterialOutLineDotWidthAll*(MHandle: cint; Width: cfloat): cint
##  全てのマテリアルのトゥーンレンダリングで使用する輪郭線のドット単位の太さを設定する

proc MV1SetMaterialOutLineDotWidth*(MHandle: cint; MaterialIndex: cint; Width: cfloat): cint
##  指定のマテリアルのトゥーンレンダリングで使用する輪郭線のドット単位の太さを設定する

proc MV1GetMaterialOutLineDotWidth*(MHandle: cint; MaterialIndex: cint): cfloat
##  指定のマテリアルのトゥーンレンダリングで使用する輪郭線のドット単位の太さを取得する

proc MV1SetMaterialOutLineColorAll*(MHandle: cint; Color: COLOR_F): cint
##  全てのマテリアルのトゥーンレンダリングで使用する輪郭線の色を設定する

proc MV1SetMaterialOutLineColor*(MHandle: cint; MaterialIndex: cint; Color: COLOR_F): cint
##  指定のマテリアルのトゥーンレンダリングで使用する輪郭線の色を設定する

proc MV1GetMaterialOutLineColor*(MHandle: cint; MaterialIndex: cint): COLOR_F
##  指定のマテリアルのトゥーンレンダリングで使用する輪郭線の色を取得する

proc MV1SetMaterialDrawBlendModeAll*(MHandle: cint; BlendMode: cint): cint
##  全てのマテリアルの描画ブレンドモードを設定する( DX_BLENDMODE_ALPHA 等 )

proc MV1SetMaterialDrawBlendMode*(MHandle: cint; MaterialIndex: cint; BlendMode: cint): cint
##  指定のマテリアルの描画ブレンドモードを設定する( DX_BLENDMODE_ALPHA 等 )

proc MV1GetMaterialDrawBlendMode*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルの描画ブレンドモードを取得する( DX_BLENDMODE_ALPHA 等 )

proc MV1SetMaterialDrawBlendParamAll*(MHandle: cint; BlendParam: cint): cint
##  全てのマテリアルの描画ブレンドパラメータを設定する

proc MV1SetMaterialDrawBlendParam*(MHandle: cint; MaterialIndex: cint;
                                  BlendParam: cint): cint
##  指定のマテリアルの描画ブレンドパラメータを設定する

proc MV1GetMaterialDrawBlendParam*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルの描画ブレンドパラメータを設定する

proc MV1SetMaterialDrawAlphaTestAll*(MHandle: cint; Enable: cint; Mode: cint;
                                    Param: cint): cint
##  全てのマテリアルの描画時のアルファテストの設定を行う( Enable:αテストを行うかどうか( TRUE:行う  FALSE:行わない( デフォルト ) ) Mode:テストモード( DX_CMP_GREATER等 )  Param:描画アルファ値との比較に使用する値( 0～255 ) )

proc MV1SetMaterialDrawAlphaTest*(MHandle: cint; MaterialIndex: cint; Enable: cint;
                                 Mode: cint; Param: cint): cint
##  指定のマテリアルの描画時のアルファテストの設定を行う( Enable:αテストを行うかどうか( TRUE:行う  FALSE:行わない( デフォルト ) ) Mode:テストモード( DX_CMP_GREATER等 )  Param:描画アルファ値との比較に使用する値( 0～255 ) )

proc MV1GetMaterialDrawAlphaTestEnable*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルの描画時のアルファテストを行うかどうかを取得する( 戻り値  TRUE:アルファテストを行う  FALSE:アルファテストを行わない )

proc MV1GetMaterialDrawAlphaTestMode*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルの描画時のアルファテストのテストモードを取得する( 戻り値  テストモード( DX_CMP_GREATER等 ) )

proc MV1GetMaterialDrawAlphaTestParam*(MHandle: cint; MaterialIndex: cint): cint
##  指定のマテリアルの描画時のアルファテストの描画アルファ地との比較に使用する値( 0～255 )を取得する

proc MV1SetMaterialDrawAddColorAll*(MHandle: cint; Red: cint; Green: cint; Blue: cint): cint
##  全てのマテリアルの描画時の加算カラーを設定する

proc MV1SetMaterialDrawAddColor*(MHandle: cint; MaterialIndex: cint; Red: cint;
                                Green: cint; Blue: cint): cint
##  指定のマテリアルの描画時の加算カラーを設定する

proc MV1GetMaterialDrawAddColor*(MHandle: cint; MaterialIndex: cint; Red: ptr cint;
                                Green: ptr cint; Blue: ptr cint): cint
##  指定のマテリアルの描画時の加算カラーを取得する
##  テクスチャ関係

proc MV1GetTextureNum*(MHandle: cint): cint
##  テクスチャの数を取得

proc MV1GetTextureName*(MHandle: cint; TexIndex: cint): ptr TCHAR
##  テクスチャの名前を取得

proc MV1SetTextureColorFilePath*(MHandle: cint; TexIndex: cint; FilePath: ptr TCHAR): cint
##  カラーテクスチャのファイルパスを変更する

proc MV1SetTextureColorFilePathWithStrLen*(MHandle: cint; TexIndex: cint;
    FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  カラーテクスチャのファイルパスを変更する

proc MV1GetTextureColorFilePath*(MHandle: cint; TexIndex: cint): ptr TCHAR
##  カラーテクスチャのファイルパスを取得

proc MV1SetTextureAlphaFilePath*(MHandle: cint; TexIndex: cint; FilePath: ptr TCHAR): cint
##  アルファテクスチャのファイルパスを変更する

proc MV1SetTextureAlphaFilePathWithStrLen*(MHandle: cint; TexIndex: cint;
    FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  アルファテクスチャのファイルパスを変更する

proc MV1GetTextureAlphaFilePath*(MHandle: cint; TexIndex: cint): ptr TCHAR
##  アルファテクスチャのファイルパスを取得

proc MV1SetTextureGraphHandle*(MHandle: cint; TexIndex: cint; GrHandle: cint;
                              SemiTransFlag: cint): cint
##  テクスチャで使用するグラフィックハンドルを変更する( GrHandle を -1 にすると解除 )

proc MV1GetTextureGraphHandle*(MHandle: cint; TexIndex: cint): cint
##  テクスチャのグラフィックハンドルを取得する

proc MV1SetTextureAddressMode*(MHandle: cint; TexIndex: cint; AddrUMode: cint;
                              AddrVMode: cint): cint
##  テクスチャのアドレスモードを設定する( AddUMode の値は DX_TEXADDRESS_WRAP 等 )

proc MV1GetTextureAddressModeU*(MHandle: cint; TexIndex: cint): cint
##  テクスチャのＵ値のアドレスモードを取得する( 戻り値:DX_TEXADDRESS_WRAP 等 )

proc MV1GetTextureAddressModeV*(MHandle: cint; TexIndex: cint): cint
##  テクスチャのＶ値のアドレスモードを取得する( 戻り値:DX_TEXADDRESS_WRAP 等 )

proc MV1GetTextureWidth*(MHandle: cint; TexIndex: cint): cint
##  テクスチャの幅を取得する

proc MV1GetTextureHeight*(MHandle: cint; TexIndex: cint): cint
##  テクスチャの高さを取得する

proc MV1GetTextureSemiTransState*(MHandle: cint; TexIndex: cint): cint
##  テクスチャに半透明要素があるかどうかを取得する( 戻り値  TRUE:ある  FALSE:ない )

proc MV1SetTextureBumpImageFlag*(MHandle: cint; TexIndex: cint; Flag: cint): cint
##  テクスチャで使用している画像がバンプマップかどうかを設定する

proc MV1GetTextureBumpImageFlag*(MHandle: cint; TexIndex: cint): cint
##  テクスチャがバンプマップかどうかを取得する( 戻り値  TRUE:バンプマップ  FALSE:違う )

proc MV1SetTextureBumpImageNextPixelLength*(MHandle: cint; TexIndex: cint;
    Length: cfloat): cint
##  バンプマップ画像の場合の隣のピクセルとの距離を設定する

proc MV1GetTextureBumpImageNextPixelLength*(MHandle: cint; TexIndex: cint): cfloat
##  バンプマップ画像の場合の隣のピクセルとの距離を取得する

proc MV1SetTextureSampleFilterMode*(MHandle: cint; TexIndex: cint; FilterMode: cint): cint
##  テクスチャのフィルタリングモードを設定する

proc MV1GetTextureSampleFilterMode*(MHandle: cint; TexIndex: cint): cint
##  テクスチャのフィルタリングモードを取得する( 戻り値  DX_DRAWMODE_BILINEAR等 )

proc MV1LoadTexture*(FilePath: ptr TCHAR): cint
##  ３Ｄモデルに貼り付けるのに向いた画像の読み込み方式で画像を読み込む( 戻り値  -1:エラー  0以上:グラフィックハンドル )

proc MV1LoadTextureWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  ３Ｄモデルに貼り付けるのに向いた画像の読み込み方式で画像を読み込む( 戻り値  -1:エラー  0以上:グラフィックハンドル )
##  フレーム関係

proc MV1GetFrameNum*(MHandle: cint): cint
##  フレームの数を取得する

proc MV1SearchFrame*(MHandle: cint; FrameName: ptr TCHAR): cint
##  フレームの名前からモデル中のフレームのフレームインデックスを取得する( 無かった場合は戻り値が-1 )

proc MV1SearchFrameWithStrLen*(MHandle: cint; FrameName: ptr TCHAR;
                              FrameNameLength: csize_t): cint
##  フレームの名前からモデル中のフレームのフレームインデックスを取得する( 無かった場合は戻り値が-1 )

proc MV1SearchFrameChild*(MHandle: cint; FrameIndex: cint = -1;
                         ChildName: ptr TCHAR = nil): cint
##  フレームの名前から指定のフレームの子フレームのフレームインデックスを取得する( 名前指定版 )( FrameIndex を -1 にすると親を持たないフレームを ChildIndex で指定する )( 無かった場合は戻り値が-1 )

proc MV1SearchFrameChildWithStrLen*(MHandle: cint; FrameIndex: cint = -1;
                                   ChildName: ptr TCHAR = nil;
                                   ChildNameLength: csize_t = 0): cint
##  フレームの名前から指定のフレームの子フレームのフレームインデックスを取得する( 名前指定版 )( FrameIndex を -1 にすると親を持たないフレームを ChildIndex で指定する )( 無かった場合は戻り値が-1 )

proc MV1GetFrameName*(MHandle: cint; FrameIndex: cint): ptr TCHAR
##  指定のフレームの名前を取得する( エラーの場合は戻り値が NULL )

proc MV1GetFrameName2*(MHandle: cint; FrameIndex: cint; StrBuffer: ptr TCHAR): cint
##  指定のフレームの名前を取得する( 戻り値   -1:エラー  -1以外:文字列のサイズ )

proc MV1GetFrameParent*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームの親フレームのインデックスを得る( 親がいない場合は -2 が返る )

proc MV1GetFrameChildNum*(MHandle: cint; FrameIndex: cint = -1): cint
##  指定のフレームの子フレームの数を取得する( FrameIndex を -1 にすると親を持たないフレームの数が返ってくる )

proc MV1GetFrameChild*(MHandle: cint; FrameIndex: cint = -1; ChildIndex: cint = 0): cint
##  指定のフレームの子フレームのフレームインデックスを取得する( 番号指定版 )( FrameIndex を -1 にすると親を持たないフレームを ChildIndex で指定する )( エラーの場合は戻り値が-1 )

proc MV1GetFramePosition*(MHandle: cint; FrameIndex: cint): VECTOR
##  指定のフレームの座標を取得する

proc MV1GetFramePositionD*(MHandle: cint; FrameIndex: cint): VECTOR_D
##  指定のフレームの座標を取得する

proc MV1GetFrameBaseLocalMatrix*(MHandle: cint; FrameIndex: cint): MATRIX
##  指定のフレームの初期状態での座標変換行列を取得する

proc MV1GetFrameBaseLocalMatrixD*(MHandle: cint; FrameIndex: cint): MATRIX_D
##  指定のフレームの初期状態での座標変換行列を取得する

proc MV1GetFrameLocalMatrix*(MHandle: cint; FrameIndex: cint): MATRIX
##  指定のフレームの座標変換行列を取得する

proc MV1GetFrameLocalMatrixD*(MHandle: cint; FrameIndex: cint): MATRIX_D
##  指定のフレームの座標変換行列を取得する

proc MV1GetFrameLocalWorldMatrix*(MHandle: cint; FrameIndex: cint): MATRIX
##  指定のフレームのローカル座標からワールド座標に変換する行列を得る

proc MV1GetFrameLocalWorldMatrixD*(MHandle: cint; FrameIndex: cint): MATRIX_D
##  指定のフレームのローカル座標からワールド座標に変換する行列を得る

proc MV1SetFrameUserLocalMatrix*(MHandle: cint; FrameIndex: cint; Matrix: MATRIX): cint
##  指定のフレームの座標変換行列( ローカル行列 )を設定する

proc MV1SetFrameUserLocalMatrixD*(MHandle: cint; FrameIndex: cint; Matrix: MATRIX_D): cint
##  指定のフレームの座標変換行列( ローカル行列 )を設定する

proc MV1ResetFrameUserLocalMatrix*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームの座標変換行列( ローカル行列 )をデフォルトに戻す

proc MV1SetFrameUserLocalWorldMatrix*(MHandle: cint; FrameIndex: cint; Matrix: MATRIX): cint
##  指定のフレームの座標変換行列( ローカル座標からワールド座標に変換する行列 )を設定する

proc MV1SetFrameUserLocalWorldMatrixD*(MHandle: cint; FrameIndex: cint;
                                      Matrix: MATRIX_D): cint
##  指定のフレームの座標変換行列( ローカル座標からワールド座標に変換する行列 )を設定する

proc MV1ResetFrameUserLocalWorldMatrix*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームの座標変換行列( ローカル座標からワールド座標に変換する行列 )をデフォルトに戻す

proc MV1GetFrameMaxVertexLocalPosition*(MHandle: cint; FrameIndex: cint): VECTOR
##  指定のフレームが持つメッシュ頂点のローカル座標での最大値を得る

proc MV1GetFrameMaxVertexLocalPositionD*(MHandle: cint; FrameIndex: cint): VECTOR_D
##  指定のフレームが持つメッシュ頂点のローカル座標での最大値を得る

proc MV1GetFrameMinVertexLocalPosition*(MHandle: cint; FrameIndex: cint): VECTOR
##  指定のフレームが持つメッシュ頂点のローカル座標での最小値を得る

proc MV1GetFrameMinVertexLocalPositionD*(MHandle: cint; FrameIndex: cint): VECTOR_D
##  指定のフレームが持つメッシュ頂点のローカル座標での最小値を得る

proc MV1GetFrameAvgVertexLocalPosition*(MHandle: cint; FrameIndex: cint): VECTOR
##  指定のフレームが持つメッシュ頂点のローカル座標での平均値を得る

proc MV1GetFrameAvgVertexLocalPositionD*(MHandle: cint; FrameIndex: cint): VECTOR_D
##  指定のフレームが持つメッシュ頂点のローカル座標での平均値を得る

proc MV1GetFrameVertexNum*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームに含まれる頂点の数を取得する

proc MV1GetFrameTriangleNum*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームに含まれるポリゴンの数を取得する

proc MV1GetFrameMeshNum*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームが持つメッシュの数を取得する

proc MV1GetFrameMesh*(MHandle: cint; FrameIndex: cint; Index: cint): cint
##  指定のフレームが持つメッシュのメッシュインデックスを取得する

proc MV1SetFrameVisible*(MHandle: cint; FrameIndex: cint; VisibleFlag: cint): cint
##  指定のフレームの表示、非表示状態を変更する( TRUE:表示  FALSE:非表示 )

proc MV1GetFrameVisible*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームの表示、非表示状態を取得する( TRUE:表示  FALSE:非表示 )

proc MV1SetFrameDifColorScale*(MHandle: cint; FrameIndex: cint; Scale: COLOR_F): cint
##  指定のフレームのディフューズカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1SetFrameSpcColorScale*(MHandle: cint; FrameIndex: cint; Scale: COLOR_F): cint
##  指定のフレームのスペキュラカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1SetFrameEmiColorScale*(MHandle: cint; FrameIndex: cint; Scale: COLOR_F): cint
##  指定のフレームのエミッシブカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1SetFrameAmbColorScale*(MHandle: cint; FrameIndex: cint; Scale: COLOR_F): cint
##  指定のフレームのアンビエントカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1GetFrameDifColorScale*(MHandle: cint; FrameIndex: cint): COLOR_F
##  指定のフレームのディフューズカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetFrameSpcColorScale*(MHandle: cint; FrameIndex: cint): COLOR_F
##  指定のフレームのスペキュラカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetFrameEmiColorScale*(MHandle: cint; FrameIndex: cint): COLOR_F
##  指定のフレームのエミッシブカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetFrameAmbColorScale*(MHandle: cint; FrameIndex: cint): COLOR_F
##  指定のフレームのアンビエントカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetFrameSemiTransState*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームに半透明要素があるかどうかを取得する( 戻り値 TRUE:ある  FALSE:ない )

proc MV1SetFrameOpacityRate*(MHandle: cint; FrameIndex: cint; Rate: cfloat): cint
##  指定のフレームの不透明度を設定する( 不透明 1.0f ～ 透明 0.0f )

proc MV1GetFrameOpacityRate*(MHandle: cint; FrameIndex: cint): cfloat
##  指定のフレームの不透明度を取得する( 不透明 1.0f ～ 透明 0.0f )

proc MV1SetFrameBaseVisible*(MHandle: cint; FrameIndex: cint; VisibleFlag: cint): cint
##  指定のフレームの初期表示状態を設定する( TRUE:表示  FALSE:非表示 )

proc MV1GetFrameBaseVisible*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームの初期表示状態を取得する( TRUE:表示  FALSE:非表示 )

proc MV1SetFrameTextureAddressTransform*(MHandle: cint; FrameIndex: cint;
                                        TransU: cfloat; TransV: cfloat;
                                        ScaleU: cfloat; ScaleV: cfloat;
                                        RotCenterU: cfloat; RotCenterV: cfloat;
                                        Rotate: cfloat): cint
##  指定のフレームのテクスチャ座標変換パラメータを設定する

proc MV1SetFrameTextureAddressTransformMatrix*(MHandle: cint; FrameIndex: cint;
    Matrix: MATRIX): cint
##  指定のフレームのテクスチャ座標変換行列をセットする

proc MV1ResetFrameTextureAddressTransform*(MHandle: cint; FrameIndex: cint): cint
##  指定のフレームのテクスチャ座標変換パラメータをリセットする
##  メッシュ関係

proc MV1GetMeshNum*(MHandle: cint): cint
##  モデルに含まれるメッシュの数を取得する

proc MV1GetMeshMaterial*(MHandle: cint; MeshIndex: cint): cint
##  指定メッシュが使用しているマテリアルのインデックスを取得する

proc MV1GetMeshVertexNum*(MHandle: cint; MeshIndex: cint): cint
##  指定メッシュに含まれる頂点の数を取得する

proc MV1GetMeshTriangleNum*(MHandle: cint; MeshIndex: cint): cint
##  指定メッシュに含まれる三角形ポリゴンの数を取得する

proc MV1SetMeshVisible*(MHandle: cint; MeshIndex: cint; VisibleFlag: cint): cint
##  指定メッシュの表示、非表示状態を変更する( TRUE:表示  FALSE:非表示 )

proc MV1GetMeshVisible*(MHandle: cint; MeshIndex: cint): cint
##  指定メッシュの表示、非表示状態を取得する( TRUE:表示  FALSE:非表示 )

proc MV1SetMeshDifColorScale*(MHandle: cint; MeshIndex: cint; Scale: COLOR_F): cint
##  指定のメッシュのディフューズカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1SetMeshSpcColorScale*(MHandle: cint; MeshIndex: cint; Scale: COLOR_F): cint
##  指定のメッシュのスペキュラカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1SetMeshEmiColorScale*(MHandle: cint; MeshIndex: cint; Scale: COLOR_F): cint
##  指定のメッシュのエミッシブカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1SetMeshAmbColorScale*(MHandle: cint; MeshIndex: cint; Scale: COLOR_F): cint
##  指定のメッシュのアンビエントカラーのスケール値を設定する( デフォルト値は 1.0f )

proc MV1GetMeshDifColorScale*(MHandle: cint; MeshIndex: cint): COLOR_F
##  指定のメッシュのディフューズカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetMeshSpcColorScale*(MHandle: cint; MeshIndex: cint): COLOR_F
##  指定のメッシュのスペキュラカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetMeshEmiColorScale*(MHandle: cint; MeshIndex: cint): COLOR_F
##  指定のメッシュのエミッシブカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1GetMeshAmbColorScale*(MHandle: cint; MeshIndex: cint): COLOR_F
##  指定のメッシュのアンビエントカラーのスケール値を取得する( デフォルト値は 1.0f )

proc MV1SetMeshOpacityRate*(MHandle: cint; MeshIndex: cint; Rate: cfloat): cint
##  指定のメッシュの不透明度を設定する( 不透明 1.0f ～ 透明 0.0f )

proc MV1GetMeshOpacityRate*(MHandle: cint; MeshIndex: cint): cfloat
##  指定のメッシュの不透明度を取得する( 不透明 1.0f ～ 透明 0.0f )

proc MV1SetMeshDrawBlendMode*(MHandle: cint; MeshIndex: cint; BlendMode: cint): cint
##  指定のメッシュの描画ブレンドモードを設定する( DX_BLENDMODE_ALPHA 等 )

proc MV1SetMeshDrawBlendParam*(MHandle: cint; MeshIndex: cint; BlendParam: cint): cint
##  指定のメッシュの描画ブレンドパラメータを設定する

proc MV1GetMeshDrawBlendMode*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュの描画ブレンドモードを取得する( DX_BLENDMODE_ALPHA 等 )

proc MV1GetMeshDrawBlendParam*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュの描画ブレンドパラメータを設定する

proc MV1SetMeshBaseVisible*(MHandle: cint; MeshIndex: cint; VisibleFlag: cint): cint
##  指定のメッシュの初期表示状態を設定する( TRUE:表示  FALSE:非表示 )

proc MV1GetMeshBaseVisible*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュの初期表示状態を取得する( TRUE:表示  FALSE:非表示 )

proc MV1SetMeshBackCulling*(MHandle: cint; MeshIndex: cint; CullingFlag: cint): cint
##  指定のメッシュのバックカリングを行うかどうかを設定する( DX_CULLING_LEFT 等 )

proc MV1GetMeshBackCulling*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュのバックカリングを行うかどうかを取得する( DX_CULLING_LEFT 等 )

proc MV1GetMeshMaxPosition*(MHandle: cint; MeshIndex: cint): VECTOR
##  指定のメッシュに含まれるポリゴンの最大ローカル座標を取得する

proc MV1GetMeshMinPosition*(MHandle: cint; MeshIndex: cint): VECTOR
##  指定のメッシュに含まれるポリゴンの最小ローカル座標を取得する

proc MV1GetMeshTListNum*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュに含まれるトライアングルリストの数を取得する

proc MV1GetMeshTList*(MHandle: cint; MeshIndex: cint; Index: cint): cint
##  指定のメッシュに含まれるトライアングルリストのインデックスを取得する

proc MV1GetMeshSemiTransState*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュに半透明要素があるかどうかを取得する( 戻り値 TRUE:ある  FALSE:ない )

proc MV1SetMeshUseVertDifColor*(MHandle: cint; MeshIndex: cint; UseFlag: cint): cint
##  指定のメッシュの頂点ディフューズカラーをマテリアルのディフューズカラーの代わりに使用するかどうかを設定する( TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する )

proc MV1SetMeshUseVertSpcColor*(MHandle: cint; MeshIndex: cint; UseFlag: cint): cint
##  指定のメッシュの頂点スペキュラカラーをマテリアルのスペキュラカラーの代わりに使用するかどうかを設定する( TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する )

proc MV1GetMeshUseVertDifColor*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュの頂点ディフューズカラーをマテリアルのディフューズカラーの代わりに使用するかどうかの設定を取得する( 戻り値  TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する )

proc MV1GetMeshUseVertSpcColor*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュの頂点スペキュラカラーをマテリアルのスペキュラカラーの代わりに使用するかどうかの設定を取得する( 戻り値  TRUE:マテリアルカラーの代わりに使用する  FALSE:マテリアルカラーを使用する )

proc MV1GetMeshShapeFlag*(MHandle: cint; MeshIndex: cint): cint
##  指定のメッシュがシェイプメッシュかどうかを取得する( 戻り値 TRUE:シェイプメッシュ  FALSE:通常メッシュ )
##  シェイプ関係

proc MV1GetShapeNum*(MHandle: cint): cint
##  モデルに含まれるシェイプの数を取得する

proc MV1SearchShape*(MHandle: cint; ShapeName: ptr TCHAR): cint
##  シェイプの名前からモデル中のシェイプのシェイプインデックスを取得する( 無かった場合は戻り値が-1 )

proc MV1SearchShapeWithStrLen*(MHandle: cint; ShapeName: ptr TCHAR;
                              ShapeNameLength: csize_t): cint
##  シェイプの名前からモデル中のシェイプのシェイプインデックスを取得する( 無かった場合は戻り値が-1 )

proc MV1GetShapeName*(MHandle: cint; ShapeIndex: cint): ptr TCHAR
##  指定シェイプの名前を取得する

proc MV1GetShapeTargetMeshNum*(MHandle: cint; ShapeIndex: cint): cint
##  指定シェイプが対象としているメッシュの数を取得する

proc MV1GetShapeTargetMesh*(MHandle: cint; ShapeIndex: cint; Index: cint): cint
##  指定シェイプが対象としているメッシュのメッシュインデックスを取得する

proc MV1SetShapeRate*(MHandle: cint; ShapeIndex: cint; Rate: cfloat;
                     Type: cint = DX_MV1_SHAPERATE_ADD): cint
##  指定シェイプの有効率を設定する( Rate  0.0f:0% ～ 1.0f:100% )

proc MV1GetShapeRate*(MHandle: cint; ShapeIndex: cint): cfloat
##  指定シェイプの有効率を取得する( 戻り値  0.0f:0% ～ 1.0f:100% )

proc MV1GetShapeApplyRate*(MHandle: cint; ShapeIndex: cint): cfloat
##  指定シェイプの有効率を取得する( 戻り値  0.0f:0% ～ 1.0f:100% )( MV1SetShapeRate で指定した値がそのまま戻り値となる MV1GetShapeRate と異なりアニメーションのシェイプ情報なども加味した値が戻り値となります )
##  トライアングルリスト関係

proc MV1GetTriangleListNum*(MHandle: cint): cint
##  モデルに含まれるトライアングルリストの数を取得する

proc MV1GetTriangleListVertexType*(MHandle: cint; TListIndex: cint): cint
##  指定のトライアングルリストの頂点データタイプを取得する( DX_MV1_VERTEX_TYPE_1FRAME 等 )

proc MV1GetTriangleListPolygonNum*(MHandle: cint; TListIndex: cint): cint
##  指定のトライアングルリストに含まれるポリゴンの数を取得する

proc MV1GetTriangleListVertexNum*(MHandle: cint; TListIndex: cint): cint
##  指定のトライアングルリストに含まれる頂点データの数を取得する

proc MV1GetTriangleListLocalWorldMatrixNum*(MHandle: cint; TListIndex: cint): cint
##  指定のトライアングルリストが使用する座標変換行列の数を取得する

proc MV1GetTriangleListLocalWorldMatrix*(MHandle: cint; TListIndex: cint;
                                        LWMatrixIndex: cint): MATRIX
##  指定のトライアングルリストが使用する座標変換行列( ローカル→ワールド )を取得する

proc MV1GetTriangleListPolygonVertexPosition*(MHandle: cint; TListIndex: cint;
    PolygonIndex: cint; VertexPositionArray: ptr VECTOR = nil;
    MatrixWeightArray: ptr cfloat = nil): cint
##  指定のトライアングルリストの指定のポリゴンが使用している頂点の座標を取得する( 戻り値  エラー：-1  0以上：ポリゴンが使用している頂点の数 )

proc MV1GetTriangleListUseMaterial*(MHandle: cint; TListIndex: cint): cint
##  指定のトライアングルリストが使用しているマテリアルのインデックスを取得する
##  コリジョン関係

proc MV1SetupCollInfo*(MHandle: cint; FrameIndex: cint = -1; XDivNum: cint = 32;
                      YDivNum: cint = 8; ZDivNum: cint = 32; MeshIndex: cint = -1): cint
##  コリジョン情報を構築する

proc MV1TerminateCollInfo*(MHandle: cint; FrameIndex: cint = -1; MeshIndex: cint = -1): cint
##  コリジョン情報の後始末

proc MV1RefreshCollInfo*(MHandle: cint; FrameIndex: cint = -1; MeshIndex: cint = -1): cint
##  コリジョン情報を更新する

proc MV1CollCheck_Line*(MHandle: cint; FrameIndex: cint; PosStart: VECTOR;
                       PosEnd: VECTOR; MeshIndex: cint = -1): MV1_COLL_RESULT_POLY
##  線とモデルの当たり判定

proc MV1CollCheck_LineDim*(MHandle: cint; FrameIndex: cint; PosStart: VECTOR;
                          PosEnd: VECTOR; MeshIndex: cint = -1): MV1_COLL_RESULT_POLY_DIM
##  線とモデルの当たり判定( 戻り値が MV1_COLL_RESULT_POLY_DIM )

proc MV1CollCheck_Sphere*(MHandle: cint; FrameIndex: cint; CenterPos: VECTOR;
                         r: cfloat; MeshIndex: cint = -1): MV1_COLL_RESULT_POLY_DIM
##  球とモデルの当たり判定

proc MV1CollCheck_Capsule*(MHandle: cint; FrameIndex: cint; Pos1: VECTOR; Pos2: VECTOR;
                          r: cfloat; MeshIndex: cint = -1): MV1_COLL_RESULT_POLY_DIM
##  カプセルとモデルの当たり判定

proc MV1CollCheck_Triangle*(MHandle: cint; FrameIndex: cint; Pos1: VECTOR;
                           Pos2: VECTOR; Pos3: VECTOR; MeshIndex: cint = -1): MV1_COLL_RESULT_POLY_DIM
##  三角形とモデルの当たり判定

proc MV1CollCheck_GetResultPoly*(ResultPolyDim: MV1_COLL_RESULT_POLY_DIM;
                                PolyNo: cint): MV1_COLL_RESULT_POLY
##  コリジョン結果ポリゴン配列から指定番号のポリゴン情報を取得する

proc MV1CollResultPolyDimTerminate*(ResultPolyDim: MV1_COLL_RESULT_POLY_DIM): cint
##  コリジョン結果ポリゴン配列の後始末をする
##  参照用メッシュ関係

proc MV1SetupReferenceMesh*(MHandle: cint; FrameIndex: cint; IsTransform: cint;
                           IsPositionOnly: cint = FALSE; MeshIndex: cint = -1): cint
##  参照用メッシュのセットアップ

proc MV1TerminateReferenceMesh*(MHandle: cint; FrameIndex: cint; IsTransform: cint;
                               IsPositionOnly: cint = FALSE; MeshIndex: cint = -1): cint
##  参照用メッシュの後始末

proc MV1RefreshReferenceMesh*(MHandle: cint; FrameIndex: cint; IsTransform: cint;
                             IsPositionOnly: cint = FALSE; MeshIndex: cint = -1): cint
##  参照用メッシュの更新

proc MV1GetReferenceMesh*(MHandle: cint; FrameIndex: cint; IsTransform: cint;
                         IsPositionOnly: cint = FALSE; MeshIndex: cint = -1): MV1_REF_POLYGONLIST
##  参照用メッシュを取得する
##  DxLive2DCubism4.cpp 関数 プロトタイプ宣言

proc Live2D_SetCubism4CoreDLLPath*(CoreDLLFilePath: ptr TCHAR): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_SetCubism4CoreDLLPathWithStrLen*(CoreDLLFilePath: ptr TCHAR;
    CoreDLLFilePathLength: csize_t): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_SetCubism3CoreDLLPath*(CoreDLLFilePath: ptr TCHAR): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_SetCubism3CoreDLLPathWithStrLen*(CoreDLLFilePath: ptr TCHAR;
    CoreDLLFilePathLength: csize_t): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_RenderBegin*(): cint
##  Live2D の描画処理を開始する

proc Live2D_RenderEnd*(): cint
##  Live2D の描画処理を終了する

proc Live2D_LoadModel*(FilePath: ptr TCHAR): cint
##  Live2D のモデルファイルを読み込む( 0以上:Live2Dモデルハンドル  マイナス値:エラー発生 )

proc Live2D_LoadModelWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t): cint
##  Live2D のモデルファイルを読み込む( 0以上:Live2Dモデルハンドル  マイナス値:エラー発生 )

proc Live2D_DeleteModel*(Live2DModelHandle: cint): cint
##  Live2D のモデルを削除する

proc Live2D_InitModel*(): cint
##  すべての Live2D のモデルを削除する

proc Live2D_SetUserShader*(TargetShader: cint; ##  DX_LIVE2D_SHADER_NORMAL_PIXEL 等
                          ShaderHandle: cint = -1): cint
##  Live2D のモデル描画で使用するシェーダーを設定する( ShaderHandle に -1 を渡すと設定を解除 )

proc Live2D_DrawCallback*(Callback: proc (Live2DModelHandle: cint;
                                       TextureIndex: cint; UserData: pointer);
                         UserData: pointer): cint
##  Live2D のモデル描画の前に呼ばれるコールバック関数を設定する Callback に NULL を渡すと設定を解除 )

proc Live2D_SetUseAutoScaling*(UseFlag: cint): cint
##  Live2D のモデル描画をする際に、画面サイズに応じたスケーリングを行うかを設定する( UseFlag  TRUE:スケーリングを行う( デフォルト )  FALSE:スケーリングを行わない )

proc Live2D_SetUseAutoCentering*(UseFlag: cint): cint
##  Live2D のモデルを画面の中心に描画するかを設定する( UseFlag   TRUE:画面の中心に描画する( デフォルト )   FALSE:画面の中心に描画しない )

proc Live2D_SetUseReverseYAxis*(UseFlag: cint): cint
##  Live2D_Model_SetTranslate で指定する平行移動値の y の向きを反転するかを設定する( UseFlag   TRUE:反転する( デフォルト )   FALSE:反転しない )

proc Live2D_Model_Update*(Live2DModelHandle: cint; DeltaTimeSeconds: cfloat): cint
##  Live2D のモデルの状態を更新する

proc Live2D_Model_SetTranslate*(Live2DModelHandle: cint; x: cfloat; y: cfloat): cint
##  Live2D のモデルの位置を設定する

proc Live2D_Model_SetExtendRate*(Live2DModelHandle: cint; ExRateX: cfloat;
                                ExRateY: cfloat): cint
##  Live2D のモデルの拡大率を設定する

proc Live2D_Model_SetRotate*(Live2DModelHandle: cint; RotAngle: cfloat): cint
##  Live2D のモデルの回転を設定する

proc Live2D_Model_Draw*(Live2DModelHandle: cint): cint
##  Live2D のモデルを描画する

proc Live2D_Model_StartMotion*(Live2DModelHandle: cint; group: ptr TCHAR; no: cint): cint
##  Live2D のモデルの指定のモーションを再生する

proc Live2D_Model_StartMotionWithStrLen*(Live2DModelHandle: cint; group: ptr TCHAR;
                                        groupLength: csize_t; no: cint): cint
##  Live2D のモデルの指定のモーションを再生する

proc Live2D_Model_GetLastPlayMotionNo*(Live2DModelHandle: cint): cint
##  Live2D のモデルで最後に再生したモーションのグループ内の番号を取得する

proc Live2D_Model_IsMotionFinished*(Live2DModelHandle: cint): cint
##  Live2D のモデルのモーション再生が終了しているかを取得する( 戻り値  TRUE:再生が終了している  FALSE:再生中 )

proc Live2D_Model_GetMotionPlayTime*(Live2DModelHandle: cint): cfloat
##  Live2D のモデルのモーション再生時間を取得する

proc Live2D_Model_SetExpression*(Live2DModelHandle: cint; expressionID: ptr TCHAR): cint
##  Live2D のモデルの指定の表情モーションを設定する

proc Live2D_Model_SetExpressionWithStrLen*(Live2DModelHandle: cint;
    expressionID: ptr TCHAR; expressionIDLength: csize_t): cint
##  Live2D のモデルの指定の表情モーションを設定する

proc Live2D_Model_HitTest*(Live2DModelHandle: cint; hitAreaName: ptr TCHAR; x: cfloat;
                          y: cfloat): cint
##  指定の座標が Live2D のモデルの指定の当たり判定の矩形範囲内か判定する( TRUE:矩形範囲内  FALSE:矩形範囲外 )

proc Live2D_Model_HitTestWithStrLen*(Live2DModelHandle: cint;
                                    hitAreaName: ptr TCHAR;
                                    hitAreaNameLength: csize_t; x: cfloat; y: cfloat): cint
##  指定の座標が Live2D のモデルの指定の当たり判定の矩形範囲内か判定する( TRUE:矩形範囲内  FALSE:矩形範囲外 )

proc Live2D_Model_GetParameterCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルに設定されているパラメータの数を取得する

proc Live2D_Model_GetParameterId*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルに設定されているパラメータのIDを取得する

proc Live2D_Model_GetParameterValue*(Live2DModelHandle: cint;
                                    parameterId: ptr TCHAR): cfloat
##  Live2D のモデルに設定されているパラメータを取得する

proc Live2D_Model_GetParameterValueWithStrLen*(Live2DModelHandle: cint;
    parameterId: ptr TCHAR; parameterIdLength: csize_t): cfloat
##  Live2D のモデルに設定されているパラメータを取得する

proc Live2D_Model_SetParameterValue*(Live2DModelHandle: cint;
                                    parameterId: ptr TCHAR; value: cfloat): cint
##  Live2D のモデルに設定されているパラメータを設定する

proc Live2D_Model_SetParameterValueWithStrLen*(Live2DModelHandle: cint;
    parameterId: ptr TCHAR; parameterIdLength: csize_t; value: cfloat): cint
##  Live2D のモデルに設定されているパラメータを設定する

proc Live2D_Model_GetHitAreasCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルに設定された当たり判定の数を取得する

proc Live2D_Model_GetHitAreaName*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルの当たり判定に設定された名前を取得する

proc Live2D_Model_GetPhysicsFileName*(Live2DModelHandle: cint): ptr TCHAR
##  Live2D のモデルの物理演算設定ファイルの名前を取得する

proc Live2D_Model_GetPoseFileName*(Live2DModelHandle: cint): ptr TCHAR
##  Live2D のモデルのパーツ切り替え設定ファイルの名前を取得する

proc Live2D_Model_GetExpressionCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルの表情設定ファイルの数を取得する

proc Live2D_Model_GetExpressionName*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルの表情設定ファイルを識別するIDを取得する

proc Live2D_Model_GetExpressionFileName*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルの表情設定ファイルの名前を取得する

proc Live2D_Model_GetMotionGroupCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルのモーショングループの数を取得する

proc Live2D_Model_GetMotionGroupName*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルのモーショングループの名前を取得する

proc Live2D_Model_GetMotionCount*(Live2DModelHandle: cint; groupName: ptr TCHAR): cint
##  Live2D のモデルのモーショングループに含まれるモーションの数を取得する

proc Live2D_Model_GetMotionCountWithStrLen*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; groupNameLength: csize_t): cint
##  Live2D のモデルのモーショングループに含まれるモーションの数を取得する

proc Live2D_Model_GetMotionFileName*(Live2DModelHandle: cint; groupName: ptr TCHAR;
                                    index: cint): ptr TCHAR
##  Live2D のモデルのグループ名とインデックス値からモーションファイルの名前を取得する

proc Live2D_Model_GetMotionFileNameWithStrLen*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; groupNameLength: csize_t; index: cint): ptr TCHAR
##  Live2D のモデルのグループ名とインデックス値からモーションファイルの名前を取得する

proc Live2D_Model_GetMotionSoundFileName*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; index: cint): ptr TCHAR
##  Live2D のモデルのモーションに対応するサウンドファイルの名前を取得する

proc Live2D_Model_GetMotionSoundFileNameWithStrLen*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; groupNameLength: csize_t; index: cint): ptr TCHAR
##  Live2D のモデルのモーションに対応するサウンドファイルの名前を取得する

proc Live2D_Model_GetMotionFadeInTimeValue*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; index: cint): cfloat
##  Live2D のモデルのモーション開始時のフェードイン処理時間を取得する

proc Live2D_Model_GetMotionFadeInTimeValueWithStrLen*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; groupNameLength: csize_t; index: cint): cfloat
##  Live2D のモデルのモーション開始時のフェードイン処理時間を取得する

proc Live2D_Model_GetMotionFadeOutTimeValue*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; index: cint): cfloat
##  Live2D のモデルのモーション終了時のフェードアウト処理時間を取得する

proc Live2D_Model_GetMotionFadeOutTimeValueWithStrLen*(Live2DModelHandle: cint;
    groupName: ptr TCHAR; groupNameLength: csize_t; index: cint): cfloat
##  Live2D のモデルのモーション終了時のフェードアウト処理時間を取得する

proc Live2D_Model_GetUserDataFile*(Live2DModelHandle: cint): ptr TCHAR
##  Live2D のモデルのユーザデータのファイル名を取得する

proc Live2D_Model_GetEyeBlinkParameterCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルの目パチに関連付けられたパラメータの数を取得する

proc Live2D_Model_GetEyeBlinkParameterId*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルの目パチに関連付けられたパラメータのIDを取得する

proc Live2D_Model_GetLipSyncParameterCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルのリップシンクに関連付けられたパラメータの数を取得する

proc Live2D_Model_GetLipSyncParameterId*(Live2DModelHandle: cint; index: cint): ptr TCHAR
##  Live2D のモデルのリップシンクに関連付けられたパラメータのIDを取得する

proc Live2D_Model_GetCanvasWidth*(Live2DModelHandle: cint): cfloat
##  Live2D のモデルのキャンバスの横幅を取得する

proc Live2D_Model_GetCanvasHeight*(Live2DModelHandle: cint): cfloat
##  Live2D のモデルのキャンバスの縦幅を取得する

{.pop.}
