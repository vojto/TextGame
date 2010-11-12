//
//  Room.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Room.h"

@implementation Room

@synthesize name, description;
@synthesize northExit, southExit, eastExit, westExit;

- (void) setNorthExit:(Room *)room {
	northExit = room;
	if ([room southExit] != self) {
		[room setSouthExit:self];
	}
}

- (void) setSouthExit:(Room *)room {
	southExit = room;
	if ([room northExit] != self) {
		[room setNorthExit:self];
	}
}

- (void) setWestExit:(Room *)room {
	westExit = room;
	if ([room eastExit] != self) {
		[room setEastExit:self];
	}
}

- (void) setEastExit:(Room *)room {
	eastExit = room;
	if ([room westExit] != self) {
		[room setWestExit:self];
	}
}

@end
