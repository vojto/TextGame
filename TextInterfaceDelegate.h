//
//  TextInterfaceDelegate.h
//  TextGame
//
//  Created by Vojto on 4.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@protocol TextInterfaceDelegate

- (void) messageReceived:(NSString *) message;

@end
