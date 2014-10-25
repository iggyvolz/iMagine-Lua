function person(name,animite,isMale)
  return {
    ["animite"] = animite,
    ["name"] = name,
    ["energy"] = 1000,
    ["isMale"]=isMale,
    ["shields"] = {
    },
    ["actions"] = {
        ["magine"] = magine,
        ["changeto"] = changeto,
        ["getenergy"] = getenergy,
        ["version"] = version,
        ["help"] = help
    },
    ["damage"] = damage,
    ["type"] = "Person"
  }
end
