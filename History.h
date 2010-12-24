//
//  History.h
//  TextGame
//
//  Created by Vojto on 22.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject {

	NSMutableArray *messages;

}

- (void) addMessage:(NSString *)message;

- (void) save:(NSString *)path;
- (void) load:(NSString *)path;

@end
