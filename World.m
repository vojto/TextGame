//
//  World.m
//  TextGame
//
//  Created by Vojto on 11.11.2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "World.h"
#import "Item.h"
#import "Backpack.h"
#import "NPC.h"
#import "NPCInteraction.h"
#import "ReplaceEffect.h"

@implementation World

@synthesize currentRoom;

- (id) init {
	if (self = [super init]) {
		[self prepareWorld];
	}
	return self;
}

- (void) prepareWorld {
	// ------------------------------------------------------
	// Forest
	Room *forest = [[Room alloc] init];
	[forest setName:@"Forest"];
	[forest setDescription:@"You see beautiful forest everywhere you look ..."];
	[rooms addObject:forest];
	// Items
	Item *lockedChest = [[Item alloc] init];
	lockedChest.name = @"LockedChest";
	lockedChest.description = @"This chest is locked.";
	[forest.items addObject:lockedChest];
	Item *sword = [[Item alloc] init];
	sword.name = @"Sword";
	sword.description = @"Long and heavy sword. You can hardly hold it in one hand.";


	// ------------------------------------------------------
	// City
	Room *city = [[Room alloc] init];
	// Meta
	[city setName:@"City"];
	[city setDescription:@"You feel the glory of the city ..."];
	[rooms addObject:city];
	// Exits
	[city setSouthExit:forest];
	// Items
	Item *rustyKey = [[Item alloc] init];
	rustyKey.name = @"RustyKey";
	rustyKey.description = @"Really old key.";
	ReplaceEffect *rustyKeyEffect = [[ReplaceEffect alloc] init];
	rustyKeyEffect.message = @"You stick rusty key into your locked chest ...";
	rustyKeyEffect.requirementMissingMessage = @"This key looks like it could fit into a chest or something.";
	rustyKeyEffect.requirement = lockedChest;
	rustyKeyEffect.replacement = sword;
	[rustyKey addEffect:rustyKeyEffect];
	// NPCs
	NPC *keymaster = [[NPC alloc] init];
	keymaster.name = @"Keymaster";
	keymaster.defaultMessage = @"I make keys.";
	NPCInteraction *keymasterInteraction01 = [[NPCInteraction alloc] init];
	keymasterInteraction01.message = @"I make keys. Tell me what kind of key you need and I might be able to help you.";
	[keymaster addInteraction:keymasterInteraction01];
	NPCInteraction *keymasterInteraction02 = [[NPCInteraction alloc] init];
	keymasterInteraction02.message = @"Man, that chest looks pretty old. You're lucky that I kept this really old key, I wanted to throw it the fuck away.";
	keymasterInteraction02.failureMessage = @"I don't think there's anything I can do for you right now.";
	[keymasterInteraction02.requiredItems addObject:lockedChest];
	[keymasterInteraction02.grantedItems addObject:rustyKey];
	[keymaster addInteraction:keymasterInteraction02];
	[city.npcs addObject:keymaster];
	// ------------------------------------------------------
	
	// ------------------------------------------------------
	// River
	Room *river = [[Room alloc] init];
	[river setName:@"River"];
	[river setDescription:@"You're at the river."];
	[river setNorthExit:forest];
	
	
	// Current Room
	currentRoom = forest;
	

}

- (void) addItem:(Item *)item at:(id<Containable>)container {
	NSDictionary *itemLink = [NSDictionary dictionaryWithObjectsAndKeys:item, @"item",
							  container, @"container",
							  nil];
	[items addObject:itemLink];
}

- (NSArray *) itemsAt:(id <Containable>)container {
	NSMutableArray *itemsAtContainer = [[NSMutableArray alloc] init];
	for(id itemLink in [items objectEnumerator]) {
		if ([itemLink objectForKey:@"container"] == container) {
			[itemsAtContainer addObject:[itemLink objectForKey:@"item"]];
		}
	}
	return (NSArray *) itemsAtContainer;
}

@end
