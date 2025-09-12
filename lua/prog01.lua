-- line comment
print("okay")


local function stuff()
    print("stuff")
end

local function stufff()
    return 1,2
end


stuff()
stuff()

local z, zz = stufff()
print(z,zz)

for i=1,5 do
    print("zahl" .. i)
end

local s = "aa2025-10-20T10"
local cols = {}
for col in string.gmatch(s, "[%d]+") do
    print(col)
end



table.insert(cols, 10)
table.insert(cols, 9)

for k, v in ipairs(cols) do
    print(k, v)
end

print(#cols)



local year, month, day = s:match("^(%d+)%-(%d+)%-(%d+)T")

if year == nil then
    print("nixus")
end

local y = math.floor(tonumber(s))
print(y)
