# Package

version       = "0.2.1"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir = "bin"
bin = @["sekigae"]
skipDirs = @["tests", "util"]

# Dependencies

requires "nim >= 0.19.0"
