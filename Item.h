//
//  Item.h
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header Item.h
	This header file describes class Item
*/

#import "Itemlike.h"
#import "Effect.h"

@class Effect;

/*!
	This class represents Item in the world
*/
@interface Item : NSObject <Itemlike> {

NSString *name;
NSString *description;
NSMutableArray *effects;
NSInteger power;

}

/*!
	Name of the item.
*/
@property (retain) NSString *name;
/*!
	Description of the item.
*/
@property (retain) NSString *description;
/*!
	Array of effects that item causes
	@see Effect Effect
*/
@property (retain) NSMutableArray *effects;
/*!
	Power bonus for player wearing this item.
*/
@property NSInteger power;

/*!
	Uses the item causing effects to fire.
*/
- (void) use;
/*!
	Adds an effect to this item.
	@param effect Effect
*/
- (void) addEffect:(Effect *)effect;

@end
