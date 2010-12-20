//
//  Effect.h
//  TextGame
//
//  Created by Vojto on 4.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Item.h"

@class Item;

@interface Effect : NSObject {

	NSString *message;
	Item *item;

}

@property (retain) NSString *message;
@property (retain) Item *item;

- (id) initWithItem:(Item *)item;
- (void) apply;

@end
