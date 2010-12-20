//
//  Effect.m
//  TextGame
//
//  Created by Vojto on 4.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Effect.h"


@implementation Effect

@synthesize message, item;

- (id) initWithItem:(Item *)anItem {
	if (self = [super init]) {
		self.item = anItem;
	}
	
	return self;
}

- (void) apply {
	
}

@end
