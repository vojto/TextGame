//
//  ReplaceEffect.h
//  TextGame
//
//  Created by Vojto on 4.12.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Effect.h"
#import "Item.h"

@interface ReplaceEffect : Effect {

Item *requirement;
Item *replacement;
NSString *requirementMissingMessage;

}

@property (retain) Item *requirement;
@property (retain) Item *replacement;
@property (retain) NSString *requirementMissingMessage;


@end
