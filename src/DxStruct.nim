import winim
import DxDefine
##  ＩＭＥ入力文字列の描画に必要な情報の内の文節情報

type
  IMEINPUTCLAUSEDATA* {.bycopy.} = object
    Position*: cint
    ##  何文字目から
    Length*: cint
    ##  何文字か

  LPIMEINPUTCLAUSEDATA* = ptr IMEINPUTCLAUSEDATA

##  ＩＭＥ入力文字列の描画に必要な情報

type
  IMEINPUTDATA* {.bycopy.} = object
    InputString*: cstring
    ##  入力中の文字列
    CursorPosition*: cint
    ##  カーソルの入力文字列中の位置(バイト単位)
    ClauseData*: ptr IMEINPUTCLAUSEDATA
    ##  文節情報
    ClauseNum*: cint
    ##  文節情報の数
    SelectClause*: cint
    ##  選択中の分節( -1 の場合はどの文節にも属していない( 末尾にカーソルがある ) )
    CandidateNum*: cint
    ##  変換候補の数( 0の場合は変換中ではない )
    CandidateList*: ptr cstring
    ##  変換候補文字列リスト( 例：ｎ番目の候補を描画する場合  DrawString( 0, 0, data.CandidateList[ n ], GetColor(255,255,255) ); )
    SelectCandidate*: cint
    ##  選択中の変換候補
    ConvertFlag*: cint
    ##  文字変換中かどうか( TRUE:変換中  FALSE:変換中ではない( 文字単位でカーソルが移動できる状態 ) )

  LPIMEINPUTDATA* = ptr IMEINPUTDATA

##  描画文字列一文字の情報

type
  DRAWCHARINFO* {.bycopy.} = object
    Char*: array[14, TCHAR]
    ##  文字
    Bytes*: WORD
    ##  文字のバイト数
    DrawX*: cfloat
    DrawY*: cfloat
    ##  描画位置
    SizeX*: cfloat
    SizeY*: cfloat
    ##  描画サイズ

  LPDRAWCHARINFO* = ptr DRAWCHARINFO

##  画面モード情報データ型

type
  DISPLAYMODEDATA* {.bycopy.} = object
    Width*: cint
    ##  水平解像度
    Height*: cint
    ##  垂直解像度
    ColorBitDepth*: cint
    ##  色ビット深度
    RefreshRate*: cint
    ##  リフレッシュレート( -1 の場合は規定値 )

  LPDISPLAYMODEDATA* = ptr DISPLAYMODEDATA

##  タイムデータ型

type
  DATEDATA* {.bycopy.} = object
    Year*: cint
    ##  年
    Mon*: cint
    ##  月
    Day*: cint
    ##  日
    Hour*: cint
    ##  時間
    Min*: cint
    ##  分
    Sec*: cint
    ##  秒

  LPDATEDATA* = ptr DATEDATA

##  ファイル情報構造体

type
  FILEINFO* {.bycopy.} = object
    Name*: array[260, TCHAR]
    ##  オブジェクト名
    DirFlag*: cint
    ##  ディレクトリかどうか( TRUE:ディレクトリ  FALSE:ファイル )
    Size*: LONGLONG
    ##  サイズ
    CreationTime*: DATEDATA
    ##  作成日時
    LastWriteTime*: DATEDATA
    ##  最終更新日時

  LPFILEINFO* = ptr FILEINFO

##  ファイル情報構造体（ wchar_t 版 ）

type
  FILEINFOW* {.bycopy.} = object
    Name*: array[260, wchar_t]
    ##  オブジェクト名
    DirFlag*: cint
    ##  ディレクトリかどうか( TRUE:ディレクトリ  FALSE:ファイル )
    Size*: LONGLONG
    ##  サイズ
    CreationTime*: DATEDATA
    ##  作成日時
    LastWriteTime*: DATEDATA
    ##  最終更新日時

  LPFILEINFOW* = ptr FILEINFOW

##  行列構造体

type
  MATRIX* {.bycopy.} = object
    m*: array[4, array[4, cfloat]]

  LPMATRIX* = ptr MATRIX
  MATRIX_D* {.bycopy.} = object
    m*: array[4, array[4, cdouble]]

  LPMATRIX_D* = ptr MATRIX_D

##  ベクトルデータ型

type
  VECTOR* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat

  LPVECTOR* = ptr VECTOR
  FLOAT3* = VECTOR
  LPFLOAT3* = ptr VECTOR
  VECTOR_D* {.bycopy.} = object
    x*: cdouble
    y*: cdouble
    z*: cdouble

  LPVECTOR_D* = ptr VECTOR_D
  DOUBLE3* = VECTOR_D
  LPDOUBLE3* = ptr VECTOR_D

##  FLOAT2個データ型

type
  FLOAT2* {.bycopy.} = object
    u*: cfloat
    v*: cfloat


##  float 型のカラー値

type
  COLOR_F* {.bycopy.} = object
    r*: cfloat
    g*: cfloat
    b*: cfloat
    a*: cfloat

  LPCOLOR_F* = ptr COLOR_F

##  unsigned char 型のカラー値

type
  COLOR_U8* {.bycopy.} = object
    b*: BYTE
    g*: BYTE
    r*: BYTE
    a*: BYTE


##  FLOAT4個データ型

type
  FLOAT4* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
    w*: cfloat

  LPFLOAT4* = ptr FLOAT4

##  DOUBLE4個データ型

type
  DOUBLE4* {.bycopy.} = object
    x*: cdouble
    y*: cdouble
    z*: cdouble
    w*: cdouble

  LPDOUBLE4* = ptr DOUBLE4

##  INT4個データ型

