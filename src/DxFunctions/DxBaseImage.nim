import ../DxDll
{.push dynlib: DLL.}
##  DxBaseImage.cpp 関数プロトタイプ宣言
##  基本イメージデータのロード＋ＤＩＢ関係

proc CreateGraphImageOrDIBGraph*(FileName: ptr TCHAR; DataImage: pointer;
                                DataImageSize: cint; DataImageType: cint; ##  LOADIMAGE_TYPE_FILE 等
                                BmpFlag: cint; ReverseFlag: cint;
                                BaseImage: ptr BASEIMAGE;
                                BmpInfo: ptr ptr BITMAPINFO; GraphData: ptr pointer): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータ若しくはＢＭＰデータを構築する

proc CreateGraphImageOrDIBGraphWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; DataImage: pointer; DataImageSize: cint; DataImageType: cint; ##  LOADIMAGE_TYPE_FILE 等
    BmpFlag: cint; ReverseFlag: cint; BaseImage: ptr BASEIMAGE;
    BmpInfo: ptr ptr BITMAPINFO; GraphData: ptr pointer): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータ若しくはＢＭＰデータを構築する

proc CreateGraphImageType2*(Src: ptr STREAMDATA; Dest: ptr BASEIMAGE): cint
##  画像データから構築したストリーム読み込み用データを使用して基本イメージデータを構築する

proc CreateBmpInfo*(BmpInfo: ptr BITMAPINFO; Width: cint; Height: cint; Pitch: cint;
                   SrcGrData: pointer; DestGrData: ptr pointer): cint
##  24bitカラー形式のビットマップデータからＢＭＰデータを構築する

proc GetImageSize_File*(FileName: ptr TCHAR; SizeX: ptr cint; SizeY: ptr cint): cint
##  画像ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetImageSize_FileWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                 SizeX: ptr cint; SizeY: ptr cint): cint
##  画像ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetImageSize_Mem*(FileImage: pointer; FileImageSize: cint; SizeX: ptr cint;
                      SizeY: ptr cint): cint
##  メモリ上に展開された画像ファイルの横ピクセル数と縦ピクセル数を取得する

proc GetGraphImageFullColorCode*(GraphImage: ptr BASEIMAGE; x: cint; y: cint): cuint
##  基本イメージデータの指定座標のフルカラーコードを取得する

