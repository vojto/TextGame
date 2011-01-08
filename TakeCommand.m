//
//  TakeCommand.m
//  TextGame
//
//  Created by Vojto on 29.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TakeCommand.h"
#import "Game.h"

@implementation TakeCommand

// Takes stuff from current room and puts it into 
// your backpack. 
- (GameState) execute {
	World			*world			= [game world];
	Backpack		*backpack		= [game backpack];
	Room			*room			= [world currentRoom];
	TextInterface	*textInterface	= [game textInterface];
	NSString		*itemName		= [params objectAtIndex:1];
	Item			*item;
	
	if (!itemName) {
		[textInterface sendMessage:@"What would you like to take?"];
		return GameStatePlaying;
	}
	
	item = [room itemWithName:itemName];
	
	if (item) {
		[textInterface sendMessage:[NSString stringWithFormat:@"Taking item with name %@.", [item name]]];
		
		[backpack addItem:item];
		[room removeItem:item];
	} else {
		[textInterface sendMessage:[NSString stringWithFormat:@"There's nothing like %@ in this room.", itemName]];
	}

	// Wouldn't it make sense if adding item to backpack
	// would automatically remove it from its room?
	// That would require us to think also about getting
	// location information from item. Hmm.
	
	return GameStatePlaying;
}

@end
