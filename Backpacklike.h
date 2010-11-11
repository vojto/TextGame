//
//  PBackpack.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Itemlike.h"


@protocol Backpacklike

// Adding and removing items
-(BOOL)add:(id<Itemlike>)item;
-(id<Itemlike>)getItemWithName:(NSString *)name;
-(id<Itemlike>)removeItemWithName:(NSString *)name;

// Sizes
-(NSInteger)getCapacity;
-(NSInteger)size;

@end
