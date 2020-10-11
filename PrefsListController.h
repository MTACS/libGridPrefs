@protocol TweakTableView
- (id)initWithSpecifier:(PSSpecifier *)specifier;
- (CGFloat)preferredHeightForWidth:(CGFloat)width;
@end

@interface TweakCustomCell: PSTableCell <TweakTableView>
@end

@interface TweakButton: UIButton
@property (nonatomic, retain) NSString *identifier;
@end