type
  INT4* {.bycopy.} = object
    x*: cint
    y*: cint
    z*: cint
    w*: cint


when not defined(DX_NOTUSE_DRAWFUNCTION):
  ##  ２Ｄ描画に使用する頂点データ型(DrawPrimitive2D用)
  type
    VERTEX2D* {.bycopy.} = object
      pos*: VECTOR
      rhw*: cfloat
      dif*: COLOR_U8
      u*: cfloat
      v*: cfloat

    LPVERTEX2D* = ptr VERTEX2D
  ##  ２Ｄ描画に使用する頂点データ型(DrawPrimitive2DToShader用)
  type
    VERTEX2DSHADER* {.bycopy.} = object
      pos*: VECTOR
      rhw*: cfloat
      dif*: COLOR_U8
      spc*: COLOR_U8
      u*: cfloat
      v*: cfloat
      su*: cfloat
      sv*: cfloat

    LPVERTEX2DSHADER* = ptr VERTEX2DSHADER
  ##  ２Ｄ描画に使用する頂点データ型(公開用)
  type
    VERTEX* {.bycopy.} = object
      x*: cfloat
      y*: cfloat
      u*: cfloat
      v*: cfloat
      b*: cuchar
      g*: cuchar
      r*: cuchar
      a*: cuchar

  ##  ３Ｄ描画に使用する頂点データ型( 旧バージョンのもの )
  type
    VERTEX3D_OLD* {.bycopy.} = object
      pos*: VECTOR
      b*: cuchar
      g*: cuchar
      r*: cuchar
      a*: cuchar
      u*: cfloat
      v*: cfloat

    LPVERTEX3D_OLD* = ptr VERTEX3D_OLD
  ##  ３Ｄ描画に使用する頂点データ型
  type
    VERTEX3D* {.bycopy.} = object
      pos*: VECTOR
      ##  座標
      norm*: VECTOR
      ##  法線
      dif*: COLOR_U8
      ##  ディフューズカラー
      spc*: COLOR_U8
      ##  スペキュラカラー
      u*: cfloat
      v*: cfloat
      ##  テクスチャ座標
      su*: cfloat
      sv*: cfloat
      ##  補助テクスチャ座標

    LPVERTEX3D* = ptr VERTEX3D
  ##  ３Ｄ描画に使用する頂点データ型( DrawPrimitive3DToShader用 )
  ##  注意…メンバ変数に追加があるかもしれませんので、宣言時の初期化( VERTEX3DSHADER Vertex = { 0.0f, 0.0f, ... というようなもの )はしない方が良いです
  type
    VERTEX3DSHADER* {.bycopy.} = object
      pos*: VECTOR
      ##  座標
      spos*: FLOAT4
      ##  補助座標
      norm*: VECTOR
      ##  法線
      tan*: VECTOR
      ##  接線
      binorm*: VECTOR
      ##  従法線
      dif*: COLOR_U8
      ##  ディフューズカラー
      spc*: COLOR_U8
      ##  スペキュラカラー
      u*: cfloat
      v*: cfloat
      ##  テクスチャ座標
      su*: cfloat
      sv*: cfloat
      ##  補助テクスチャ座標

    LPVERTEX3DSHADER* = ptr VERTEX3DSHADER
  ##  ライトパラメータ
  type
    LIGHTPARAM* {.bycopy.} = object
      LightType*: cint
      ##  ライトのタイプ( DX_LIGHTTYPE_D3DLIGHT_POINT 等 )
      Diffuse*: COLOR_F
      ##  ディフューズカラー
      Specular*: COLOR_F
      ##  スペキュラカラー
      Ambient*: COLOR_F
      ##  アンビエント色
      Position*: VECTOR
      ##  位置
      Direction*: VECTOR
      ##  方向
      Range*: cfloat
      ##  有効距離
      Falloff*: cfloat
      ##  フォールオフ 1.0f にしておくのが好ましい
      Attenuation0*: cfloat
      ##  距離による減衰係数０
      Attenuation1*: cfloat
      ##  距離による減衰係数１
      Attenuation2*: cfloat
      ##  距離による減衰係数２
      Theta*: cfloat
      ##  スポットライトの内部コーンの照明角度( ラジアン )
      Phi*: cfloat
      ##  スポットライトの外部コーンの照明角度

  ##  マテリアルパラメータ
  type
    MATERIALPARAM* {.bycopy.} = object
      Diffuse*: COLOR_F
      ##  ディフューズカラー
      Ambient*: COLOR_F
      ##  アンビエントカラー
      Specular*: COLOR_F
      ##  スペキュラカラー
      Emissive*: COLOR_F
      ##  エミッシブカラー
      Power*: cfloat
      ##  スペキュラハイライトの鮮明度

##  ラインヒットチェック結果格納用構造体

type
  HITRESULT_LINE* {.bycopy.} = object
    HitFlag*: cint
    ##  当たったかどうか( 1:当たった  0:当たらなかった )
    Position*: VECTOR
    ##  当たった座標


##  ラインヒットチェック結果格納用構造体

type
  HITRESULT_LINE_D* {.bycopy.} = object
    HitFlag*: cint
    ##  当たったかどうか( 1:当たった  0:当たらなかった )
    Position*: VECTOR_D
    ##  当たった座標


##  関数 Segment_Segment_Analyse の結果を受け取る為の構造体

