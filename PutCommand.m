//
//  PutCommand.m
//  TextGame
//
//  Created by Vojto on 22.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PutCommand.h"
#import "Game.h"

@implementation PutCommand

- (GameState) execute {
	World			*world			= [game world];
	Backpack		*backpack		= [game backpack];
	Room			*room			= [world currentRoom];
	TextInterface	*textInterface	= [game textInterface];
	NSString		*itemName		= [params objectAtIndex:1];
	Item			*item;
	
	if (!itemName) {
		[textInterface sendMessage:@"What would you like to put?"];
		return GameStatePlaying;
	}
	
	item = [backpack itemWithName:itemName];
	
	if (item) {
		[textInterface sendMessage:[NSString stringWithFormat:@"You put %@ down on the floor. ", [item name]]];
	} else {
		[textInterface sendMessage:[NSString stringWithFormat:@"There's nothing like %@ in your backpack.", itemName]];
	}
	
	[backpack removeItem:item];
	[room.items addObject:item];
	// Wouldn't it make sense if adding item to backpack
	// would automatically remove it from its room?
	// That would require us to think also about getting
	// location information from item. Hmm.
	
	return GameStatePlaying;
}

@end
