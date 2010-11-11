//
//  World.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "World.h"
#import "Room.h"
#import "RoomExit.h"


@implementation World

@synthesize currentRoom;

- (id) init {
	if (self = [super init]) {
		// World Map
		Room *forest = [[Room alloc] init];
		[forest setName:@"Elwynn Forest"];
		[forest setDescription:@"You see beautiful forest everywhere you look ..."];
		[rooms addObject:forest];
		
		Room *city = [[Room alloc] init];
		[city setName:@"City"];
		[city setDescription:@"You feel the glory of the city ..."];
		[rooms addObject:city];
		
		[forest setRoom:city forExit:RoomExitNorth];
		
		// Current Room
		currentRoom = forest;
		
	}
	return self;
}

@end
