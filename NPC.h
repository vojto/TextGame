//
//  NPC.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NPCInteraction.h"

@class NPCInteraction;

@interface NPC : NSObject {

	BOOL isHostile;
	NSString *name;
	NSString *defaultMessage;
	NSMutableArray *interactions;

}

@property BOOL isHostile;
@property (retain) NSString *name;
@property (retain) NSString *defaultMessage;
@property (retain) NSMutableArray *interactions;
@property NSInteger nextInteraction;

- (void) addInteraction:(NPCInteraction *)interaction;
- (void) interact;

@end
