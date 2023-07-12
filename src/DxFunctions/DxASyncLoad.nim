import ../DxDll
{.push dynlib: DLL.}
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

{.pop.}
