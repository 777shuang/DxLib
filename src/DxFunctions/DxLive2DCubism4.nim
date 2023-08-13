import ../DxDll
{.push dynlib: DLL, importc.}

##  DxLive2DCubism4.cpp 関数 プロトタイプ宣言

proc Live2D_SetCubism4CoreDLLPath*(CoreDLLFilePath: cstring): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_SetCubism4CoreDLLPathWithStrLen*(CoreDLLFilePath: cstring;
    CoreDLLFilePathLength: csize_t): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_SetCubism3CoreDLLPath*(CoreDLLFilePath: cstring): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_SetCubism3CoreDLLPathWithStrLen*(CoreDLLFilePath: cstring;
    CoreDLLFilePathLength: csize_t): cint
##  Live2DCubismCore.dll のファイルパスを設定する

proc Live2D_RenderBegin*(): cint
##  Live2D の描画処理を開始する

proc Live2D_RenderEnd*(): cint
##  Live2D の描画処理を終了する

proc Live2D_LoadModel*(FilePath: cstring): cint
##  Live2D のモデルファイルを読み込む( 0以上:Live2Dモデルハンドル  マイナス値:エラー発生 )

proc Live2D_LoadModelWithStrLen*(FilePath: cstring; FilePathLength: csize_t): cint
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

proc Live2D_Model_StartMotion*(Live2DModelHandle: cint; group: cstring; no: cint): cint
##  Live2D のモデルの指定のモーションを再生する

proc Live2D_Model_StartMotionWithStrLen*(Live2DModelHandle: cint; group: cstring;
                                        groupLength: csize_t; no: cint): cint
##  Live2D のモデルの指定のモーションを再生する

proc Live2D_Model_GetLastPlayMotionNo*(Live2DModelHandle: cint): cint
##  Live2D のモデルで最後に再生したモーションのグループ内の番号を取得する

proc Live2D_Model_IsMotionFinished*(Live2DModelHandle: cint): cint
##  Live2D のモデルのモーション再生が終了しているかを取得する( 戻り値  TRUE:再生が終了している  FALSE:再生中 )

proc Live2D_Model_GetMotionPlayTime*(Live2DModelHandle: cint): cfloat
##  Live2D のモデルのモーション再生時間を取得する

proc Live2D_Model_SetExpression*(Live2DModelHandle: cint; expressionID: cstring): cint
##  Live2D のモデルの指定の表情モーションを設定する

proc Live2D_Model_SetExpressionWithStrLen*(Live2DModelHandle: cint;
    expressionID: cstring; expressionIDLength: csize_t): cint
##  Live2D のモデルの指定の表情モーションを設定する

proc Live2D_Model_HitTest*(Live2DModelHandle: cint; hitAreaName: cstring; x: cfloat;
                          y: cfloat): cint
##  指定の座標が Live2D のモデルの指定の当たり判定の矩形範囲内か判定する( TRUE:矩形範囲内  FALSE:矩形範囲外 )

proc Live2D_Model_HitTestWithStrLen*(Live2DModelHandle: cint;
                                    hitAreaName: cstring;
                                    hitAreaNameLength: csize_t; x: cfloat; y: cfloat): cint
##  指定の座標が Live2D のモデルの指定の当たり判定の矩形範囲内か判定する( TRUE:矩形範囲内  FALSE:矩形範囲外 )

proc Live2D_Model_GetParameterCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルに設定されているパラメータの数を取得する

proc Live2D_Model_GetParameterId*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルに設定されているパラメータのIDを取得する

proc Live2D_Model_GetParameterValue*(Live2DModelHandle: cint;
                                    parameterId: cstring): cfloat
##  Live2D のモデルに設定されているパラメータを取得する

proc Live2D_Model_GetParameterValueWithStrLen*(Live2DModelHandle: cint;
    parameterId: cstring; parameterIdLength: csize_t): cfloat
##  Live2D のモデルに設定されているパラメータを取得する

proc Live2D_Model_SetParameterValue*(Live2DModelHandle: cint;
                                    parameterId: cstring; value: cfloat): cint
##  Live2D のモデルに設定されているパラメータを設定する

proc Live2D_Model_SetParameterValueWithStrLen*(Live2DModelHandle: cint;
    parameterId: cstring; parameterIdLength: csize_t; value: cfloat): cint
##  Live2D のモデルに設定されているパラメータを設定する

proc Live2D_Model_GetHitAreasCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルに設定された当たり判定の数を取得する

