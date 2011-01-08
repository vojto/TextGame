//
//  History.m
//  TextGame
//
//  Created by Vojto on 22.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "History.h"
#import "Game.h"

@implementation History

- (id) init {
	if (self = [super init]) {
		messages = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void) addMessage:(NSString *)message {
	[messages addObject:message];
}

- (void) save:(NSString *)path {
	// NSFileHandle *file = [NSFileHandle fileHandleForUpdatingAtPath:path];
	NSFileManager *manager = [NSFileManager defaultManager];
	NSMutableString *allMessages = [NSMutableString stringWithFormat:@""];
	NSData *data;
	
	for (NSString *message in [messages objectEnumerator]) {
		[allMessages appendString:message];
		[allMessages appendString:@"\n"];
	}
	
	data =  [allMessages dataUsingEncoding:NSUTF8StringEncoding];
	[manager createFileAtPath:path contents:data attributes:nil];
	
//	if (file == nil) {
//		NSLog(@"Can't open file at path %@", path);
//	}
//	
//	[file writeData:data];
//	[file closeFile];
}

- (void) load:(NSString *)path {
	// Ok slow down here. Now we're hard-wiring this class to 
	// Game. I'm not saying it's a bad thing, we're not really 
	// going to use History with any other Game or something, but
	// remember that in the end, we're aiming for this whole 
	// Delegate principle we see all over Cocoa.
	Game *game					= [Game sharedGame];
	NSError *err;
	NSString *history	= [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
//	
	NSArray *historyMessages = [history componentsSeparatedByString:@"\n"];
	for (NSString *message in [historyMessages objectEnumerator]) {
		[game.textInterface sendMessage:[NSString stringWithFormat:@"> %@", message]];
		[game executeMessage:message];
	}
}

@end
