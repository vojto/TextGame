//
//  Player.m
//  TextGame
//
//  Created by Vojto on 20.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "Game.h"
#import "Item.h"

@implementation Player

@synthesize basePower;

- (NSInteger) power {
	Game *game = [Game sharedGame];
	
	NSInteger bonusPower = 0;
	
	for(Item *item in [game.backpack.items objectEnumerator]) {
		bonusPower += item.power;
	}
		
	NSLog(@"Base power: %d, Bonus power: %d", basePower, bonusPower);
	
	return basePower + bonusPower;
}

@end