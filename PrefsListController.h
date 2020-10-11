#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <AudioToolbox/AudioServices.h> // If you want haptic feedback on buttons
#import <Preferences/PSTableCell.h>

@protocol TweakTableView
- (id)initWithSpecifier:(PSSpecifier *)specifier;
- (CGFloat)preferredHeightForWidth:(CGFloat)width;
@end

@interface TweakCustomCell: PSTableCell <TweakTableView>
@end

@interface TweakButton: UIButton
@property (nonatomic, retain) NSString *identifier;
@end
