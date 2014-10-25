-- TEMPORARY
catchphrases={
  ["furok"] = "Let the fur fly!",
  ["ugger"] = "I am Ugger!",
  ["freep"] = "Whose noggin needs knockin'?"
}
function dreamcreature(name,owner)
  return {
    ["owner"] = owner,
    ["inDreamPlane"] = true,
    ["creatureName"] = name,
    ["catchPhrase"] = catchphrases[name],
    ["type"] ="DreamCreature",
    ["shields"] = {},
    ["actions"] = {
        ["tothedreamplane"] = tothedreamplane,
        ["version"] = version,
        ["help"] = help
    },
     ["damage"] = damage
   }
end
