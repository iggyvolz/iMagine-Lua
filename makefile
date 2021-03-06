files:= inputparser person dreamcreature version help
luaversion:= 5.2
luapatch:= 2
build:
	@lua utilities/build.lua>src/build.lua
buildtests:
	@rm -f test.lua
	@$(foreach file,$(files),echo "require \"src/$(file)\"">>utilities/test.lua;)
	@$(foreach file,$(files),cat "src/$(file)_test.lua">>utilities/test.lua;)
runtests:
	@busted utilities/test.lua
test: build testlua buildtests runtests
testlua:
	@wget http://www.lua.org/tests/$(luaversion)/lua-$(luaversion).$(luapatch)-tests.tar.gz
	@tar xf lua-$(luaversion).$(luapatch)-tests.tar.gz
	@bash -c "cd lua-$(luaversion).$(luapatch)-tests;lua -e\"_U=true\" all.lua"
	@unlink lua-$(luaversion).$(luapatch)-tests.tar.gz
	@rm -Rf lua-$(luaversion).$(luapatch)-tests