type
  SEGMENT_SEGMENT_RESULT* {.bycopy.} = object
    SegA_SegB_MinDist_Square*: cfloat
    ##  線分Ａと線分Ｂが最も接近する座標間の距離の二乗
    SegA_MinDist_Pos1_Pos2_t*: cfloat
    ##  線分Ａと線分Ｂに最も接近する座標の線分Ａの t ( 0.0f ～ 1.0f 、最近点座標 = ( SegAPos2 - SegAPos1 ) * t + SegAPos1 )
    SegB_MinDist_Pos1_Pos2_t*: cfloat
    ##  線分Ｂが線分Ａに最も接近する座標の線分Ｂの t ( 0.0f ～ 1.0f 、最近点座標 = ( SegBPos2 - SegBPos1 ) * t + SegBPos1 )
    SegA_MinDist_Pos*: VECTOR
    ##  線分Ａが線分Ｂに最も接近する線分Ａ上の座標
    SegB_MinDist_Pos*: VECTOR
    ##  線分Ｂが線分Ａに最も接近する線分Ｂ上の座標


##  関数 Segment_Segment_Analyse の結果を受け取る為の構造体

type
  SEGMENT_SEGMENT_RESULT_D* {.bycopy.} = object
    SegA_SegB_MinDist_Square*: cdouble
    ##  線分Ａと線分Ｂが最も接近する座標間の距離の二乗
    SegA_MinDist_Pos1_Pos2_t*: cdouble
    ##  線分Ａと線分Ｂに最も接近する座標の線分Ａの t ( 0.0 ～ 1.0 、最近点座標 = ( SegAPos2 - SegAPos1 ) * t + SegAPos1 )
    SegB_MinDist_Pos1_Pos2_t*: cdouble
    ##  線分Ｂが線分Ａに最も接近する座標の線分Ｂの t ( 0.0 ～ 1.0 、最近点座標 = ( SegBPos2 - SegBPos1 ) * t + SegBPos1 )
    SegA_MinDist_Pos*: VECTOR_D
    ##  線分Ａが線分Ｂに最も接近する線分Ａ上の座標
    SegB_MinDist_Pos*: VECTOR_D
    ##  線分Ｂが線分Ａに最も接近する線分Ｂ上の座標


##  関数 Segment_Point_Analyse の結果を受け取る為の構造体

type
  SEGMENT_POINT_RESULT* {.bycopy.} = object
    Seg_Point_MinDist_Square*: cfloat
    ##  線分と点が最も接近する座標間の距離の二乗
    Seg_MinDist_Pos1_Pos2_t*: cfloat
    ##  線分が点に最も接近する座標の線分の t ( 0.0f ～ 1.0f 、最近点座標 = ( SegPos2 - SegPos1 ) * t + SegPos1 )
    Seg_MinDist_Pos*: VECTOR
    ##  線分が点に最も接近する線分上の座標


##  関数 Segment_Point_Analyse の結果を受け取る為の構造体

type
  SEGMENT_POINT_RESULT_D* {.bycopy.} = object
    Seg_Point_MinDist_Square*: cdouble
    ##  線分と点が最も接近する座標間の距離の二乗
    Seg_MinDist_Pos1_Pos2_t*: cdouble
    ##  線分が点に最も接近する座標の線分の t ( 0.0 ～ 1.0 、最近点座標 = ( SegPos2 - SegPos1 ) * t + SegPos1 )
    Seg_MinDist_Pos*: VECTOR_D
    ##  線分が点に最も接近する線分上の座標


##  関数 Segment_Triangle_Analyse の結果を受け取る為の構造体

type
  SEGMENT_TRIANGLE_RESULT* {.bycopy.} = object
    Seg_Tri_MinDist_Square*: cfloat
    ##  線分と三角形が最も接近する座標間の距離の二乗
    Seg_MinDist_Pos1_Pos2_t*: cfloat
    ##  線分が三角形に最も接近する座標の線分の t ( 0.0f ～ 1.0f 、最近点座標 = ( SegPos2 - SegPos1 ) * t + SegPos1 )
    Seg_MinDist_Pos*: VECTOR
    ##  線分が三角形に最も接近する線分上の座標
    Tri_MinDist_Pos1_w*: cfloat
    ##  三角形が線分に最も接近する座標の三角形座標１の重み( 最近点座標 = TriPos1 * TriPos1_w + TriPos2 * TriPos2_w + TriPos3 * TriPos3_w )
    Tri_MinDist_Pos2_w*: cfloat
    ##  三角形が線分に最も接近する座標の三角形座標２の重み
    Tri_MinDist_Pos3_w*: cfloat
    ##  三角形が線分に最も接近する座標の三角形座標３の重み
    Tri_MinDist_Pos*: VECTOR
    ##  三角形が線分に最も接近する三角形上の座標


##  関数 Segment_Triangle_Analyse の結果を受け取る為の構造体

type
  SEGMENT_TRIANGLE_RESULT_D* {.bycopy.} = object
    Seg_Tri_MinDist_Square*: cdouble
    ##  線分と三角形が最も接近する座標間の距離の二乗
    Seg_MinDist_Pos1_Pos2_t*: cdouble
    ##  線分が三角形に最も接近する座標の線分の t ( 0.0 ～ 1.0 、最近点座標 = ( SegPos2 - SegPos1 ) * t + SegPos1 )
    Seg_MinDist_Pos*: VECTOR_D
    ##  線分が三角形に最も接近する線分上の座標
    Tri_MinDist_Pos1_w*: cdouble
    ##  三角形が線分に最も接近する座標の三角形座標１の重み( 最近点座標 = TriPos1 * TriPos1_w + TriPos2 * TriPos2_w + TriPos3 * TriPos3_w )
    Tri_MinDist_Pos2_w*: cdouble
    ##  三角形が線分に最も接近する座標の三角形座標２の重み
    Tri_MinDist_Pos3_w*: cdouble
    ##  三角形が線分に最も接近する座標の三角形座標３の重み
    Tri_MinDist_Pos*: VECTOR_D
    ##  三角形が線分に最も接近する三角形上の座標


