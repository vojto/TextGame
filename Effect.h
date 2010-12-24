//
//  Effect.h
//  TextGame
//
//  Created by Vojto on 4.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header Effect.h
	@discussion Header file describing class Effect
*/

#import <Cocoa/Cocoa.h>
#import "Item.h"

@class Item;

/*!
	Item effect: Abstracted parametrized behavior representing
	what happens when item is used.
*/
@interface Effect : NSObject {

	NSString *message;
	Item *item;

}

/*!
	Message for player describing what effect caused
*/
@property (retain) NSString *message;
/*!
	Reference to owner item
*/
@property (retain) Item *item;

/*!
	Designated initializer: Initializes new Effect for item.
	@param item Item
	@return Instance
*/
- (id) initWithItem:(Item *)item;
/*!
	Applies effect
*/
- (void) apply;

@end
