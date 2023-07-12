import ../DxDll
{.push dynlib: DLL, importc.}

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

{.pop.}
