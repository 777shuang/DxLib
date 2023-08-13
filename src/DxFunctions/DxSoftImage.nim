import ../DxDll
{.push dynlib: DLL, importc.}

##  DxSoftImage.cpp関数プロトタイプ宣言

proc InitSoftImage*(): cint
##  ソフトウエアイメージハンドルを全て削除する

proc LoadSoftImage*(FileName: cstring): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )

proc LoadSoftImageWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )

proc LoadARGB8ColorSoftImage*(FileName: cstring): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )

proc LoadARGB8ColorSoftImageWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )

proc LoadXRGB8ColorSoftImage*(FileName: cstring): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )

proc LoadXRGB8ColorSoftImageWithStrLen*(FileName: cstring; FileNameLength: csize_t): cint
##  画像ファイルを読み込みソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )

proc LoadSoftImageToMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )

proc LoadARGB8ColorSoftImageToMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が RGBA8 以外のフォーマットだった場合は RGBA8 カラーに変換 )

proc LoadXRGB8ColorSoftImageToMem*(FileImage: pointer; FileImageSize: cint): cint
##  メモリ上に展開された画像ファイルイメージからソフトウエアイメージハンドルを作成する( -1:エラー  -1以外:イメージハンドル )( 読み込んだ画像が XGBA8 以外のフォーマットだった場合は XGBA8 カラーに変換 )

proc MakeSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( -1:エラー  -1以外:イメージハンドル )

proc MakeARGBF32ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA 各チャンネル 32bit 浮動小数点型 カラー )

proc MakeARGBF16ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA 各チャンネル 16bit 浮動小数点型 カラー )

proc MakeXRGB8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( XRGB8 カラー )

proc MakeARGB8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA8 カラー )

proc MakeRGBA8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGBA8 カラー )

proc MakeABGR8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( ABGR8 カラー )

proc MakeBGRA8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( BGRA8 カラー )

proc MakeARGB4ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( ARGB4 カラー )

proc MakeA1R5G5B5ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( A1R5G5B5 カラー )

proc MakeX1R5G5B5ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( X1R5G5B5 カラー )

proc MakeR5G5B5A1ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( R5G5B5A1 カラー )

proc MakeR5G6B5ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( R5G6B5 カラー )

proc MakeRGB8ColorSoftImage*(SizeX: cint; SizeY: cint): cint
##  ソフトウエアイメージハンドルの作成( RGB8 カラー )

proc MakePAL8ColorSoftImage*(SizeX: cint; SizeY: cint; UseAlpha: cint = FALSE): cint
##  ソフトウエアイメージハンドルの作成( パレット２５６色 カラー )

proc MakeColorDataSoftImage*(SizeX: cint; SizeY: cint; ColorData: ptr COLORDATA): cint
##  ソフトウエアイメージハンドルの作成( COLORDATA でフォーマット指定 )

proc DeleteSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルの削除する

proc GetSoftImageSize*(SIHandle: cint; Width: ptr cint; Height: ptr cint): cint
##  ソフトウエアイメージハンドルのサイズを取得する

proc CheckPaletteSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルがパレット画像かどうかを取得する( TRUE:パレット画像  FALSE:パレット画像じゃない )

proc CheckAlphaSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルのフォーマットにα要素があるかどうかを取得する( TRUE:ある  FALSE:ない )

proc CheckPixelAlphaSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルに含まれるピクセルのα値をチェックする( 戻り値   -1:エラー  0:画像にα成分が無い  1:画像にα成分があり、すべて最大(255)値  2:画像にα成分があり、存在するα値は最小(0)と最大(255)もしくは最小(0)のみ　3:画像にα成分があり、最小と最大以外の中間の値がある )

proc GetDrawScreenSoftImage*(x1: cint; y1: cint; x2: cint; y2: cint; SIHandle: cint): cint
##  描画対象の画面から指定領域をソフトウエアイメージハンドルに転送する

proc GetDrawScreenSoftImageDestPos*(x1: cint; y1: cint; x2: cint; y2: cint;
                                   SIHandle: cint; DestX: cint; DestY: cint): cint
##  描画対象の画面から指定領域をソフトウエアイメージハンドルに転送する( 転送先座標指定版 )

proc FillSoftImage*(SIHandle: cint; r: cint; g: cint; b: cint; a: cint): cint
##  ソフトウエアイメージハンドルを指定色で塗りつぶす(各色要素は０～２５５)

