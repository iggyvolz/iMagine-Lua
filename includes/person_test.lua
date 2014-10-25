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
        theperson=person("tony",{"furok"},true)
        it("should have animite be {\"furok\"}",function()
          assert.are.same(theperson.animite,{"furok"})
        end)
        it("should have name be \"tony\"",function()
          assert.are.same(theperson.name,"tony")
        end)
        it("should have energy be 1000",function()
          assert.are.same(theperson.energy,1000)
        end)
        it("should have isMale be true",function()
          assert.are.same(theperson.isMale,true)
        end)
        it("should have no shields",function()
          assert.are.same(theperson.shields,{})
        end)
        it("should have the action magine",function()
          assert.are.same(theperson.actions.magine,magine)
        end)
        it("should have the action changeto",function()
          assert.are.same(theperson.actions.changeto,changeto)
        end)
        it("should have the action getenergy",function()
          assert.are.same(theperson.actions.getenergy,getenergy)
        end)
        it("should have the action version",function()
          assert.are.same(theperson.actions.version,version)
        end)
        it("should have the action help",function()
          assert.are.same(theperson.actions.help,help)
        end)
        it("should have the function damage",function()
          assert.are.same(theperson.damage,damage)
        end)
        it("should have the type \"Person\"",function()
          assert.are.same(theperson.type,"Person")
        end)
      end)
    end)
  end)
  describe("with name edyn",function()
    describe("with animite {\"ugger\"}",function()
      describe("as a female",function()
        theperson=person("edyn",{"ugger"},false)
        it("should have animite be {\"ugger\"}",function()
          assert.are.same(theperson.animite,{"ugger"})
        end)
        it("should have name be \"edyn\"",function()
          assert.are.same(theperson.name,"edyn")
        end)
        it("should have energy be 1000",function()
          assert.are.same(theperson.energy,1000)
        end)
        it("should have isMale be false",function()
          assert.are.same(theperson.isMale,false)
        end)
        it("should have no shields",function()
          assert.are.same(theperson.shields,{})
        end)
        it("should have the action magine",function()
          assert.are.same(theperson.actions.magine,magine)
        end)
        it("should have the action changeto",function()
          assert.are.same(theperson.actions.changeto,changeto)
        end)
        it("should have the action getenergy",function()
          assert.are.same(theperson.actions.getenergy,getenergy)
        end)
        it("should have the action version",function()
          assert.are.same(theperson.actions.version,version)
        end)
        it("should have the action help",function()
          assert.are.same(theperson.actions.help,help)
        end)
        it("should have the function damage",function()
          assert.are.same(theperson.damage,damage)
        end)
        it("should have the type \"Person\"",function()
          assert.are.same(theperson.type,"Person")
        end)
      end)
    end)
  end)
  describe("with name strag",function()
    describe("with animite {\"freep\"}",function()
      describe("as a male",function()
        theperson=person("strag",{"freep"},true)
        it("should have animite be {\"freep\"}",function()
          assert.are.same(theperson.animite,{"freep"})
        end)
        it("should have name be \"strag\"",function()
          assert.are.same(theperson.name,"strag")
        end)
        it("should have energy be 1000",function()
          assert.are.same(theperson.energy,1000)
        end)
        it("should have isMale be true",function()
          assert.are.same(theperson.isMale,true)
        end)
        it("should have no shields",function()
          assert.are.same(theperson.shields,{})
        end)
        it("should have the action magine",function()
          assert.are.same(theperson.actions.magine,magine)
        end)
        it("should have the action changeto",function()
          assert.are.same(theperson.actions.changeto,changeto)
        end)
        it("should have the action getenergy",function()
          assert.are.same(theperson.actions.getenergy,getenergy)
        end)
        it("should have the action version",function()
          assert.are.same(theperson.actions.version,version)
        end)
        it("should have the action help",function()
          assert.are.same(theperson.actions.help,help)
        end)
        it("should have the function damage",function()
          assert.are.same(theperson.damage,damage)
        end)
        it("should have the type \"Person\"",function()
          assert.are.same(theperson.type,"Person")
        end)
      end)
    end)
  end)
end)
