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


@implementation Game

@synthesize textInterface, commandRecognizer;

- (id) init {
	if (self = [super init]) {
		commandRecognizer = [[CommandRecognizer alloc] init];
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
	gameState = [command execute:self];
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
