//
//  CommandInterface.m
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TextInterface.h"


@implementation TextInterface

@synthesize delegate;

- (void) sendMessage: (NSString *) message {
	printf("%s\n", [message UTF8String]);
}

- (NSString *) readMessage {
	char inputBuffer[200];
	NSString *input;
	fgets(inputBuffer, 200, stdin);
	if (inputBuffer[strlen(inputBuffer)-1] == '\n') {
		inputBuffer[strlen(inputBuffer)-1] = '\0';
	}
	input = [[NSString alloc] initWithUTF8String:inputBuffer];
	
	return input;
}

@end
