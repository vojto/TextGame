//
//  HostileNPC.m
//  TextGame
//
//  Created by Vojto on 20.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HostileNPC.h"
#import "Game.h"


@implementation HostileNPC

@synthesize power, carriedItems;

- (id) init {
	if (self = [super init]) {
		carriedItems = [[NSMutableArray alloc] init];
		isHostile = YES;
	}
	return self;
}

- (void) attack {
	Game *game					= [Game sharedGame];
	TextInterface *interface	= [game textInterface];
	Backpack *backpack			= [game backpack];
	
	NSInteger playerPower = game.player.power;
	if (power > playerPower) {
		[interface sendMessage:[NSString stringWithFormat:@"You fall on the ground being killed by %@ ...", name]];
		game.gameState = GameStateQuit;
	} else {
		[interface sendMessage:[NSString stringWithFormat:@"%@ drew his last breath.", name]];
		if ([carriedItems count] != 0) {
			for (id item in [carriedItems objectEnumerator]) {
				[backpack addItem:item];
			}
		}
	}
	
	
}

@end
