#import "TweakCustomCell.h"
#import "PrefsListController.h"
#import "HEX-Colors.h"

UIImage *leftIconImage;
UIImage *middleIconImage;
UIImage *rightIconImage;

@implementation TweakButton
@end


@implementation TweakCustomCell

- (id)initWithSpecifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell" specifier:specifier];
	return self;
}


- (void)didMoveToSuperview {
	[super didMoveToSuperview];


	// Icon images path, inside the resource's folder, in my case I've got Assets folder inside resource's where it store's all icon images.
	NSString *leftIconPathString = [NSString stringWithFormat:@"/Library/PreferenceBundles/YourTweakPrefs.bundle/Assets/%@.png", self.specifier.properties[@"leftIcon"]];
	NSString *middleIconPathString = [NSString stringWithFormat:@"/Library/PreferenceBundles/YourTweakPrefs.bundle/Assets/%@.png", self.specifier.properties[@"middleIcon"]];
	NSString *rightIconPathString = [NSString stringWithFormat:@"/Library/PreferenceBundles/YourTweakPrefs.bundle/Assets/%@.png", self.specifier.properties[@"rightIcon"]];

	
	// UIColor string from HEX-Colors.h
        NSString *iconTintColorString = self.specifier.properties[@"iconColor"];
        iconTintColor = colorFromHexString(iconTintColorString);

        NSString *iconShadowColorString = self.specifier.properties[@"iconShadowColor"];
        iconShadowColor = colorFromHexString(iconShadowColorString);

        NSString *fontColorString = self.specifier.properties[@"fontColor"];
        fontColor = colorFromHexString(fontColorString);

        // Float values for icon UIEdgeInsetsMake
        NSString *iconInsetString = [NSString stringWithFormat:@"%@", self.specifier.properties[@"iconInset"]];
        CGFloat iconInset = [iconInsetString floatValue];

	if ([self.specifier.properties[@"renderingMode"] isEqualToString:@"template"]) { // Check specifier properties if it's set to template then the icon image's tint color will be applied

	leftIconImage = [[UIImage imageNamed:leftIconPathString]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	middleIconImage = [[UIImage imageNamed:middleIconPathString]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	rightIconImage = [[UIImage imageNamed:rightIconPathString]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

} else if ([self.specifier.properties[@"renderingMode"] isEqualToString:@"original"]) { // Check specifier properties if it's set to template then the icon image's tint color won't be applied

leftIconImage = [[UIImage imageNamed:leftIconPathString]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
middleIconImage = [[UIImage imageNamed:middleIconPathString]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
rightIconImage = [[UIImage imageNamed:rightIconPathString]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

}  
	
	if ([self.specifier.properties[@"fontColor"] isEqualToString:@"default"]) { // Check specifier properties if default are set then it will use UIColor.labelColor as font color otherwise it will use hex color values

	fontColor = UIColor.labelColor;

}


UIStackView *stack = [[UIStackView alloc] initWithFrame:self.bounds];
stack.axis = UILayoutConstraintAxisHorizontal;
stack.alignment = UIStackViewAlignmentCenter;
stack.distribution = UIStackViewDistributionEqualSpacing;
stack.spacing = 20;
stack.translatesAutoresizingMaskIntoConstraints = false;

UIStackView *leftStack = [[UIStackView alloc] initWithFrame:CGRectMake(20, 20, 80, 120)];
leftStack.axis = UILayoutConstraintAxisVertical;
leftStack.alignment = UIStackViewAlignmentCenter;
leftStack.distribution = UIStackViewDistributionEqualSpacing;
leftStack.spacing = 15;
leftStack.translatesAutoresizingMaskIntoConstraints = false;

TweakButton *leftButton = [[TweakButton alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
leftButton.tintColor = iconTintColor;
leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
[leftButton setImage:leftIconImage forState:UIControlStateNormal]; // If you don't want to use a custom icon image then comment out this line, uncomment the code below to use SFSymbol icons, repeat the same thing for middle and right buttons also make sure to set rendering mode to template in plist if you use SFSymbol icons
// if (@available(iOS 13, *)) {
// 	[leftButton setImage:[UIImage systemImageNamed:self.specifier.properties[@"leftIcon"]] forState:UIControlStateNormal];
// }
leftButton.tag = 1;
leftButton.clipsToBounds = YES;
[leftButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
leftButton.layer.masksToBounds = NO;
leftButton.layer.shadowColor = iconShadowColor.CGColor; // Adds shadows to the left button
leftButton.layer.shadowRadius = 5;
leftButton.layer.shadowOffset = CGSizeMake(1, 1);
leftButton.layer.shadowOpacity = 0.5;
leftButton.imageEdgeInsets = UIEdgeInsetsMake(iconInset, iconInset, iconInset, iconInset); // Custom image size, I recommend this over changing cell size
leftButton.identifier = self.specifier.properties[@"leftClass"];
[leftButton addTarget:[[PrefsListController alloc] init] action:@selector(openController:) forControlEvents:UIControlEventTouchUpInside];
[leftStack addArrangedSubview:leftButton];
[leftButton.widthAnchor constraintEqualToConstant:80].active = true;
[leftButton.heightAnchor constraintEqualToConstant:80].active = true;

UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
leftLabel.text = self.specifier.properties[@"leftLabel"];
leftLabel.font = [UIFont boldSystemFontOfSize:12];
leftLabel.textColor = fontColor;
leftLabel.textAlignment = NSTextAlignmentCenter;
[leftStack addArrangedSubview:leftLabel];
[stack addArrangedSubview:leftStack];

UIStackView *middleStack = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, 80, 120)];
middleStack.axis = UILayoutConstraintAxisVertical;
middleStack.alignment = UIStackViewAlignmentCenter;
middleStack.distribution = UIStackViewDistributionEqualSpacing;
middleStack.spacing = 15;
middleStack.translatesAutoresizingMaskIntoConstraints = YES;

TweakButton *middleButton = [[TweakButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
middleButton.tintColor = iconTintColor;
middleButton.center = CGPointMake(CGRectGetMidX(self.bounds), middleButton.center.y);
middleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
middleButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
[middleButton setImage:middleIconImage forState:UIControlStateNormal];
// if (@available(iOS 13, *)) {
// 	[middleButton setImage:[UIImage systemImageNamed:self.specifier.properties[@"middleIcon"]] forState:UIControlStateNormal];
// }
middleButton.tag = 3;
middleButton.clipsToBounds = YES;
[middleButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
middleButton.layer.masksToBounds = NO;
middleButton.layer.shadowColor = iconShadowColor.CGColor; // Adds shadows to the middle button
middleButton.layer.shadowRadius = 5;
middleButton.layer.shadowOffset = CGSizeMake(1, 1);
middleButton.layer.shadowOpacity = 0.5;
middleButton.imageEdgeInsets = UIEdgeInsetsMake(iconInset, iconInset, iconInset, iconInset);
middleButton.identifier = self.specifier.properties[@"middleClass"];
[middleButton addTarget:[[PrefsListController alloc] init] action:@selector(openController:) forControlEvents:UIControlEventTouchUpInside];
[middleStack addArrangedSubview:middleButton];
[middleButton.widthAnchor constraintEqualToConstant:80].active = true;
[middleButton.heightAnchor constraintEqualToConstant:80].active = true;

UILabel *middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
middleLabel.text = self.specifier.properties[@"middleLabel"];
middleLabel.font = [UIFont boldSystemFontOfSize:12];
middleLabel.textColor = fontColor;
middleLabel.textAlignment = NSTextAlignmentCenter;
[middleStack addArrangedSubview:middleLabel];
[stack addArrangedSubview:middleStack];

UIStackView *rightStack = [[UIStackView alloc] initWithFrame:CGRectMake(0, 0, 80, 120)];
rightStack.axis = UILayoutConstraintAxisVertical;
rightStack.alignment = UIStackViewAlignmentCenter;
rightStack.distribution = UIStackViewDistributionEqualSpacing;
rightStack.spacing = 15;
rightStack.translatesAutoresizingMaskIntoConstraints = false;

TweakButton *rightButton = [[TweakButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
rightButton.tintColor = iconTintColor;
rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
rightButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
[rightButton setImage:rightIconImage forState:UIControlStateNormal];
// if (@available(iOS 13, *)) {
// 	[rightButton setImage:[UIImage systemImageNamed:self.specifier.properties[@"rightIcon"]] forState:UIControlStateNormal];
// }
rightButton.tag = 2;
rightButton.clipsToBounds = YES;
[rightButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
rightButton.layer.masksToBounds = NO;
rightButton.layer.shadowColor = iconShadowColor.CGColor; // Adds shadows to the right button
rightButton.layer.shadowRadius = 5;
rightButton.layer.shadowOffset = CGSizeMake(1, 1);
rightButton.layer.shadowOpacity = 0.5;
rightButton.imageEdgeInsets = UIEdgeInsetsMake(iconInset, iconInset, iconInset, iconInset);
rightButton.identifier = self.specifier.properties[@"rightClass"];
[rightButton addTarget:[[PrefsListController alloc] init] action:@selector(openController:) forControlEvents:UIControlEventTouchUpInside];
[rightStack addArrangedSubview:rightButton];
[rightButton.widthAnchor constraintEqualToConstant:80].active = true;
[rightButton.heightAnchor constraintEqualToConstant:80].active = true;
[stack addArrangedSubview:rightStack];

UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
rightLabel.text = self.specifier.properties[@"rightLabel"];
rightLabel.font = [UIFont boldSystemFontOfSize:12];
rightLabel.textColor = fontColor;
rightLabel.textAlignment = NSTextAlignmentCenter;
[rightStack addArrangedSubview:rightLabel];
[stack addArrangedSubview:rightStack];

[self addSubview:stack];
[stack.topAnchor constraintEqualToAnchor:self.topAnchor constant:20].active = true;
[stack.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-40].active = true;
[stack.heightAnchor constraintEqualToAnchor:self.heightAnchor constant:-40].active = true;
[stack.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:-40].active = true;
[stack.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = true;
[stack.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = true;

}
- (CGFloat)preferredHeightForWidth:(CGFloat)width {
	return 100.0;
}
@end
