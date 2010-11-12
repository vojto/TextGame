//
//  QuitCommand.m
//  TextGame
//
//  Created by Vojto on 8.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "QuitCommand.h"

@implementation QuitCommand

- (GameState) execute {
	TextInterface *interface = [game textInterface];
	[interface sendMessage:@"Quitting now."];
	if([self.params count] > 1) {
		[interface sendMessage:@"By the way what's like the point of passing arguments to quit command?"];
	}
	return GameStateQuit;
}

@end
