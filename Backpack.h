//
//  Backpack.h
//  TextGame
//
//  Created by Vojto on 29.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Backpacklike.h"


@interface Backpack : NSObject <Backpacklike> {
	NSInteger capacity;
	NSMutableArray *items;
}

@property (nonatomic) NSInteger capacity;
@property (retain, nonatomic) NSMutableArray *items;

- (BOOL) hasItem:(Item *)item;

@end