proc ClearRectSoftImage*(SIHandle: cint; x: cint; y: cint; w: cint; h: cint): cint
##  ソフトウエアイメージハンドルの指定の領域を０クリアする

proc GetPaletteSoftImage*(SIHandle: cint; PaletteNo: cint; r: ptr cint; g: ptr cint;
                         b: ptr cint; a: ptr cint): cint
##  ソフトウエアイメージハンドルのパレットを取得する(各色要素は０～２５５)

proc SetPaletteSoftImage*(SIHandle: cint; PaletteNo: cint; r: cint; g: cint; b: cint;
                         a: cint): cint
##  ソフトウエアイメージハンドルのパレットを設定する(各色要素は０～２５５)

proc DrawPixelPalCodeSoftImage*(SIHandle: cint; x: cint; y: cint; palNo: cint): cint
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(パレット画像用、有効値は０～２５５)

proc GetPixelPalCodeSoftImage*(SIHandle: cint; x: cint; y: cint): cint
##  ソフトウエアイメージハンドルの指定座標の色コードを取得する(パレット画像用、戻り値は０～２５５)

proc GetImageAddressSoftImage*(SIHandle: cint): pointer
##  ソフトウエアイメージハンドルの画像が格納されているメモリ領域の先頭アドレスを取得する

proc GetPitchSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルのメモリに格納されている画像データの1ライン辺りのバイト数を取得する

proc DrawPixelSoftImage*(SIHandle: cint; x: cint; y: cint; r: cint; g: cint; b: cint; a: cint): cint
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は０～２５５)

proc DrawPixelSoftImageF*(SIHandle: cint; x: cint; y: cint; r: cfloat; g: cfloat;
                         b: cfloat; a: cfloat): cint
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は浮動小数点数)

proc DrawPixelSoftImage_Unsafe_XRGB8*(SIHandle: cint; x: cint; y: cint; r: cint; g: cint;
                                     b: cint)
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や ARGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc DrawPixelSoftImage_Unsafe_ARGB8*(SIHandle: cint; x: cint; y: cint; r: cint; g: cint;
                                     b: cint; a: cint)
##  ソフトウエアイメージハンドルの指定座標にドットを描画する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や XRGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc GetPixelSoftImage*(SIHandle: cint; x: cint; y: cint; r: ptr cint; g: ptr cint;
                       b: ptr cint; a: ptr cint): cint
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は０～２５５)

proc GetPixelSoftImageF*(SIHandle: cint; x: cint; y: cint; r: ptr cfloat; g: ptr cfloat;
                        b: ptr cfloat; a: ptr cfloat): cint
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は浮動小数点数)

proc GetPixelSoftImage_Unsafe_XRGB8*(SIHandle: cint; x: cint; y: cint; r: ptr cint;
                                    g: ptr cint; b: ptr cint)
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や XRGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc GetPixelSoftImage_Unsafe_ARGB8*(SIHandle: cint; x: cint; y: cint; r: ptr cint;
                                    g: ptr cint; b: ptr cint; a: ptr cint)
##  ソフトウエアイメージハンドルの指定座標の色を取得する(各色要素は０～２５５)、エラーチェックをしない代わりに高速ですが、範囲外の座標や ARGB8 以外のフォーマットのソフトハンドルを渡すと不正なメモリアクセスで強制終了します

proc DrawLineSoftImage*(SIHandle: cint; x1: cint; y1: cint; x2: cint; y2: cint; r: cint;
                       g: cint; b: cint; a: cint): cint
##  ソフトウエアイメージハンドルの指定座標に線を描画する(各色要素は０～２５５)

proc DrawCircleSoftImage*(SIHandle: cint; x: cint; y: cint; radius: cint; r: cint; g: cint;
                         b: cint; a: cint; FillFlag: cint = TRUE): cint
##  ソフトウエアイメージハンドルの指定座標に円を描画する(各色要素は０～２５５)

proc BltSoftImage*(SrcX: cint; SrcY: cint; SrcSizeX: cint; SrcSizeY: cint;
                  SrcSIHandle: cint; DestX: cint; DestY: cint; DestSIHandle: cint): cint
##  ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルに転送する

