//
//  LookCommand.m
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LookCommand.h"

@implementation LookCommand

- (GameState) execute {
	World *world = [game world];
	TextInterface *interface = [game textInterface];
	Room *currentRoom = [world currentRoom];
	
	[interface sendMessage:@"You look around ..."];
	
	// Room desription
	[interface sendMessage:[NSString stringWithFormat:@"Room: %@", [currentRoom name]]];
	[interface sendMessage:[NSString stringWithFormat:@"      %@", [currentRoom description]]];
	
	// Exits
	[interface sendMessage:@"Exits: "];
	if ([currentRoom northExit] != nil) {
		Room *exit = [currentRoom northExit];
		[interface sendMessage:[NSString stringWithFormat:@"      North: %@", [exit name]]];
	}
	if ([currentRoom southExit] != nil) {
		Room *exit = [currentRoom southExit];
		[interface sendMessage:[NSString stringWithFormat:@"      South: %@", [exit name]]];
	}
	if ([currentRoom westExit] != nil) {
		Room *exit = [currentRoom westExit];
		[interface sendMessage:[NSString stringWithFormat:@"      West: %@", [exit name]]];
	}
	if ([currentRoom eastExit] != nil) {
		Room *exit = [currentRoom eastExit];
		[interface sendMessage:[NSString stringWithFormat:@"      East: %@", [exit name]]];
	}
	
	// Items
	[interface sendMessage:@"Items: "];
	NSArray *items = [world itemsAt:currentRoom];
	for (id item in [items objectEnumerator]) {
		[interface sendMessage:[NSString stringWithFormat:@"      %@", [item name]]];
	}
	
	return GameStatePlaying;
}

@end
