//
//  Command.h
//  TextGame
//
//  Created by Vojto on 4.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Commandlike.h"
#import "CommandRecognizer.h"
#import "TextInterface.h"
#import "World.h"

@class Game;

@interface Command : NSObject <Commandlike> {
	Game *game;
}

@property (retain) Game *game;

@end
