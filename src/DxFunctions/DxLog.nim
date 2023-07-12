import ../DxDll
{.push dynlib: DLL, importc.}

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

{.pop.}
