//
//  NPCInteraction.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*!
	@header NPCInteraction.h
	@discussion This header file describes class NPCInteraction
*/

#import "Item.h"
#import "NPC.h"

@class NPC;

/*!
	This class represents Interaction of NPC.
	Each interaction consists of message, failureMessage,
	requiredItems and granted items.
*/
@interface NPCInteraction : NSObject {
	NPC *npc;
	NSString *message;
	NSString *failureMessage;
	NSMutableArray *requiredItems;
	NSMutableArray *grantedItems;
	BOOL takesRequiredItems;
}

/*!
	Owner NPC
*/
@property (retain) NPC *npc;
/*!
	Message
*/
@property (retain) NSString *message;
/*!
	Failure message
*/
@property (retain) NSString *failureMessage;
/*!
	Required items
	These are items that user must have in their backpack in order
	for interaction to be executed.
*/
@property (retain) NSMutableArray *requiredItems;
/*!
	Granted items
	These are items user is granted if interaction is successful.
*/
@property (retain) NSMutableArray *grantedItems;
/*!
	Boolean value indicating whether required items should be taken from
	user when interaction is successful
*/
@property BOOL takesRequiredItems;

/*!
	Returns whether interaction is allowed to be executed
	@return YES if is allowed
*/
- (BOOL) isAllowed;
/*!
	Executes interaction
	@return YES if execution was successful otherwise NO
*/
- (BOOL) execute;
/*!
	Takes required items from user's backpack
*/
- (void) takeRequiredItems;

@end