##  関数 Triangle_Point_Analyse の結果を受け取る為の構造体

type
  TRIANGLE_POINT_RESULT* {.bycopy.} = object
    Tri_Pnt_MinDist_Square*: cfloat
    ##  三角形と点が最も接近する座標間の距離の二乗
    Tri_MinDist_Pos1_w*: cfloat
    ##  三角形が点に最も接近する座標の三角形座標１の重み( 最近点座標 = TriPos1 * TriPos1_w + TriPos2 * TriPos2_w + TriPos3 * TriPos3_w )
    Tri_MinDist_Pos2_w*: cfloat
    ##  三角形が点に最も接近する座標の三角形座標２の重み
    Tri_MinDist_Pos3_w*: cfloat
    ##  三角形が点に最も接近する座標の三角形座標３の重み
    Tri_MinDist_Pos*: VECTOR
    ##  三角形が点に最も接近する三角形上の座標


##  関数 Triangle_Point_Analyse の結果を受け取る為の構造体

type
  TRIANGLE_POINT_RESULT_D* {.bycopy.} = object
    Tri_Pnt_MinDist_Square*: cdouble
    ##  三角形と点が最も接近する座標間の距離の二乗
    Tri_MinDist_Pos1_w*: cdouble
    ##  三角形が点に最も接近する座標の三角形座標１の重み( 最近点座標 = TriPos1 * TriPos1_w + TriPos2 * TriPos2_w + TriPos3 * TriPos3_w )
    Tri_MinDist_Pos2_w*: cdouble
    ##  三角形が点に最も接近する座標の三角形座標２の重み
    Tri_MinDist_Pos3_w*: cdouble
    ##  三角形が点に最も接近する座標の三角形座標３の重み
    Tri_MinDist_Pos*: VECTOR_D
    ##  三角形が点に最も接近する三角形上の座標


##  関数 Plane_Point_Analyse の結果を受け取る為の構造体

type
  PLANE_POINT_RESULT* {.bycopy.} = object
    Pnt_Plane_Normal_Side*: cint
    ##  点が平面の法線の側にあるかどうか( 1:法線の側にある  0:法線と反対側にある )
    Plane_Pnt_MinDist_Square*: cfloat
    ##  平面と点の距離
    Plane_MinDist_Pos*: VECTOR
    ##  平面上の点との最近点座標


##  関数 Plane_Point_Analyse の結果を受け取る為の構造体

type
  PLANE_POINT_RESULT_D* {.bycopy.} = object
    Pnt_Plane_Normal_Side*: cint
    ##  点が平面の法線の側にあるかどうか( 1:法線の側にある  0:法線と反対側にある )
    Plane_Pnt_MinDist_Square*: cdouble
    ##  平面と点の距離
    Plane_MinDist_Pos*: VECTOR_D
    ##  平面上の点との最近点座標


when not defined(DX_NOTUSE_DRAWFUNCTION):
  ##  コリジョン結果代入用ポリゴン
  type
    MV1_COLL_RESULT_POLY* {.bycopy.} = object
      HitFlag*: cint
      ##  ( MV1CollCheck_Line でのみ有効 )ヒットフラグ( 1:ヒットした  0:ヒットしなかった )
      HitPosition*: VECTOR
      ##  ( MV1CollCheck_Line でのみ有効 )ヒット座標
      FrameIndex*: cint
      ##  当たったポリゴンが含まれるフレームの番号
      MeshIndex*: cint
      ##  当たったポリゴンが含まれるメッシュの番号( メッシュ単位で判定した場合のみ有効 )
      PolygonIndex*: cint
      ##  当たったポリゴンの番号
      MaterialIndex*: cint
      ##  当たったポリゴンが使用しているマテリアルの番号
      Position*: array[3, VECTOR]
      ##  当たったポリゴンを形成する三点の座標
      Normal*: VECTOR
      ##  当たったポリゴンの法線
      PositionWeight*: array[3, cfloat]
      ##  当たった座標は、当たったポリゴンの三点それぞれどの割合で影響しているか、の値( 当たった座標 = Position[ 0 ] * PositionWeight[ 0 ] + Position[ 1 ] * PositionWeight[ 1 ] + Position[ 2 ] * PositionWeight[ 2 ] )
      PosMaxWeightFrameIndex*: array[3, cint]
      ##  当たったポリゴンの座標がそれぞれ最も影響を受けているフレームの番号

  ##  コリジョン結果代入用ポリゴン配列
  type
    MV1_COLL_RESULT_POLY_DIM* {.bycopy.} = object
      HitNum*: cint
      ##  ヒットしたポリゴンの数
      Dim*: ptr MV1_COLL_RESULT_POLY
      ##  ヒットしたポリゴンの配列( HitNum個分存在する )

  ##  参照用頂点構造体
  type
    MV1_REF_VERTEX* {.bycopy.} = object
      Position*: VECTOR
      ##  位置
      Normal*: VECTOR
      ##  法線
      TexCoord*: array[2, FLOAT2]
      ##  テクスチャ座標
      DiffuseColor*: COLOR_U8
      ##  ディフューズカラー
      SpecularColor*: COLOR_U8
      ##  スペキュラカラー
      MaxWeightFrameIndex*: cint
      ##  最も大きな影響を与えているフレーム( スキニングメッシュ用 )

  ##  参照用ポリゴン構造体
  type
    MV1_REF_POLYGON* {.bycopy.} = object
      FrameIndex*: cushort
      ##  このポリゴンが属しているフレーム
      MeshIndex*: cushort
      ##  このポリゴンが属しているメッシュ
      MaterialIndex*: cushort
      ##  使用しているマテリアル
      VIndexTarget*: cushort
      ##  VIndex が指すインデックスの参照先( 1:フレーム  0:モデル全体 )
      VIndex*: array[3, cint]
      ##  ３角形ポリゴンを成す参照頂点のインデックス
      MinPosition*: VECTOR
      ##  ポリゴンを成す頂点座標の最小値
      MaxPosition*: VECTOR
      ##  ポリゴンを成す頂点座標の最大値

  ##  参照用ポリゴンデータ構造体
  type
    MV1_REF_POLYGONLIST* {.bycopy.} = object
      PolygonNum*: cint
      ##  参照用ポリゴンの数
      VertexNum*: cint
      ##  頂点の数
      MinPosition*: VECTOR
      ##  頂点座標の最小値
      MaxPosition*: VECTOR
      ##  頂点座標の最大値
      Polygons*: ptr MV1_REF_POLYGON
      ##  参照用ポリゴン配列
      Vertexs*: ptr MV1_REF_VERTEX
      ##  参照用頂点配列

