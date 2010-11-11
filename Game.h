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

@interface Game : NSObject <Gamelike> {
	TextInterface *commandInterface;
	GameState gameState;
	CommandRecognizer *commandRecognizer;
}
@property (retain) TextInterface *textInterface;
@property (retain) CommandRecognizer *commandRecognizer;

- (void) readCommand;

@end
