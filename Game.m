//
//  Game.m
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "Command.h"
#import "UnrecognizedCommand.h"
#import "GameState.h"
#import "CommandRecognizer.h"
#import "World.h"


@implementation Game

@synthesize textInterface, commandRecognizer, world;

- (id) init {
	if (self = [super init]) {
		commandRecognizer = [[CommandRecognizer alloc] init];
		world = [[World alloc] init];
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
	id<Commandlike> command;
	command = [self processCommand:message];
	[command setGame:self];
	gameState = [command execute];
}

- (id<Commandlike>) processCommand:(NSString *)message {
	NSArray *params = [message componentsSeparatedByString:@" "];
	NSString *commandText = [params objectAtIndex:0];
	id<Commandlike> command;
	
	command = [commandRecognizer recognizeCommandForText:commandText];
	[command setParams:params];

	return command;
}
 

@end
