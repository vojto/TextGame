//
//  TalkCommand.m
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TalkCommand.h"
#import "Game.h"
#import "NPC.h"


@implementation TalkCommand

- (GameState) execute {
	World *world				= [game world];
	TextInterface *interface	= [game textInterface];
	Room *room					= [world currentRoom];
	NSString *npcName			= [params objectAtIndex:1];
	NPC *npc					= [room npcWithName:npcName];
	
	if ([params count] != 2) {
		[interface sendMessage:@"Who would you like to talk to?"];
		return GameStatePlaying;
	}
	
	
	if (!npc) {
		[interface sendMessage:[NSString stringWithFormat:@"No NPC named %@.", npcName]];
		return GameStatePlaying;
	}
	
	[npc interact];
	return GameStatePlaying;
}

@end
