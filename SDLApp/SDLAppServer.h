//
//  SDLAppServer.h
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 15/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import <sys/types.h>
#import <sys/types.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <stdio.h>
#import <stdlib.h>
#import <string.h>
#import <unistd.h>
#import <fcntl.h>

#import <Foundation/Foundation.h>
#import "ControllerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLAppServer : NSObject
{
    int socketFD;
    int connectFD;
    NSThread* t;
}

@property id ctrl;

+ (id) initWithController: (id<ControllerProtocol>) myctrl;
- (void) startServer;
- (void) serverHandle;

@end

NS_ASSUME_NONNULL_END
