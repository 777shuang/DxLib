import winim
export winim
import DxDefine, DxStruct
export DxDefine, DxStruct

when defined(windows):
    const DLL* = "DxLib-3_24d.dll"
else:
    const DLL* = "DxLib.so"