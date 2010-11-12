//
//  Commandlike.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameState.h"

@protocol Commandlike

- (GameState)execute;

@end
