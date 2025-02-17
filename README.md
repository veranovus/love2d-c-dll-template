# Love2D C DLL Template

Simple template for loading custom C DLLs into Love2D games.

I couldn't find any official guide on Love2D's website or anywhere on the internet for that matter, so here is my attempt at it after trying to get it to work for hours.

### Requirements

In order to use this template, you'd need:

* Zig
* MSVC
* LuaJIT

> Currently, this template only supports Windows.

## Preparation

### Compiling LuaJIT

Unfortunately, there are no official pre-compiled binaries of LuaJIT for Windows. You can use the pre-compiled binaries I provided in the `lua` folder or recreate the folder itself by compiling LuaJIT yourself, which I'd recommend doing.

If you already have MSVC, you can compile LuaJIT by following these steps:

1. Download the latest LuaJIT repository or clone it by running `git clone https://luajit.org/git/luajit.git`
2. Open an VS Developer Command Prompt from Windows Terminal.
3. `cd C:\Your\Path\To\luajit\src`
4. `.\msvcbuild.bat`

### Modifying Love2D

Afterwards, get the necessary files listed below and store them in your project folder as you wish, or just replicate the `lua` folder in the repository:

 - `lua51.dll`
 - `lua51.lib`
 - `lua.h`
 - `lauxlib.h`
 - `lualib.h`
 - `luaconf.h`

Finally, copy the `lua51.dll` into where Love2D is located on your computer.

## Compiling DLL & Running

I use [zig](https://ziglang.org/download/) for building my C projects, and I've provided a `build.zig` file in the repository, but you can use anything you wish. If you wish to use Zig, you can simply compile the DLL via this command:
```
zig build -p .
```
After the DLL has compiled, you can run the project using this command from the project folder:
```
'C:\Your\Path\To\Love2D\lovec.exe' .
```
