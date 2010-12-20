//
//  ReplaceEffect.m
//  TextGame
//
//  Created by Vojto on 4.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ReplaceEffect.h"
#import "Game.h"
#import "Backpack.h"
#import "TextInterface.h"


@implementation ReplaceEffect

@synthesize requirement, replacement, requirementMissingMessage;

- (void) apply {
	Game *game			= [Game sharedGame];
	Backpack *backpack	= [game backpack];
	TextInterface *interface = [game textInterface];
	
	if ([backpack hasItem:requirement]) {
		[interface sendMessage:message];
		[backpack removeItem:item];
		[backpack removeItem:requirement];
		[backpack addItem:replacement];
	} else {
		[interface sendMessage:requirementMissingMessage];
	}
}

@end
