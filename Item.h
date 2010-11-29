//
//  Item.h
//  TextGame
//
//  Created by Vojto on 12.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Itemlike.h"

@interface Item : NSObject <Itemlike> {

NSString *name;
NSString *description;

}

@property (retain) NSString *name;
@property (retain) NSString *description;

- (void) useWithArguments:(NSArray *)arguments;

@end
