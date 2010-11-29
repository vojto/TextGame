//
//  Room.h
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import "Containable.h"

@interface Room : NSObject <Containable> {
	NSString *name;
	NSString *description;
	Room *northExit;
	Room *southExit;
	Room *westExit;
	Room *eastExit;
	NSMutableArray *items;
}

@property (retain) NSString *name;
@property (retain) NSString *description;
@property (retain) Room *northExit;
@property (retain) Room *southExit;
@property (retain) Room *westExit;
@property (retain) Room *eastExit;
@property (retain) NSMutableArray *items;

- (void) addItem:(Item *)item;
- (Item *) itemWithName:(NSString *)name;
- (void) removeItem:(Item *)item;

@end
