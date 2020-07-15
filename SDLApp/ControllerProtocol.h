//
//  ControllerProtocol.h
//  SDLApp
//
//  Created by Pieter Van Keymeulen on 15/07/2020.
//  Copyright © 2020 Pieter Van Keymeulen. All rights reserved.
//

#ifndef ControllerProtocol_h
#define ControllerProtocol_h
@protocol ControllerProtocol
@required
- (void) moveToPoint: (double) x withy: (double) y;
@end

#endif /* ControllerProtocol_h */
