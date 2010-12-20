//
//  Game.m
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#include "Game.h"
#include "Player.h"

static Game *sharedGame = nil;

@implementation Game

@synthesize textInterface, commandRecognizer, world, backpack, player, gameState;

+ (Game *) sharedGame {
	@synchronized(self) {
		if (sharedGame == nil) {
			sharedGame = [[Game alloc] init];
		}
	}
	return sharedGame;
}

- (id) init {
	if (self = [super init]) {
		commandRecognizer = [[CommandRecognizer alloc] init];
		world = [[World alloc] init];
		backpack = [[Backpack alloc] init];
		player = [[Player alloc] init];
		player.basePower = 10;
	}
	return self;
}

- (void) play {
	[textInterface sendMessage:@"Welcome to The Game!"];
	gameState = GameStatePlaying;
	while(gameState == GameStatePlaying) {
		[self readCommand];
	}
	[textInterface sendMessage:[NSString stringWithFormat:@"# Game ended with state: %d", gameState]];
}

- (void) readCommand {
	NSString *message;
	message = [textInterface readMessage];
	[self executeCommand:[self processCommand:message]];
}

- (id<Commandlike>) processCommand:(NSString *)message {
	NSArray *params = [message componentsSeparatedByString:@" "];
	NSString *commandText = [params objectAtIndex:0];
	id<Commandlike> command;
	
	command = [commandRecognizer recognizeCommandForText:commandText];
	[command setParams:params];

	return command;
}

- (void) executeCommand:(id<Commandlike>)command {
	[command setGame:self];
	gameState = [command execute];
}
 

@end
