//
//  NPCInteraction.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import "NPC.h"

@class NPC;

@interface NPCInteraction : NSObject {
	NPC *npc;
	NSString *message;
	NSString *failureMessage;
	NSMutableArray *requiredItems;
	NSMutableArray *grantedItems;
	BOOL takesRequiredItems;
}

@property (retain) NPC *npc;
@property (retain) NSString *message;
@property (retain) NSString *failureMessage;
@property (retain) NSMutableArray *requiredItems;
@property (retain) NSMutableArray *grantedItems;
@property BOOL takesRequiredItems;

- (BOOL) isAllowed;
- (BOOL) execute;
- (void) takeRequiredItems;

@end
