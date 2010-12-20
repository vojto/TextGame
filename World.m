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
#import "HostileNPC.h"
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
	ReplaceEffect *rustyKeyEffect = [[ReplaceEffect alloc] initWithItem:rustyKey];
	rustyKeyEffect.message = @"You stick rusty key into your locked chest ...";
	rustyKeyEffect.requirementMissingMessage = @"This key looks like it could fit into a chest or something.";
	rustyKeyEffect.requirement = lockedChest;
	rustyKeyEffect.replacement = sword;
	[rustyKey addEffect:rustyKeyEffect];
	Item *metal = [[Item alloc] init];
	metal.name = @"Metal";
	metal.description = @"A piece of metal that could be suitable for anything.";
	// NPCs
	NPC *keymaster = [[NPC alloc] init];
	keymaster.name = @"Keymaster";
	keymaster.defaultMessage = @"I make keys.";
	NPCInteraction *keymasterInteraction01 = [[NPCInteraction alloc] init];
	keymasterInteraction01.message = @"I make keys. Tell me what kind of key you need and I might be able to help you.";
	[keymaster addInteraction:keymasterInteraction01];
	NPCInteraction *keymasterInteraction02 = [[NPCInteraction alloc] init];
	[keymasterInteraction02.requiredItems addObject:lockedChest];
	keymasterInteraction02.message = @"Hm, nice chest. I could make a key for you, but I need some metal. Unfortunately all I know about is at the cemetary, guarded by skeletons. If I look at you, it's certain that these skeletons would kill you.";
	keymasterInteraction02.failureMessage = @"I don't think there's anything I can do for you right now.";
	[keymaster addInteraction:keymasterInteraction02];
	NPCInteraction *keymasterInteraction03 = [[NPCInteraction alloc] init];
	[keymasterInteraction03.requiredItems addObject:metal];
	keymasterInteraction03.takesRequiredItems = YES;
	keymasterInteraction03.failureMessage = @"Did you bring me the metal?";
	keymasterInteraction03.message = @"You got it? And you're actually alive? Unbelievable. Now let's see what can I do ...";
	[keymasterInteraction03.grantedItems addObject:rustyKey];
	[keymaster addInteraction:keymasterInteraction03];
	[city.npcs addObject:keymaster];
	// ------------------------------------------------------
	
	// ------------------------------------------------------
	// River
	Room *river = [[Room alloc] init];
	[river setName:@"River"];
	[river setDescription:@"You're at the river."];
	[river setNorthExit:forest];
	
	// ------------------------------------------------------
	// Cemetary
	Room *cemetary = [[Room alloc] init];
	[cemetary setName:@"Cemetary"];
	[cemetary setDescription:@"You shiver feeling the coldness of the dead."];
	[cemetary setEastExit:river];
	// NPCs
	HostileNPC *skeleton = [[HostileNPC alloc] init];
	skeleton.name = @"Skeleton";
	skeleton.defaultMessage = @"Darkness ...";
	skeleton.power = 10;
	[skeleton.carriedItems addObject:metal];
	[cemetary.npcs addObject:skeleton];
	
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
