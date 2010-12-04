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

- (id) init {
	if (self = [super init]) {
		effects = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void) addEffect:(Effect *)effect {
	[effects addObject:effect];
}

- (void) use {
	Game *game = [Game sharedGame];
	TextInterface *interface = [game textInterface];
	
	if ([effects count] == 0) {
		[interface sendMessage:@"Nothing special happens."];
	}
	
	for (id effect in [effects objectEnumerator]) {
		[effect execute];
	}
}

@end
