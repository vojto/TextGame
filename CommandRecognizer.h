//
//  CommandRecognizer.h
//  TextGame
//
//  Created by Vojto on 9.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header CommandRecognizer.h
	@discussion This header file describes class CommandRecognizer.
*/

#import "Command.h"

@class Command;

/*!
	This class is used to "recognize" commands: Parse messages
	entered by user, find out which command it is, instantiate it,
	set parameters and return that command.
*/
@interface CommandRecognizer : NSObject {
	NSArray *commands;
}

/*!
	Creates new command for entered text.
	@param text Text from user input
	@return Newly created command
*/
- (Command *)recognizeCommandForText:(NSString *) text;

/*!
	Instance variable holding array of all available
	commands.
*/
@property (retain) NSArray *commands;

@end
