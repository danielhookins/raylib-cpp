#!/bin/bash

echo "Ensuring submodules are up to date..."
git submodule update --init --recursive

echo "Building raylib..."
cd ./libs/raylib/src
make PLATFORM=PLATFORM_DESKTOP
cd ../../..

echo "Copying raylib headers..."
cp ./libs/raylib/src/raylib.h ./include
cp ./libs/raylib/src/raymath.h ./include
cp ./libs/raylib/src/rlgl.h ./include

echo "Building game..."

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    g++ -std=c++11 -o ./bin/game ./src/*.cpp libs/raylib/src/libraylib.a -I./include -lGL -lm -lpthread -ldl -lrt -lX11
fi 

# Mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    g++ -std=c++11 -o ./bin/game ./src/*.cpp libs/raylib/src/libraylib.a -I./include -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
fi