proc BltSoftImageWithTransColor*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; SrcSIHandle: cint; DestX: cint;
                                DestY: cint; DestSIHandle: cint; Tr: cint; Tg: cint;
                                Tb: cint; Ta: cint): cint
##  ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルに透過色処理付きで転送する

proc BltSoftImageWithAlphaBlend*(SrcX: cint; SrcY: cint; SrcSizeX: cint;
                                SrcSizeY: cint; SrcSIHandle: cint; DestX: cint;
                                DestY: cint; DestSIHandle: cint; Opacity: cint = 255): cint
##  ソフトウエアイメージハンドルを別のソフトウエアイメージハンドルにアルファ値のブレンドを考慮した上で転送する( Opacity は透明度 : 0( 完全透明 ) ～ 255( 完全不透明 ) )( 出力先が ARGB8 形式以外の場合はエラーになります )

proc ReverseSoftImageH*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを左右反転する

proc ReverseSoftImageV*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを上下反転する

proc ReverseSoftImage*(SIHandle: cint): cint
##  ソフトウエアイメージハンドルを上下左右反転する

proc ConvertPremulAlphaSoftImage*(SIHandle: cint): cint
##  通常のαチャンネル付き画像を乗算済みαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc ConvertInterpAlphaSoftImage*(SIHandle: cint): cint
##  乗算済みαチャンネル付き画像を通常のαチャンネル付き画像に変換する( ピクセルフォーマットが ARGB8 以外の場合は ARGB8 に変換されます )

proc BltStringSoftImage*(x: cint; y: cint; StrData: cstring; DestSIHandle: cint;
                        DestEdgeSIHandle: cint = -1; VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( デフォルトフォントハンドルを使用する )

proc BltStringSoftImageWithStrLen*(x: cint; y: cint; StrData: cstring;
                                  StrDataLength: csize_t; DestSIHandle: cint;
                                  DestEdgeSIHandle: cint = -1;
                                  VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( デフォルトフォントハンドルを使用する )

proc BltStringSoftImageToHandle*(x: cint; y: cint; StrData: cstring;
                                DestSIHandle: cint; DestEdgeSIHandle: cint; ##  縁が必要ない場合は -1
                                FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( フォントハンドル使用版 )

proc BltStringSoftImageToHandleWithStrLen*(x: cint; y: cint; StrData: cstring;
    StrDataLength: csize_t; DestSIHandle: cint; DestEdgeSIHandle: cint; ##  縁が必要ない場合は -1
    FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  ソフトウエアイメージハンドルに文字列を描画する( フォントハンドル使用版 )

proc DrawSoftImage*(x: cint; y: cint; SIHandle: cint): cint
##  ソフトウエアイメージハンドルを画面に描画する

proc SaveSoftImageToBmp*(FilePath: cstring; SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＢＭＰ画像ファイルとして保存する

proc SaveSoftImageToBmpWithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                  SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＢＭＰ画像ファイルとして保存する

proc SaveSoftImageToDds*(FilePath: cstring; SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＤＤＳ画像ファイルとして保存する

proc SaveSoftImageToDdsWithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                  SIHandle: cint): cint
##  ソフトウエアイメージハンドルをＤＤＳ画像ファイルとして保存する

proc SaveSoftImageToPng*(FilePath: cstring; SIHandle: cint; CompressionLevel: cint): cint
##  ソフトウエアイメージハンドルをＰＮＧ画像ファイルとして保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveSoftImageToPngWithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                  SIHandle: cint; CompressionLevel: cint): cint
##  ソフトウエアイメージハンドルをＰＮＧ画像ファイルとして保存する CompressionLevel = 圧縮率、値が大きいほど高圧縮率高負荷、０は無圧縮,0～9

proc SaveSoftImageToJpeg*(FilePath: cstring; SIHandle: cint; Quality: cint;
                         Sample2x1: cint): cint
##  ソフトウエアイメージハンドルをＪＰＥＧ画像ファイルとして保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

proc SaveSoftImageToJpegWithStrLen*(FilePath: cstring; FilePathLength: csize_t;
                                   SIHandle: cint; Quality: cint; Sample2x1: cint): cint
##  ソフトウエアイメージハンドルをＪＰＥＧ画像ファイルとして保存する Quality = 画質、値が大きいほど低圧縮高画質,0～100

{.pop.}