proc Live2D_Model_GetHitAreaName*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルの当たり判定に設定された名前を取得する

proc Live2D_Model_GetPhysicsFileName*(Live2DModelHandle: cint): cstring
##  Live2D のモデルの物理演算設定ファイルの名前を取得する

proc Live2D_Model_GetPoseFileName*(Live2DModelHandle: cint): cstring
##  Live2D のモデルのパーツ切り替え設定ファイルの名前を取得する

proc Live2D_Model_GetExpressionCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルの表情設定ファイルの数を取得する

proc Live2D_Model_GetExpressionName*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルの表情設定ファイルを識別するIDを取得する

proc Live2D_Model_GetExpressionFileName*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルの表情設定ファイルの名前を取得する

proc Live2D_Model_GetMotionGroupCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルのモーショングループの数を取得する

proc Live2D_Model_GetMotionGroupName*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルのモーショングループの名前を取得する

proc Live2D_Model_GetMotionCount*(Live2DModelHandle: cint; groupName: cstring): cint
##  Live2D のモデルのモーショングループに含まれるモーションの数を取得する

proc Live2D_Model_GetMotionCountWithStrLen*(Live2DModelHandle: cint;
    groupName: cstring; groupNameLength: csize_t): cint
##  Live2D のモデルのモーショングループに含まれるモーションの数を取得する

proc Live2D_Model_GetMotionFileName*(Live2DModelHandle: cint; groupName: cstring;
                                    index: cint): cstring
##  Live2D のモデルのグループ名とインデックス値からモーションファイルの名前を取得する

proc Live2D_Model_GetMotionFileNameWithStrLen*(Live2DModelHandle: cint;
    groupName: cstring; groupNameLength: csize_t; index: cint): cstring
##  Live2D のモデルのグループ名とインデックス値からモーションファイルの名前を取得する

proc Live2D_Model_GetMotionSoundFileName*(Live2DModelHandle: cint;
    groupName: cstring; index: cint): cstring
##  Live2D のモデルのモーションに対応するサウンドファイルの名前を取得する

proc Live2D_Model_GetMotionSoundFileNameWithStrLen*(Live2DModelHandle: cint;
    groupName: cstring; groupNameLength: csize_t; index: cint): cstring
##  Live2D のモデルのモーションに対応するサウンドファイルの名前を取得する

proc Live2D_Model_GetMotionFadeInTimeValue*(Live2DModelHandle: cint;
    groupName: cstring; index: cint): cfloat
##  Live2D のモデルのモーション開始時のフェードイン処理時間を取得する

proc Live2D_Model_GetMotionFadeInTimeValueWithStrLen*(Live2DModelHandle: cint;
    groupName: cstring; groupNameLength: csize_t; index: cint): cfloat
##  Live2D のモデルのモーション開始時のフェードイン処理時間を取得する

proc Live2D_Model_GetMotionFadeOutTimeValue*(Live2DModelHandle: cint;
    groupName: cstring; index: cint): cfloat
##  Live2D のモデルのモーション終了時のフェードアウト処理時間を取得する

proc Live2D_Model_GetMotionFadeOutTimeValueWithStrLen*(Live2DModelHandle: cint;
    groupName: cstring; groupNameLength: csize_t; index: cint): cfloat
##  Live2D のモデルのモーション終了時のフェードアウト処理時間を取得する

proc Live2D_Model_GetUserDataFile*(Live2DModelHandle: cint): cstring
##  Live2D のモデルのユーザデータのファイル名を取得する

proc Live2D_Model_GetEyeBlinkParameterCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルの目パチに関連付けられたパラメータの数を取得する

proc Live2D_Model_GetEyeBlinkParameterId*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルの目パチに関連付けられたパラメータのIDを取得する

proc Live2D_Model_GetLipSyncParameterCount*(Live2DModelHandle: cint): cint
##  Live2D のモデルのリップシンクに関連付けられたパラメータの数を取得する

proc Live2D_Model_GetLipSyncParameterId*(Live2DModelHandle: cint; index: cint): cstring
##  Live2D のモデルのリップシンクに関連付けられたパラメータのIDを取得する

proc Live2D_Model_GetCanvasWidth*(Live2DModelHandle: cint): cfloat
##  Live2D のモデルのキャンバスの横幅を取得する

proc Live2D_Model_GetCanvasHeight*(Live2DModelHandle: cint): cfloat
##  Live2D のモデルのキャンバスの縦幅を取得する

{.pop.}
