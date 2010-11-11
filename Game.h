//
//  Game.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Gamelike.h"
#import "TextInterface.h"
#import "CommandRecognizer.h"
#import "World.h"

@interface Game : NSObject <Gamelike> {
	TextInterface *commandInterface;
	GameState gameState;
	CommandRecognizer *commandRecognizer;
	World *world;
}
@property (retain) TextInterface *textInterface;
@property (retain) CommandRecognizer *commandRecognizer;
@property (retain) World *world;

- (void) readCommand;

@end
