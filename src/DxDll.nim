import winim
import DxDefine, DxStruct
export DxDefine, DxStruct

when defined(windows):
    const DLL* = "DxDll.dll"
else:
    const DLL* = "DxLib.so"