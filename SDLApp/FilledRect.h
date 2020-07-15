//
//  FilledRect.h
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 14/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDL2/SDL.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilledRect : NSObject

@property SDL_Rect myrect;
@property bool filled;

+ (id) initWithRect: (SDL_Rect) rect;

@end

@interface FilledRectList : NSObject

@property NSMutableArray* mylist;
@property int radius;

+ initWithWidth: (int) width andHeight: (int) height andRadius: (int) radius;
- (bool) hasRectFilled: (SDL_Rect) rect;

@end

NS_ASSUME_NONNULL_END
