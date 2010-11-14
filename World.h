//
//  World.h
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Room.h"
#import "Containable.h"

@interface World : NSObject {
	NSMutableArray *rooms;
	Room *currentRoom;
	NSMutableArray *items;
}

@property (assign) Room *currentRoom;

- (void) prepareWorld;
- (void) addItem:(Item *)item at:(id<Containable>)container;
- (NSArray *) itemsAt:(id<Containable>)container;

@end
