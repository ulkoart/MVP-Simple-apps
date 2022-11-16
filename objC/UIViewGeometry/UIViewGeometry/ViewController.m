//
//  ViewController.m
//  UIViewGeometry
//
//  Created by Улько Артем Викторович on 10.11.2022.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* testView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
	view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
	[self.view addSubview:view1];

	UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(150, 80, 50, 250)];
	view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
	view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
	[self.view addSubview:view2];

	[self.view bringSubviewToFront:view1];
	
	self.testView = view2;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	// NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.testView.frame),  NSStringFromCGRect(self.testView.bounds));

	NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.view.frame),  NSStringFromCGRect(self.view.bounds));

	CGPoint origin = CGPointZero;
	
	origin = [self.view convertPoint:origin fromView:self.view.window];

	NSLog(@"origin = %@", NSStringFromCGPoint(origin));
	
	CGRect frame1 = self.view.frame;
	frame1.origin.y = 0;
	frame1.origin.x = CGRectGetWidth(frame1) - 100;
	frame1.size = CGSizeMake(100, 100);
	
	UIView* view3 = [[UIView alloc] initWithFrame:frame1];
	view3.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8];
	[self.view addSubview:view3];
}

@end
