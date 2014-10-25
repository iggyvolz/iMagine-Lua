if not describe then
  names={}
  function describe(name,fn)
    table.insert(names,name)
    local index=#names
    fn()
    table.remove(names,index)
  end
  function it(name,fn)
    table.insert(names,name)
    local index=#names
    print(table.concat(names," "))
    table.remove(names,index)
  end
  assert={
    ["are"]={
      ["same"]=function()
      end
    }
  }
end
if not person then
  require "person"
end
describe("Person",function()
  describe("with name tony",function()
    describe("with animite {\"furok\"}",function()
      describe("as a male",function()
        it("should return { [\"animite\"] = {\"furok\"}, [\"name\"] = \"tony\", [\"energy\"] = 1000, [\"isMale\"]=true, [\"shields\"] = { }, [\"actions\"] = { [\"magine\"] = magine, [\"changeto\"] = changeto, [\"getenergy\"] = getenergy, [\"version\"] = version, [\"help\"] = help }, [\"damage\"] = damage, [\"type\"] = \"Person\" }",function()
          assert.are.same(person("tony",{"furok"},true),{ ["animite"] = {"furok"}, ["name"] = "tony", ["energy"] = 1000, ["isMale"]=true, ["shields"] = { }, ["actions"] = { ["magine"] = magine, ["changeto"] = changeto, ["getenergy"] = getenergy, ["version"] = version, ["help"] = help }, ["damage"] = damage, ["type"] = "Person" })
        end)
      end)
    end)
  end)
  describe("with name edyn",function()
    describe("with animite {\"ugger\"}",function()
      describe("as a female",function()
        it("should return { [\"animite\"] = {\"ugger\"}, [\"name\"] = \"edyn\", [\"energy\"] = 1000, [\"isMale\"]=false, [\"shields\"] = { }, [\"actions\"] = { [\"magine\"] = magine, [\"changeto\"] = changeto, [\"getenergy\"] = getenergy, [\"version\"] = version, [\"help\"] = help }, [\"damage\"] = damage, [\"type\"] = \"Person\" }",function()
          assert.are.same(person("edyn",{"ugger"},false),{ ["animite"] = {"ugger"}, ["name"] = "edyn", ["energy"] = 1000, ["isMale"]=false, ["shields"] = { }, ["actions"] = { ["magine"] = magine, ["changeto"] = changeto, ["getenergy"] = getenergy, ["version"] = version, ["help"] = help }, ["damage"] = damage, ["type"] = "Person" })
        end)
      end)
    end)
  end)
  describe("with name strag",function()
    describe("with animite {\"freep\"}",function()
      describe("as a male",function()
        it("should return { [\"animite\"] = {\"freep\"}, [\"name\"] = \"strag\", [\"energy\"] = 1000, [\"isMale\"]=true, [\"shields\"] = { }, [\"actions\"] = { [\"magine\"] = magine, [\"changeto\"] = changeto, [\"getenergy\"] = getenergy, [\"version\"] = version, [\"help\"] = help }, [\"damage\"] = damage, [\"type\"] = \"Person\" }",function()
          assert.are.same(person("edyn",{"freep"},false),{ ["animite"] = {"freep"}, ["name"] = "strag", ["energy"] = 1000, ["isMale"]=true, ["shields"] = { }, ["actions"] = { ["magine"] = magine, ["changeto"] = changeto, ["getenergy"] = getenergy, ["version"] = version, ["help"] = help }, ["damage"] = damage, ["type"] = "Person" })
        end)
      end)
    end)
  end)
end)
