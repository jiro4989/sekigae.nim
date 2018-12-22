import unittest
include sekigae/submodule

test "makeSheets":
  check(@[@["1"], @[""]] == @[@[true], @[false]].makeSheets(@["1"]))
  check(@[@["1"], @["a", "A"]] == @[@[true], @[true, true]].makeSheets(@["1", "a","A"]))
  check(@[@["1"], @["", "a"]] == @[@[true], @[false, true]].makeSheets(@["1", "a","A"]))
  check(@[@["", ""], @["", ""]] == @[@[false, false], @[false, false]].makeSheets(@["1", "a","A"]))
