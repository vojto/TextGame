//
//  NPC.m
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NPC.h"
#import "NPCInteraction.h"
#import "Game.h"
#import "TextInterface.h"


@implementation NPC

@synthesize name, defaultMessage, isHostile;

- (id) init {
	if (self = [super init]) {
		interactions = [[NSMutableArray alloc] init];
		isHostile = NO;
	}
	
	return self;
}

- (void) addInteraction:(NPCInteraction *)interaction {
	interaction.npc = self;
	[interactions addObject:interaction];
}

- (void) interact {
	NPCInteraction *interaction;
	Game *game					= [Game sharedGame];
	TextInterface *interface	= [game textInterface];
		
	if ([interactions count] == 0) {
		[interface sendMessage:defaultMessage];
		return;
	}
	
	interaction = [interactions objectAtIndex:0];
	if ([interaction execute]) {
		[interactions removeObjectAtIndex:0];
	}
}

@end
