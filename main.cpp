#include <raylib.h>

int main() {
    const int screenWidth = 800;
    const int screenHeight = 600;

    InitWindow(screenWidth, screenHeight, "Raylib C++ Starter Project");

    SetTargetFPS(60);

    while (!WindowShouldClose()) {
        BeginDrawing();

        ClearBackground(RAYWHITE);
        DrawText("Let's get started with Raylib and C++", 100, 100, 32, DARKGRAY);

        EndDrawing();
    }

    CloseWindow();

    return 0;
}
