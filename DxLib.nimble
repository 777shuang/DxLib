# Package

version       = "3.24.2"
author        = "777shuang"
description   = "A Nim binding for DX Library"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["DxLibHeaderSpliter"]

# Dependencies

requires "nim >= 1.6.12"
requires "puppy"
requires "zippy"
requires "c2nim"
requires "winim"