proc makeSheets*(sheets: seq[seq[bool]], ids: openarray[string]): seq[seq[string]] =
  ## makeSheets は使用可能な席リストの座席にIDをセットしたリストを返す
  var i = 0
  for sheet in sheets:
    var sheetLine: seq[string]
    for isAvailable in sheet:
      if isAvailable and i < ids.len:
        sheetLine.add(ids[i])
        inc(i)
      else:
        sheetLine.add("")
    result.add(sheetLine)
