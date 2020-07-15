//
//  SDLAppServer.m
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 15/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#import "SDLAppServer.h"

@implementation SDLAppServer


- (void) startServer {
    t = [[NSThread alloc] initWithTarget:self selector:@selector(serverHandle:) object:nil];
    [t start];
}

- (void) serverHandle {
    //NSLog(@"Testing");
    
    char buffer[1024] = "";
    if(connectFD < 0) {
        NSLog(@"Waiting for connection");
        connectFD = accept(socketFD, NULL, NULL);
        NSLog(@"Connectie!");
    }
    read(connectFD, buffer, 1024);
    NSLog(@"bericht gelezen %d: %s", connectFD, buffer);
    
    //We verwachten een x en een y coordinaat
    NSString *message = [NSString stringWithUTF8String:buffer];
    
    if(!([message length] == 0)) {
        NSArray *arr = [message componentsSeparatedByString:@","];
        
        double x = atof([[arr objectAtIndex:0] UTF8String]);
        double y = atof([[arr objectAtIndex:1] UTF8String]);
        [_ctrl moveToPoint:x withy:y];
    }
    
}

- (id) init {
    id retval = [super init];
    
    socketFD = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(socketFD == -1) {
        NSLog(@"No socket has been created");
    }
    struct sockaddr_in sa;
    memset(&sa, 0, sizeof(sa));
    
    sa.sin_family = AF_INET;
    sa.sin_port = htons(7000);
    sa.sin_addr.s_addr = htonl(INADDR_ANY);
    
    int bindres = bind(socketFD, (struct sockaddr*) &sa, sizeof(sa));
    if(bindres == -1) {
        NSLog(@"Poort niet gebonden");
    }
    
    if(listen(socketFD, 10) == -1) {
        NSLog(@"Er wordt niet naar de socket geluisterd");
    }
    
    //non-blocking
    int flags = fcntl(socketFD, F_GETFL);
    fcntl(socketFD, F_SETFL, flags | O_NONBLOCK);
    
    connectFD = -1;
    return retval;
}

+ (id) initWithController: (id) myctrl {
    SDLAppServer* retval = [[SDLAppServer alloc] init];
    
    retval.ctrl = myctrl;
    
    return retval;
}

@end
