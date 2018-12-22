import random, strformat, os, ospaths, json, sequtils, strutils, logging
import sekigae/submodule

let configPaths = [
  ".sekigae.json",
  getConfigDir() & "/sekigae/config.json"
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
  let loggerHandler = newConsoleLogger(lvlInfo, fmtStr = "$datetime [$levelname]$appname:")
  addHandler(loggerHandler)

  # 設定ファイルがあれば読み込む
  for configPath in configPaths:
    if existsFile(configPath):
      try:
        let jsonNode = configPath.readFile().parseJson()
        let config = to(jsonNode, Config)
        sheets = config.sheets
        ids = config.ids
        break
      except:
        error &"設定ファイル({configPath})の読み込みに失敗しました。書式を確認してください。"
        quit 1

  let maxIdLen = ids.mapIt(it.len).max

  randomize()
  ids.shuffle()

  let newSheets = sheets.makeSheets(ids)
  for sheet in newSheets:
    let line = sheet.mapIt("| " & it.align(maxIdLen) & " ").join()
    echo line, "|"
