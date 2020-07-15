//
//  GameController.h
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 14/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import <math.h>
#import <Foundation/Foundation.h>
#import <SDL2/SDL.h>

#import "SDLAppServer.h"
#import "ControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject <ControllerProtocol>
+ initWithWindow;
- (SDL_Surface*) loadResource: (NSString*) withName;

@property SDL_Window* mainwin;
@property SDL_Surface* mainimage;
@property SDL_Surface* screen;
@property SDL_Texture* maintexture;
@property SDL_Renderer*  mainrenderer;
@property SDLAppServer* server;
@property int testint;

@property NSMutableArray* pointArray;

- (void) runEventHandle;
- (void) moveToPoint: (double) x withy: (double) y;

@end

NS_ASSUME_NONNULL_END
