//
//  World.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "World.h"
#import "Item.h"
#import "Backpack.h"

@implementation World

@synthesize currentRoom;

- (id) init {
	if (self = [super init]) {
		[self prepareWorld];
	}
	return self;
}

- (void) prepareWorld {
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
	
	// Items
	Item *lockedChest = [[Item alloc] init];
	[lockedChest setName:@"LockedChest"];
	[lockedChest setDescription:@"This chest is locked."];
	[forest addItem:lockedChest];
	
	Item *chest = [[Item alloc] init];
	[chest setName:@"Chest"];
	
	// todo: key
	
	// ReplaceEffect *chestReplace = [[ReplaceEffect alloc] init];
	// [chestReplace setReplacement:chest];
	// [lockedChest addEffect:chestReplace inCombinationWith:key];
	
}

- (void) addItem:(Item *)item at:(id<Containable>)container {
	NSDictionary *itemLink = [NSDictionary dictionaryWithObjectsAndKeys:item, @"item",
							  container, @"container",
							  nil];
	[items addObject:itemLink];
}

- (NSArray *) itemsAt:(id <Containable>)container {
	NSMutableArray *itemsAtContainer = [[NSMutableArray alloc] init];
	for(id itemLink in [items objectEnumerator]) {
		if ([itemLink objectForKey:@"container"] == container) {
			[itemsAtContainer addObject:[itemLink objectForKey:@"item"]];
		}
	}
	return (NSArray *) itemsAtContainer;
}

@end
