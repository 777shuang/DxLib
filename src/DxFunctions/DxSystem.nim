import ../DxDll
{.push dynlib: DLL, importc.}

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

proc GetLastErrorMessage*(StringBuffer: cstring; StringBufferBytes: cint): cint
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

proc GetClipboardText*(DestBuffer: cstring): cint
##  クリップボードに格納されているテキストデータを読み出す( DestBuffer:文字列を格納するバッファの先頭アドレス   戻り値  -1:クリップボードにテキストデータが無い  -1以外:クリップボードに格納されている文字列データのサイズ( 単位:byte ) )

proc SetClipboardText*(Text: cstring): cint
##  クリップボードにテキストデータを格納する

proc SetClipboardTextWithStrLen*(Text: cstring; TextLength: csize_t): cint
##  クリップボードにテキストデータを格納する
##  iniファイル関係

proc GetPrivateProfileStringDx*(AppName: cstring; KeyName: cstring;
                               Default: cstring; ReturnedStringBuffer: cstring;
                               ReturnedStringBufferBytes: csize_t;
                               IniFilePath: cstring;
                               IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileString のＤＸライブラリ版

proc GetPrivateProfileStringDxWithStrLen*(AppName: cstring;
    AppNameLength: csize_t; KeyName: cstring; KeyNameLength: csize_t;
    Default: cstring; DefaultLength: csize_t; ReturnedStringBuffer: cstring;
    ReturnedStringBufferBytes: csize_t; IniFilePath: cstring;
    IniFilePathLength: csize_t; IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileString のＤＸライブラリ版

proc GetPrivateProfileIntDx*(AppName: cstring; KeyName: cstring; Default: cint;
                            IniFilePath: cstring;
                            IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileInt のＤＸライブラリ版

proc GetPrivateProfileIntDxWithStrLen*(AppName: cstring; AppNameLength: csize_t;
                                      KeyName: cstring; KeyNameLength: csize_t;
                                      Default: cint; IniFilePath: cstring;
                                      IniFilePathLength: csize_t;
                                      IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileInt のＤＸライブラリ版

proc GetPrivateProfileStringDxForMem*(AppName: cstring; KeyName: cstring;
                                     Default: cstring;
                                     ReturnedStringBuffer: cstring;
                                     ReturnedStringBufferBytes: csize_t;
                                     IniFileImage: pointer;
                                     IniFileImageBytes: csize_t;
                                     IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileStringDx のメモリから読み込む版

proc GetPrivateProfileStringDxForMemWithStrLen*(AppName: cstring;
    AppNameLength: csize_t; KeyName: cstring; KeyNameLength: csize_t;
    Default: cstring; DefaultLength: csize_t; ReturnedStringBuffer: cstring;
    ReturnedStringBufferBytes: csize_t; IniFileImage: pointer;
    IniFileImageBytes: csize_t; IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileStringDx のメモリから読み込む版

proc GetPrivateProfileIntDxForMem*(AppName: cstring; KeyName: cstring;
                                  Default: cint; IniFileImage: pointer;
                                  IniFileImageBytes: csize_t;
                                  IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileIntDx のメモリから読み込む版

proc GetPrivateProfileIntDxForMemWithStrLen*(AppName: cstring;
    AppNameLength: csize_t; KeyName: cstring; KeyNameLength: csize_t; Default: cint;
    IniFileImage: pointer; IniFileImageBytes: csize_t;
    IniFileCharCodeFormat: cint = -1): cint
##  GetPrivateProfileIntDx のメモリから読み込む版
##  メールアプリを送信メール編集状態で起動する
##  MailAddr    : 宛先( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  MailCCAddr  : CC の宛先( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  MailBCCAddr : BCC の宛先( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  Subject     : タイトル( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください
##  Text        : 本文( NULL で無効 )、メールアドレスが複数ある場合はカンマ『,』で区切ってください

proc MailApp_Send*(MailAddr: cstring = nil; MailCCAddr: cstring = nil;
                  MailBCCAddr: cstring = nil; Subject: cstring = nil;
                  Text: cstring = nil): cint
proc MailApp_SendWithStrLen*(MailAddr: cstring = nil; MailAddrLength: csize_t = 0;
                            MailCCAddr: cstring = nil;
                            MailCCAddrLength: csize_t = 0;
                            MailBCCAddr: cstring = nil;
                            MailBCCAddrLength: csize_t = 0;
                            Subject: cstring = nil; SubjectLength: csize_t = 0;
                            Text: cstring = nil; TextLength: csize_t = 0): cint

{.pop.}
