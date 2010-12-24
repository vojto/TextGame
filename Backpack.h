//
//  Backpack.h
//  TextGame
//
//  Created by Vojto on 29.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header Backpack.h
	@discussion This header describes class Backpack
*/

#import <Foundation/Foundation.h>
#import "Item.h"

/*!
	This class represents player's Backpack
*/
@interface Backpack : NSObject {
	NSInteger capacity;
	NSMutableArray *items;
}

/*!
	Capacity of backpack
*/
@property (nonatomic) NSInteger capacity;
/*!
	Items in backpack
*/
@property (retain, nonatomic) NSMutableArray *items;

/*!
	Adds item to backpack
	@param item Item
	@return YES if item was added to backpack, NO if not
*/
-(BOOL)addItem:(Item *)item;
/*!
	Returns item in backpack with name
	@param itemName Name
	@return Item
*/
-(Item *)itemWithName:(NSString *)itemName;
/*!
	Removes item from backpack
	@param Item Item to be removed
*/
-(void)removeItem:(Item *)item;
/*!
	Removes item with name
	@param itemName Item name
*/
-(Item *)removeItemWithName:(NSString *)itemName;

@end
