//
//  AppDelegate.m
//  Notifications
//
//  Created by Улько Артем Викторович on 09.10.2022.
//

#import "AppDelegate.h"
#import "ASGovernment.h"
#import "ASDoctor.h"

@interface AppDelegate ()

@property (strong, nonatomic) ASGovernment* government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];

	self.government = [[ASGovernment alloc] init];

	ASDoctor* doctor1 = [[ASDoctor alloc] init];
	ASDoctor* doctor2 = [[ASDoctor alloc] init];
	ASDoctor* doctor3 = [[ASDoctor alloc] init];
	ASDoctor* doctor4 = [[ASDoctor alloc] init];
	ASDoctor* doctor5 = [[ASDoctor alloc] init];

	doctor1.salary = doctor2.salary = doctor3.salary = doctor4.salary = doctor5.salary = self.government.salary;
	

	[[NSNotificationCenter defaultCenter]	addObserver: self
											selector: @selector(governmentNotification:)
											name: ASGovernmentTaxLevelDidChangeNotification
											object:nil];

	self.government.taxLevel = 5.5;
	self.government.salary = 1100;
	self.government.averagePrice = 15;
	[[self government] setPension:550];

	self.government.salary = 1050;
	self.government.salary = 1150;
	self.government.salary = 900;
	

	return YES;
}

- (void) governmentNotification:(NSNotification *) notification {
	NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
}

- (void) dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver: self];
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	// Called when a new scene session is being created.
	// Use this method to select a configuration to create the new scene with.
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
	// Called when the user discards a scene session.
	// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
