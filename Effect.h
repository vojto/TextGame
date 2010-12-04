//
//  Effect.h
//  TextGame
//
//  Created by Vojto on 4.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Effect : NSObject {

NSString *message;

}

@property (retain) NSString *message;

- (void) execute;

@end
