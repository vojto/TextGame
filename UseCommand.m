//
//  GoCommand.m
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UseCommand.h"
#import "Game.h"

@implementation UseCommand

- (GameState) execute {
	TextInterface *textInterface = [game textInterface];
	Backpack *backpack = [game backpack];
	
	// Parse arguments to find item name(s)
	NSString *itemName = [params objectAtIndex:1];
	NSRange argumentRange = NSMakeRange(2, [params count]-2);
	NSArray *otherArguments = [params objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:argumentRange]];

	if (!itemName) {
		[textInterface sendMessage:@"What would you like to use?"];
		return GameStatePlaying;
	}
	
	Item *item = [backpack itemWithName:itemName];
	
	if (item) {
		[item useWithArguments:otherArguments];
	} else {
		[textInterface sendMessage:[NSString stringWithFormat:@"There's no item with name %@ in your backpack.", itemName]];
	}
	
	// So you can actually only use what's in your backpack. 
	
	// Find all items
	
	// Send use method to first item with array of other
	// items
	
	return GameStatePlaying;
}


@end
