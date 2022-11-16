//
//  ViewController.m
//  UIViewIBOutlets
//
//  Created by Улько Артем Викторович on 16.11.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (CGFloat) randomFromZeroToOne {
	return (float)(arc4random() % 256) / 255;
}

- (UIColor*) randomColor {
	CGFloat r = [self randomFromZeroToOne];
	CGFloat g = [self randomFromZeroToOne];
	CGFloat b = [self randomFromZeroToOne];

	return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
	
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	self.view1.backgroundColor = [self randomColor];
	self.view2.backgroundColor = [self randomColor];
}

@end
