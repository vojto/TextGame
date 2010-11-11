//
//  Room.h
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RoomExit.h"


@interface Room : NSObject {
	NSString *name;
	NSString *description;
	NSMutableArray *exits;
}

@property (retain) NSString *name;
@property (retain) NSString *description;

- (void) setRoom:(Room *)room forExit:(RoomExit)exit;

@end
