//
//  AppDelegate.m
//  Dictionary
//
//  Created by Улько Артем Викторович on 05.10.2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSDictionary* dictionary = [
		[NSDictionary alloc] initWithObjectsAndKeys:
			@"Petrov", @"lastName",
			@"Vasily", @"name",
			[NSNumber numberWithInt:25], @"age",
		nil
	];
	
	// NSDictionary* dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:, nil]
	
	NSDictionary* dictionary3 = @{@"lastName": @"Kekov"};
	
	// [NSNumber numberWithInt:25] == @25
	// NSInteger number = 25
	// @(number) - можно добавить в словарь

	NSLog(@"%@", dictionary);

	NSLog(@"name = %@, lastName = %@, age = %d",
		  [dictionary objectForKey:@"name"],
		  [dictionary objectForKey:@"lastName"],
		  [[dictionary objectForKey:@"age"] integerValue]);

	for (NSString* key in [dictionary allKeys]) {
		id obj = [dictionary objectForKey:key];
		NSLog(@"key = %@, value = %@", key, obj);
	}
	
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
