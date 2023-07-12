import ../DxDll
{.push dynlib: DLL, importc.}

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

{.pop.}
