# Package

packageName = "sekigae"
version     = "1.0.4"
author      = "jiro4989"
description = "席替えプログラム"
license     = "MIT"
srcDir      = "src"
binDir      = "bin"
bin         = @[packageName]
skipDirs    = @["tests", "util"]

# Dependencies

requires "nim >= 0.19.0"

import strformat

let
  binbin = &"{binDir}/{packageName}"
  distDir = "dist"

task run, "バイナリをビルドする":
  exec "nimble build"
  exec binbin

task archive, "配布用に圧縮する":
  exec "nimble build"
  let
    pack = &"{packageName}_v{version}"
    archiveDir = &"{distDir}/{pack}"
  rmdir distDir
  mkdir distDir
  mkdir archiveDir
  cpFile binbin, &"{archiveDir}/{packageName}"
  cpFile "README.md", &"{archiveDir}/README.md"
  withDir distDir:
    exec &"tar czf {pack}.tar.gz {pack}"

task release, "GitHubにリリースする":
  exec "nimble test"
  exec "nimble archive"
  exec &"ghr v{version} {distDir}/"
