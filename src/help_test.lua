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
if not help then
  require "help"
end
describe("Help",function()
  it("should return {_(\"Please see http://iggyvolz.github.io/iMagine/documentation.html for help\"),_(\"NOTE: still in development so this documentation is likely irrelevant\")}",function()
    assert.are.same({_("Please see http://iggyvolz.github.io/iMagine/documentation.html for help"),_("NOTE: still in development so this documentation is likely irrelevant")},help())
  end)
end)
