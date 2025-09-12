local s = "2002-10-10-10"

-- nur erste Zahl
local year = string.match(s, "%d+")
print(year)

-- mehrere Gruppen auf einmal
local y, m, d, h = string.match(s, "(%d+)%-(%d+)%-(%d+)%-(%d+)")
print(y, m, d, h)


-- nil und false => false
-- not


local mylib = require "mylib"

mylib.myf()
mylib.myf()
