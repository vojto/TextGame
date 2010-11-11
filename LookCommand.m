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
	[interface sendMessage:[currentRoom name]];
	[interface sendMessage:[currentRoom description]];
	
	return GameStatePlaying;
}

@end
