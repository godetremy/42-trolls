#include <SDL2/SDL.h>

int main()
{
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow(
        "Be polite next time!",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        498, 385,
        SDL_WINDOW_SHOWN
    );

    SDL_Surface *frame00 = SDL_LoadBMP("frames/frame00.bmp");
    SDL_Surface *frame01 = SDL_LoadBMP("frames/frame01.bmp");
    SDL_Surface *frame02 = SDL_LoadBMP("frames/frame02.bmp");
    
    for (int i = 0; i < (4 * 3); ++i) {
        SDL_Surface *currentFrame = NULL;
        if (i % 4 == 0) {
            currentFrame = frame00;
        } else if (i % 4 == 1) {
            currentFrame = frame01;
        } else if (i % 4 == 2) {
            currentFrame = frame02;
        } else if (i % 4 == 3) {
            currentFrame = frame01;
        }

        SDL_BlitSurface(currentFrame, NULL, SDL_GetWindowSurface(window), NULL);
        SDL_UpdateWindowSurface(window);
        SDL_Delay(200);
    }
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}