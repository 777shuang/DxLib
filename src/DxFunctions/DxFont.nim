import ../DxDll
{.push dynlib: DLL, importc.}

##  DxFont.cpp 関数プロトタイプ宣言
##  フォント、文字列描画関係関数

proc EnumFontName*(NameBuffer: cstring; NameBufferNum: cint;
                  JapanOnlyFlag: cint = TRUE): cint
##  使用可能なフォントの名前を列挙する( NameBuffer に 64バイト区切りで名前が格納されます )

proc EnumFontNameEx*(NameBuffer: cstring; NameBufferNum: cint; CharSet: cint = -1): cint
##  使用可能なフォントの名前を列挙する( NameBuffer に 64バイト区切りで名前が格納されます )( 文字セット指定版 )

proc EnumFontNameEx2*(NameBuffer: cstring; NameBufferNum: cint;
                     EnumFontName: cstring; CharSet: cint = -1): cint
##  指定のフォント名のフォントを列挙する

proc EnumFontNameEx2WithStrLen*(NameBuffer: cstring; NameBufferNum: cint;
                               EnumFontName: cstring;
                               EnumFontNameLength: csize_t; CharSet: cint = -1): cint
##  指定のフォント名のフォントを列挙する

proc CheckFontName*(FontName: cstring; CharSet: cint = -1): cint
##  指定のフォント名のフォントが存在するかどうかをチェックする( 戻り値  TRUE:存在する  FALSE:存在しない )

proc CheckFontNameWithStrLen*(FontName: cstring; FontNameLength: csize_t;
                             CharSet: cint = -1): cint
##  指定のフォント名のフォントが存在するかどうかをチェックする( 戻り値  TRUE:存在する  FALSE:存在しない )

proc InitFontToHandle*(): cint
##  全てのフォントハンドルを削除する

proc CreateFontToHandle*(FontName: cstring; Size: cint; Thick: cint;
                        FontType: cint = -1; CharSet: cint = -1; EdgeSize: cint = -1;
                        Italic: cint = FALSE; Handle: cint = -1): cint
##  フォントハンドルを作成する

proc CreateFontToHandleWithStrLen*(FontName: cstring; FontNameLength: csize_t;
                                  Size: cint; Thick: cint; FontType: cint = -1;
                                  CharSet: cint = -1; EdgeSize: cint = -1;
                                  Italic: cint = FALSE; Handle: cint = -1): cint
##  フォントハンドルを作成する

proc LoadFontDataToHandle*(FileName: cstring; EdgeSize: cint = 0): cint
##  フォントデータファイルからフォントハンドルを作成する

proc LoadFontDataToHandleWithStrLen*(FileName: cstring; FileNameLength: csize_t;
                                    EdgeSize: cint = 0): cint
##  フォントデータファイルからフォントハンドルを作成する

proc LoadFontDataFromMemToHandle*(FontDataImage: pointer; FontDataImageSize: cint;
                                 EdgeSize: cint = 0): cint
##  メモリ上のフォントデータファイルイメージからフォントハンドルを作成する

proc SetFontSpaceToHandle*(Pixel: cint; FontHandle: cint): cint
##  フォントハンドルの字間を変更する

proc SetFontLineSpaceToHandle*(Pixel: cint; FontHandle: cint): cint
##  フォントハンドルの行間を変更する

proc SetFontCharCodeFormatToHandle*(CharCodeFormat: cint; ##  DX_CHARCODEFORMAT_SHIFTJIS 等
                                   FontHandle: cint): cint
##  指定のフォントハンドルを使用する関数の引数に渡す文字列の文字コード形式を設定する( UNICODE版では無効 )

proc DeleteFontToHandle*(FontHandle: cint): cint
##  フォントハンドルを削除する

proc SetFontLostFlag*(FontHandle: cint; LostFlag: ptr cint): cint
##  フォントハンドルを削除した際に TRUE を代入する変数のアドレスを設定する

proc AddFontImageToHandle*(FontHandle: cint; Char: cstring; GrHandle: cint;
                          DrawX: cint; DrawY: cint; AddX: cint): cint
##  指定の文字の代わりに描画するグラフィックハンドルを登録する

proc AddFontImageToHandleWithStrLen*(FontHandle: cint; Char: cstring;
                                    CharLength: csize_t; GrHandle: cint;
                                    DrawX: cint; DrawY: cint; AddX: cint): cint
##  指定の文字の代わりに描画するグラフィックハンドルを登録する

proc SubFontImageToHandle*(FontHandle: cint; Char: cstring): cint
##  指定の文字の代わりに描画するグラフィックハンドルの登録を解除する

proc SubFontImageToHandleWithStrLen*(FontHandle: cint; Char: cstring;
                                    CharLength: csize_t): cint
##  指定の文字の代わりに描画するグラフィックハンドルの登録を解除する

proc AddSubstitutionFontToHandle*(FontHandle: cint; SubstitutionFontHandle: cint;
                                 DrawX: cint; DrawY: cint): cint
##  代替フォントハンドル( FontHandle に無い文字を描画しようとしたときに代わりに使用されるフォントハンドル )を登録する

proc SubSubstitutionFontToHandle*(FontHandle: cint; SubstitutionFontHandle: cint): cint
##  代替フォントハンドルの登録を解除する

