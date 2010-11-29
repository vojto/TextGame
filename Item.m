//
//  Item.m
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import "Game.h"

@implementation Item

@synthesize name, description;

- (void) useWithArguments:(NSArray *)arguments {
	Game *game = [Game sharedGame];
	TextInterface *interface = [game textInterface];
	Backpack *backpack = [game backpack];
	
	[interface sendMessage:description];
}

@end
