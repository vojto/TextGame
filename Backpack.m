//
//  Backpack.m
//  TextGame
//
//  Created by Vojto on 29.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Backpack.h"
#import "Item.h"

@implementation Backpack

@synthesize capacity, items;

- (id) init	{
	if (self = [super init]) {
		items = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (NSInteger) size {
	return [items count];
}

- (id<Itemlike>)itemWithName:(NSString *)itemName {
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

- (id<Itemlike>)removeItemWithName:(NSString *)itemName {
	id<Itemlike> item = [self itemWithName:itemName];
	[self removeItem:item];
	return item;
}

- (BOOL) addItem:(id <Itemlike>)item {
	if ([self size] <= [self capacity]) {
		[items addObject:item];
		return YES;
	} else {
		return NO;
	}

}

@end
