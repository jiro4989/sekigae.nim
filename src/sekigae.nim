import random, strformat, os, ospaths, json, sequtils, strutils
import sekigae/submodule

let configPaths = [
  ".sekigae.json",
  getConfigDir() & &"/sekigae/config.json"
  ]

# デフォルト座席
var sheets = @[
  @[false, false, true, true, false, false],
  @[true, true, true, true, true, true],
  @[true, true, true, true, true, true],
  @[true, true, true, true, true, true]
  ]

# IDリスト
var ids = @[ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22" ]

type Config = object
  sheets: seq[seq[bool]]
  ids: seq[string]

when isMainModule:
  # 設定ファイルがあれば読み込む
  for configPath in configPaths:
    if existsFile(configPath):
      let jsonNode = configPath.readFile().parseJson()
      let config = to(jsonNode, Config)
      sheets = config.sheets
      ids = config.ids
      break

  let maxIdLen = ids.mapIt(it.len).max

  randomize()
  ids.shuffle()

  let newSheets = sheets.changeSheets(ids)
  for sheet in newSheets:
    var line: string
    for s in sheet:
      line.add("| " & align(s, maxIdLen) & " ")
    echo line, "|"
