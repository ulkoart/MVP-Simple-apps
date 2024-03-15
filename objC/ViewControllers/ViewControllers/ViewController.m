//
//  ViewController.m
//  ViewControllers
//
//  Created by Улько Артем Викторович on 09.11.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
	[super loadView];
	NSLog(@"loadView");
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
		NSLog(@"iPhone");
	}
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		NSLog(@"iPhone");
	}
	
	NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	NSLog(@"viewDidAppear");
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	NSLog(@"viewDidLayoutSubviews");
}



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	NSLog(@"didReceiveMemoryWarning");
}


@end
