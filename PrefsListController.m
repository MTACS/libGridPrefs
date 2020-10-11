#import "PrefsListController.h"

// Do your normal preferences stuff here //
//
//
//
//                                       //

// Add this to the end. If you prefer to use a separate .m file for your cell class, create and import a custom header as well, and add to the Makefile's files.

#define tweakTintColor [UIColor whatEverColorMacroYouWant]

@interface TweakCustomCell ()
@end

@implementation TweakCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell" specifier:specifier];
	return self;
}
- (void)didMoveToSuperview {
	[super didMoveToSuperview];
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
	leftButton.tintColor = tweakTintColor;
	leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
  	leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
	if (@available(iOS 13, *)) {
		[leftButton setImage:[UIImage systemImageNamed:self.specifier.properties[@"leftIcon"]] forState:UIControlStateNormal];
	}
	leftButton.tag = 1;
	leftButton.clipsToBounds = YES;
	[leftButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
	leftButton.layer.masksToBounds = NO;
	leftButton.layer.shadowColor = [UIColor blackColor].CGColor; // Adds shadows to the left button
	leftButton.layer.shadowRadius = 5;
	leftButton.layer.shadowOffset = CGSizeMake(1, 1);
	leftButton.layer.shadowOpacity = 0.5;
	leftButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10); // Custom image size, I recommend this over changing cell size
	leftButton.identifier = self.specifier.properties[@"leftClass"];
	[leftButton addTarget:[[LynxRootListController alloc] init] action:@selector(openController:) forControlEvents:UIControlEventTouchUpInside];
	[leftStack addArrangedSubview:leftButton];
	[leftButton.widthAnchor constraintEqualToConstant:80].active = true;
	[leftButton.heightAnchor constraintEqualToConstant:80].active = true;

	UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
	leftLabel.text = self.specifier.properties[@"leftLabel"];
	leftLabel.font = [UIFont boldSystemFontOfSize:12];
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
	middleButton.tintColor = tweakTintColor;
	middleButton.center = CGPointMake(CGRectGetMidX(self.bounds), middleButton.center.y);
	middleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
   	middleButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
	if (@available(iOS 13, *)) {
		[middleButton setImage:[UIImage systemImageNamed:self.specifier.properties[@"middleIcon"]] forState:UIControlStateNormal];
	}
	middleButton.tag = 3;
	middleButton.clipsToBounds = YES;
	[middleButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
	middleButton.layer.masksToBounds = NO;
	middleButton.layer.shadowColor = [UIColor blackColor].CGColor; // Adds shadows to the middle button
	middleButton.layer.shadowRadius = 5;
	middleButton.layer.shadowOffset = CGSizeMake(1, 1);
	middleButton.layer.shadowOpacity = 0.5;
	middleButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
	middleButton.identifier = self.specifier.properties[@"middleClass"];
	[middleButton addTarget:[[LynxRootListController alloc] init] action:@selector(openController:) forControlEvents:UIControlEventTouchUpInside];
	[middleStack addArrangedSubview:middleButton];
	[middleButton.widthAnchor constraintEqualToConstant:80].active = true;
	[middleButton.heightAnchor constraintEqualToConstant:80].active = true;

	UILabel *middleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
	middleLabel.text = self.specifier.properties[@"middleLabel"];
	middleLabel.font = [UIFont boldSystemFontOfSize:12];
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
	rightButton.tintColor = tweakTintColor;
	rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
  	rightButton.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
	if (@available(iOS 13, *)) {
		[rightButton setImage:[UIImage systemImageNamed:self.specifier.properties[@"rightIcon"]] forState:UIControlStateNormal];
	}
	rightButton.tag = 2;
	rightButton.clipsToBounds = YES;
	[rightButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
	rightButton.layer.masksToBounds = NO;
	rightButton.layer.shadowColor = [UIColor blackColor].CGColor; // Adds shadows to the right button
	rightButton.layer.shadowRadius = 5;
	rightButton.layer.shadowOffset = CGSizeMake(1, 1);
	rightButton.layer.shadowOpacity = 0.5;
	rightButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
	rightButton.identifier = self.specifier.properties[@"rightClass"];
	[rightButton addTarget:[[LynxRootListController alloc] init] action:@selector(openController:) forControlEvents:UIControlEventTouchUpInside];
	[rightStack addArrangedSubview:rightButton];
	[rightButton.widthAnchor constraintEqualToConstant:80].active = true;
	[rightButton.heightAnchor constraintEqualToConstant:80].active = true;
	[stack addArrangedSubview:rightStack];

	UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
	rightLabel.text = self.specifier.properties[@"rightLabel"];
	rightLabel.font = [UIFont boldSystemFontOfSize:12];
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
