#import "PrefsListController.h"
#import "TweakCustomCell.h" // You will need to import it

@interface PrefsListController

// Do your normal preferences stuff here //
//
//
//
//                                       //

- (void)openController:(TweakButton *)sender {
	AudioServicesPlaySystemSound(1519); // Add haptic feedback if you want
	NSString *className = sender.identifier;
	HBRootListController *controller = [[NSClassFromString(className) alloc] init]; // Use the base class of your sub prefs controller here. PSListController iirc
	[self pushController:controller];
}
@end
