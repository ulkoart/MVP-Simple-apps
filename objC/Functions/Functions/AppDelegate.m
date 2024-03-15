//
//  AppDelegate.m
//  Functions
//
//  Created by Улько Артем Викторович on 27.09.2022.
//

#import "AppDelegate.h"
#import "ASParentClass.h"
#import "ASChildClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	//MARK: - ASParentClass

	ASParentClass* parent = [[ASParentClass alloc] init];

	[parent sayHello];
	[parent say:@"How are you?"];
	[parent say:@"First string" andSay:@"Next string"];

	NSLog(@"%@", [parent saySomething]);

	[ASParentClass whoAreyou];

	//MARK: - ASChildClass
	
	ASChildClass* child = [[ASChildClass alloc] init];

	[child sayHello];
	[child say:@"How are you?"];
	[child say:@"First string" andSay:@"Next string"];

	NSLog(@"%@", [child saySomething]);

	[ASChildClass whoAreyou];

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
