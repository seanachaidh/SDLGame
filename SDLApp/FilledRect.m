//
//  FilledRect.m
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 14/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import "FilledRect.h"

@implementation FilledRect

+ (id) initWithRect: (SDL_Rect) rect {
    FilledRect* retval = [[FilledRect alloc] init];
    if(retval) {
        retval.filled = NO;
        retval.myrect = rect;
    }
    return retval;
}

@end

@implementation FilledRectList
- (bool) hasRectFilled: (SDL_Rect) rect{
    
    for(FilledRect* x in [self mylist]) {
        SDL_Rect currentRect = [x myrect];
        if(currentRect.x == rect.x && currentRect.y == rect.y && [x filled]) {
            return YES;
        }
    }
    
    return NO;
}

+ initWithWidth: (int) width andHeight: (int) height andRadius: (int) radius {
    FilledRectList *retval;
    retval = [[FilledRectList alloc] init];
    [retval setRadius:radius];
    
    retval.mylist = [NSMutableArray array];
    int rect_width = (radius*2) + 1, rect_height = (radius*2) + 1;
    
    int start_x = radius; int start_y = radius;
    int end_x = width - radius; int end_y = height - radius;
    int step = (radius * 2);
    
    int i, j;
    for(i = start_x; i <= end_x; i += step) {
        for(j = start_y; j <= end_y; j += step) {
            SDL_Rect tmp_rect;
            int tmp_rect_x = i - radius;
            int tmp_rect_y = j - radius;
            
            tmp_rect.h = rect_height;
            tmp_rect.w = rect_width;
            tmp_rect.x = tmp_rect_x;
            tmp_rect.y = tmp_rect_y;
            
            [retval.mylist addObject: [FilledRect initWithRect:tmp_rect]];
        }
    }
    
    return retval;
}
@end
