//
//  Room.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Room.h"
#import "Item.h"

@implementation Room

@synthesize name, description, items, npcs;
@synthesize northExit, southExit, eastExit, westExit;

- (id) init {
	if(self = [super init]) {
		items = [[NSMutableArray alloc] init];
		npcs = [[NSMutableArray alloc] init];
	}
	return self;
}

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

- (Item *) itemWithName:(NSString *)itemName {
	for (Item *item in [items objectEnumerator]) {
		if ([[item name] isEqualToString:itemName]) {
			return item;
		}
	}
	return nil;
}

- (void) removeItem:(Item *)item {
	[items removeObjectIdenticalTo:item];
}

- (NPC *) npcWithName:(NSString *)npcName {
	for (NPC *npc in [npcs objectEnumerator]) {
		if ([[npc name] isEqualToString:npcName]) {
			return npc;
		}
	}
	return nil;
}

@end
