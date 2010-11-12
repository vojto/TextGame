//
//  VersionCommand.m
//  TextGame
//
//  Created by Vojto on 9.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VersionCommand.h"

@implementation VersionCommand

- (GameState) execute {
	TextInterface *interface = [game textInterface];
	[interface sendMessage:@"The Game v1.0"];
	[interface sendMessage:@"Crafted by Vojto Rinik"];
	[interface sendMessage:@"(c)2010"];
	return GameStatePlaying;
}

@end
