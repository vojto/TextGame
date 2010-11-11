//
//  CommandRecognizer.m
//  TextGame
//
//  Created by Vojto on 9.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommandRecognizer.h"
#import "Commandlike.h"
#import "HelpCommand.h"
#import "QuitCommand.h"
#import "UnrecognizedCommand.h"
#import "VersionCommand.h"


@implementation CommandRecognizer

@synthesize commands;

- (id) init {
	if(self = [super init]) {
		commands = [NSArray arrayWithObjects:
					[NSDictionary dictionaryWithObjectsAndKeys:
					 @"Shows help message", @"description",
					 [NSArray arrayWithObjects:@"help", nil], @"triggers",
					 @"HelpCommand", @"className",
					 nil],
					[NSDictionary dictionaryWithObjectsAndKeys:
					 @"Quits game", @"description",
					 [NSArray arrayWithObjects:@"quit", @"q", @"exit", nil], @"triggers",
					 @"QuitCommand", @"className",
					 nil],
					[NSDictionary dictionaryWithObjectsAndKeys:
					 @"Show version info", @"description",
					 [NSArray arrayWithObjects:@"version", nil], @"triggers",
					 @"VersionCommand", @"className",
					 nil],
					[NSDictionary dictionaryWithObjectsAndKeys:
					 @"List all commands", @"description",
					 [NSArray arrayWithObjects:@"commands", @"prikazy", nil], @"triggers",
					 @"CommandsCommand", @"className",
					 nil],
					nil];
	}
	return self;
}

- (id<Commandlike>) recognizeCommandForText:(NSString *) commandText {
	id<Commandlike> command;
	
	NSArray *triggers;
	NSString *className;
	Class klass;
	
	for(id commandDescription in [commands objectEnumerator]) {
		triggers = [commandDescription objectForKey:@"triggers"];
		if([triggers containsObject:commandText]) {
			className = [commandDescription objectForKey:@"className"];
			klass =	NSClassFromString(className);
			return [[klass alloc] init];
		}
	}
	
	return [[UnrecognizedCommand alloc] init];
}

- (NSString *) commandDescriptions {
	NSMutableString *descriptions = [NSMutableString stringWithString:@""];
	for(id commandDescription in [commands objectEnumerator]) {
		[descriptions appendString:@"* "];
		NSArray *triggers = [commandDescription objectForKey:@"triggers"];
		[descriptions appendString:[triggers componentsJoinedByString:@", "]];
		[descriptions appendString:@"\n  "];
		[descriptions appendString:[commandDescription objectForKey:@"description"]];
		[descriptions appendString:@"\n"];
	}
	
	return (NSString *) descriptions;
}

@end
