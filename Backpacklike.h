//
//  PBackpack.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Itemlike.h"

@protocol Backpacklike

// Adding and removing items
-(BOOL)addItem:(id<Itemlike>)item;
-(id<Itemlike>)itemWithName:(NSString *)itemName;
-(void)removeItem:(id<Itemlike>)item;
-(id<Itemlike>)removeItemWithName:(NSString *)itemName;

// Sizes
-(NSInteger)capacity;
-(NSInteger)size;

@end