##  ３Ｄサウンドリバーブエフェクトパラメータ構造体
##  ( 注釈は MSDN の XAUDIO2FX_REVERB_PARAMETERS 構造体の解説をほぼ引用しています )

type
  SOUND3D_REVERB_PARAM* {.bycopy.} = object
    WetDryMix*: cfloat
    ##  リバーブとなる出力の割合( 指定可能範囲 0.0f ～ 100.0f )
    ReflectionsDelay*: cuint
    ##  ダイレクト パスに対する初期反射の遅延時間、単位はミリ秒( 指定可能範囲 0 ～ 300 )
    ReverbDelay*: BYTE
    ##  初期反射に対するリバーブの遅延時間、単位はミリ秒( 指定可能範囲 0 ～ 85 )
    RearDelay*: BYTE
    ##  左後方出力および右後方出力の遅延時間、単位はミリ秒( 指定可能範囲 0 ～ 5 )
    PositionLeft*: BYTE
    ##  シミュレーション空間における視聴者に対する左入力の位置( 指定可能範囲 0 ～ 30 )
    ##  PositionLeft を最小値に設定した場合、左入力は視聴者の近くに配置されます。
    ##  この位置では、サウンド フィールドにおいて初期反射が優勢になり、残響減衰は弱まって、振幅が小さくなります。
    ##  PositionLeft を最大値に設定した場合、左入力はシミュレーション室内で視聴者から最大限遠い位置に配置されます。
    ##  PositionLeft は残響減衰時間 (部屋の残響効果) に影響せず、視聴者に対する音源の見かけの位置のみに影響します。
    PositionRight*: BYTE
    ##  PositionLeft と同効果の右入力値( 指定可能範囲 0 ～ 30 )、右入力にのみ影響を与える
    PositionMatrixLeft*: BYTE
    ##  音源から視聴者までの距離によるインプレッションを増減させる値( 指定可能範囲 0 ～ 30 )
    PositionMatrixRight*: BYTE
    ##  音源から視聴者までの距離によるインプレッションを増減させま値( 指定可能範囲 0 ～ 30 )
    EarlyDiffusion*: BYTE
    ##  個々の壁の反射特性値( 指定可能範囲 0 ～ 15 )、( 堅く平らな表面をシミュレートするには小さな値を設定し、散乱性の表面をシミュレートするには大きな値を設定します。)
    LateDiffusion*: BYTE
    ##  個々の壁のリバーブ特性値( 指定可能範囲 0 ～ 15 )、( 堅く平らな表面をシミュレートするには小さな値を設定し、散乱性の表面をシミュレートするには大きな値を設定します。)
    LowEQGain*: BYTE
    ##  1 kHz における減衰時間を基準にして低周波数の減衰時間調整値( 指定可能範囲 0 ～ 12 )
    ##  値とゲイン (dB) の関係
    ##  値          0  1  2  3  4  5  6  7  8  9 10 11 12
    ##  ゲイン(dB) -8 -7 -6 -5 -4 -3 -2 -1  0 +1 +2 +3 +4
    ##  LowEQGain の値が 8 の場合、低周波数の減衰時間と 1 kHz における減衰時間が等しくなることに注意してください
    LowEQCutoff*: BYTE
    ##  LowEQGain パラメーターにより制御されるローパス フィルターの折点周波数の設定値( 指定可能範囲 0 ～ 9 )
    ##  値と周波数 (Hz) の関係
    ##  値          0   1   2   3   4   5   6   7   8   9
    ##  周波数(Hz) 50 100 150 200 250 300 350 400 450 500
    HighEQGain*: BYTE
    ##  1 kHz における減衰時間を基準にして高周波数の減衰時間調整値( 指定可能範囲 0 ～ 8 )
    ##  値とゲイン (dB) の関係
    ##  値          0  1  2  3  4  5  6  7 8
    ##  ゲイン(dB) -8 -7 -6 -5 -4 -3 -2 -1 0
    ##  0 に設定すると、高周波数の音が 1 kHz の場合と同じ割合で減衰します。最大値に設定すると、高周波数の音が 1 kHz の場合よりもはるかに高い割合で減衰します。
    HighEQCutoff*: BYTE
    ##  HighEQGain パラメーターにより制御されるハイパス フィルターの折点周波数設定値( 指定可能範囲 0 ～ 14 )
    ##  値と周波数 (kHz) の関係
    ##  値          0    1    2     3    4     5    6     7    8     9   10    11   12    13   14
    ##  周波数(kHz) 1  1.5    2   2.5    3   3.5    4   4.5    5   5.5    6   6.5    7   7.5    8
    RoomFilterFreq*: cfloat
    ##  室内エフェクトのローパス フィルターの折点周波数、単位は Hz ( 指定可能範囲 20.0f ～ 20000.0f )
    RoomFilterMain*: cfloat
    ##  初期反射と後期フィールド残響の両方に適用されるローパス フィルターのパス バンド強度レベル、単位は dB ( 指定可能範囲 -100.0f ～ 0.0f )
    RoomFilterHF*: cfloat
    ##  折点周波数 (RoomFilterFreq) での初期反射と後期フィールド残響の両方に適用されるローパス フィルターのパス バンド強度レベル、単位は dB ( 指定可能範囲 -100.0f ～ 0.0f )
    ReflectionsGain*: cfloat
    ##  初期反射の強度/レベルを調整値、単位は dB ( 指定可能範囲 -100.0f ～ 20.0f )
    ReverbGain*: cfloat
    ##  リバーブの強度/レベルを調整値、単位は dB ( 指定可能範囲 -100.0f ～ 20.0f )
    DecayTime*: cfloat
    ##  1 kHz における残響減衰時間、単位は秒 ( 指定可能範囲 0.1f ～ 上限値特になし )、これは、フル スケールの入力信号が 60 dB 減衰するまでの時間です。
    Density*: cfloat
    ##  後期フィールド残響のモード密度を制御値、単位はパーセント( 指定可能範囲 0.0f ～ 100.0f )
    ##  無色 (colorless) の空間では、Density を最大値 (100.0f ) に設定する必要があります。
    ##  Density を小さくすると、サウンドはくぐもった音 (くし形フィルターが適用された音) になります。
    ##  これはサイロをシミュレーションするときに有効なエフェクトです。
    RoomSize*: cfloat
    ##  音響空間の見かけ上のサイズ、単位はフィート( 指定可能範囲 1.0f (30.48 cm) ～ 100.0f (30.48 m) )


