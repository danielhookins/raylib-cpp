@echo off

REM  "Ensuring submodules are up to date..."
git submodule update --init --recursive

REM  "Building raylib..."
cd .\libs\raylib\src
make PLATFORM=PLATFORM_DESKTOP
cd ..\..\..

REM "Ensure build directories exist..."
if not exist ".\include" mkdir ".\include"
if not exist ".\bin" mkdir ".\bin"

REM "Copying raylib headers..."
copy .\libs\raylib\src\*.h .\include\

REM "Building game..."
g++ -o .\bin\game.exe .\src\*.cpp -I.\include -L.\libs\raylib\src -lraylib -lopengl32 -lgdi32 -lwinmm -static -std=c++11 -Wl,-allow-multiple-definition
