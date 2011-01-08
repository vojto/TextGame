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

#pragma mark -
#pragma mark Exits setters and getters

- (void) setNorthExit:(Room *)room {
	[self setNorthExit:room oneWay:NO];
}

- (void) setSouthExit:(Room *)room {
	[self setSouthExit:room oneWay:NO];
}

- (void) setWestExit:(Room *)room {
	[self setWestExit:room oneWay:NO];
}

- (void) setEastExit:(Room *)room {
	[self setEastExit:room oneWay:NO];
}

- (void) setNorthExit:(Room *)room oneWay:(BOOL)isOneWay {
	northExit = room;
	if (isOneWay == NO && [room southExit] != self) {
		[room setSouthExit:self];
	}
}

- (void) setSouthExit:(Room *)room oneWay:(BOOL)isOneWay {
	southExit = room;
	if (isOneWay == NO && [room northExit] != self) {
		[room setNorthExit:self];
	}
}

- (void) setWestExit:(Room *)room oneWay:(BOOL)isOneWay {
	westExit = room;
	if (isOneWay == NO && [room eastExit] != self) {
		[room setEastExit:self];
	}
}

- (void) setEastExit:(Room *)room oneWay:(BOOL)isOneWay {
	eastExit = room;
	if (isOneWay == NO && [room westExit] != self) {
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
