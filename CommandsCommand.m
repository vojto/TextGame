//
//  CommandsCommand.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommandsCommand.h"

@implementation CommandsCommand

- (GameState) execute {
	TextInterface *interface = [game textInterface];
	CommandRecognizer *recognizer = [game commandRecognizer];
	
	[interface sendMessage:[recognizer commandDescriptions]];
	
	return GameStatePlaying;
}

@end
