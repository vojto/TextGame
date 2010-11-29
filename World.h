//
//  World.h
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Backpack.h"
#import "Containable.h"
#import "Room.h"

@interface World : NSObject {
	NSMutableArray *rooms;
	Room *currentRoom;
	NSMutableArray *items;
}

@property (assign) Room *currentRoom;

- (void) prepareWorld;

@end
