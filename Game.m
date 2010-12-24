//
//  Game.m
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Player.h"
#import "History.h"

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
		history = [[History alloc] init];
	}
	return self;
}

- (void) play {
	[textInterface sendMessage:@"Welcome to The Game!"];
	gameState = GameStatePlaying;
	while(gameState == GameStatePlaying) {
		NSLog(@"GameState = %d", gameState);
		[self readCommand];
	}
}

- (void) readCommand {
	NSString *message;
	message = [textInterface readMessage];
	[history addMessage:message];
	[self executeCommand:[self processCommand:message]];
}

- (Command *) processCommand:(NSString *)message {
	NSArray *params = [message componentsSeparatedByString:@" "];
	NSString *commandText = [params objectAtIndex:0];
	Command *command;
	
	command = [commandRecognizer recognizeCommandForText:commandText];
	[command setParams:params];

	return command;
}

- (void) executeCommand:(Command *)command {
	[command setGame:self];
	gameState = [command execute];
}
 
- (void) save {
	[history save:@"/Users/vojto/.text_game"];
}

- (void) load {
	[history load:@"/Users/vojto/.text_game"];
}

@end
