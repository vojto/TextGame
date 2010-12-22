//
//  AttackCommand.m
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AttackCommand.h"
#import "Game.h"
#import "HostileNPC.h"


@implementation AttackCommand

- (GameState) execute {
	World *world				= [game world];
	TextInterface *interface	= [game textInterface];
	Room *room					= [world currentRoom];
	NSString *npcName			= [params objectAtIndex:1];
	NPC *npc					= [room npcWithName:npcName];
	
	if ([params count] != 2) {
		[interface sendMessage:@"Who are we gonna attack today?"];
		return GameStatePlaying;
	}
	
	
	if (!npc) {
		[interface sendMessage:[NSString stringWithFormat:@"No NPC named %@.", npcName]];
		return GameStatePlaying;
	}
	
	if ([npc isHostile] == NO) {
		[interface sendMessage:[NSString stringWithFormat:@"You can't attack %@.", npcName]];
		return GameStatePlaying;
	}
	
	if ([npc attack] == YES) { // Killed it
		return GameStatePlaying;
	} else { // Died
		return GameStateQuit;
	}
	
}

@end
