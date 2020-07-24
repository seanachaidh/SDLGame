//
//  AppDelegate.m
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 14/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import "AppDelegate.h"
#import "GameController.h"

@interface AppDelegate ()
{
    GameController* controller;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    if(SDL_Init(SDL_INIT_VIDEO) != 0) {
        NSLog(@"Er ging iets mis met de initialisatie");
    } else {
        NSLog(@"Init succesvol");
    }
    
    controller = [GameController initWithWindow];
    [controller runEventHandle];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void) toggleFullscreen: (id) sender {
    NSLog(@"Full screen toggle");
}

@end