##  ストリームデータ制御用関数ポインタ構造体タイプ２

type
  STREAMDATASHREDTYPE2* {.bycopy.} = object
    Open*: proc (Path: cstring; UseCacheFlag: cint; BlockReadFlag: cint;
               UseASyncReadFlag: cint): DWORD_PTR
    Close*: proc (Handle: DWORD_PTR): cint
    Tell*: proc (Handle: DWORD_PTR): LONGLONG
    Seek*: proc (Handle: DWORD_PTR; SeekPoint: LONGLONG; SeekType: cint): cint
    Read*: proc (Buffer: pointer; BlockSize: csize_t; DataNum: csize_t;
               Handle: DWORD_PTR): csize_t
    Eof*: proc (Handle: DWORD_PTR): cint
    IdleCheck*: proc (Handle: DWORD_PTR): cint
    ChDir*: proc (Path: cstring): cint
    GetDir*: proc (Buffer: cstring): cint
    GetDirS*: proc (Buffer: cstring; BufferSize: csize_t): cint
    FindFirst*: proc (FilePath: cstring; Buffer: ptr FILEINFO): DWORD_PTR
    ##  戻り値: -1=エラー  -1以外=FindHandle
    FindNext*: proc (FindHandle: DWORD_PTR; Buffer: ptr FILEINFO): cint
    ##  戻り値: -1=エラー  0=成功
    FindClose*: proc (FindHandle: DWORD_PTR): cint
    ##  戻り値: -1=エラー  0=成功


##  ストリームデータ制御用関数ポインタ構造体タイプ２の wchar_t 使用版

type
  STREAMDATASHREDTYPE2W* {.bycopy.} = object
    Open*: proc (Path: ptr wchar_t; UseCacheFlag: cint; BlockReadFlag: cint;
               UseASyncReadFlag: cint): DWORD_PTR
    Close*: proc (Handle: DWORD_PTR): cint
    Tell*: proc (Handle: DWORD_PTR): LONGLONG
    Seek*: proc (Handle: DWORD_PTR; SeekPoint: LONGLONG; SeekType: cint): cint
    Read*: proc (Buffer: pointer; BlockSize: csize_t; DataNum: csize_t;
               Handle: DWORD_PTR): csize_t
    Eof*: proc (Handle: DWORD_PTR): cint
    IdleCheck*: proc (Handle: DWORD_PTR): cint
    IsDXA*: proc (Handle: DWORD_PTR): cint
    ##  戻り値: -1=エラー  0=ＤＸアーカイブファイル内のファイルではない  1=ＤＸアーカイブファイル内のファイル
    ChDir*: proc (Path: ptr wchar_t): cint
    GetDir*: proc (Buffer: ptr wchar_t): cint
    GetDirS*: proc (Buffer: ptr wchar_t; BufferSize: csize_t): cint
    FindFirst*: proc (FilePath: ptr wchar_t; Buffer: ptr FILEINFOW): DWORD_PTR
    ##  戻り値: -1=エラー  -1以外=FindHandle
    FindNext*: proc (FindHandle: DWORD_PTR; Buffer: ptr FILEINFOW): cint
    ##  戻り値: -1=エラー  0=成功
    FindClose*: proc (FindHandle: DWORD_PTR): cint
    ##  戻り値: -1=エラー  0=成功


##  ストリームデータ制御用関数ポインタ構造体

