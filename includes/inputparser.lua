-- Temporary default subject - reprogram later
defaultSubject="tony"
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
function inputParser (text)
   local otext=text
   local subject=""
   local action=""
   local params={}
   text=text:lower()
   if not text:find(".",1,1) then
      text="i."..text
   end
   if not text:find("(",1,1) then
     text=text.."()"
   end
   if not text:find(")",1,1) then
     text=text..(")")
   end
   subject=text:split(".")[1]
   if subject == "i" then
     subject=defaultSubject
   end
   action=text:split(".")[2]:split("(")[1]
   if #text:split(".")[2]:split("(")[2]:split(")")[1] == 0 then
     params={}
   else
     params=text:split(".")[2]:split("(")[2]:split(")")[1]:split(",")
   end
   return otext,subject,action,params
end
