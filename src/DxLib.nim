{.push header: "DxLib.h".}

# 使用必須関数
proc DxLib_Init*(): int
proc DxLib_End*(): int
proc ProcessMessage*(): int

# 図形描画関数
proc DrawLine*(x1, y1, x2, y2 : int, Color: uint): int
proc DrawLineAA*(x1, y1, x2, y2 : float, Color: uint): int
proc DrawBox*(x1, y1, x2, y2 : int, Color: uint, FillFlag: int): int
proc DrawBoxAA*(x1, y1, x2, y2 : float, Color: uint, FillFlag: int): int
proc DrawCircle*(x, y, r : int, Color: uint, FillFlag: int): int
proc DrawCircleAA*(x, y, r : float, posnum: int, Color: uint, FillFlag: int): int
proc DrawOval*(x, y, rx, ry : int, Color: uint, FillFlag: int): int
proc DrawOvalAA*(x, y, rx, ry, : float, posnum: int, Color: uint, FillFlag: int): int
proc DrawTriangle*(x1: int, y1: int, x2: int, y2: int, x3: int, y3: int, Color: uint, FillFlag: int): int
proc DrawTriangleAA*(x1: float, y1: float, x2: float, y2: float, x3: float, y3: float, Color: uint, FillFlag: int): int
proc DrawPixel*(x: int, y: int, Color: uint): int
proc GetPixel*(x: int, y: int): uint

# グラフィックデータ制御関数
proc LoadGraphScreen*(x: int, y: int, GraphName: cstring, TransFlag: int): int
proc LoadGraph*(FileName: cstring): int
proc LoadDivGraph*(FileName: cstring, AllNum: int, XNum: int, YNum: int, XSize: int,
                  YSize: int, HandleBuf: ptr int): int
proc MakeGraph*(SizeX: int, SizeY: int): int
proc MakeScreen*(SizeX: int, SizeY: int, UseAlphaChannel: int): int
proc SetCreateDrawValidGraphMultiSample*(Samples: int, Quality: int): int
proc SetCreateGraphColorBitDepth*(BitDepth: int): int
proc SetDrawValidFloatTypeGraphCreateFlag*(Flag: int): int
proc SetCreateDrawValidGraphChannelNum*(ChannelNum: int): int
proc SetUsePremulAlphaConvertLoad*(UseFlag: int): int
proc DrawGraph*(x: int, y: int, GrHandle: int, TransFlag: int): int
proc DrawTurnGraph*(x: int, y: int, GrHandle: int, TransFlag: int): int
proc DrawExtendGraph*(x1: int, y1: int, x2: int, y2: int, GrHandle: int,
                     TransFlag: int): int
proc DrawRotaGraph*(x: int, y: int, ExtRate: float64, Angle: float64, GrHandle: int,
                   TransFlag: int, TurnFlag: int): int
proc DrawRotaGraph2*(x: int, y: int, cx: int, cy: int, ExtRate: float64,
                    Angle: float64, GrHandle: int, TransFlag: int, TurnFlag: int): int
proc DrawRotaGraph3*(x: int, y: int, cx: int, cy: int, ExtRateX: float64,
                    ExtRateY: float64, Angle: float64, GrHandle: int,
                    TransFlag: int, TurnFlag: int): int
proc DrawModiGraph*(x1: int, y1: int, x2: int, y2: int, x3: int, y3: int, x4: int,
                   y4: int, GrHandle: int, TransFlag: int): int
proc DrawRectGraph*(DestX: int, DestY: int, SrcX: int, SrcY: int, Width: int,
                   Height: int, GraphHandle: int, TransFlag: int, TurnFlag: int): int
proc DerivationGraph*(SrcX: int, SrcY: int, Width: int, Height: int,
                     SrcGraphHandle: int): int
proc GetDrawScreenGraph*(x1: int, y1: int, x2: int, y2: int, GrHandle: int): int
proc GetGraphSize*(GrHandle: int, SizeXBuf: ptr int, SizeYBuf: ptr int): int
proc InitGraph*(): int
proc DeleteGraph*(GrHandle: int): int
proc SetDrawMode*(DrawMode: int): int
proc SetDrawBlendMode*(BlendMode: int, Pal: int): int
proc SetDrawBright*(RedBright: int, GreenBright: int, BlueBright: int): int
proc SetTransColor*(Red: int, Green: int, Blue: int): int
proc LoadBlendGraph*(FileName: cstring): int
proc DrawBlendGraph*(x: int, y: int, GrHandle: int, TransFlag: int, BlendGraph: int,
                    BorderParam: int, BorderRange: int): int
