import DxDefine, DxStruct, DxFunctions
export DxDefine, DxStruct, DxFunctions

when defined(windows):
  import DxFunctionWin
  export DxFUnctionWin