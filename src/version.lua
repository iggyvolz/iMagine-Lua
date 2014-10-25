if buildvars == nil then
  buildvars=require "src/build"
end
if _ == nil then
  function _(str)
    return str
  end
end
function string:split(div) -- credit: http://richard.warburton.it
  if (div=='') then return false end
  local pos,arr = 0,{}
  for st,sp in function() return string.find(self,div,pos,true) end do
    table.insert(arr,string.sub(self,pos,st-1))
    pos = sp + 1
  end
  table.insert(arr,string.sub(self,pos))
  return arr
end
function version()
  local git=buildvars.git
  if not git.describe:find("-",1,1) then
    local toreturn,x=_("Using version _1_"):gsub("_1_",git.describe)
    return {toreturn}
  else
    local toreturn,x=_("Ahead of _1_ by _2_ commits, with hash _3_ and message _4_"):gsub("_1_",git.describe:split("-")[1]):gsub("_2_",git.describe:split("-")[2]):gsub("_3_",git.hash):gsub("_4_",git.message)
    return {toreturn}
  end
end
