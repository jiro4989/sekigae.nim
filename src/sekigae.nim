import random, strformat
import sekigae/submodule

const sheets = @[
  @[false, false, true, true, false, false],
  @[true, true, true, true, true, true],
  @[true, true, true, true, true, true],
  @[true, true, true, true, true, true]
  ]

var studentIds = @[ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22" ]

if isMainModule:
  randomize()
  studentIds.shuffle()

  let newSheets = sheets.changeSheets(studentIds)
  for sheet in newSheets:
    var line: string
    for s in sheet:
      line.add(&"|{s:>4}")
    echo line, "|"
