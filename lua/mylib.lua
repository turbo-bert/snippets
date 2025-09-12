local M = {}

function M.myf()
    print("from mylib the myf()")
end

return M



-- USAGE
--
-- local mylib = require "mylib"
-- 
-- mylib.myf()
-- mylib.myf()
