-- Temporary default subject - reprogram later
defaultSubject="tony"
function inputParser (text)
   local otext=text
   local stage=1
   local subject=""
   local action=""
   local params={}
   local continue=0
   local char=""
   if not text:find(".",1,1) then
      text="i."..text
   end
   for i=1,#text do
      continue=0
      char=text:sub(i,i)
      if stage==1 then
         if char=="." then
            stage=2
            continue=1
            if subject=="i" then
               subject=defaultSubject
            end
         else
            subject=subject..char
         end
      end
      if stage==2 and continue~=1 then
         if char=="(" then
            stage=3
            if #text==i then
              break
            end
            if text:sub(i+1,i+1) == ")" then
              break
            end
            table.insert(params,"")
            continue=1
         else
            action=action..char
         end
      end
      if stage==3 and continue~=1 then
         if char==")" then
            break
         end
         if char=="," then
            table.insert(params,"")
         else
            params[#params]=params[#params]..char
         end
      end
   end
   return text,subject,action,params
end
