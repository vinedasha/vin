local f = io.open(`res.txt`, `r`)
local s = f:read(`*a`)
f:close()
--rtt min/avg/max/mdev = 12.424.12.882/13.431/0.472 ms
--print(s)
local _, _, a, b, c, d = s:find("(%d+.%d)/(%d+.%d)/(%d+.%d)/(%d+.%d)")
io.write(string.format(`%.0f`, tonumber(b)))
