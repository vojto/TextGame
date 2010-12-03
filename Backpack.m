//
//  Backpack.m
//  TextGame
//
//  Created by Vojto on 29.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Backpack.h"
#import "Item.h"
#import "Game.h"
#import "Backpack.h"

@implementation Backpack

@synthesize capacity, items;

- (id) init	{
	if (self = [super init]) {
		items = [[NSMutableArray alloc] init];
		capacity = 16;
	}
	
	return self;
}

- (NSInteger) size {
	return [items count];
}

- (Item *)itemWithName:(NSString *)itemName {
	for (Item *item in [items objectEnumerator]) {
		if ([[item name] isEqualToString:itemName]) {
			return item;
		}
	}
	return nil;
}

- (void)removeItem:(id <Itemlike>)item {
	[items removeObjectIdenticalTo:item];
}

- (Item *)removeItemWithName:(NSString *)itemName {
	Item * item = [self itemWithName:itemName];
	[self removeItem:item];
	return item;
}

- (BOOL) addItem:(id <Itemlike>)item {
	Game *game = [Game sharedGame];
	TextInterface *interface = [game textInterface];
	
	if ([self size] <= [self capacity]) {
		[items addObject:item];
		[interface sendMessage:[NSString stringWithFormat:@"You receive item: %@", [item name]]];
		return YES;
	} else {
		[interface sendMessage:@"No space in your backpack."];
		return NO;
	}

}

@end