proc CreateGraphImage_plus_Alpha*(FileName: ptr TCHAR; RgbImage: pointer;
                                 RgbImageSize: cint; RgbImageType: cint;
                                 AlphaImage: pointer; AlphaImageSize: cint;
                                 AlphaImageType: cint;
                                 RgbGraphImage: ptr BASEIMAGE;
                                 AlphaGraphImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータを構築する

proc CreateGraphImage_plus_AlphaWithStrLen*(FileName: ptr TCHAR;
    FileNameLength: csize_t; RgbImage: pointer; RgbImageSize: cint;
    RgbImageType: cint; AlphaImage: pointer; AlphaImageSize: cint;
    AlphaImageType: cint; RgbGraphImage: ptr BASEIMAGE;
    AlphaGraphImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージを読み込み、基本イメージデータを構築する

proc ReverseGraphImage*(GraphImage: ptr BASEIMAGE): cint
##  基本イメージデータを左右反転する
## extern int		AddUserGraphLoadFunction( int ( *UserLoadFunc )( FILE *fp, BITMAPINFO **BmpInfo, void **GraphData ) ) ;																						// ユーザー定義の画像データ読み込み関数を登録する
## extern int		AddUserGraphLoadFunction2( int ( *UserLoadFunc )( void *Image, int ImageSize, int ImageType, BITMAPINFO **BmpInfo, void **GraphData ) ) ;													// ユーザー定義の画像データ読み込み関数を登録する
## extern int		AddUserGraphLoadFunction3( int ( *UserLoadFunc )( void *DataImage, int DataImageSize, int DataImageType, int BmpFlag, BASEIMAGE *BaseImage, BITMAPINFO **BmpInfo, void **GraphData ) ) ;	// ユーザー定義の画像データ読み込み関数Ver3を登録する

proc AddUserGraphLoadFunction4*(UserLoadFunc: proc (Src: ptr STREAMDATA;
    BaseImage: ptr BASEIMAGE): cint): cint
##  ユーザー定義の画像データ読み込み関数Ver4を登録する
## extern int		SubUserGraphLoadFunction( int ( *UserLoadFunc )( FILE *fp, BITMAPINFO **BmpInfo, void **GraphData ) ) ;																						// ユーザー定義の画像データ読み込み関数を登録から抹消する
## extern int		SubUserGraphLoadFunction2( int ( *UserLoadFunc )( void *Image, int ImageSize, int ImageType, BITMAPINFO **BmpInfo, void **GraphData ) ) ;													// ユーザー定義の画像データ読み込み関数を登録から抹消する
## extern int		SubUserGraphLoadFunction3( int ( *UserLoadFunc )( void *DataImage, int DataImageSize, int DataImageType, int BmpFlag, BASEIMAGE *BaseImage, BITMAPINFO **BmpInfo, void **GraphData ) ) ;	// ユーザー定義の画像データ読み込み関数Ver3を登録から抹消する

proc SubUserGraphLoadFunction4*(UserLoadFunc: proc (Src: ptr STREAMDATA;
    BaseImage: ptr BASEIMAGE): cint): cint
##  ユーザー定義の画像データ読み込み関数Ver4を登録から抹消する

proc SetUseFastLoadFlag*(Flag: cint): cint
##  高速読み込みルーチンを使用するかどうかを設定する( TRUE:使用する( デフォルト )  FALSE:使用しない )

proc SetGraphDataShavedMode*(ShavedMode: cint): cint
  ##  DX_SHAVEDMODE_NONE 等
##  画像減色時の画像劣化緩和処理モードを設定する( デフォルトでは緩和処理無しの DX_SHAVEDMODE_NONE )

proc GetGraphDataShavedMode*(): cint
##  画像減色時の画像劣化緩和処理モードを取得する

proc SetUsePremulAlphaConvertLoad*(UseFlag: cint): cint
##  画像ファイル読み込み時に乗算済みアルファ画像に変換するかどうかを設定する( TRUE:変換処理を行う  FALSE:変換処理を行わない( デフォルト ) )

proc GetUsePremulAlphaConvertLoad*(): cint
##  画像ファイル読み込み時に乗算済みアルファ画像に変換するかどうかを取得する( TRUE:変換処理を行う  FALSE:変換処理を行わない( デフォルト ) )

proc SetUseConvertNormalFormatLoad*(UseFlag: cint): cint
##  画像ファイル読み込み時に DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換するかどうかを設定する( TRUE:変換処理を行う  FALSE:変換処理を行なわない( デフォルト ) )

proc GetUseConvertNormalFormatLoad*(): cint
##  画像ファイル読み込み時に DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換するかどうかを取得する( TRUE:変換処理を行う  FALSE:変換処理を行なわない( デフォルト ) )
##  基本イメージデータ構造体関係

proc CreateBaseImage*(FileName: ptr TCHAR; FileImage: pointer; FileImageSize: cint; DataType: cint; ## =LOADIMAGE_TYPE_FILE
                     BaseImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージから基本イメージデータを構築する

proc CreateBaseImageWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                               FileImage: pointer; FileImageSize: cint; DataType: cint; ## =LOADIMAGE_TYPE_FILE
                               BaseImage: ptr BASEIMAGE; ReverseFlag: cint): cint
##  画像ファイル若しくはメモリ上に展開された画像ファイルイメージから基本イメージデータを構築する

proc CreateGraphImage*(FileName: ptr TCHAR; DataImage: pointer; DataImageSize: cint;
                      DataImageType: cint; GraphImage: ptr BASEIMAGE;
                      ReverseFlag: cint): cint
##  CreateBaseImage の旧名称

proc CreateBaseImageToFile*(FileName: ptr TCHAR; BaseImage: ptr BASEIMAGE;
                           ReverseFlag: cint = FALSE): cint
##  画像ファイルから基本イメージデータを構築する

proc CreateBaseImageToFileWithStrLen*(FileName: ptr TCHAR; FileNameLength: csize_t;
                                     BaseImage: ptr BASEIMAGE;
                                     ReverseFlag: cint = FALSE): cint
##  画像ファイルから基本イメージデータを構築する

proc CreateBaseImageToMem*(FileImage: pointer; FileImageSize: cint;
                          BaseImage: ptr BASEIMAGE; ReverseFlag: cint = FALSE): cint
##  メモリ上に展開された画像ファイルイメージから基本イメージデータを構築する

proc CreateARGBF32ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ各チャンネル 32bit 浮動小数点型 カラーの基本イメージデータを作成する

proc CreateARGBF16ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ各チャンネル 16bit 浮動小数点型 カラーの基本イメージデータを作成する

proc CreateXRGB8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＸＲＧＢ８カラーの基本イメージデータを作成する

proc CreateARGB8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ８カラーの基本イメージデータを作成する

proc CreateRGBA8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＲＧＢＡ８カラーの基本イメージデータを作成する

proc CreateABGR8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＢＧＲ８カラーの基本イメージデータを作成する

proc CreateBGRA8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＢＧＲＡ８カラーの基本イメージデータを作成する

proc CreateARGB4ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＡＲＧＢ４カラーの基本イメージデータを作成する

proc CreateA1R5G5B5ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ａ１Ｒ５Ｇ５Ｂ５カラーの基本イメージデータを作成する

proc CreateX1R5G5B5ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ｘ１Ｒ５Ｇ５Ｂ５カラーの基本イメージデータを作成する

proc CreateR5G5B5A1ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ｒ５Ｇ５Ｂ５Ａ１カラーの基本イメージデータを作成する

proc CreateR5G6B5ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  Ｒ５Ｇ６Ｂ５カラーの基本イメージデータを作成する

proc CreateRGB8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE): cint
##  ＲＧＢ８カラーの基本イメージデータを作成する

proc CreatePAL8ColorBaseImage*(SizeX: cint; SizeY: cint; BaseImage: ptr BASEIMAGE;
                              UseAlpha: cint = FALSE): cint
##  パレット８ビットカラーの基本イメージデータを作成する

proc CreateColorDataBaseImage*(SizeX: cint; SizeY: cint; ColorData: ptr COLORDATA;
                              BaseImage: ptr BASEIMAGE): cint
##  指定のカラーフォーマットの基本イメージデータを作成する

proc GetBaseImageGraphDataSize*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータのイメージサイズを取得する( 単位：byte )

proc DerivationBaseImage*(BaseImage: ptr BASEIMAGE; x1: cint; y1: cint; x2: cint;
                         y2: cint; NewBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータの指定の部分だけを使う基本イメージデータの情報を作成する( BaseImage にはフォーマットが DX_BASEIMAGE_FORMAT_NORMAL でミップマップを使用していない画像のみ使用可能 )

proc ReleaseBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータの後始末を行う

proc ReleaseGraphImage*(GraphImage: ptr BASEIMAGE): cint
##  ReleaseBaseImage の旧名称

proc ConvertNormalFormatBaseImage*(BaseImage: ptr BASEIMAGE;
                                  ReleaseOrigGraphData: cint = TRUE): cint
##  DX_BASEIMAGE_FORMAT_NORMAL 以外の形式のイメージを DX_BASEIMAGE_FORMAT_NORMAL 形式のイメージに変換する

proc ConvertPremulAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  通常のαチャンネル付き画像を乗算済みαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc ConvertInterpAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  乗算済みαチャンネル付き画像を通常のαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc GetDrawScreenBaseImage*(x1: cint; y1: cint; x2: cint; y2: cint;
                            BaseImage: ptr BASEIMAGE): cint
##  描画対象の画面から指定領域を基本イメージデータに転送する

proc GetDrawScreenBaseImageDestPos*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   BaseImage: ptr BASEIMAGE; DestX: cint; DestY: cint): cint
##  描画対象の画面から指定領域を基本イメージデータに転送する( 転送先座標指定版 )

proc FillBaseImage*(BaseImage: ptr BASEIMAGE; r: cint; g: cint; b: cint; a: cint): cint
##  基本イメージデータを指定の色で塗りつぶす

proc FillRectBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; w: cint; h: cint;
                       r: cint; g: cint; b: cint; a: cint): cint
