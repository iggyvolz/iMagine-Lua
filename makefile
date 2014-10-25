files:= inputparser person dreamcreature
luaversion:= 5.2
luapatch:= 2
buildtests:
	@rm -f test.lua
	@$(foreach file,$(files),echo "require \"includes/$(file)\"">>test.lua;)
	@$(foreach file,$(files),cat "includes/$(file)_test.lua">>test.lua;)
runtests:
	@busted test.lua
test: buildtests runtests
testlua:
	@wget http://www.lua.org/tests/$(luaversion)/lua-$(luaversion).$(luapatch)-tests.tar.gz
	@tar xf lua-$(luaversion).$(luapatch)-tests.tar.gz
	@bash -c "cd lua-$(luaversion).$(luapatch)-tests;lua -e\"_U=true\" all.lua"
	@unlink lua-$(luaversion).$(luapatch)-tests.tar.gz
	@rm -Rf lua-$(luaversion).$(luapatch)-tests
