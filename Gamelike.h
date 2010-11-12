//
//  Game.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Backpacklike.h"
#import "Roomlike.h"

@protocol Commandlike;


@protocol Gamelike

-(id<Backpacklike>)getBackpack;
-(id<Roomlike>)getCurrentRoom;
-(void)play;
-(id<Commandlike>)processCommand: (NSString *) message;
-(void)setCurrentRoom;

@end
