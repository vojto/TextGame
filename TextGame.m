#import <Foundation/Foundation.h>
#import "TextInterface.h"
#import "Game.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	// Initialize new TextInterface
    TextInterface *textInterface = [[TextInterface alloc] init];
	// Initialize new Game
	Game *game = [[Game alloc] init];

	[game setTextInterface:textInterface];
	
	// Start the game
	[game play];
	
    [pool drain];
    return 0;
}