##  基本イメージデータの指定の領域を指定の色で塗りつぶす

proc ClearRectBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; w: cint; h: cint): cint
##  基本イメージデータの指定の領域を０クリアする

proc GetPaletteBaseImage*(BaseImage: ptr BASEIMAGE; PaletteNo: cint; r: ptr cint;
                         g: ptr cint; b: ptr cint; a: ptr cint): cint
##  基本イメージデータのパレットを取得する

proc SetPaletteBaseImage*(BaseImage: ptr BASEIMAGE; PaletteNo: cint; r: cint; g: cint;
                         b: cint; a: cint): cint
##  基本イメージデータのパレットをセットする

proc SetPixelPalCodeBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; palNo: cint): cint
##  基本イメージデータの指定の座標の色コードを変更する(パレット画像用)

proc GetPixelPalCodeBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint): cint
##  基本イメージデータの指定の座標の色コードを取得する(パレット画像用)

proc SetPixelBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: cint; g: cint;
                       b: cint; a: cint): cint
##  基本イメージデータの指定の座標の色を変更する(各色要素は０～２５５)

proc SetPixelBaseImageF*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: cfloat; g: cfloat;
                        b: cfloat; a: cfloat): cint
##  基本イメージデータの指定の座標の色を変更する(各色要素は浮動小数点数)

