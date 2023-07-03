when defined(windows):
    const DLL* = "DxDll.dll"
else:
    const DLL* = "DxLib.so"