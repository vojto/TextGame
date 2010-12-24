//
//  World.h
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header World.h
	@discussion This header describes class World.
*/

#import "Backpack.h"
#import "Containable.h"
#import "Room.h"

/*!
	This class represents Game World, which holds references
	to rooms, objects, and so on.
	Also, code that takes care of first initialization of world
	is in this class.
*/
@interface World : NSObject {
	NSMutableArray *rooms;
	Room *currentRoom;
	NSMutableArray *items;
}

/*!
	Reference to current room.
*/
@property (assign) Room *currentRoom;

/*!
	Method that contains code for initialization of world.
*/
- (void) prepareWorld;

@end
