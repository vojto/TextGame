//
//  NPCInteraction.m
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NPCInteraction.h"
#import "Game.h"
#import "Backpack.h"
#import "TextInterface.h"


@implementation NPCInteraction

@synthesize npc, message, failureMessage, requiredItems, grantedItems, takesRequiredItems;

- (id) init {
	if (self = [super init]) {
		requiredItems		= [[NSMutableArray alloc] init];
		grantedItems		= [[NSMutableArray alloc] init];
		takesRequiredItems	= NO;
	}
	
	return self;
}

- (BOOL) isAllowed {
	Game *game = [Game sharedGame];
	Backpack *backpack = [game backpack];
	
	for (id requiredItem in [requiredItems objectEnumerator]) {
		if (![backpack.items containsObject:requiredItem]) {
			return NO;
		}
	}
	
	return YES;
}

- (void) takeRequiredItems {
	Game *game = [Game sharedGame];
	Backpack *backpack = [game backpack];
	
	for (id requiredItem in [requiredItems objectEnumerator]) {
		if ([backpack hasItem:requiredItem]) {
			[backpack removeItem:requiredItem];
		}
	}
}


- (BOOL) execute {
	Game *game					= [Game sharedGame];
	Backpack *backpack			= [game backpack];
	TextInterface *interface	= [game textInterface];
	
	BOOL allowed = [self isAllowed];

	if (allowed) {
		if (takesRequiredItems) {
			[self takeRequiredItems];
		}
		[interface sendMessage:message];
		if ([grantedItems count] != 0) {
			for (id item in [grantedItems objectEnumerator]) {
				[backpack addItem:item];
			}
		}
	} else {
		[interface sendMessage:failureMessage];
	}
	
	
	return allowed;
}

@end
