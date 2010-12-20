//
//  NPC.h
//  TextGame
//
//  Created by Vojto on 3.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NPC.h"

@interface HostileNPC : NPC {

	NSInteger power;
	NSMutableArray *carriedItems;

}

@property NSInteger power;
@property (retain) NSMutableArray *carriedItems;

- (void) attack;

@end
