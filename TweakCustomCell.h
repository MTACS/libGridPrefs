#import <UIKit/UIKit.h>

@interface TweakCustomCell ()
@end

@interface TweakButton : UIButton
@property (nonatomic, retain) NSString *identifier;
@end

@protocol TweakTableView
- (id)initWithSpecifier:(PSSpecifier *)specifier;
- (CGFloat)preferredHeightForWidth:(CGFloat)width;
@end

@interface TweakCustomCell: PSTableCell <TweakTableView>
@end