proc GraphFilter*(GrHandle: int, FilterType: int): int {.varargs.}
proc GraphFilterBlt*(SrcGrHandle: int, DestGrHandle: int, FilterType: int): int {.
    varargs.}
proc GraphFilterRectBlt*(SrcGrHandle: int, DestGrHandle: int, SrcX1: int,
                        SrcY1: int, SrcX2: int, SrcY2: int, DestX: int, DestY: int,
                        FilterType: int): int {.varargs.}
proc GraphBlend*(GrHandle: int, BlendGrHandle: int, BlendRatio: int, BlendType: int): int {.
    varargs.}
proc GraphBlendBlt*(SrcGrHandle: int, BlendGrHandle: int, DestGrHandle: int,
                   BlendRatio: int, BlendType: int): int {.varargs.}
proc GraphBlendRectBlt*(SrcGrHandle: int, BlendGrHandle: int, DestGrHandle: int,
                       SrcX1: int, SrcY1: int, SrcX2: int, SrcY2: int, BlendX: int,
                       BlendY: int, DestX: int, DestY: int, BlendRatio: int,
                       BlendType: int): int {.varargs.}

# 文字描画関係関数
proc DrawString*(x: int, y: int, String: cstring, Color: uint): int
proc DrawFormatString*(x: int, y: int, Color: uint, FormatString: cstring): int {.
    varargs.}
proc GetDrawStringWidth*(String: cstring, StrLen: int): int
proc GetDrawFormatStringWidth*(FormatString: cstring): int {.varargs.}
proc SetFontSize*(FontSize: int): int
proc SetFontThickness*(TinckPal: int): int
proc ChangeFont*(FontName: cstring): int
proc ChangeFontType*(FontType: int): int
proc CreateFontToHandle*(FontName: cstring, Size: int, Thick: int, FontType: int): int
proc LoadFontDataToHandle*(FileName: cstring, EdgeSize: int): int
proc DeleteFontToHandle*(FontHandle: int): int
proc SetFontCacheUsePremulAlphaFlag*(Flag: int): int
proc DrawStringToHandle*(x: int, y: int, String: cstring, Color: uint,
                        FontHandle: int): int
proc DrawFormatStringToHandle*(x: int, y: int, Color: uint, FontHandle: int,
                              FormatString: cstring): int {.varargs.}
proc GetDrawStringWidthToHandle*(String: cstring, StrLen: int, FontHandle: int): int
proc GetDrawFormatStringWidthToHandle*(FontHandle: int, FormatString: cstring): int {.
    varargs.}
proc GetFontStateToHandle*(FontName: cstring, Size: ptr int, Thick: ptr int,
                          FontHandle: int): int
proc InitFontToHandle*(): int

# 簡易画面出力関数
proc printfDx*(FormatString: cstring): int {.varargs.}
proc clsDx*(): int

# その他画面操作系関数
proc SetGraphMode*(SizeX: int, SizeY: int, ColorBitNum: int): int
proc SetFullScreenResolutionMode*(ResolutionMode: int): int
proc SetFullScreenScalingMode*(ScalingMode: int): int
proc GetScreenState*(SizeX: ptr int, SizeY: ptr int, ColorBitDepth: ptr int): int
proc SetDrawArea*(x1: int, y1: int, x2: int, y2: int): int
proc ClearDrawScreen*(): int
proc ClearDrawScreenZBuffer*(): int
proc SetBackgroundColor*(Red: int, Green: int, Blue: int): int
proc GetColor*(Red: int, Green: int, Blue: int): uint
proc SetDrawScreen*(DrawScreen: int): int
proc ScreenFlip*(): int
proc SetFullSceneAntiAliasingMode*(Samples: int, Quality: int): int

# 動画関係関数
proc PlayMovie*(FileName: cstring, ExRate: int, PlayType: int): int
proc PlayMovieToGraph*(GraphHandle: int): int
proc PauseMovieToGraph*(GraphHandle: int): int
proc SeekMovieToGraph*(GraphHandle: int, Time: int): int
proc TellMovieToGraph*(GraphHandle: int): int
proc GetMovieStateToGraph*(GraphHandle: int): int

{.pop.}