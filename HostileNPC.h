//
//  NPC.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*!
	@header HostileNPC.h
	@discussion This header file describes class HostileNPC
*/


#import "NPC.h"

/*!
	NPC subclass representing hostile NPC. In addition to interactions
	mechanism, it adds method attack that would kill either player or
	NPC depending on whos power is higher.
*/
@interface HostileNPC : NPC {

	NSInteger power;
	NSMutableArray *carriedItems;

}

/*!
	Power of NPC
*/
@property NSInteger power;
/*!
	Carried items, the ones that are dropped when NPC is killed.
	(I can sense a little bit of duplication towards Interactions mechanism
	but I just decided these are two different things.)
*/
@property (retain) NSMutableArray *carriedItems;

/*!
	Attacks NPC. If its power is less than player's, NPC dies and player
	is given carriedItems. Otherwise player is killed.
	@return YES if attack was successful and NPC was killed. NO, if player died.
*/
- (BOOL) attack;

@end
