//
//  SaveCommand.m
//  TextGame
//
//  Created by Vojto on 22.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SaveCommand.h"
#import "Game.h"

@implementation SaveCommand

- (GameState) execute {
	[game save];

	return GameStatePlaying;
}

@end
