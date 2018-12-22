proc makeSheets*(sheets: seq[seq[bool]], ids: openarray[string]): auto =
  ## makeSheets は使用可能な席リストの座席にIDをセットしたリストを返す
  var
    arr: seq[seq[string]] = @[]
    i = 0
  for sheet in sheets:
    var sheetLine: seq[string]
    for isAvailable in sheet:
      if isAvailable:
        sheetLine.add(ids[i])
        inc(i)
      else:
        sheetLine.add("")
    arr.add(sheetLine)
  return arr

