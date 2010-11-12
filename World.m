//
//  World.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "World.h"

@implementation World

@synthesize currentRoom;

- (id) init {
	if (self = [super init]) {
		// World Map
		Room *forest = [[Room alloc] init];
		[forest setName:@"Forest"];
		[forest setDescription:@"You see beautiful forest everywhere you look ..."];
		[rooms addObject:forest];
		
		Room *city = [[Room alloc] init];
		[city setName:@"City"];
		[city setDescription:@"You feel the glory of the city ..."];
		[rooms addObject:city];
		
		Room *river = [[Room alloc] init];
		[river setName:@"River"];
		[river setDescription:@"You're at the river."];
		
		[forest setNorthExit:city];
		[forest setSouthExit:river];
		
		// Current Room
		currentRoom = forest;
		
	}
	return self;
}

@end
