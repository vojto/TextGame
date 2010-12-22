//
//  LoadCommand.m
//  TextGame
//
//  Created by Vojto on 22.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LoadCommand.h"


@implementation LoadCommand

- (GameState) execute {
	[game load];
	
	return GameStatePlaying;
}

@end
