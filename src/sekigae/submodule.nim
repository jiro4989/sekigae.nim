proc changeSheets*(sheets: seq[seq[bool]], ids: openarray[string]): auto =
  var
    arr: seq[seq[string]] = @[]
    i = 0
  for sheet in sheets:
    var x: seq[string]
    for s in sheet:
      if s:
        x.add(ids[i])
        inc(i)
      else:
        x.add("")
    arr.add(x)
  return arr

