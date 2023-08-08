import ../DxDll
{.push dynlib: DLL, importc.}

##  DxInputString.cpp関数プロトタイプ宣言
##  文字コードバッファ操作関係

proc StockInputChar*(CharCode: TCHAR): cint
##  文字コードバッファに文字コードをストックする

proc ClearInputCharBuf*(): cint
##  文字コードバッファをクリアする

proc GetInputChar*(DeleteFlag: cint): TCHAR
##  文字コードバッファに溜まったデータから文字コードを一つ取得する

proc GetInputCharWait*(DeleteFlag: cint): TCHAR
##  文字コードバッファに溜まったデータから文字コードを一つ取得する、バッファになにも文字コードがない場合は文字コードがバッファに一文字分溜まるまで待つ

proc GetOneChar*(CharBuffer: ptr TCHAR; DeleteFlag: cint): cint
##  文字コードバッファに溜まったデータから１文字分取得する

proc GetOneCharWait*(CharBuffer: ptr TCHAR; DeleteFlag: cint): cint
##  文字コードバッファに溜まったデータから１文字分取得する、バッファに何も文字コードがない場合は文字コードがバッファに一文字分溜まるまで待つ

proc GetCtrlCodeCmp*(Char: TCHAR): cint
##  指定の文字コードがアスキーコントロールコードか調べる

proc DrawIMEInputString*(x: cint; y: cint; SelectStringNum: cint;
                        DrawCandidateList: cint = TRUE): cint
##  画面上に入力中の文字列を描画する

proc DrawIMEInputExtendString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              SelectStringNum: cint;
                              DrawCandidateList: cint = TRUE): cint
##  画面上に入力中の文字列を描画する( 拡大率付き )

proc SetUseIMEFlag*(UseFlag: cint): cint
##  ＩＭＥを使用するかどうかを設定する

proc GetUseIMEFlag*(): cint
##  ＩＭＥを使用するかどうかの設定を取得する

proc SetInputStringMaxLengthIMESync*(Flag: cint): cint
##  ＩＭＥで入力できる最大文字数を MakeKeyInput の設定に合わせるかどうかをセットする( TRUE:あわせる  FALSE:あわせない(デフォルト) )

proc SetIMEInputStringMaxLength*(Length: cint): cint
##  ＩＭＥで一度に入力できる最大文字数を設定する( 0:制限なし  1以上:指定の文字数で制限 )

