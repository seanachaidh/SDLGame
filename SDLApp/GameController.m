//
//  GameController.m
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 14/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (SDL_Surface*) loadResource: (NSString*) withName {
    NSString* fullPath = [[NSBundle mainBundle] pathForResource:withName ofType:@"bmp"];
    SDL_Surface* retval = SDL_LoadBMP([fullPath UTF8String]);
    return retval;
}

- (SDL_Rect) createRect: (SDL_Point) atLocation withRadius: (int) radius {
    SDL_Rect retval;
    int x = atLocation.x; int y = atLocation.y;
    
    int width = (radius * 2) + 1;
    int height = width;
    int rect_x = x - radius;
    int rect_y = y - radius;
    
    retval.h = height;
    retval.w = width;
    retval.x = rect_x;
    retval.y = rect_y;
    
    return retval;
}

- (void) updateAtPoint: (SDL_Point) point {
    SDL_Rect mainrect = [self createRect:point withRadius:60]; //maak van de radius een parameter
    //SDL_Rect param[1] = {mainrect};
    SDL_RenderCopy(_mainrenderer, _maintexture, &mainrect, &mainrect);
}

- (void) drawWindow {
    SDL_RenderClear(_mainrenderer);
    //SDL_RenderCopy(_mainrenderer, _maintexture, NULL, NULL);
    
    SDL_Point mypoint;
    mypoint.x = 100;
    mypoint.y = 200;
    SDL_Rect newpoint = [self createRect:mypoint withRadius:4];
    [self updateAtPoint:mypoint];
    SDL_RenderPresent(_mainrenderer);
}

- (void) initResources {
    _mainimage = [self loadResource:@"totoro"];
    _maintexture = SDL_CreateTextureFromSurface(_mainrenderer, _mainimage);
    if(_maintexture == NULL) {
        NSLog([NSString stringWithFormat:@"Error: %s", SDL_GetError()]);
    }
}

- (void) runEventHandle {
    while(true) {
        SDL_PumpEvents();
        /*
        int mouse_x, mouse_y;
        SDL_GetMouseState(&mouse_x, &mouse_y);
        NSLog(@"Mouse at %d,%d", mouse_x, mouse_y);
        
        SDL_Point point;
        point.x = mouse_x;
        point.y = mouse_y;
        
        SDL_RenderClear(_mainrenderer);
        [self updateAtPoint:point];
        SDL_RenderPresent(_mainrenderer);
         */
        //[_server serverHandle];
        glClearColor(1.0, 0, 0, 1.0);
        glClear(GL_COLOR_BUFFER_BIT);
        
        glColor3f(1.0, 1.0, 1.0);
        glBegin(GL_QUADS);
        glVertex3f(0.2, 0.2, -0.5);
        glVertex3f(0.2, 0.4, -0.5);
        glVertex3f(0.4, 0.4, -0.5);
        glVertex3f(0.4, 0.2, -0.5);
        glEnd();
        glFlush();
        SDL_GL_SwapWindow(_mainwin);
    }
}

- (void) moveToPoint: (double) x withy: (double) y {
    SDL_Point p;
    int new_x = round(800*x);
    int new_y = round(600*y);
    
    p.x = new_x;
    p.y = new_y;
    SDL_RenderClear(_mainrenderer);
    [self updateAtPoint:p];
    SDL_RenderPresent(_mainrenderer);
}

+ (id) initWithWindow {
    GameController* retval = [[GameController alloc] init];
    if(retval) {
        retval.mainwin = SDL_CreateWindow("mainwindow", 0, 0, 800, 600, SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL);
        retval.screen = SDL_GetWindowSurface(retval.mainwin);
        retval.mainrenderer = SDL_GetRenderer(retval.mainwin);
        retval.testint = 5;
        if(retval.mainrenderer == NULL) {
            NSLog([NSString stringWithFormat:@"Error: %s", SDL_GetError()]);
        }
    }
    //SDL_SetWindowFullscreen(retval.mainwin, SDL_WINDOW_FULLSCREEN);
    retval.glCtx = SDL_GL_CreateContext(retval.mainwin);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    
    [retval initResources];
    SDL_RenderClear(retval.mainrenderer);
    //[retval drawWindow];
    retval.server = [SDLAppServer initWithController:retval]; //Circulaire referentie!
    return retval;
}

@end
