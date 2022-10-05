//
//  AppDelegate.m
//  Arrays
//
//  Created by Улько Артем Викторович on 30.09.2022.
//

#import "AppDelegate.h"
#import "ASObject.h"
#import "ASChild.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//	NSArray* array = [[NSArray alloc] initWithObjects:
//					  @"String 1", @"String 2", @"String 3", nil
//	];

//	NSArray* array = [NSArray arrayWithObjects:@"String 1", @"String 2", @"String 3", nil];
	
//	NSArray* array = @[@"String 1", @"String 2", @"String 3"];

//	for (int i = 0; i < [array count]; i++) {
//		NSLog(@"%@", [array objectAtIndex:i]);
//		NSLog(@"%d", i);
//	}
//
//	for (int i = [array count] - 1; i >= 0; i--) {
//		NSLog(@"%@", [array objectAtIndex:i]);
//		NSLog(@"%d", i);
//	}

//	for (NSString* string in array) {
//		NSLog(@"%@", string);
//		NSLog(@"index = %lu", (unsigned long)[array indexOfObject:string]);
//	}
	
	ASObject* obj1 = [[ASObject alloc] init];
	ASObject* obj2 = [[ASObject alloc] init];
	ASChild* obj3 = [[ASChild alloc] init];

	obj1.name = @"Object 1";
	obj2.name = @"Object 2";
	[obj3 setName:@"Object 3"];

	obj3.lastName = @"Last Name";

	NSArray* array = [NSArray arrayWithObjects: obj1, obj2, obj3, nil];

	for (ASObject* obj in array) {
		NSLog(@"name = %@", obj.name);
		[obj action];

		if ([obj isKindOfClass:[ASChild class]]) {
			ASChild* child = (ASChild*)obj;
			NSLog(@"Last Name = %@", child.lastName);
		}
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
