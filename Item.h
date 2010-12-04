//
//  Item.h
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Itemlike.h"
#import "Effect.h"

@interface Item : NSObject <Itemlike> {

NSString *name;
NSString *description;
NSMutableArray *effects;

}

@property (retain) NSString *name;
@property (retain) NSString *description;
@property (retain) NSMutableArray *effects;

- (void) use;
- (void) addEffect:(Effect *)effect;

@end