proc ChangeFont*(FontName: cstring; CharSet: cint = -1): cint
##  デフォルトフォントハンドルで使用するフォントを変更

proc ChangeFontWithStrLen*(FontName: cstring; FontNameLength: csize_t;
                          CharSet: cint = -1): cint
##  デフォルトフォントハンドルで使用するフォントを変更

proc ChangeFontFromHandle*(FontHandle: cint): cint
##  デフォルトフォントハンドルとして使用するフォントハンドルを変更する

proc ChangeFontType*(FontType: cint): cint
##  デフォルトフォントハンドルのフォントタイプの変更

proc GetFontName*(): cstring
##  デフォルトフォントハンドルのフォント名を取得する

proc SetFontSize*(FontSize: cint): cint
##  デフォルトフォントハンドルのサイズを設定する

proc GetFontSize*(): cint
##  デフォルトフォントハンドルのサイズを取得する

proc GetFontEdgeSize*(): cint
##  デフォルトフォントハンドルの縁サイズを取得する

proc SetFontThickness*(ThickPal: cint): cint
##  デフォルトフォントハンドルの太さを設定する

proc SetFontSpace*(Pixel: cint): cint
##  デフォルトフォントハンドルの字間を変更する

proc GetFontSpace*(): cint
##  デフォルトフォントハンドルの字間を取得する

proc SetFontLineSpace*(Pixel: cint): cint
##  デフォルトフォントハンドルの行間を変更する

proc GetFontLineSpace*(): cint
##  デフォルトフォントハンドルの行間を取得する

proc SetFontCharCodeFormat*(CharCodeFormat: cint): cint
  ##  DX_CHARCODEFORMAT_SHIFTJIS 等
##  デフォルトフォントハンドルを使用する関数の引数に渡す文字列の文字コード形式を設定する( UNICODE版では無効 )

proc SetDefaultFontState*(FontName: cstring; Size: cint; Thick: cint;
                         FontType: cint = -1; CharSet: cint = -1; EdgeSize: cint = -1;
                         Italic: cint = FALSE): cint
##  デフォルトフォントハンドルの設定を変更する

proc SetDefaultFontStateWithStrLen*(FontName: cstring; FontNameLength: csize_t;
                                   Size: cint; Thick: cint; FontType: cint = -1;
                                   CharSet: cint = -1; EdgeSize: cint = -1;
                                   Italic: cint = FALSE): cint
##  デフォルトフォントハンドルの設定を変更する

proc GetDefaultFontHandle*(): cint
##  デフォルトフォントハンドルを取得する

proc GetFontMaxCacheCharNum*(): cint
##  デフォルトフォントハンドルのキャッシュできる文字の数を取得する

proc GetFontMaxWidth*(): cint
##  デフォルトフォントハンドルの文字の最大幅を取得する

proc GetFontAscent*(): cint
##  デフォルトフォントハンドルの描画位置からベースラインまでの高さを取得する