proc GetStringPoint*(String: ptr TCHAR; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の文字数での半角文字数を得る

proc GetStringPointWithStrLen*(String: ptr TCHAR; StringLength: csize_t; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の文字数での半角文字数を得る

proc GetStringPoint2*(String: ptr TCHAR; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の半角文字数での文字数を得る

proc GetStringPoint2WithStrLen*(String: ptr TCHAR; StringLength: csize_t; Point: cint): cint
##  全角文字、半角文字入り乱れる中から指定の半角文字数での文字数を得る

proc GetStringLength*(String: ptr TCHAR): cint
##  全角文字、半角文字入り乱れる中から文字数を取得する

proc DrawObtainsString*(x: cint; y: cint; AddY: cint; String: ptr TCHAR; StrColor: cuint;
                       StrEdgeColor: cuint = 0; FontHandle: cint = -1;
                       SelectBackColor: cuint = 0xffffffff'u32;
                       SelectStrColor: cuint = 0;
                       SelectStrEdgeColor: cuint = 0xffffffff'u32;
                       SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画

proc DrawObtainsNString*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                        StringLength: csize_t; StrColor: cuint;
                        StrEdgeColor: cuint = 0; FontHandle: cint = -1;
                        SelectBackColor: cuint = 0xffffffff'u32;
                        SelectStrColor: cuint = 0;
                        SelectStrEdgeColor: cuint = 0xffffffff'u32;
                        SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画

proc DrawObtainsString_CharClip*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                                StrColor: cuint; StrEdgeColor: cuint = 0;
                                FontHandle: cint = -1;
                                SelectBackColor: cuint = 0xffffffff'u32;
                                SelectStrColor: cuint = 0;
                                SelectStrEdgeColor: cuint = 0xffffffff'u32;
                                SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画( クリップが文字単位 )

proc DrawObtainsNString_CharClip*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                                 StringLength: csize_t; StrColor: cuint;
                                 StrEdgeColor: cuint = 0; FontHandle: cint = -1;
                                 SelectBackColor: cuint = 0xffffffff'u32;
                                 SelectStrColor: cuint = 0;
                                 SelectStrEdgeColor: cuint = 0xffffffff'u32;
                                 SelectStart: cint = -1; SelectEnd: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画( クリップが文字単位 )

proc GetObtainsStringCharPosition*(x: cint; y: cint; AddY: cint; String: ptr TCHAR;
                                  StrLen: cint; PosX: ptr cint; PosY: ptr cint;
                                  FontHandle: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画した場合の文字列の末端の座標を取得する

proc GetObtainsStringCharPosition_CharClip*(x: cint; y: cint; AddY: cint;
    String: ptr TCHAR; StrLen: cint; PosX: ptr cint; PosY: ptr cint; FontHandle: cint = -1): cint
##  描画可能領域に収まるように改行しながら文字列を描画した場合の文字列の末端の座標を取得する( クリップが文字単位 )

proc DrawObtainsBox*(x1: cint; y1: cint; x2: cint; y2: cint; AddY: cint; Color: cuint;
                    FillFlag: cint): cint
##  描画可能領域に収まるように補正を加えながら矩形を描画

proc InputStringToCustom*(x: cint; y: cint; BufLength: csize_t; StrBuffer: ptr TCHAR;
                         CancelValidFlag: cint; SingleCharOnlyFlag: cint;
                         NumCharOnlyFlag: cint; DoubleCharOnlyFlag: cint = FALSE;
                         EnableNewLineFlag: cint = FALSE;
                         DisplayCandidateList: cint = TRUE): cint
##  文字列の入力取得

proc KeyInputString*(x: cint; y: cint; CharMaxLength: csize_t; StrBuffer: ptr TCHAR;
                    CancelValidFlag: cint): cint
##  文字列の入力取得

proc KeyInputSingleCharString*(x: cint; y: cint; CharMaxLength: csize_t;
                              StrBuffer: ptr TCHAR; CancelValidFlag: cint): cint
##  半角文字列のみの入力取得

proc KeyInputNumber*(x: cint; y: cint; MaxNum: cint; MinNum: cint; CancelValidFlag: cint): cint
##  数値の入力取得

proc GetIMEInputModeStr*(GetBuffer: ptr TCHAR): cint
##  IMEの入力モード文字列を取得する

proc GetIMEInputData*(): ptr IMEINPUTDATA
##  IMEで入力中の文字列の情報を取得する

proc SetIMEInputString*(String: ptr TCHAR): cint
##  IMEで入力中の文字列を変更する( IMEで文字列を入力中ではなかった場合は何も起こりません )

proc SetIMEInputStringWithStrLen*(String: ptr TCHAR; StringLength: csize_t): cint
##  IMEで入力中の文字列を変更する( IMEで文字列を入力中ではなかった場合は何も起こりません )

proc SetKeyInputStringColor*(NmlStr: ULONGLONG; NmlCur: ULONGLONG;
                            IMEStrBack: ULONGLONG; IMECur: ULONGLONG;
                            IMELine: ULONGLONG; IMESelectStr: ULONGLONG;
                            IMEModeStr: ULONGLONG; NmlStrE: ULONGLONG = 0;
                            IMESelectStrE: ULONGLONG = 0;
                            IMEModeStrE: ULONGLONG = 0;
                            IMESelectWinE: ULONGLONG = (-1'i64);
                            IMESelectWinF: ULONGLONG = (-1'i64);
    SelectStrBackColor: ULONGLONG = (-1'i64);
                            SelectStrColor: ULONGLONG = (-1'i64);
    SelectStrEdgeColor: ULONGLONG = (-1'i64);
                            IMEStr: ULONGLONG = (-1'i64);
                            IMEStrE: ULONGLONG = (-1'i64)): cint
##  ( SetKeyInputStringColor2 の旧関数 )InputString関数使用時の文字の各色を変更する

proc SetKeyInputStringColor2*(TargetColor: cint; ##  DX_KEYINPSTRCOLOR_NORMAL_STR 等
                             Color: cuint): cint
##  InputString関数使用時の文字の各色を変更する

proc ResetKeyInputStringColor2*(TargetColor: cint): cint
  ##  DX_KEYINPSTRCOLOR_NORMAL_STR 等
##  SetKeyInputStringColor2 で設定した色をデフォルトに戻す

proc SetKeyInputStringFont*(FontHandle: cint): cint
##  キー入力文字列描画関連で使用するフォントのハンドルを変更する(-1でデフォルトのフォントハンドル)

proc SetKeyInputStringEndCharaMode*(EndCharaMode: cint): cint
  ##  DX_KEYINPSTR_ENDCHARAMODE_OVERWRITE 等
##  キー入力文字列処理の入力文字数が限界に達している状態で、文字列の末端部分で入力が行われた場合の処理モードを変更する

proc DrawKeyInputModeString*(x: cint; y: cint): cint
##  入力モード文字列を描画する

proc InitKeyInput*(): cint
##  キー入力データ初期化

proc MakeKeyInput*(MaxStrLength: csize_t; CancelValidFlag: cint;
                  SingleCharOnlyFlag: cint; NumCharOnlyFlag: cint;
                  DoubleCharOnlyFlag: cint = FALSE; EnableNewLineFlag: cint = FALSE): cint
##  新しいキー入力ハンドルの作成

proc DeleteKeyInput*(InputHandle: cint): cint
##  キー入力ハンドルの削除

proc SetActiveKeyInput*(InputHandle: cint): cint
##  指定のキー入力ハンドルをアクティブにする( -1 を指定するとアクティブなキー入力ハンドルが無い状態になります )

proc GetActiveKeyInput*(): cint
##  現在アクティブになっているキー入力ハンドルを取得する

proc CheckKeyInput*(InputHandle: cint): cint
##  キー入力ハンドルの入力が終了しているか取得する

proc ReStartKeyInput*(InputHandle: cint): cint
##  入力が完了したキー入力ハンドルを再度編集状態に戻す

proc ProcessActKeyInput*(): cint
##  キー入力ハンドル処理関数

proc DrawKeyInputString*(x: cint; y: cint; InputHandle: cint;
                        DrawCandidateList: cint = TRUE): cint
##  キー入力ハンドルの入力中情報の描画

proc DrawKeyInputExtendString*(x: cint; y: cint; ExRateX: cdouble; ExRateY: cdouble;
                              InputHandle: cint; DrawCandidateList: cint = TRUE): cint
##  キー入力ハンドルの入力中情報の描画( 拡大率指定付き )

proc SetKeyInputDrawArea*(x1: cint; y1: cint; x2: cint; y2: cint; InputHandle: cint): cint
##  キー入力ハンドルの入力中文字列を描画する際の描画範囲を設定する

proc SetKeyInputSelectArea*(SelectStart: cint; SelectEnd: cint; InputHandle: cint): cint
##  キー入力ハンドルの指定の領域を選択状態にする( SelectStart と SelectEnd に -1 を指定すると選択状態が解除されます )

proc GetKeyInputSelectArea*(SelectStart: ptr cint; SelectEnd: ptr cint;
                           InputHandle: cint): cint
##  キー入力ハンドルの選択領域を取得する

proc SetKeyInputDrawStartPos*(DrawStartPos: cint; InputHandle: cint): cint
##  キー入力ハンドルの描画開始文字位置を設定する

proc GetKeyInputDrawStartPos*(InputHandle: cint): cint
##  キー入力ハンドルの描画開始文字位置を取得する

proc SetKeyInputCursorBrinkTime*(Time: cint): cint
##  キー入力ハンドルのキー入力時のカーソルの点滅する早さをセットする

proc SetKeyInputCursorBrinkFlag*(Flag: cint): cint
##  キー入力ハンドルのキー入力時のカーソルを点滅させるかどうかをセットする

proc SetKeyInputString*(String: ptr TCHAR; InputHandle: cint): cint
##  キー入力ハンドルに指定の文字列をセットする

proc SetKeyInputStringWithStrLen*(String: ptr TCHAR; StringLength: csize_t;
                                 InputHandle: cint): cint
##  キー入力ハンドルに指定の文字列をセットする

proc SetKeyInputNumber*(Number: cint; InputHandle: cint): cint
##  キー入力ハンドルに指定の数値を文字に置き換えてセットする

proc SetKeyInputNumberToFloat*(Number: cfloat; InputHandle: cint): cint
##  キー入力ハンドルに指定の浮動小数点値を文字に置き換えてセットする

proc GetKeyInputString*(StrBuffer: ptr TCHAR; InputHandle: cint): cint
##  キー入力ハンドルの入力中の文字列を取得する

proc GetKeyInputNumber*(InputHandle: cint): cint
##  キー入力ハンドルの入力中の文字列を整数値として取得する

proc GetKeyInputNumberToFloat*(InputHandle: cint): cfloat
##  キー入力ハンドルの入力中の文字列を浮動小数点値として取得する

proc SetKeyInputCursorPosition*(Position: cint; InputHandle: cint): cint
##  キー入力ハンドルの現在のカーソル位置を設定する

proc GetKeyInputCursorPosition*(InputHandle: cint): cint
##  キー入力ハンドルの現在のカーソル位置を取得する

{.pop.}
