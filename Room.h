//
//  Room.h
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header Room.h
	@discussion This header file describes class Room.
*/

#import "Item.h"
#import "NPC.h"

/*!
	This class represents one Room in World. 
*/
@interface Room : NSObject {
	NSString *name;
	NSString *description;
	Room *northExit;
	Room *southExit;
	Room *westExit;
	Room *eastExit;
	NSMutableArray *items;
	NSMutableArray *npcs;
}

/*!
	Name of the room
*/
@property (retain) NSString *name;
/*!
	Description of the room
*/
@property (retain) NSString *description;
/*!
	Reference to another Room which represents north exit.
*/
@property (retain) Room *northExit;
/*!
	Reference to another Room which represents south exit.
*/
@property (retain) Room *southExit;
/*!
	Reference to another Room which represents west exit.
*/
@property (retain) Room *westExit;
/*!
	Reference to another Room which represents east exit.
*/
@property (retain) Room *eastExit;
/*!
	Array of items contained in this room.
*/
@property (retain) NSMutableArray *items;
/*!
	Array of non-playing characters in this room.
*/
@property (retain) NSMutableArray *npcs;

/*!
	Looks for item with some name
	@param name Name of the item
	@return Item or nil
*/
- (Item *) itemWithName:(NSString *)name;
/*!
	Removes item with some name from the room
	@param name Name of the item
*/
- (void) removeItem:(Item *)item;
/*!
	Looks fro NPC with some name
	@param name Name of NPC
	@return NPC
*/
- (NPC *) npcWithName:(NSString *)name;

/*!
	Sets north exit to room
	@param room Room
	param isOneWay If set to NO, opposite exit will be created too.
*/
- (void) setNorthExit:(Room *)room oneWay:(BOOL)isOneWay;
/*!
	Sets south exit to room
	@param room Room
	param isOneWay If set to NO, opposite exit will be created too.
*/
- (void) setSouthExit:(Room *)room oneWay:(BOOL)isOneWay;
/*!
	Sets west exit to room
	@param room Room
	param isOneWay If set to NO, opposite exit will be created too.
*/
- (void) setWestExit:(Room *)room oneWay:(BOOL)isOneWay;
/*!
	Sets east exit to room
	@param room Room
	param isOneWay If set to NO, opposite exit will be created too.
*/
- (void) setEastExit:(Room *)room oneWay:(BOOL)isOneWay;

@end
