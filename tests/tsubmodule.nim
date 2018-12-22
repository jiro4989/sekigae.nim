import unittest
include sekigae/submodule

test "changeSheets":
  check(@[@["1"], @[""]] == @[@[true], @[false]].changeSheets(@["1"]))
  check(@[@["1"], @["a", "A"]] == @[@[true], @[true, true]].changeSheets(@["1", "a","A"]))
  check(@[@["1"], @["", "a"]] == @[@[true], @[false, true]].changeSheets(@["1", "a","A"]))
  check(@[@["", ""], @["", ""]] == @[@[false, false], @[false, false]].changeSheets(@["1", "a","A"]))
