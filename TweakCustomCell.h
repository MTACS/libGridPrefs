#import <UIKit/UIKit.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>

@interface TweakButton : UIButton
@property (nonatomic, retain) NSString *identifier;
@end

@protocol TweakTableView
- (id)initWithSpecifier:(PSSpecifier *)specifier;
- (CGFloat)preferredHeightForWidth:(CGFloat)width;
@end

@interface TweakCustomCell: PSTableCell <TweakTableView>
@end
