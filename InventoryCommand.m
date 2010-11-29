//
//  InventoryCommand.m
//  TextGame
//
//  Created by Vojto on 29.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "InventoryCommand.h"
#import "Game.h"

@implementation InventoryCommand

// Lists stuff in our inventory.
- (GameState) execute {
	Backpack *backpack = [game backpack];
	TextInterface *interface = [game textInterface];
	
	[interface sendMessage:@"Things in your backpack:"];
	
	for (Item *item in [backpack.items objectEnumerator]) {
		[interface sendMessage:[item name]];
	}
	
	return GameStatePlaying;
}

@end
