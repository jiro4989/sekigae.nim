# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
include sekigae/submodule

suite "changeSheets":
  test "normal":
    check(@[@["1"], @[""]] == @[@[true], @[false]].changeSheets(@["1"]))
    check(@[@["1"], @["a", "A"]] == @[@[true], @[true, true]].changeSheets(@["1", "a","A"]))
    check(@[@["1"], @["", "a"]] == @[@[true], @[false, true]].changeSheets(@["1", "a","A"]))
    check(@[@["", ""], @["", ""]] == @[@[false, false], @[false, false]].changeSheets(@["1", "a","A"]))