type
  STREAMDATASHRED* {.bycopy.} = object
    Tell*: proc (StreamDataPoint: DWORD_PTR): LONGLONG
    Seek*: proc (StreamDataPoint: DWORD_PTR; SeekPoint: LONGLONG; SeekType: cint): cint
    Read*: proc (Buffer: pointer; BlockSize: csize_t; DataNum: csize_t;
               StreamDataPoint: DWORD_PTR): csize_t
    ## 	size_t					(*Write		)( void *Buffer, size_t BlockSize, size_t DataNum, DWORD_PTR StreamDataPoint ) ;
    Eof*: proc (StreamDataPoint: DWORD_PTR): cint
    IdleCheck*: proc (StreamDataPoint: DWORD_PTR): cint
    Close*: proc (StreamDataPoint: DWORD_PTR): cint

  LPSTREAMDATASHRED* = ptr STREAMDATASHRED

##  ストリームデータ制御用データ構造体

type
  STREAMDATA* {.bycopy.} = object
    ReadShred*: STREAMDATASHRED
    DataPoint*: DWORD_PTR


##  パレット情報構造体

type
  COLORPALETTEDATA* {.bycopy.} = object
    Blue*: cuchar
    Green*: cuchar
    Red*: cuchar
    Alpha*: cuchar


##  カラー構造情報構造体

type
  COLORDATA* {.bycopy.} = object
    Format*: cuchar
    ##  フォーマット( DX_BASEIMAGE_FORMAT_NORMAL 等 )
    ChannelNum*: cuchar
    ##  チャンネル数
    ChannelBitDepth*: cuchar
    ##  １チャンネル辺りのビット深度
    FloatTypeFlag*: cuchar
    ##  浮動小数点型かどうか( TRUE:浮動小数点型  FALSE:整数型 )
    PixelByte*: cuchar
    ##  １ピクセルあたりのバイト数
    ##  以下は ChannelNum 又は ChannelBitDepth が 0 の時のみ有効
    ColorBitDepth*: cuchar
    ##  ビット深度
    NoneLoc*: cuchar
    NoneWidth*: cuchar
    ##  使われていないビットのアドレスと幅
    RedWidth*: cuchar
    GreenWidth*: cuchar
    BlueWidth*: cuchar
    AlphaWidth*: cuchar
    ##  各色のビット幅
    RedLoc*: cuchar
    GreenLoc*: cuchar
    BlueLoc*: cuchar
    AlphaLoc*: cuchar
    ##  各色の配置されているビットアドレス
    RedMask*: cuint
    GreenMask*: cuint
    BlueMask*: cuint
    AlphaMask*: cuint
    ##  各色のビットマスク
    NoneMask*: cuint
    ##  使われていないビットのマスク
    MaxPaletteNo*: cint
    ##  使用しているパレット番号の最大値( 0 の場合は 255 とみなす )
    ##  memo : ここより上にメンバー変数を追加したら DxBaseImage.cpp の NS_GraphColorMatchBltVer2 のアセンブラでのパレットデータ参照のリテラル値を修正する必要あり
    Palette*: array[256, COLORPALETTEDATA]
    ##  パレット( ColorBitDepth が８以下の場合のみ有効 )

  LPCOLORDATA* = ptr COLORDATA

##  基本イメージデータ構造体

type
  BASEIMAGE* {.bycopy.} = object
    ColorData*: COLORDATA
    ##  色情報
    Width*: cint
    Height*: cint
    Pitch*: cint
    ##  幅、高さ、ピッチ
    GraphData*: pointer
    ##  グラフィックイメージ
    MipMapCount*: cint
    ##  ミップマップの数
    GraphDataCount*: cint
    ##  グラフィックイメージの数

  GRAPHIMAGE* = BASEIMAGE
  LPGRAPHIMAGE* = ptr BASEIMAGE

##  矩形データ型

type
  RECTDATA* {.bycopy.} = object
    x1*: cint
    y1*: cint
    x2*: cint
    y2*: cint
    ##  座標
    color*: cuint
    ##  色
    pal*: cint
    ##  パラメータ

  LPRECTDATA* = ptr RECTDATA

##  ラインデータ型

type
  LINEDATA* {.bycopy.} = object
    x1*: cint
    y1*: cint
    x2*: cint
    y2*: cint
    ##  座標
    color*: cuint
    ##  色
    pal*: cint
    ##  パラメータ

  LPLINEDATA* = ptr LINEDATA

##  座標データ型

type
  POINTDATA* {.bycopy.} = object
    x*: cint
    y*: cint
    ##  座標
    color*: cuint
    ##  色
    pal*: cint
    ##  パラメータ

  LPPOINTDATA* = ptr POINTDATA

##  立方体データ型

type
  CUBEDATA* {.bycopy.} = object
    Pos1*: VECTOR
    ##  座標1
    Pos2*: VECTOR
    ##  座標2
    DifColor*: COLOR_U8
    ##  ディフューズカラー
    SpcColor*: COLOR_U8
    ##  スペキュラカラー

  LPCUBEDATA* = ptr CUBEDATA

