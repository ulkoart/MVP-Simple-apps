//
//  AppDelegate.m
//  Properties
//
//  Created by Улько Артем Викторович on 28.09.2022.
//

#import "AppDelegate.h"
#import "ASBoxer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	ASBoxer* boxer = [[ASBoxer alloc] init];
	
	/*
	boxer.name = @"Max";
	boxer.age = 25;
	boxer.height = 1.8f;
	boxer.weight = 80.0f;
	*/
	
	[boxer setName: @"Max"];
	[boxer setAge: 25];
	[boxer setHeight: 1.8f];
	[boxer setWeight: 80.0f];

	NSLog(@"name = %@", boxer.name);
	NSLog(@"name = %@", [boxer name]);
	NSLog(@"age = %ld", boxer.age);
	NSLog(@"height = %f", boxer.height);
	NSLog(@"weight = %f", boxer.weight);
	NSLog(@"age = %ld", [boxer howOldAreYou]);
	
	return YES;
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
