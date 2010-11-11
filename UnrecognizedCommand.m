//
//  UnrecognizedCommand.m
//  TextGame
//
//  Created by Vojto on 9.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UnrecognizedCommand.h"


@implementation UnrecognizedCommand

- (GameState) execute:(id <Gamelike>)game {
	TextInterface *interface = [game textInterface];
	NSString *command = [self.params objectAtIndex:0];
	NSString *message = [NSString stringWithFormat:@"Unrecognized command: %@", command];
	[interface sendMessage:message];
	return GameStatePlaying;
}

@end
