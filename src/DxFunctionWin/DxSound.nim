import ../DxDll
{.push dynlib: DLL, importc.}

##  DxSound.cpp関数プロトタイプ宣言
##  サウンドデータ管理系関数

proc LoadSoundMemByResource*(ResourceName: ptr TCHAR; ResourceType: ptr TCHAR;
                            BufferNum: cint = 1): cint
##  サウンドリソースからサウンドハンドルを作成する

proc LoadSoundMemByResourceWithStrLen*(ResourceName: ptr TCHAR;
                                      ResourceNameLength: csize_t;
                                      ResourceType: ptr TCHAR;
                                      ResourceTypeLength: csize_t;
                                      BufferNum: cint = 1): cint
##  サウンドリソースからサウンドハンドルを作成する
##  設定関係関数

proc SetUseSoftwareMixingSoundFlag*(Flag: cint): cint
##  サウンドの処理をソフトウエアで行うかどうかを設定する( TRUE:ソフトウエア  FALSE:ハードウエア( デフォルト ) )

proc SetEnableXAudioFlag*(Flag: cint): cint
##  サウンドの再生にXAudioを使用するかどうかを設定する( TRUE:使用する  FALSE:使用しない( デフォルト ) )

proc SetEnableWASAPIFlag*(Flag: cint; IsExclusive: cint = TRUE;
                         DevicePeriod: cint = -1; SamplePerSec: cint = 44100): cint
##  サウンドの再生にWASAPIを使用するかどうかを設定する( Flag  TRUE:使用する  FALSE:使用しない( デフォルト ), IsExclusive  TRUE:排他モードを使用する  FALSE:排他モードを使用しない, DevicePeriod 再生遅延時間、100ナノ秒単位( 100000 で 10ミリ秒 )、-1でデフォルト値, SamplePerSec サンプリングレート )

proc SetEnableASIOFlag*(Flag: cint; BufferSize: cint = -1; SamplePerSec: cint = 44100): cint
##  サウンドの再生にASIOを使用するかどうかを設定する( Flag  TRUE:使用する  FALSE:使用しない( デフォルト ), BufferSize 再生バッファのサイズ、小さいほど遅延が少なくなりますが、処理が間に合わずにブツブツノイズが発生する可能性も高くなります( -1 でデフォルト値 ), SamplePerSec サンプリングレート )

proc SetUseASIODriverIndex*(Index: cint): cint
##  サウンドの再生に使用するASIOドライバーの番号を設定する( デフォルトでは 0 )

proc SetEnableMMEwaveOutFlag*(Flag: cint; BufferSamples: cint = -1;
                             SamplePerSec: cint = 44100): cint
##  サウンドの再生にマルチメディアAPIの waveOut を使用するかどうかを設定する( Flag  TRUE:使用する  FALSE:使用しない( デフォルト ), BufferSamples 再生バッファのサイズ、小さいほど遅延が少なくなりますが、処理が間に合わずにブツブツノイズが発生する可能性も高くなります( -1 でデフォルト値 ), SamplePerSec サンプリングレート )
##  情報取得系関数

proc GetDSoundObj*(): pointer
##  戻り値を IDirectSound * にキャストして下さい
##  ＤＸライブラリが使用している DirectSound オブジェクトを取得する
##  ＭＩＤＩ制御関数

proc LoadMusicMemByResource*(ResourceName: ptr TCHAR; ResourceType: ptr TCHAR): cint
##  リソース上のＭＩＤＩファイルからＭＩＤＩハンドルを作成する

proc LoadMusicMemByResourceWithStrLen*(ResourceName: ptr TCHAR;
                                      ResourceNameLength: csize_t;
                                      ResourceType: ptr TCHAR;
                                      ResourceTypeLength: csize_t): cint
##  リソース上のＭＩＤＩファイルからＭＩＤＩハンドルを作成する

proc PlayMusicByResource*(ResourceName: ptr TCHAR; ResourceType: ptr TCHAR;
                         PlayType: cint): cint
##  リソースからＭＩＤＩファイルを読み込んで演奏する

proc PlayMusicByResourceWithStrLen*(ResourceName: ptr TCHAR;
                                   ResourceNameLength: csize_t;
                                   ResourceType: ptr TCHAR;
                                   ResourceTypeLength: csize_t; PlayType: cint): cint
##  リソースからＭＩＤＩファイルを読み込んで演奏する

{.pop.}
