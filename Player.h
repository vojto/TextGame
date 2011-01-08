//
//  Player.h
//  TextGame
//
//  Created by Vojto on 20.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*!
	@header Player.h
	@discussion This header file describes class Player
*/

#import <Foundation/Foundation.h>

/*!
	This class represents Player and his attributes.
*/
@interface Player : NSObject {
	NSInteger basePower;
}

/*!
	Base power
*/
@property NSInteger basePower;

/*!
	Returns total power by summing up base power and
	additional power provided by items in backpack.
	@return Power
*/
- (NSInteger) power;

@end
