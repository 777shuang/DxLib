import strformat
import winim
export winim
import DxDefine, DxStruct
export DxDefine, DxStruct
import DxLibVersion

when defined(windows):
    const DLL* = fmt"DxLib-{DxLibVersion.DxLibVersion}.dll"
else:
    const DLL* = "DxLib.so"