when not defined(DX_NOTUSE_DRAWFUNCTION):
  ##  イメージフォーマットデータ
  type
    IMAGEFORMATDESC* {.bycopy.} = object
      TextureFlag*: cuchar
      ##  テクスチャか、フラグ( TRUE:テクスチャ  FALSE:標準サーフェス )
      CubeMapTextureFlag*: cuchar
      ##  キューブマップテクスチャか、フラグ( TRUE:キューブマップテクスチャ　FALSE:それ以外 )
      AlphaChFlag*: cuchar
      ##  αチャンネルはあるか、フラグ	( TRUE:ある  FALSE:ない )
      DrawValidFlag*: cuchar
      ##  描画可能か、フラグ( TRUE:可能  FALSE:不可能 )
      SystemMemFlag*: cuchar
      ##  システムメモリ上に存在しているか、フラグ( TRUE:システムメモリ上  FALSE:ＶＲＡＭ上 )( 標準サーフェスの時のみ有効 )
      UseManagedTextureFlag*: cuchar
      ##  マネージドテクスチャを使用するか、フラグ
      UseLinearMapTextureFlag*: cuchar
      ##  テクスチャのメモリデータ配置にリニアが選択できる場合はデータ配置方式をリニアにするかどうか( TRUE:リニアが可能な場合はリニアにする  FALSE:リニアが可能な場合も特にリニアを指定しない )
      PlatformTextureFormat*: cuchar
      ##  環境依存のテクスチャフォーマットを直接指定するために使用するための変数( DX_TEXTUREFORMAT_DIRECT3D9_R8G8B8 など )
      BaseFormat*: cuchar
      ##  基本フォーマット( DX_BASEIMAGE_FORMAT_NORMAL 等 )
      MipMapCount*: cuchar
      ##  ミップマップの数
      AlphaTestFlag*: cuchar
      ##  αテストチャンネルはあるか、フラグ( TRUE:ある  FALSE:ない )( テクスチャの場合のみ有効 )
      FloatTypeFlag*: cuchar
      ##  浮動小数点型かどうか
      ColorBitDepth*: cuchar
      ##  色深度( テクスチャの場合のみ有効 )
      ChannelNum*: cuchar
      ##  チャンネルの数
      ChannelBitDepth*: cuchar
      ##  １チャンネル辺りのビット深度( テクスチャの場合のみ有効、0 の場合は ColorBitDepth が使用される )
      BlendGraphFlag*: cuchar
      ##  ブレンド用画像か、フラグ
      UsePaletteFlag*: cuchar
      ##  パレットを使用しているか、フラグ( SystemMemFlag が TRUE の場合のみ有効 )
      MSSamples*: cuchar
      ##  マルチサンプリング数( 描画対象の場合使用 )
      MSQuality*: cuchar
      ##  マルチサンプリングクオリティ( 描画対象の場合使用 )

##  DirectInput のジョイパッド入力情報

type
  DINPUT_JOYSTATE* {.bycopy.} = object
    X*: cint
    ##  スティックのＸ軸パラメータ( -1000～1000 )
    Y*: cint
    ##  スティックのＹ軸パラメータ( -1000～1000 )
    Z*: cint
    ##  スティックのＺ軸パラメータ( -1000～1000 )
    Rx*: cint
    ##  スティックのＸ軸回転パラメータ( -1000～1000 )
    Ry*: cint
    ##  スティックのＹ軸回転パラメータ( -1000～1000 )
    Rz*: cint
    ##  スティックのＺ軸回転パラメータ( -1000～1000 )
    Slider*: array[2, cint]
    ##  スライダー二つ( 0～65535 )
    POV*: array[4, cuint]
    ##  ハットスイッチ４つ( 0xffffffff'u32:入力なし 0:上 4500:右上 9000:右 13500:右下 18000:下 22500:左下 27000:左 31500:左上 )
    Buttons*: array[32, cuchar]
    ##  ボタン３２個( 押されたボタンは 128 になる )


##  XInput のジョイパッド入力情報

type
  XINPUT_STATE* {.bycopy.} = object
    Buttons*: array[16, cuchar]
    ##  ボタン１６個( 添字には XINPUT_BUTTON_DPAD_UP 等を使用する、0:押されていない  1:押されている )
    LeftTrigger*: cuchar
    ##  左トリガー( 0～255 )
    RightTrigger*: cuchar
    ##  右トリガー( 0～255 )
    ThumbLX*: cshort
    ##  左スティックの横軸値( -32768 ～ 32767 )
    ThumbLY*: cshort
    ##  左スティックの縦軸値( -32768 ～ 32767 )
    ThumbRX*: cshort
    ##  右スティックの横軸値( -32768 ～ 32767 )
    ThumbRY*: cshort
    ##  右スティックの縦軸値( -32768 ～ 32767 )


##  タッチパネルの１箇所分のタッチの情報

type
  TOUCHINPUTPOINT* {.bycopy.} = object
    Device*: DWORD
    ##  タッチされたデバイス
    ID*: DWORD
    ##  タッチを判別するためのＩＤ
    PositionX*: cint
    ##  タッチされた座標X
    PositionY*: cint
    ##  タッチされた座標Y
    Pressure*: cfloat
    ##  圧力
    Orientation*: cfloat
    ##  画面の上端に対する接点の方位角
    Tilt*: cfloat
    ##  画面の垂線に対する接点の高度角
    ToolType*: cint
    ##  ツールタイプ( DX_TOUCHINPUT_TOOL_TYPE_UNKNOWN など )


##  タッチパネルのタッチの情報

type
  TOUCHINPUTDATA* {.bycopy.} = object
    Time*: LONGLONG
    ##  情報の時間
    Source*: cuint
    PointNum*: cint
    ##  有効なタッチ情報の数
    Point*: array[TOUCHINPUTPOINT_MAX, TOUCHINPUTPOINT]
    ##  タッチ情報


##  WinSockets使用時のアドレス指定用構造体

type
  INNER_C_UNION_DxStruct_2* {.bycopy, union.} = object
    Byte*: array[16, cuchar]
    Word*: array[8, cushort]

  IPDATA* {.bycopy.} = object
    d1*: cuchar
    d2*: cuchar
    d3*: cuchar
    d4*: cuchar
    ##  アドレス値

  LPIPDATA* = ptr IPDATA
  IPDATA_IPv6* {.bycopy.} = object
    ano_DxStruct_3*: INNER_C_UNION_DxStruct_2
    ScopeID*: culong

