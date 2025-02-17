#include "stdio.h"
#include "lua/include/lua.h"
#include "lua/include/lauxlib.h"

#if defined(WIN32)
#define LUA_API __declspec(dllexport)
#else
#define LUA_API
#endif

LUA_API int luaopen_lovec(lua_State *L);

static int c_add(lua_State *L) {

  double a = lua_tonumber(L, 1);
  double b = lua_tonumber(L, 2);

  double s = a + b;

  lua_pushnumber(L, s);

  return 1;
}

static const luaL_Reg func[] = {
  {"c_add", c_add},
  {NULL, NULL},
};

int luaopen_lovec(lua_State *L) {

  printf("Loaded LoveC DLL.\n");
  luaL_openlib(L, "lovec", func, 0);
  return 1;
}
