//
//  Command.h
//  TextGame
//
//  Created by Vojto on 4.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header Command.h
	@discussion This header describes class Command.
*/

#import "CommandRecognizer.h"
#import "TextInterface.h"
#import "World.h"
#import "GameState.h"

@class Game;

/*!	@class Command
	This class represents single command entered and executed
	by player and it's a controlling part of the game.
*/
	
@interface Command : NSObject {
	Game *game;
	NSArray *params;
}

/*!
	Reference to Game. This is not really needed, since Game
	is now Singleton class.
	@deprecated
*/
@property (retain) Game *game;
/*!
	Array of paramaters specified by player.
*/
@property (retain) NSArray *params;

/*!
	Executes command
	This is API for synchronous execution of commands
	and thus there's no way to change resulting GameState from outside
	of a command. 
	@return Returns new GameState
*/
- (GameState)execute;

@end
