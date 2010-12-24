//
//  Game.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010, Vojto Rinik. All rights reserved.
//

/*! @header Game.h
	@discussion This header describes class Game.
*/

#import "Command.h"
#import "CommandRecognizer.h"
#import "GameState.h"
#import "TextInterface.h"
#import "World.h"
#import "Backpack.h"
#import "Player.h"
#import "History.h"

/*! @class Game
	Singleton class representing currently running Game.
*/
@interface Game : NSObject {
	TextInterface *commandInterface;
	GameState gameState;
	CommandRecognizer *commandRecognizer;
	World *world;
	Backpack *backpack;
	Player *player;
	History *history;
}

/*!
	Reference to current text interface
*/
@property (retain) TextInterface *textInterface;
/*!
	Reference to instance of CommandRecognizer
	@see CommandRecognizer CommandRecognizer
*/
@property (retain) CommandRecognizer *commandRecognizer;
/*!
	Reference to instance of World
	@see World World
*/
@property (retain) World *world;
/*!
	Reference to instance of Backpack
	@see Backpack Backpack
*/
@property (retain) Backpack *backpack;
/*!
	Reference to instance of Player
	@see Player Player
*/
@property (retain) Player *player;
/*!
	Current Game State
	@see GameState GameState
*/
@property GameState gameState;

/*!
	Returns instance of Game or creates new.
*/
+ (Game *) sharedGame;

/*!
	Starts the game.
*/
- (void) play;

/*!
	Reads next command from TextInterface and executes it.
*/
- (void) readCommand;

/*!
	Processes NSString with command to be executed
	and executes it.
	
	@param message NSString with command
*/
- (Command *) processCommand: (NSString *) message;

/*!
	Executes Command.
*/
- (void) executeCommand:(Command *)command;

/*!
	Saves current Game to a file.
*/
- (void) save;

/*!
	Loads Game from file.
*/
- (void) load;

@end
