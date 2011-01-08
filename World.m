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
	sword.power = 5;


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
	// City Haven
	Room *cityHaven = [[Room alloc] init];
	[cityHaven setName:@"City Haven"];
	[cityHaven setDescription:@"You see lots of ships"];
	[rooms addObject:cityHaven];
	[cityHaven setSouthExit:city];
	
	
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
	
	// ------------------------------------------------------
	// Mausoleum
	Room *mausoleum = [[Room alloc] init];
	[mausoleum setName:@"Mausoleum"];
	[mausoleum setDescription:@"Dead folk everywhere around you."];
	[rooms addObject:mausoleum];
	[mausoleum setNorthExit:cemetary];
	
	// ------------------------------------------------------
	// Cave
	Room *cave = [[Room alloc] init];
	[cave setName:@"Cave"];
	[cave setDescription:@"You have fallen into a cave. It looks like there ain't no way back."];
	[rooms addObject:cave];
	[mausoleum setSouthExit:cave oneWay:YES];
	
	// ------------------------------------------------------
	// Channels
	Room *channels = [[Room alloc] init];
	[channels setName:@"Channels"];
	[channels setDescription:@"Channels in the cave"];
	[rooms addObject:channels];
	[cave setEastExit:channels];
	
	// ------------------------------------------------------
	// Tunnel
	Room *tunnel = [[Room alloc] init];
	[tunnel setName:@"Tunnel"];
	[tunnel setDescription:@"Tunnel in the cave"];
	[rooms addObject:tunnel];
	[cave setWestExit:tunnel];
	
	// ------------------------------------------------------
	// Hole
	Room *hole = [[Room alloc] init];
	[hole setName:@"Hole"];
	[hole setDescription:@"You reached the end of the cave. Oh, wait, isn't that sunlight?"];
	[rooms addObject:hole];
	[tunnel setWestExit:hole];
	
	// ------------------------------------------------------
	// Dark forest
	Room *darkForest = [[Room alloc] init];
	[darkForest setName:@"Dark Forest"];
	[darkForest setDescription:@"You climbed up and found yourself in a dark forest. Hole is nowhere to be found anymore."];
	[rooms addObject:darkForest];
	[hole setSouthExit:darkForest oneWay:YES];
	// Items
	Item *emptyVial = [[Item alloc] init];
	emptyVial.name = @"EmptyVial";
	emptyVial.description = @"Simple, empty vial";
	// NPCs
	HostileNPC *orc = [[HostileNPC alloc] init];
	orc.name = @"Orc";
	orc.defaultMessage = @"Lugbûrz-ghaara!";
	orc.power = 15;
	[orc.carriedItems addObject:emptyVial];
	[darkForest.npcs addObject:orc];
	
	// ------------------------------------------------------
	// Dark road
	Room *darkRoad = [[Room alloc] init];
	[darkRoad setName:@"Dark Road"];
	[darkRoad setDescription:@"You are walking in the forest and you found an old road. You can smell the sea."];
	[rooms addObject:darkRoad];
	[darkForest setEastExit:darkRoad];
	
	// ------------------------------------------------------
	// Dark shore
	Room *darkShore = [[Room alloc] init];
	[darkShore setName:@"Dark Shore"];
	[darkShore setDescription:@"You have reached the sea. And look! A small boat to the east."];
	[rooms addObject:darkShore];
	[darkRoad setEastExit:darkShore];
	[darkShore setEastExit:river oneWay:YES];
	
	// ------------------------------------------------------
	// Road to the Sea
	Room *roadToSea = [[Room alloc] init];
	[roadToSea setName:@"Road to sea"];
	[roadToSea setDescription:@"Road to the west where sea is"];
	[rooms addObject:roadToSea];
	[forest setWestExit:roadToSea];
	
	// ------------------------------------------------------
	// Grasslands
	Room *grasslands = [[Room alloc] init];
	[grasslands setName:@"Grasslands"];
	[grasslands setDescription:@"Sun is killing you"];
	[rooms addObject:grasslands];
	[roadToSea setWestExit:grasslands];
	
	// ------------------------------------------------------
	// Shore
	Room *shore = [[Room alloc] init];
	[shore setName:@"Sea shore"];
	[shore setDescription:@"Finally you reach the sea"];
	[rooms addObject:shore];
	[grasslands setWestExit:shore];

	// ------------------------------------------------------
	// Valley road
	Room *valleyRoad = [[Room alloc] init];
	[valleyRoad setName:@"Valley Road"];
	[valleyRoad setDescription:@"It's dark, you are on the road to the valley."];
	[rooms addObject:valleyRoad];
	[valleyRoad setWestExit:forest];
	// Items
	Item *goldDust = [[Item alloc] init];
	goldDust.name = @"GoldDust";
	goldDust.description = @"Stinking dust";
	Item *enchantedSword = [[Item alloc] init];
	enchantedSword.name = @"EnchantedSword";
	enchantedSword.description = @"Sword with moonlike shine.";
	enchantedSword.power = 100;
	Item *arcaneElixir = [[Item alloc] init];
	arcaneElixir.name = @"ArcaneElixir";
	arcaneElixir.description = @"Arcane elixir... Be careful, it might explode!";
	ReplaceEffect *elixirEffect = [[ReplaceEffect alloc] initWithItem:arcaneElixir];
	elixirEffect.message = @"You pour elixir on your sword and you are blinded by a light...";
	elixirEffect.requirementMissingMessage = @"This elixir is to be used with old weapons to bring them back to life.";
	elixirEffect.requirement = sword;
	elixirEffect.replacement = enchantedSword;
	[arcaneElixir addEffect:elixirEffect];
	// NPCs
	NPC *alchemist = [[NPC alloc] init];
	alchemist.name = @"Alchemist";
	alchemist.defaultMessage = @"Hmm... Interesting...";
	NPCInteraction *alchemistInteraction01 = [[NPCInteraction alloc] init];
	alchemistInteraction01.message = @"I will help you make elixirs.";
	[alchemist addInteraction:alchemistInteraction01];
	NPCInteraction *alchemistInteraction02 = [[NPCInteraction alloc] init];
	[alchemistInteraction02.requiredItems addObject:sword];
	alchemistInteraction02.message = @"You are a stout human, but you won't stand a chance fighting an enemy with this sword. Find an empty vial, some gold dust and I'll enchant your sword with good magic.";
	alchemistInteraction02.failureMessage = @"I don't think there's anything else I could do for you.";
	[alchemist addInteraction:alchemistInteraction02];
	NPCInteraction *alchemistInteraction03 = [[NPCInteraction alloc] init];
	[alchemistInteraction03.requiredItems addObject:emptyVial];
	[alchemistInteraction03.requiredItems addObject:goldDust];
	alchemistInteraction03.takesRequiredItems = YES;
	[alchemistInteraction03.grantedItems addObject:arcaneElixir];
	alchemistInteraction03.message = @"You got it all. Now take this elixir.";
	[alchemist addInteraction:alchemistInteraction03];
	[valleyRoad.npcs addObject:alchemist];
	
	
	// ------------------------------------------------------
	// Valley
	Room *valley = [[Room alloc] init];
	[valley setName:@"Valley"];
	[valley setDescription:@"The darkness has surrounded you. There's no way back now."];
	[rooms addObject:valley];
	[valley setWestExit:valleyRoad];
	
	// ------------------------------------------------------
	// Mountain road
	Room *mountainRoad = [[Room alloc] init];
	[mountainRoad setName:@"Mountain road"];
	[mountainRoad setDescription:@"It's getting colder, you start to see the snow"];
	[rooms addObject:mountainRoad];
	[mountainRoad setNorthExit:valley];
	
	// ------------------------------------------------------
	// Mountain
	Room *mountain = [[Room alloc] init];
	[mountain setName:@"Mountain"];
	[mountain setDescription:@"You have reached the mountain"];
	[rooms addObject:mountain];
	[mountain setNorthExit:mountainRoad];
	// Items
	[mountain.items addObject:goldDust];
	
	// ------------------------------------------------------
	// Garden
	Room *garden = [[Room alloc] init];
	[garden setName:@"Garden"];
	[garden setDescription:@"Garde of a castle or something. It looks abandoned."];
	[rooms addObject:garden];
	[garden setWestExit:mountainRoad];
	
	// ------------------------------------------------------
	// Courtyard
	Room *courtyard = [[Room alloc] init];
	[courtyard setName:@"Courtyard"];
	[courtyard setDescription:@"Standing in the courtyard, now you can see an old castle. Everything is dead."];
	[rooms addObject:courtyard];
	[courtyard setNorthExit:garden];
	
	// ------------------------------------------------------
	// Castle entrance
	Room *castleEntrance = [[Room alloc] init];
	[castleEntrance setName:@"Castle entrance"];
	[castleEntrance setDescription:@"The castle looks open and you enter it."];
	[rooms addObject:castleEntrance];
	[castleEntrance setNorthExit:courtyard];
	
	// ------------------------------------------------------
	// Hall
	Room *castleHall = [[Room alloc] init];
	[castleHall setName:@"Castle Hall"];
	[castleHall setDescription:@"You are in a huge empty hall"];
	[rooms addObject:castleHall];
	[castleHall setNorthExit:castleEntrance];
	
	// ------------------------------------------------------
	// Dining room
	Room *diningRoom = [[Room alloc] init];
	[diningRoom setName:@"Dining Room"];
	[diningRoom setDescription:@"There is a big table and lots of chairs"];
	[rooms addObject:diningRoom];
	[diningRoom setEastExit:castleHall];
	
	// ------------------------------------------------------
	// Library
	Room *library = [[Room alloc] init];
	[library setName:@"Library"];
	[library setDescription:@"Castle library"];
	[rooms addObject:library];
	[library setWestExit:castleHall];
	
	// ------------------------------------------------------
	// Balcony
	Room *balcony = [[Room alloc] init];
	[balcony setName:@"Balcony"];
	[balcony setDescription:@"Standing on the balcony, you see nothing, but endless void"];
	[rooms addObject:balcony];
	[balcony setWestExit:library];
	
	// ------------------------------------------------------
	// Secret room
	Room *secretRoom = [[Room alloc] init];
	[secretRoom setName:@"Secret Room"];
	[secretRoom setDescription:@"You are in the secret room, which you have discovered by chance"];
	[rooms addObject:secretRoom];
	[secretRoom setNorthExit:castleHall];
	
	// ------------------------------------------------------
	// Office
	Room *office = [[Room alloc] init];
	[office setName:@"Office"];
	[office setDescription:@"There's a desk and everything, looks just like an office"];
	[rooms addObject:office];
	[office setNorthExit:secretRoom];
	// NPCs
	HostileNPC *arcanist = [[HostileNPC alloc] init];
	arcanist.name = @"Arcanist";
	arcanist.defaultMessage = @"You will not defile this mysteries!";
	arcanist.power = 100;
	[office.npcs addObject:arcanist];
	
	// Current Room
	currentRoom = forest;
	

}

@end
