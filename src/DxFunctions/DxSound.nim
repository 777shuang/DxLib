import ../DxDll
{.push dynlib: DLL, importc.}

##  DxSound.cpp関数プロトタイプ宣言
##  サウンドデータ管理系関数

proc InitSoundMem*(): cint
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

proc AddStreamSoundMemToFile*(WaveFile: cstring; LoopNum: cint; SoundHandle: cint;
                             StreamDataType: cint; UnionHandle: cint = -1): cint
##  ストリーム再生タイプのサウンドハンドルにサウンドファイルを再生対象に追加する

proc AddStreamSoundMemToFileWithStrLen*(WaveFile: cstring;
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

proc LoadSoundMem2*(FileName1: cstring; FileName2: cstring): cint
##  前奏部とループ部に分かれたサウンドファイルを読み込みサウンドハンドルを作成する

proc LoadSoundMem2WithStrLen*(FileName1: cstring; FileName1Length: csize_t;
                             FileName2: cstring; FileName2Length: csize_t): cint
##  前奏部とループ部に分かれたサウンドファイルを読み込みサウンドハンドルを作成する

proc LoadBGM*(FileName: cstring): cint
##  主にＢＧＭを読み込みサウンドハンドルを作成するのに適した関数

proc LoadBGMWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  主にＢＧＭを読み込みサウンドハンドルを作成するのに適した関数

proc LoadSoundMemBase*(FileName: cstring; BufferNum: cint; UnionHandle: cint = -1): cint
##  サウンドファイルからサウンドハンドルを作成する

proc LoadSoundMemBaseWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                BufferNum: cint; UnionHandle: cint = -1): cint
##  サウンドファイルからサウンドハンドルを作成する

proc LoadSoundMem*(FileName: cstring; BufferNum: cint = 3; UnionHandle: cint = -1): cint
##  LoadSoundMemBase の別名関数

proc LoadSoundMemWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                            BufferNum: cint = 3; UnionHandle: cint = -1): cint
##  LoadSoundMemBase の別名関数

proc LoadSoundMemToBufNumSitei*(FileName: cstring; BufferNum: cint): cint
##  LoadSoundMem を使用して下さい

proc LoadSoundMemToBufNumSiteiWithStrLen*(FileName: cstring;
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

proc DeleteSoundMem*(SoundHandle: cint): cint
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

proc GetMP3TagInfo*(FileName: cstring; TitleBuffer: cstring;
                   TitleBufferBytes: csize_t; ArtistBuffer: cstring;
                   ArtistBufferBytes: csize_t; AlbumBuffer: cstring;
                   AlbumBufferBytes: csize_t; YearBuffer: cstring;
                   YearBufferBytes: csize_t; CommentBuffer: cstring;
                   CommentBufferBytes: csize_t; TrackBuffer: cstring;
                   TrackBufferBytes: csize_t; GenreBuffer: cstring;
                   GenreBufferBytes: csize_t; PictureGrHandle: ptr cint): cint
##  MP3ファイルのタグ情報を取得する

proc GetMP3TagInfoWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                             TitleBuffer: cstring; TitleBufferBytes: csize_t;
                             ArtistBuffer: cstring; ArtistBufferBytes: csize_t;
                             AlbumBuffer: cstring; AlbumBufferBytes: csize_t;
                             YearBuffer: cstring; YearBufferBytes: csize_t;
                             CommentBuffer: cstring; CommentBufferBytes: csize_t;
                             TrackBuffer: cstring; TrackBufferBytes: csize_t;
                             GenreBuffer: cstring; GenreBufferBytes: csize_t;
                             PictureGrHandle: ptr cint): cint
##  MP3ファイルのタグ情報を取得する

proc GetOggCommentNum*(FileName: cstring): cint
##  Oggファイルのコメント情報の数を取得する

proc GetOggCommentNumWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  Oggファイルのコメント情報の数を取得する

proc GetOggComment*(FileName: cstring; CommentIndex: cint;
                   CommentNameBuffer: cstring; CommentNameBufferBytes: csize_t;
                   CommentBuffer: cstring; CommentBufferBytes: csize_t): cint
##  Oggファイルのコメント情報を取得する

proc GetOggCommentWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                             CommentIndex: cint; CommentNameBuffer: cstring;
                             CommentNameBufferBytes: csize_t;
                             CommentBuffer: cstring; CommentBufferBytes: csize_t): cint
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

proc PlaySoundFile*(FileName: cstring; PlayType: cint): cint
##  サウンドファイルを再生する

proc PlaySoundFileWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                             PlayType: cint): cint
##  サウンドファイルを再生する

proc PlaySound*(FileName: cstring; PlayType: cint): cint
##  PlaySoundFile の旧名称

proc PlaySoundWithStrLen*(FileName: cstring; FileNameLength: csize_t; PlayType: cint): cint
##  PlaySoundFile の旧名称

proc PlaySoundDX*(FileName: cstring; PlayType: cint): cint
##  PlaySoundFile の旧名称