proc GetPixelBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: ptr cint;
                       g: ptr cint; b: ptr cint; a: ptr cint): cint
##  基本イメージデータの指定の座標の色を取得する(各色要素は０～２５５)

proc GetPixelBaseImageF*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; r: ptr cfloat;
                        g: ptr cfloat; b: ptr cfloat; a: ptr cfloat): cint
##  基本イメージデータの指定の座標の色を取得する(各色要素は浮動小数点数)

proc DrawLineBaseImage*(BaseImage: ptr BASEIMAGE; x1: cint; y1: cint; x2: cint; y2: cint;
                       r: cint; g: cint; b: cint; a: cint): cint
##  基本イメージデータの指定の座標に線を描画する(各色要素は０～２５５)

proc DrawCircleBaseImage*(BaseImage: ptr BASEIMAGE; x: cint; y: cint; radius: cint;
                         r: cint; g: cint; b: cint; a: cint; FillFlag: cint = TRUE): cint
##  基本イメージデータの指定の座標に円を描画する(各色要素は０～２５５)

proc BltBaseImage*(SrcX: cint; SrcY: cint; SrcSizeX: cint; SrcSizeY: cint; DestX: cint;
                  DestY: cint; SrcBaseImage: ptr BASEIMAGE;
                  DestBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを別の基本イメージデータに転送する

proc BltBaseImage*(DestX: cint; DestY: cint; SrcBaseImage: ptr BASEIMAGE;
                  DestBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを別の基本イメージデータに転送する

proc BltBaseImage2*(DestX: cint; DestY: cint; SrcBaseImage: ptr BASEIMAGE;
                   DestBaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを別の基本イメージデータに転送する

proc BltBaseImageWithTransColor*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; DestX: cint; DestY: cint;
                                SrcBaseImage: ptr BASEIMAGE;
                                DestBaseImage: ptr BASEIMAGE; Tr: cint; Tg: cint;
                                Tb: cint; Ta: cint): cint
##  基本イメージデータを別の基本イメージデータに透過色処理付きで転送する

proc BltBaseImageWithAlphaBlend*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; DestX: cint; DestY: cint;
                                SrcBaseImage: ptr BASEIMAGE;
                                DestBaseImage: ptr BASEIMAGE; Opacity: cint = 255): cint
##  基本イメージデータを別の基本イメージデータにアルファ値のブレンドを考慮した上で転送する( Opacity は透明度 : 0( 完全透明 ) ～ 255( 完全不透明 ) )( 出力先が ARGB8 形式以外の場合はエラーになります )

proc ReverseBaseImageH*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを左右反転する

proc ReverseBaseImageV*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを上下反転する

proc ReverseBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを上下左右反転する

proc CheckPixelAlphaBaseImage*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータに含まれるピクセルのアルファ値をチェックする( 戻り値   -1:エラー  0:画像にアルファ成分が無い  1:画像にアルファ成分があり、すべて最大(255)値  2:画像にアルファ成分があり、存在するアルファ値は最小(0)と最大(255)もしくは最小(0)のみ　3:画像にアルファ成分があり、最小と最大以外の中間の値がある )

proc GetBaseImageUseMaxPaletteNo*(BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータで使用されているパレット番号の最大値を取得する( パレット画像では無い場合は -1 が返る )

proc ReadJpegExif*(JpegFilePath: ptr TCHAR; ExifBuffer_Array: ptr BYTE;
                  ExifBufferSize: csize_t): cint
##  JPEGファイルの Exif情報を取得する、ExifBuffer を NULL に渡すと、戻り値の情報のサイズのみ取得できます( 戻り値  -1:エラー  -1以外：Exif情報のサイズ )

proc ReadJpegExifWithStrLen*(JpegFilePath: ptr TCHAR; JpegFilePathLength: csize_t;
                            ExifBuffer_Array: ptr BYTE; ExifBufferSize: csize_t): cint
##  JPEGファイルの Exif情報を取得する、ExifBuffer を NULL に渡すと、戻り値の情報のサイズのみ取得できます( 戻り値  -1:エラー  -1以外：Exif情報のサイズ )

proc SaveBaseImageToBmp*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＢＭＰ画像として保存する

proc SaveBaseImageToBmpWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＢＭＰ画像として保存する

proc SaveBaseImageToDds*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＤＤＳ画像として保存する

proc SaveBaseImageToDdsWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータをＤＤＳ画像として保存する

proc SaveBaseImageToPng*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE;
                        CompressionLevel: cint): cint
##  基本イメージデータをＰＮＧ画像として保存する

proc SaveBaseImageToPngWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                  BaseImage: ptr BASEIMAGE; CompressionLevel: cint): cint
##  基本イメージデータをＰＮＧ画像として保存する

