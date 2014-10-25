require "io"
require "os"
function explode(div,str) -- credit: http://richard.warburton.it
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end
if not io.popen then
  function shell(script)
    local rand=string.char(math.random(65,90))..string.char(math.random(65,90))..string.char(math.random(65,90))..string.char(math.random(65,90))..string.char(math.random(65,90))
    os.execute(script..">tmp-"..rand)
    local toReturn=explode("\n",io.open("tmp-"..rand):read("*a"))
    os.execute("tmp-"..rand)
    table.remove(toReturn)
    return toReturn
  end
else
  function shell(script)
    local toReturn=explode("\n",io.popen(script):read("*a"))
    table.remove(toReturn)
    return toReturn
  end
end
-- TABLE SERIALIZATION COURTESY OF TONY FINCH http://lua-users.org/lists/lua-l/2009-11/msg00533.html
local szt = {}

local function char(c) return ("\\%3d"):format(c:byte()) end
local function szstr(s) return ('"%s"'):format(s:gsub("[^ !#-~]", char)) end
local function szfun(f) return "loadstring"..szstr(string.dump(f)) end
local function szany(...) return szt[type(...)](...) end

local function sztbl(t,code,var)
  for k,v in pairs(t) do
    local ks = szany(k,code,var)
    local vs = szany(v,code,var)
    code[#code+1] = ("%s[%s]=%s"):format(var[t],ks,vs)
  end
  return "{}"
end

local function memo(sz)
  return function(d,code,var)
    if var[d] == nil then
      var[1] = var[1] + 1
      var[d] = ("_[%d]"):format(var[1])
      local index = #code+1
      code[index] = "" -- reserve place during recursion
      code[index] = ("%s=%s"):format(var[d],sz(d,code,var))
    end
    return var[d]
  end
end

szt["nil"]      = tostring
szt["boolean"]  = tostring
szt["number"]   = tostring
szt["string"]   = szstr
szt["function"] = memo(szfun)
szt["table"]    = memo(sztbl)

function serialize(d)
  local code = { "local _ = {}" }
  local value = szany(d,code,{0})
  code[#code+1] = "return "..value
  if #code == 2 then return code[2]
  else return table.concat(code, "\n")
  end
end

buildvars={
  ["git-describe"]=shell("git describe --tags")
}
print(serialize(buildvars))
