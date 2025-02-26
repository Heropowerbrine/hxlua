package;

import hxlua.Lua;
import hxlua.LuaL;
import hxlua.Types;

class Main
{
	public static function main():Void
	{
		/* version info */
		Sys.println(Lua.VERSION);

		/* initialize Lua */
		var vm:cpp.RawPointer<Lua_State> = LuaL.newstate();

		/* load Lua base libraries */
		LuaL.openlibs(vm);

		/* set some default values */
		Lua.pushinteger(vm, 10);
		Lua.setglobal(vm, "apple");
		Lua.pushinteger(vm, 20);
		Lua.setglobal(vm, "banana");
		Lua.pushinteger(vm, 30);
		Lua.setglobal(vm, "cherry");

		/* run the script */
		LuaL.dofile(vm, "script.lua");

		/* cleanup Lua */
		Lua.close(vm);
		vm = null;
	}
}
