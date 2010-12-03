//
//  NPC.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


@interface NPC : NSObject {

	BOOL isHostile;
	NSString *name;
	NSMutableArray *interactions;
	NSInteger nextInteraction;

}

@property BOOL isHostile;
@property (retain) NSString *name;
@property (retain) NSMutableArray *interactions;
@property NSInteger nextInteraction;

- (void) interact;

@end