proc PlaySoundDXWithStrLen*(FileName: cstring; FileNameLength: csize_t;
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

proc LoadSoftSound*(FileName: cstring): cint
##  ソフトウエアで扱う波形データハンドルをサウンドファイルから作成する

proc LoadSoftSoundWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
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

proc SaveSoftSound*(SoftSoundHandle: cint; FileName: cstring): cint
##  ソフトウエアで扱う波形データハンドルをWAVEファイル(PCM)形式で保存する

proc SaveSoftSoundWithStrLen*(SoftSoundHandle: cint; FileName: cstring;
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

proc LoadMusicMem*(FileName: cstring): cint
##  ＭＩＤＩファイルを読み込みＭＩＤＩハンドルを作成する

proc LoadMusicMemWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
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

proc PlayMusic*(FileName: cstring; PlayType: cint): cint
##  ＭＩＤＩファイルを演奏する

proc PlayMusicWithStrLen*(FileName: cstring; FileNameLength: csize_t; PlayType: cint): cint
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

proc SetDXArchiveExtension*(Extension: cstring = nil): cint
##  検索するＤＸアーカイブファイルの拡張子を設定する( Extension:拡張子名文字列 )

proc SetDXArchiveExtensionWithStrLen*(Extension: cstring = nil;
                                     ExtensionLength: csize_t = 0): cint
##  検索するＤＸアーカイブファイルの拡張子を設定する( Extension:拡張子名文字列 )

proc SetDXArchiveKeyString*(KeyString: cstring = nil): cint
##  ＤＸアーカイブファイルの鍵文字列を設定する( KeyString:鍵文字列 )

proc SetDXArchiveKeyStringWithStrLen*(KeyString: cstring = nil;
                                     KeyStringLength: csize_t = 0): cint
##  ＤＸアーカイブファイルの鍵文字列を設定する( KeyString:鍵文字列 )

proc DXArchivePreLoad*(FilePath: cstring; ASync: cint = FALSE): cint
##  指定のＤＸＡファイルを丸ごとメモリに読み込む( 戻り値  -1:エラー  0:成功 )

proc DXArchivePreLoadWithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                ASync: cint = FALSE): cint
##  指定のＤＸＡファイルを丸ごとメモリに読み込む( 戻り値  -1:エラー  0:成功 )

proc DXArchiveCheckIdle*(FilePath: cstring): cint
##  指定のＤＸＡファイルの事前読み込みが完了したかどうかを取得する( 戻り値  TRUE:完了した FALSE:まだ )

proc DXArchiveCheckIdleWithStrLen*(FilePath: cstring; FilePathLength: csize_t): cint
##  指定のＤＸＡファイルの事前読み込みが完了したかどうかを取得する( 戻り値  TRUE:完了した FALSE:まだ )

proc DXArchiveRelease*(FilePath: cstring): cint
##  指定のＤＸＡファイルをメモリから解放する

proc DXArchiveReleaseWithStrLen*(FilePath: cstring; FilePathLength: csize_t): cint
##  指定のＤＸＡファイルをメモリから解放する

proc DXArchiveCheckFile*(FilePath: cstring; TargetFilePath: cstring): cint
##  ＤＸＡファイルの中に指定のファイルが存在するかどうかを調べる、TargetFilePath はＤＸＡファイルをカレントフォルダとした場合のパス( 戻り値:  -1=エラー  0:無い  1:ある )

proc DXArchiveCheckFileWithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                  TargetFilePath: cstring;
                                  TargetFilePathLength: csize_t): cint
##  ＤＸＡファイルの中に指定のファイルが存在するかどうかを調べる、TargetFilePath はＤＸＡファイルをカレントフォルダとした場合のパス( 戻り値:  -1=エラー  0:無い  1:ある )

proc DXArchiveSetMemImage*(ArchiveImage: pointer; ArchiveImageSize: cint;
                          EmulateFilePath: cstring;
                          ArchiveImageCopyFlag: cint = FALSE;
                          ArchiveImageReadOnly: cint = TRUE): cint
##  メモリ上に展開されたＤＸＡファイルを指定のファイルパスにあることにする( EmulateFilePath は見立てる dxa ファイルのパス、例えばＤＸＡファイルイメージを Image.dxa というファイル名で c:\Temp にあることにしたい場合は EmulateFilePath に "c:\\Temp\\Image.dxa" を渡す、SetDXArchiveExtension で拡張子を変更している場合は EmulateFilePath に渡すファイルパスの拡張子もそれに合わせる必要あり )

proc DXArchiveSetMemImageWithStrLen*(ArchiveImage: pointer; ArchiveImageSize: cint;
                                    EmulateFilePath: cstring;
                                    EmulateFilePathLength: csize_t;
                                    ArchiveImageCopyFlag: cint = FALSE;
                                    ArchiveImageReadOnly: cint = TRUE): cint
##  メモリ上に展開されたＤＸＡファイルを指定のファイルパスにあることにする( EmulateFilePath は見立てる dxa ファイルのパス、例えばＤＸＡファイルイメージを Image.dxa というファイル名で c:\Temp にあることにしたい場合は EmulateFilePath に "c:\\Temp\\Image.dxa" を渡す、SetDXArchiveExtension で拡張子を変更している場合は EmulateFilePath に渡すファイルパスの拡張子もそれに合わせる必要あり )

proc DXArchiveReleaseMemImage*(ArchiveImage: pointer): cint
##  DXArchiveSetMemImage の設定を解除する

proc HashCRC32*(SrcData: pointer; SrcDataSize: csize_t): DWORD
##  バイナリデータを元に CRC32 のハッシュ値を計算する

{.pop.}
