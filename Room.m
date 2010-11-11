//
//  Room.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Room.h"
#import "RoomExit.h"


@implementation Room

@synthesize name, description;

- (void) setRoom:(Room *)room forExit:(RoomExit)exit {
	[exits removeObjectAtIndex:exit];
	[exits insertObject:room atIndex:exit];
}

@end
