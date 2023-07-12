import ../DxDll
{.push dynlib: DLL.}
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

{.pop.}
