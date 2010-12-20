//
//  Player.h
//  TextGame
//
//  Created by Vojto on 20.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@interface Player : NSObject {
	NSInteger basePower;
}

@property NSInteger basePower;

- (NSInteger) valueForStat:(NSString *)statName;

- (NSInteger) power;

@end
