//
//  AppDelegate.h
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 14/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SDL2/SDL.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
- (void) toggleFullscreen: (id) sender;
@end

