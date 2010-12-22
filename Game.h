//
//  Game.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommandRecognizer.h"
#import "Gamelike.h"
#import "GameState.h"
#import "TextInterface.h"
#import "World.h"
#import "Backpack.h"
#import "Player.h"
#import "History.h"

@interface Game : NSObject <Gamelike> {
	TextInterface *commandInterface;
	GameState gameState;
	CommandRecognizer *commandRecognizer;
	World *world;
	Backpack *backpack;
	Player *player;
	History *history;
}
@property (retain) TextInterface *textInterface;
@property (retain) CommandRecognizer *commandRecognizer;
@property (retain) World *world;
@property (retain) Backpack *backpack;
@property (retain) Player *player;
@property GameState gameState;

+ (Game *) sharedGame;

- (void) readCommand;
- (id<Commandlike>) processCommand:(NSString *)message;
- (void) executeCommand:(id<Commandlike>)command;
- (void) save;

@end