proc GetDrawStringWidth*(String: cstring; StrLen: cint; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawNStringWidth*(String: cstring; StringLength: csize_t;
                         VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawFormatStringWidth*(FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅を取得する

proc GetDrawExtendStringWidth*(ExRateX: cdouble; String: cstring; StrLen: cint;
                              VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する( 拡大率付き )

proc GetDrawExtendNStringWidth*(ExRateX: cdouble; String: cstring;
                               StringLength: csize_t; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅を取得する( 拡大率付き )

proc GetDrawExtendFormatStringWidth*(ExRateX: cdouble; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅を取得する( 拡大率付き )

proc GetDrawStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                       String: cstring; StrLen: cint; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawNStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                        String: cstring; StringLength: csize_t;
                        VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawFormatStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                             FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                             ExRateX: cdouble; ExRateY: cdouble; String: cstring;
                             StrLen: cint; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する( 拡大率付き )

proc GetDrawExtendNStringSize*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                              ExRateX: cdouble; ExRateY: cdouble; String: cstring;
                              StringLength: csize_t; VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の描画幅・高さ・行数を取得する( 拡大率付き )

proc GetDrawExtendFormatStringSize*(SizeX: ptr cint; SizeY: ptr cint;
                                   LineCount: ptr cint; ExRateX: cdouble;
                                   ExRateY: cdouble; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する( 拡大率付き )

proc GetDrawStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO; InfoBufferSize: csize_t;
                           String: cstring; StrLen: cint;
                           VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawNStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO; InfoBufferSize: csize_t;
                            String: cstring; StringLength: csize_t;
                            VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawFormatStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                 InfoBufferSize: csize_t; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawExtendStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                 InfoBufferSize: csize_t; ExRateX: cdouble;
                                 ExRateY: cdouble; String: cstring; StrLen: cint;
                                 VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendNStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                  InfoBufferSize: csize_t; ExRateX: cdouble;
                                  ExRateY: cdouble; String: cstring;
                                  StringLength: csize_t;
                                  VerticalFlag: cint = FALSE): cint
##  デフォルトフォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendFormatStringCharInfo*(InfoBuffer: ptr DRAWCHARINFO;
                                       InfoBufferSize: csize_t; ExRateX: cdouble;
                                       ExRateY: cdouble; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawStringKerningPairInfo*(PairChar: cstring; KernAmount: ptr cint): cint
##  デフォルトフォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetDrawStringKerningPairInfoWithStrLen*(PairChar: cstring;
    PairCharLength: csize_t; KernAmount: ptr cint): cint
##  デフォルトフォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetFontNameToHandle*(FontHandle: cint): cstring
##  フォントハンドルのフォント名を取得する

proc GetFontMaxCacheCharNumToHandle*(FontHandle: cint): cint
##  フォントハンドルのキャッシュできる文字の数を取得する

proc GetFontMaxWidthToHandle*(FontHandle: cint): cint
##  フォントハンドルの文字の最大幅を取得する

proc GetFontAscentToHandle*(FontHandle: cint): cint
##  フォントハンドルの描画位置からベースラインまでの高さを取得する

proc GetFontSizeToHandle*(FontHandle: cint): cint
##  フォントハンドルのサイズを取得する

proc GetFontEdgeSizeToHandle*(FontHandle: cint): cint
##  フォントハンドルの縁サイズを取得する

proc GetFontSpaceToHandle*(FontHandle: cint): cint
##  フォントハンドルの字間を取得する

proc GetFontLineSpaceToHandle*(FontHandle: cint): cint
##  フォントハンドルの行間を取得する

proc GetFontCharInfo*(FontHandle: cint; Char: cstring; DrawX: ptr cint;
                     DrawY: ptr cint; NextCharX: ptr cint; SizeX: ptr cint;
                     SizeY: ptr cint): cint
##  フォントハンドルの指定の文字の描画情報を取得する

proc GetFontCharInfoWithStrLen*(FontHandle: cint; Char: cstring;
                               CharLength: csize_t; DrawX: ptr cint; DrawY: ptr cint;
                               NextCharX: ptr cint; SizeX: ptr cint; SizeY: ptr cint): cint
##  フォントハンドルの指定の文字の描画情報を取得する

proc GetDrawStringWidthToHandle*(String: cstring; StrLen: cint; FontHandle: cint;
                                VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawNStringWidthToHandle*(String: cstring; StringLength: csize_t;
                                 FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawFormatStringWidthToHandle*(FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅を取得する

proc GetDrawExtendStringWidthToHandle*(ExRateX: cdouble; String: cstring;
                                      StrLen: cint; FontHandle: cint;
                                      VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawExtendNStringWidthToHandle*(ExRateX: cdouble; String: cstring;
                                       StringLength: csize_t; FontHandle: cint;
                                       VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅を取得する

proc GetDrawExtendFormatStringWidthToHandle*(ExRateX: cdouble; FontHandle: cint;
    FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅を取得する

proc GetDrawStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                               String: cstring; StrLen: cint; FontHandle: cint;
                               VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawNStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint; LineCount: ptr cint;
                                String: cstring; StringLength: csize_t;
                                FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawFormatStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
                                     LineCount: ptr cint; FontHandle: cint;
                                     FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
                                     LineCount: ptr cint; ExRateX: cdouble;
                                     ExRateY: cdouble; String: cstring;
                                     StrLen: cint; FontHandle: cint;
                                     VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendNStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
                                      LineCount: ptr cint; ExRateX: cdouble;
                                      ExRateY: cdouble; String: cstring;
                                      StringLength: csize_t; FontHandle: cint;
                                      VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の描画幅・高さ・行数を取得する

proc GetDrawExtendFormatStringSizeToHandle*(SizeX: ptr cint; SizeY: ptr cint;
    LineCount: ptr cint; ExRateX: cdouble; ExRateY: cdouble; FontHandle: cint;
    FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の描画幅・高さ・行数を取得する

proc GetDrawStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
                                   InfoBufferSize: csize_t; String: cstring;
                                   StrLen: cint; FontHandle: cint;
                                   VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawNStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
                                    InfoBufferSize: csize_t; String: cstring;
                                    StringLength: csize_t; FontHandle: cint;
                                    VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawFormatStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; FontHandle: cint; FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawExtendStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; ExRateX: cdouble; ExRateY: cdouble; String: cstring;
    StrLen: cint; FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendNStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; ExRateX: cdouble; ExRateY: cdouble; String: cstring;
    StringLength: csize_t; FontHandle: cint; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用した文字列の１文字毎の情報を取得する

proc GetDrawExtendFormatStringCharInfoToHandle*(InfoBuffer: ptr DRAWCHARINFO;
    InfoBufferSize: csize_t; ExRateX: cdouble; ExRateY: cdouble; FontHandle: cint;
    FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用した書式付き文字列の１文字毎の情報を取得する

proc GetDrawStringKerningPairInfoToHandle*(PairChar: cstring;
    KernAmount: ptr cint; FontHandle: cint): cint
##  フォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetDrawStringKerningPairInfoToHandleWithStrLen*(PairChar: cstring;
    PairCharLength: csize_t; KernAmount: ptr cint; FontHandle: cint): cint
##  フォントハンドルを使用した二つの文字のペアのカーニング情報を取得する( PairChar:カーニング情報を調べるペアとなる2文字の文字列( 2文字以上あっても先頭の2文字だけ使用されます )  KernAmount:2文字目の文字を基本の位置からずらすドット数を代入するint型変数のアドレス )

proc GetFontStateToHandle*(FontName: cstring; Size: ptr cint; Thick: ptr cint;
                          FontHandle: cint; FontType: ptr cint = nil;
                          CharSet: ptr cint = nil; EdgeSize: ptr cint = nil;
                          Italic: ptr cint = nil): cint
##  フォントハンドルの情報を取得する

proc CheckFontCacheToTextureFlag*(FontHandle: cint): cint
##  フォントハンドルがテクスチャキャッシュを使用しているかどうかを取得する

proc CheckFontChacheToTextureFlag*(FontHandle: cint): cint
##  CheckFontCacheToTextureFlag の誤字版

proc CheckFontHandleValid*(FontHandle: cint): cint
##  フォントハンドルが有効かどうかを取得する

proc ClearFontCacheToHandle*(FontHandle: cint): cint
##  フォントハンドルのキャッシュ情報を初期化する

proc SetFontCacheToTextureFlag*(Flag: cint): cint
##  フォントのキャッシュにテクスチャを使用するかどうかを設定する( TRUE:テクスチャを使用する( デフォルト )  FALSE:テクスチャは使用しない )

proc GetFontCacheToTextureFlag*(): cint
##  フォントのキャッシュにテクスチャを使用するかどうかを設定する

proc SetFontChacheToTextureFlag*(Flag: cint): cint
##  SetFontCacheToTextureFlag の誤字版

proc GetFontChacheToTextureFlag*(): cint
##  GetFontCacheToTextureFlag の誤字版

proc SetFontCacheTextureColorBitDepth*(ColorBitDepth: cint): cint
##  フォントのキャッシュとして使用するテクスチャのカラービット深度を設定する( 16 又は 32 のみ指定可能  デフォルトは 32 )

proc GetFontCacheTextureColorBitDepth*(): cint
##  フォントのキャッシュとして使用するテクスチャのカラービット深度を取得する

proc SetFontCacheCharNum*(CharNum: cint): cint
##  フォントキャッシュでキャッシュできる文字数を設定する

proc GetFontCacheCharNum*(): cint
##  フォントキャッシュでキャッシュできる文字数を取得する( 戻り値  0:デフォルト  1以上:指定文字数 )

proc SetFontCacheUsePremulAlphaFlag*(Flag: cint): cint
##  フォントキャッシュとして保存する画像の形式を乗算済みαチャンネル付き画像にするかどうかを設定する( TRUE:乗算済みαを使用する  FLASE:乗算済みαを使用しない( デフォルト ) )

proc GetFontCacheUsePremulAlphaFlag*(): cint
##  フォントキャッシュとして保存する画像の形式を乗算済みαチャンネル付き画像にするかどうかを取得する

proc SetFontUseAdjustSizeFlag*(Flag: cint): cint
##  フォントのサイズを補正する処理を行うかどうかを設定する( Flag  TRUE:行う( デフォルト )  FALSE:行わない )

proc GetFontUseAdjustSizeFlag*(): cint
##  フォントのサイズを補正する処理を行うかどうかを取得する

proc SetFontOnlyDrawType*(OnlyType: cint): cint
##  フォントの描画で縁のみ、又は本体のみ描画を行うかどうかを設定する( OnlyType  0:通常描画 1:本体のみ描画 2:縁のみ描画 )

proc GetFontOnlyDrawType*(): cint
##  フォントの描画で縁のみ、又は本体のみ描画を行うかどうかを取得する( 戻り値  0:通常描画 1:本体のみ描画 2:縁のみ描画 )

proc SetFontIgnoreLFFlag*(Flag: cint): cint
##  DrawString などで \n を無視するかどうかを設定する( TRUE : 無視する    FALSE : 無視しない( デフォルト ) )

proc GetFontIgnoreLFFlag*(): cint
##  DrawString などで \n を無視するかどうかを取得する( TRUE : 無視する    FALSE : 無視しない( デフォルト ) )
##  FontCacheStringDraw の代わりに DrawString を使ってください

proc FontCacheStringDrawToHandle*(x: cint; y: cint; StrData: cstring; Color: cuint;
                                 EdgeColor: cuint; DestImage: ptr BASEIMAGE; ClipRect: ptr RECT; ##  NULL 可
                                 FontHandle: cint; VerticalFlag: cint = FALSE;
                                 DrawSizeP: ptr SIZE = nil): cint
proc FontCacheStringDrawToHandleWithStrLen*(x: cint; y: cint; StrData: cstring;
    StrDataLength: csize_t; Color: cuint; EdgeColor: cuint; DestImage: ptr BASEIMAGE; ClipRect: ptr RECT; ##  NULL 可
    FontHandle: cint; VerticalFlag: cint = FALSE; DrawSizeP: ptr SIZE = nil): cint
proc FontBaseImageBlt*(x: cint; y: cint; StrData: cstring; DestImage: ptr BASEIMAGE;
                      DestEdgeImage: ptr BASEIMAGE; VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する( デフォルトフォントハンドルを使用する )

proc FontBaseImageBltWithStrLen*(x: cint; y: cint; StrData: cstring;
                                StrDataLength: csize_t; DestImage: ptr BASEIMAGE;
                                DestEdgeImage: ptr BASEIMAGE;
                                VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する( デフォルトフォントハンドルを使用する )

proc FontBaseImageBltToHandle*(x: cint; y: cint; StrData: cstring;
                              DestImage: ptr BASEIMAGE;
                              DestEdgeImage: ptr BASEIMAGE; FontHandle: cint;
                              VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する

proc FontBaseImageBltToHandleWithStrLen*(x: cint; y: cint; StrData: cstring;
                                        StrDataLength: csize_t;
                                        DestImage: ptr BASEIMAGE;
                                        DestEdgeImage: ptr BASEIMAGE;
                                        FontHandle: cint;
                                        VerticalFlag: cint = FALSE): cint
##  基本イメージに文字列を描画する

proc MultiByteCharCheck*(Buf: cstring; CharSet: cint): cint
  ##  DX_CHARSET_SHFTJIS
##  ２バイト文字か調べる( TRUE:２バイト文字  FALSE:１バイト文字 )
##  文字列描画関数

proc DrawString*(x: cint; y: cint; String: cstring; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する

proc DrawNString*(x: cint; y: cint; String: cstring; StringLength: csize_t;
                 Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する

proc DrawVString*(x: cint; y: cint; String: cstring; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawNVString*(x: cint; y: cint; String: cstring; StringLength: csize_t;
                  Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawFormatString*(x: cint; y: cint; Color: cuint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する

proc DrawFormatVString*(x: cint; y: cint; Color: cuint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縦書き )

proc DrawFormatString2*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                       FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )

proc DrawFormatVString2*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                        FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )

proc DrawExtendString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                      String: cstring; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画

proc DrawExtendNString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                       String: cstring; StringLength: csize_t; Color: cuint;
                       EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画

proc DrawExtendVString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                       String: cstring; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )

proc DrawExtendNVString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                        String: cstring; StringLength: csize_t; Color: cuint;
                        EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )

proc DrawExtendFormatString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                            Color: cuint; FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する

proc DrawExtendFormatVString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             Color: cuint; FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )

proc DrawExtendFormatString2*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             Color: cuint; EdgeColor: cuint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )

proc DrawExtendFormatVString2*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              Color: cuint; EdgeColor: cuint;
                              FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )

proc DrawRotaString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                    RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                    Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                    String: cstring = nil): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する

proc DrawRotaNString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                     RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                     Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                     String: cstring = nil; StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する

proc DrawRotaFormatString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                          RotCenterX: cdouble; RotCenterY: cdouble;
                          RotAngle: cdouble; Color: cuint; EdgeColor: cuint = 0;
                          VerticalFlag: cint = FALSE; FormatString: cstring = nil): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を回転描画する

proc DrawModiString*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                    y4: cint; Color: cuint; EdgeColor: cuint = 0;
                    VerticalFlag: cint = FALSE; String: cstring = nil): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する

proc DrawModiNString*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint; x4: cint;
                     y4: cint; Color: cuint; EdgeColor: cuint = 0;
                     VerticalFlag: cint = FALSE; String: cstring = nil;
                     StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する

proc DrawModiFormatString*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                          x4: cint; y4: cint; Color: cuint; EdgeColor: cuint = 0;
                          VerticalFlag: cint = FALSE; FormatString: cstring = nil): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を変形描画する

proc DrawStringF*(x: cfloat; y: cfloat; String: cstring; Color: cuint;
                 EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawNStringF*(x: cfloat; y: cfloat; String: cstring; StringLength: csize_t;
                  Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawVStringF*(x: cfloat; y: cfloat; String: cstring; Color: cuint;
                  EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawNVStringF*(x: cfloat; y: cfloat; String: cstring; StringLength: csize_t;
                   Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatStringF*(x: cfloat; y: cfloat; Color: cuint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 座標指定が float 版 )

proc DrawFormatVStringF*(x: cfloat; y: cfloat; Color: cuint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatString2F*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                        FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawFormatVString2F*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                         FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawExtendStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                       String: cstring; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 座標指定が float 版 )

proc DrawExtendNStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                        String: cstring; StringLength: csize_t; Color: cuint;
                        EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 座標指定が float 版 )

proc DrawExtendVStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                        String: cstring; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )( 座標指定が float 版 )

proc DrawExtendNVStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                         String: cstring; StringLength: csize_t; Color: cuint;
                         EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して文字列の拡大描画( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                             Color: cuint; FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendFormatVStringF*(x: cfloat; y: cfloat; ExRateX: cdouble;
                              ExRateY: cdouble; Color: cuint;
                              FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatString2F*(x: cfloat; y: cfloat; ExRateX: cdouble;
                              ExRateY: cdouble; Color: cuint; EdgeColor: cuint;
                              FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawExtendFormatVString2F*(x: cfloat; y: cfloat; ExRateX: cdouble;
                               ExRateY: cdouble; Color: cuint; EdgeColor: cuint;
                               FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawRotaStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                     RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                     Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                     String: cstring = nil): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaNStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                      RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
                      Color: cuint; EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                      String: cstring = nil; StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaFormatStringF*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                           RotCenterX: cdouble; RotCenterY: cdouble;
                           RotAngle: cdouble; Color: cuint; EdgeColor: cuint = 0;
                           VerticalFlag: cint = FALSE; FormatString: cstring = nil): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を回転描画する( 座標指定が float 版 )

proc DrawModiStringF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                     y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                     EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                     String: cstring = nil): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiNStringF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                      y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                      EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                      String: cstring = nil; StringLength: csize_t = 0): cint
##  デフォルトフォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiFormatStringF*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                           y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                           EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                           FormatString: cstring = nil): cint {.varargs.}
##  デフォルトフォントハンドルを使用して書式指定文字列を変形描画する( 座標指定が float 版 )

proc DrawNumberToI*(x: cint; y: cint; Num: cint; RisesNum: cint; Color: cuint;
                   EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して整数型の数値を描画する

proc DrawNumberToF*(x: cint; y: cint; Num: cdouble; Length: cint; Color: cuint;
                   EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して浮動小数点型の数値を描画する

proc DrawNumberPlusToI*(x: cint; y: cint; NoteString: cstring; Num: cint;
                       RisesNum: cint; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して整数型の数値とその説明の文字列を一度に描画する

proc DrawNumberPlusToF*(x: cint; y: cint; NoteString: cstring; Num: cdouble;
                       Length: cint; Color: cuint; EdgeColor: cuint = 0): cint
##  デフォルトフォントハンドルを使用して浮動小数点型の数値とその説明の文字列を一度に描画する

proc DrawStringToZBuffer*(x: cint; y: cint; String: cstring; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawNStringToZBuffer*(x: cint; y: cint; String: cstring; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawVStringToZBuffer*(x: cint; y: cint; String: cstring; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawNVStringToZBuffer*(x: cint; y: cint; String: cstring; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawFormatStringToZBuffer*(x: cint; y: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                               FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を描画する

proc DrawFormatVStringToZBuffer*(x: cint; y: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を描画する( 縦書き )

proc DrawExtendStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                               String: cstring; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendNStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                String: cstring; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendVStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                String: cstring; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendNVStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                 String: cstring; StringLength: csize_t; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendFormatStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                     FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する

proc DrawExtendFormatVStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                      ExRateY: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                      FormatString: cstring): cint {.varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する( 縦書き )

proc DrawRotaStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             RotCenterX: cdouble; RotCenterY: cdouble;
                             RotAngle: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                             VerticalFlag: cint; String: cstring): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaNStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              RotCenterX: cdouble; RotCenterY: cdouble;
                              RotAngle: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                              VerticalFlag: cint; String: cstring;
                              StringLength: csize_t): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaFormatStringToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                   ExRateY: cdouble; RotCenterX: cdouble;
                                   RotCenterY: cdouble; RotAngle: cdouble; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                   VerticalFlag: cint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を回転描画する

proc DrawModiStringToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                             x4: cint; y4: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                             VerticalFlag: cint; String: cstring): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiNStringToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                              x4: cint; y4: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                              VerticalFlag: cint; String: cstring;
                              StringLength: csize_t): cint
##  デフォルトフォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiFormatStringToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                   y3: cint; x4: cint; y4: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                   VerticalFlag: cint; FormatString: cstring): cint {.
    varargs.}
##  デフォルトフォントハンドルを使用してＺバッファに対して書式指定文字列を変形描画する

proc DrawStringToHandle*(x: cint; y: cint; String: cstring; Color: cuint;
                        FontHandle: cint; EdgeColor: cuint = 0;
                        VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する

proc DrawNStringToHandle*(x: cint; y: cint; String: cstring; StringLength: csize_t;
                         Color: cuint; FontHandle: cint; EdgeColor: cuint = 0;
                         VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する

proc DrawVStringToHandle*(x: cint; y: cint; String: cstring; Color: cuint;
                         FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawNVStringToHandle*(x: cint; y: cint; String: cstring; StringLength: csize_t;
                          Color: cuint; FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )

proc DrawFormatStringToHandle*(x: cint; y: cint; Color: cuint; FontHandle: cint;
                              FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する

proc DrawFormatVStringToHandle*(x: cint; y: cint; Color: cuint; FontHandle: cint;
                               FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縦書き )

proc DrawFormatString2ToHandle*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                               FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )

proc DrawFormatVString2ToHandle*(x: cint; y: cint; Color: cuint; EdgeColor: cuint;
                                FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )

proc DrawExtendStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              String: cstring; Color: cuint; FontHandle: cint;
                              EdgeColor: cuint = 0; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する

proc DrawExtendNStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                               String: cstring; StringLength: csize_t;
                               Color: cuint; FontHandle: cint; EdgeColor: cuint = 0;
                               VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する

proc DrawExtendVStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                               String: cstring; Color: cuint; FontHandle: cint;
                               EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )

proc DrawExtendNVStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                                String: cstring; StringLength: csize_t;
                                Color: cuint; FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )

proc DrawExtendFormatStringToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                    ExRateY: cdouble; Color: cuint;
                                    FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する

proc DrawExtendFormatVStringToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; Color: cuint;
                                     FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )

proc DrawExtendFormatString2ToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; Color: cuint;
                                     EdgeColor: cuint; FontHandle: cint;
                                     FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )

proc DrawExtendFormatVString2ToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                      ExRateY: cdouble; Color: cuint;
                                      EdgeColor: cuint; FontHandle: cint;
                                      FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )

proc DrawRotaStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                            RotCenterX: cdouble; RotCenterY: cdouble;
                            RotAngle: cdouble; Color: cuint; FontHandle: cint;
                            EdgeColor: cuint; VerticalFlag: cint; String: cstring): cint
##  フォントハンドルを使用して文字列を回転描画する

proc DrawRotaNStringToHandle*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                             RotCenterX: cdouble; RotCenterY: cdouble;
                             RotAngle: cdouble; Color: cuint; FontHandle: cint;
                             EdgeColor: cuint; VerticalFlag: cint;
                             String: cstring; StringLength: csize_t): cint
##  フォントハンドルを使用して文字列を回転描画する

proc DrawRotaFormatStringToHandle*(x: cint; y: cint; ExRateX: cdouble;
                                  ExRateY: cdouble; RotCenterX: cdouble;
                                  RotCenterY: cdouble; RotAngle: cdouble;
                                  Color: cuint; FontHandle: cint; EdgeColor: cuint;
                                  VerticalFlag: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を回転描画する

proc DrawModiStringToHandle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                            x4: cint; y4: cint; Color: cuint; FontHandle: cint;
                            EdgeColor: cuint; VerticalFlag: cint; String: cstring): cint
##  フォントハンドルを使用して文字列を変形描画する

proc DrawModiNStringToHandle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint; y3: cint;
                             x4: cint; y4: cint; Color: cuint; FontHandle: cint;
                             EdgeColor: cuint; VerticalFlag: cint;
                             String: cstring; StringLength: csize_t): cint
##  フォントハンドルを使用して文字列を変形描画する

proc DrawModiFormatStringToHandle*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                  y3: cint; x4: cint; y4: cint; Color: cuint;
                                  FontHandle: cint; EdgeColor: cuint;
                                  VerticalFlag: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を変形描画する

proc DrawStringFToHandle*(x: cfloat; y: cfloat; String: cstring; Color: cuint;
                         FontHandle: cint; EdgeColor: cuint = 0;
                         VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawNStringFToHandle*(x: cfloat; y: cfloat; String: cstring;
                          StringLength: csize_t; Color: cuint; FontHandle: cint;
                          EdgeColor: cuint = 0; VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を描画する( 座標指定が float 版 )

proc DrawVStringFToHandle*(x: cfloat; y: cfloat; String: cstring; Color: cuint;
                          FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawNVStringFToHandle*(x: cfloat; y: cfloat; String: cstring;
                           StringLength: csize_t; Color: cuint; FontHandle: cint;
                           EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatStringFToHandle*(x: cfloat; y: cfloat; Color: cuint; FontHandle: cint;
                               FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 座標指定が float 版 )

proc DrawFormatVStringFToHandle*(x: cfloat; y: cfloat; Color: cuint; FontHandle: cint;
                                FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縦書き )( 座標指定が float 版 )

proc DrawFormatString2FToHandle*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                                FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawFormatVString2FToHandle*(x: cfloat; y: cfloat; Color: cuint; EdgeColor: cuint;
                                 FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawExtendStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                               ExRateY: cdouble; String: cstring; Color: cuint;
                               FontHandle: cint; EdgeColor: cuint = 0;
                               VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendNStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                ExRateY: cdouble; String: cstring;
                                StringLength: csize_t; Color: cuint;
                                FontHandle: cint; EdgeColor: cuint = 0;
                                VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用して文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendVStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                ExRateY: cdouble; String: cstring; Color: cuint;
                                FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendNVStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                 ExRateY: cdouble; String: cstring;
                                 StringLength: csize_t; Color: cuint;
                                 FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                     ExRateY: cdouble; Color: cuint;
                                     FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 座標指定が float 版 )

proc DrawExtendFormatVStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                      ExRateY: cdouble; Color: cuint;
                                      FontHandle: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縦書き )( 座標指定が float 版 )

proc DrawExtendFormatString2FToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                      ExRateY: cdouble; Color: cuint;
                                      EdgeColor: cuint; FontHandle: cint;
                                      FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 座標指定が float 版 )

proc DrawExtendFormatVString2FToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                       ExRateY: cdouble; Color: cuint;
                                       EdgeColor: cuint; FontHandle: cint;
                                       FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を拡大描画する( 縁の色引数付き )( 縦書き )( 座標指定が float 版 )

proc DrawRotaStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble; ExRateY: cdouble;
                             RotCenterX: cdouble; RotCenterY: cdouble;
                             RotAngle: cdouble; Color: cuint; FontHandle: cint;
                             EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                             String: cstring = nil): cint
##  フォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaNStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                              ExRateY: cdouble; RotCenterX: cdouble;
                              RotCenterY: cdouble; RotAngle: cdouble; Color: cuint;
                              FontHandle: cint; EdgeColor: cuint = 0;
                              VerticalFlag: cint = FALSE; String: cstring = nil;
                              StringLength: csize_t = 0): cint
##  フォントハンドルを使用して文字列を回転描画する( 座標指定が float 版 )

proc DrawRotaFormatStringFToHandle*(x: cfloat; y: cfloat; ExRateX: cdouble;
                                   ExRateY: cdouble; RotCenterX: cdouble;
                                   RotCenterY: cdouble; RotAngle: cdouble;
                                   Color: cuint; FontHandle: cint;
                                   EdgeColor: cuint = 0; VerticalFlag: cint = FALSE;
                                   FormatString: cstring = nil): cint {.varargs.}
##  フォントハンドルを使用して書式指定文字列を回転描画する( 座標指定が float 版 )

proc DrawModiStringFToHandle*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat; x3: cfloat;
                             y3: cfloat; x4: cfloat; y4: cfloat; Color: cuint;
                             FontHandle: cint; EdgeColor: cuint; VerticalFlag: cint;
                             String: cstring): cint
##  フォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiNStringFToHandle*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
                              x3: cfloat; y3: cfloat; x4: cfloat; y4: cfloat;
                              Color: cuint; FontHandle: cint; EdgeColor: cuint;
                              VerticalFlag: cint; String: cstring;
                              StringLength: csize_t): cint
##  フォントハンドルを使用して文字列を変形描画する( 座標指定が float 版 )

proc DrawModiFormatStringFToHandle*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat;
                                   x3: cfloat; y3: cfloat; x4: cfloat; y4: cfloat;
                                   Color: cuint; FontHandle: cint; EdgeColor: cuint;
                                   VerticalFlag: cint; FormatString: cstring): cint {.
    varargs.}
##  フォントハンドルを使用して書式指定文字列を変形描画する( 座標指定が float 版 )

proc DrawNumberToIToHandle*(x: cint; y: cint; Num: cint; RisesNum: cint; Color: cuint;
                           FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して整数型の数値を描画する

proc DrawNumberToFToHandle*(x: cint; y: cint; Num: cdouble; Length: cint; Color: cuint;
                           FontHandle: cint; EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して浮動小数点型の数値を描画する

proc DrawNumberPlusToIToHandle*(x: cint; y: cint; NoteString: cstring; Num: cint;
                               RisesNum: cint; Color: cuint; FontHandle: cint;
                               EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して整数型の数値とその説明の文字列を一度に描画する

proc DrawNumberPlusToFToHandle*(x: cint; y: cint; NoteString: cstring; Num: cdouble;
                               Length: cint; Color: cuint; FontHandle: cint;
                               EdgeColor: cuint = 0): cint
##  フォントハンドルを使用して浮動小数点型の数値とその説明の文字列を一度に描画する

proc DrawStringToHandleToZBuffer*(x: cint; y: cint; String: cstring; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                 VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawNStringToHandleToZBuffer*(x: cint; y: cint; String: cstring;
                                  StringLength: csize_t; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                  VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を描画する

proc DrawVStringToHandleToZBuffer*(x: cint; y: cint; String: cstring;
                                  FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawNVStringToHandleToZBuffer*(x: cint; y: cint; String: cstring;
                                   StringLength: csize_t; FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を描画する( 縦書き )

proc DrawFormatStringToHandleToZBuffer*(x: cint; y: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                       FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を描画する

proc DrawFormatVStringToHandleToZBuffer*(x: cint; y: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                        FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を描画する( 縦書き )

proc DrawExtendStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                       ExRateY: cdouble; String: cstring;
                                       FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                       VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendNStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                        ExRateY: cdouble; String: cstring;
                                        StringLength: csize_t; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                        VerticalFlag: cint = FALSE): cint
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する

proc DrawExtendVStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                        ExRateY: cdouble; String: cstring;
                                        FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendNVStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; String: cstring; StringLength: csize_t; FontHandle: cint; WriteZMode: cint): cint
  ##  DX_ZWRITE_MASK 等
##  フォントハンドルを使用してＺバッファに対して文字列を拡大描画する( 縦書き )

proc DrawExtendFormatStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する

proc DrawExtendFormatVStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を拡大描画する( 縦書き )

proc DrawRotaStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                     ExRateY: cdouble; RotCenterX: cdouble;
                                     RotCenterY: cdouble; RotAngle: cdouble;
                                     FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                     VerticalFlag: cint; String: cstring): cint
##  フォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaNStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
                                      ExRateY: cdouble; RotCenterX: cdouble;
                                      RotCenterY: cdouble; RotAngle: cdouble;
                                      FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                      VerticalFlag: cint; String: cstring;
                                      StringLength: csize_t): cint
##  フォントハンドルを使用してＺバッファに対して文字列を回転描画する

proc DrawRotaFormatStringToHandleToZBuffer*(x: cint; y: cint; ExRateX: cdouble;
    ExRateY: cdouble; RotCenterX: cdouble; RotCenterY: cdouble; RotAngle: cdouble;
    FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    VerticalFlag: cint; FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を回転描画する

proc DrawModiStringToHandleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                     y3: cint; x4: cint; y4: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                     VerticalFlag: cint; String: cstring): cint
##  フォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiNStringToHandleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint; x3: cint;
                                      y3: cint; x4: cint; y4: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
                                      VerticalFlag: cint; String: cstring;
                                      StringLength: csize_t): cint
##  フォントハンドルを使用してＺバッファに対して文字列を変形描画する

proc DrawModiFormatStringToHandleToZBuffer*(x1: cint; y1: cint; x2: cint; y2: cint;
    x3: cint; y3: cint; x4: cint; y4: cint; FontHandle: cint; WriteZMode: cint; ##  DX_ZWRITE_MASK 等
    VerticalFlag: cint; FormatString: cstring): cint {.varargs.}
##  フォントハンドルを使用してＺバッファに対して書式指定文字列を変形描画する

{.pop.}
