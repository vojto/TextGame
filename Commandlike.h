//
//  Commandlike.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Gamelike.h"
#import "GameState.h"

@protocol Gamelike;

@protocol Commandlike

- (GameState)execute;

@property (retain) NSArray *params;

@end
