//
//  HelpCommand.m
//  TextGame
//
//  Created by Vojto on 8.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HelpCommand.h"

@implementation HelpCommand;

@synthesize params;

- (GameState) execute:(id<Gamelike>) game {
	TextInterface *interface = [game textInterface];
	[interface sendMessage:@"The Game has you."];
	[interface sendMessage:@"Type commands to see what you can do here."];
	return GameStatePlaying;
}

@end
