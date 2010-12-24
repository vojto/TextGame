//
//  NPC.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*!
	@header NPC.h
	@discussion This header file describes class NPC
*/

#import "NPCInteraction.h"

@class NPCInteraction;

/*!
	This class represents non-playing character in game.
	Player can interact with NPCs using interactions.
*/
@interface NPC : NSObject {

	BOOL isHostile;
	NSString *name;
	NSString *defaultMessage;
	NSMutableArray *interactions;

}

/*!
	Indicating wether NPC is hostile. I'm not sure if this one
	should be here, because NPC itself cannot be hostile. What can
	be hostile is subclass of NPC, called HostileNPC. 
	The problem is, when I wanna find out if NPC is hostile I just wanted
	to have simple property to check against, so I added this one.
	Now initializer sets hostileness of NPC.
*/
@property BOOL isHostile;
/*!
	Name of NPC
*/
@property (retain) NSString *name;
/*!
	Default message: player will see this when there are no interactions
	left.
*/
@property (retain) NSString *defaultMessage;
/*!
	Array of interactions
*/
@property (retain) NSMutableArray *interactions;

/*!
	Adds an interaction to NPC
	@param interaction Interaction
*/
- (void) addInteraction:(NPCInteraction *)interaction;
/*!
	Executes interaction specified by instance variable nextInteraction.
	At first, it's zero, so it tries to execute first interaction. If it doesn't
	fail, interaction's message is printed and nextInteraction number is incremented.
	If it fails, failMessage is printed, and nextInteraction stays the same.
	Also, interactions are removed from the array upon successful execution. When
	there are no interactions left, defaultMessage is printed.
*/
- (void) interact;

@end
