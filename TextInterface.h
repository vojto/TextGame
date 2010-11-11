//
//  CommandInterface.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface TextInterface : NSObject {
	id delegate;
}
@property (retain) id delegate;

- (void) sendMessage: (NSString *) message;
- (NSString *) readMessage;

@end
