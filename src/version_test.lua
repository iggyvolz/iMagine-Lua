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
_G.buildvars={
  ["git"]={
    ["describe"]="",
    ["hash"]="",
    ["message"]=""
  }
}
if not version then
  require "version"
end
describe("Version",function()
  describe("directly at tag foo",function()
    buildvars.git.describe="foo"
    describe("at commit message bak",function()
      buildvars.git.message="bak"
      describe("at commit hash 1234567890123456789012345678901234567890",function()
        buildvars.git.hash="1234567890123456789012345678901234567890"
        it("should return {\"Using version foo\"}",function()
          assert.are.same({"Using version foo"},version())
        end)
      end)
    end)
  end)
  describe("456 ahead of tag bar at mini-hash 09876543",function()
    buildvars.git.describe="bar-456-09876543"
    describe("at commit message bin",function()
      buildvars.git.message="bin"
      describe("at commit hash 0987654321098765432109876543210987654321",function()
        buildvars.git.hash="0987654321098765432109876543210987654321"
        it("should return {\"Ahead of bar by 456 commits, with hash 0987654321098765432109876543210987654321 and message bin\"}",function()
          assert.are.same({"Ahead of bar by 456 commits, with hash 0987654321098765432109876543210987654321 and message bin"},version())
        end)
      end)
    end)
  end)
end)
