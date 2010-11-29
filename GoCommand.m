//
//  GoCommand.m
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "GoCommand.h"
#import "LookCommand.h"

@implementation GoCommand

- (GameState) execute {
	World *world = [game world];
	TextInterface *interface = [game textInterface];
	Room *currentRoom = [world currentRoom];
		
	if ([params count] != 2) {
		[interface sendMessage:@"Tell me where would you like to go."];
		return GameStatePlaying;
	}
	
	NSString *direction = [params objectAtIndex:1];
	Room *targetRoom;
	
	if ([direction isEqualToString:@"north"] || [direction isEqualToString:@"n"]) {
		targetRoom = [currentRoom northExit];
	} else if ([direction isEqualToString:@"south"] || [direction isEqualToString:@"s"]) {
		targetRoom = [currentRoom southExit];
	} else if ([direction isEqualToString:@"west"] || [direction isEqualToString:@"w"]) {
		targetRoom = [currentRoom westExit];
	} else if ([direction isEqualToString:@"east"] || [direction isEqualToString:@"e"]) {
		targetRoom = [currentRoom eastExit];
	} else {
		[interface sendMessage:[NSString stringWithFormat:@"How do I get to %@?", direction]];
		return GameStatePlaying;
	}
	
	if (targetRoom == nil) {
		[interface sendMessage:@"Can't go that way."];
		return GameStatePlaying;
	}
	
	[world setCurrentRoom:targetRoom];
	[game executeCommand:[[LookCommand alloc] init]];
	
	return GameStatePlaying;
}


@end