proc SaveBaseImageToJpeg*(FilePath: ptr TCHAR; BaseImage: ptr BASEIMAGE; Quality: cint;
                         Sample2x1: cint): cint
##  基本イメージデータをＪＰＥＧ画像として保存する

proc SaveBaseImageToJpegWithStrLen*(FilePath: ptr TCHAR; FilePathLength: csize_t;
                                   BaseImage: ptr BASEIMAGE; Quality: cint;
                                   Sample2x1: cint): cint
##  基本イメージデータをＪＰＥＧ画像として保存する
##  基本イメージ描画

proc DrawBaseImage*(x: cint; y: cint; BaseImage: ptr BASEIMAGE): cint
##  基本イメージデータを描画する
##  カラーマッチングしながらイメージデータ間転送を行う Ver2

proc GraphColorMatchBltVer2*(DestGraphData: pointer; DestPitch: cint;
                            DestColorData: ptr COLORDATA; SrcGraphData: pointer;
                            SrcPitch: cint; SrcColorData: ptr COLORDATA;
                            AlphaMask: pointer; AlphaPitch: cint;
                            AlphaColorData: ptr COLORDATA; DestPoint: POINT;
                            SrcRect: ptr RECT; ReverseFlag: cint;
                            TransColorAlphaTestFlag: cint; TransColor: cuint;
                            ImageShavedMode: cint; AlphaOnlyFlag: cint = FALSE;
                            RedIsAlphaFlag: cint = FALSE;
                            TransColorNoMoveFlag: cint = FALSE;
                            Pal8ColorMatch: cint = FALSE): cint
##  色情報取得関係

proc GetColorF*(Red: cfloat; Green: cfloat; Blue: cfloat; Alpha: cfloat): COLOR_F
##  浮動小数点型のカラー値を作成する

