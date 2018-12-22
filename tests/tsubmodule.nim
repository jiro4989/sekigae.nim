import unittest
include sekigae/submodule

suite "makeSheets":
  test "正常系":
    check(@[@["1"], @[""]] == @[@[true], @[false]].makeSheets(@["1"]))
    check(@[@["1"], @["a", "A"]] == @[@[true], @[true, true]].makeSheets(@["1", "a","A"]))
    check(@[@["1"], @["", "a"]] == @[@[true], @[false, true]].makeSheets(@["1", "a","A"]))
    check(@[@["", ""], @["", ""]] == @[@[false, false], @[false, false]].makeSheets(@["1", "a","A"]))
  test "IDの数が足りない場合は空で埋まる":
    check(@[@["1", "a"], @["A", ""]] == @[@[true, true], @[true, true]].makeSheets(@["1", "a","A"]))
  test "IDリストに空配列を渡されたら全部空の座席が返る":
    check(@[@["", ""], @["", ""]] == @[@[true, true], @[true, true]].makeSheets(@[]))
