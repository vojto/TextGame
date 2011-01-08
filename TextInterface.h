//
//  CommandInterface.h
//  TextGame
//
//  Created by Vojto on 27.10.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/*! @header TextInterface.h
	This header describes class TextInterface
*/

#import <Foundation/Foundation.h>

/*!
	This class is used for input/output
*/
@interface TextInterface : NSObject {
}

/*!
	Sends message for user to see.
	@param message Message
*/
- (void) sendMessage: (NSString *) message;

/*!
	Synchronously reads next message. Synchronously
	means program execution is paused until a new message
	is entered.
	@return Message entered by user.
*/
- (NSString *) readMessage;

@end
