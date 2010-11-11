//
//  CommandRecognizer.h
//  TextGame
//
//  Created by Vojto on 9.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Commandlike.h"


@interface CommandRecognizer : NSObject {
	NSArray *commands;
}

- (id<Commandlike>) recognizeCommandForText:(NSString *) text;

@property (retain) NSArray *commands;

@end
