files:= inputparser person
buildtests:
	@rm -f test.lua
	@$(foreach file,$(files),echo "require \"includes/$(file)\"">>test.lua;)
	@$(foreach file,$(files),cat "includes/$(file)_test.lua">>test.lua;)
runtests:
	@busted test.lua
test: buildtests runtests
