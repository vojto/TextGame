//
//  PBackpack.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@protocol Backpacklike

// Adding and removing items
-(BOOL)addItem:(Item *)item;
-(Item *)itemWithName:(NSString *)itemName;
-(void)removeItem:(Item *)item;
-(Item *)removeItemWithName:(NSString *)itemName;

// Sizes
-(NSInteger)capacity;
-(NSInteger)size;

@end