proc GetColorU8*(Red: cint; Green: cint; Blue: cint; Alpha: cint): COLOR_U8
##  符号なし整数８ビットのカラー値を作成する

proc GetColor*(Red: cint; Green: cint; Blue: cint): cuint
##  DrawPixel 等の描画関数で使用するカラー値を取得する

proc GetColor2*(Color: cuint; Red: ptr cint; Green: ptr cint; Blue: ptr cint): cint
##  カラー値から赤、緑、青の値を取得する

proc GetColor3*(ColorData: ptr COLORDATA; Red: cint; Green: cint; Blue: cint;
               Alpha: cint = 255): cuint
##  指定のピクセルフォーマットに対応したカラー値を得る

proc GetColor4*(DestColorData: ptr COLORDATA; SrcColorData: ptr COLORDATA;
               SrcColor: cuint): cuint
##  指定のカラーフォーマットのカラー値を別のカラーフォーマットのカラー値に変換する

proc GetColor5*(ColorData: ptr COLORDATA; Color: cuint; Red: ptr cint; Green: ptr cint;
               Blue: ptr cint; Alpha: ptr cint = nil): cint
##  指定のカラーフォーマットのカラー値を赤、緑、青、アルファの値を取得する

proc CreatePaletteColorData*(ColorDataBuf: ptr COLORDATA): cint
##  パレットカラーのカラーフォーマットを構築する

proc CreateARGBF32ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ各チャンネル 32bit 浮動小数点型カラーのカラーフォーマットを構築する

proc CreateARGBF16ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ各チャンネル 16bit 浮動小数点型カラーのカラーフォーマットを構築する

proc CreateXRGB8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＸＲＧＢ８カラーのカラーフォーマットを構築する

proc CreateARGB8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ８カラーのカラーフォーマットを構築する

proc CreateRGBA8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＲＧＢＡ８カラーのカラーフォーマットを構築する

proc CreateABGR8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＢＧＲ８カラーのカラーフォーマットを構築する

proc CreateBGRA8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＢＧＲＡ８カラーのカラーフォーマットを構築する

proc CreateBGR8ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＢＧＲ８カラーのカラーフォーマットを構築する

proc CreateARGB4ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ＡＲＧＢ４カラーのカラーフォーマットを構築する

proc CreateA1R5G5B5ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ａ１Ｒ５Ｇ５Ｂ５カラーのカラーフォーマットを構築する

proc CreateX1R5G5B5ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ｘ１Ｒ５Ｇ５Ｂ５カラーのカラーフォーマットを構築する

proc CreateR5G5B5A1ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ｒ５Ｇ５Ｂ５Ａ１カラーのカラーフォーマットを構築する

proc CreateR5G6B5ColorData*(ColorDataBuf: ptr COLORDATA): cint
##  Ｒ５Ｇ６Ｂ５カラーのカラーフォーマットを構築する

proc CreateFullColorData*(ColorDataBuf: ptr COLORDATA): cint
##  ２４ビットカラーのカラーフォーマットを構築する

proc CreateGrayColorData*(ColorDataBuf: ptr COLORDATA): cint
##  グレースケールのカラーフォーマットを構築する

proc CreatePal8ColorData*(ColorDataBuf: ptr COLORDATA; UseAlpha: cint = FALSE): cint
##  パレット２５６色のカラーフォーマットを構築する

proc CreateColorData*(ColorDataBuf: ptr COLORDATA; ColorBitDepth: cint;
                     RedMask: DWORD; GreenMask: DWORD; BlueMask: DWORD;
                     AlphaMask: DWORD; ChannelNum: cint = 0;
                     ChannelBitDepth: cint = 0; FloatTypeFlag: cint = FALSE): cint
##  カラーフォーマットを作成する

proc SetColorDataNoneMask*(ColorData: ptr COLORDATA)
##  NoneMask 以外の要素を埋めた COLORDATA 構造体の情報を元に NoneMask をセットする

proc CmpColorData*(ColorData1: ptr COLORDATA; ColorData2: ptr COLORDATA): cint
##  二つのカラーフォーマットが等しいかどうか調べる( 戻り値　TRUE:等しい  FALSE:等しくない )

{.pop.}
