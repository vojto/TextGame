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

@synthesize name, interactions, isHostile, nextInteraction;

- (id) init {
	if (self = [super init]) {
		interactions = [[NSMutableArray alloc] init];
		nextInteraction = 0;
	}
	
	return self;
}

- (void) interact {
	NPCInteraction *interaction;
	Game *game					= [Game sharedGame];
	TextInterface *interface	= [game textInterface];
	
	if ([interactions count] == 0) {
		[interface sendMessage:@"I can't speak."];
		return;
	}
	
	interaction = [interactions objectAtIndex:nextInteraction];
	if ([interaction execute]) {
		[self progressToNextInteraction];
	}
}

- (void) progressToNextInteraction {
	nextInteraction += 1;
	if (nextInteraction > [interactions count]-1) {
		nextInteraction = 0;
	}
}

@end
