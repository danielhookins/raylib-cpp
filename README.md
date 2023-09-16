# Raylib C++ Starter Project

## Build Game

The included script will pull down the Raylib repo (as a git submodule) and then build the Raylib library.
Once built, it will copy the headers into the project `include` directory.
Then it will build the game project linking the Raylib library and headers.
After everything is built, it will copy the `game` binary to the `bin` directory.

### Linux / MacOS

```
./build.sh
```

## Run

### Linux / MacOS

```
cd bin
./game
```

