//
//  AppDelegate.m
//  NSDate
//
//  Created by Улько Артем Викторович on 21.10.2022.
//

#import "AppDelegate.h"
#import "ASObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	/*
	NSDate* date = [NSDate date];

	NSLog(@"%@", date);
	
	NSLog(@"%@", [date dateByAddingTimeInterval:5000]); // в секндах
	
	[date compare:[date dateByAddingTimeInterval:5000]];
	[date earlierDate:[date dateByAddingTimeInterval:5000]];
	[date laterDate:[date dateByAddingTimeInterval:5000]];
	
	NSDate* date2 = [NSDate dateWithTimeIntervalSinceReferenceDate:10];
	
	NSLog(@"%@", date2);


	NSDate* date = [NSDate date];
	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];

	[dateFormatter setDateStyle:NSDateFormatterShortStyle];

	
	
	[dateFormatter setDateFormat:@"dd.MM.yyyy - HH:mm:ss W w"];
	
	NSLog(@"%@", [dateFormatter stringFromDate:date]);
	
	NSDate* date2 = [dateFormatter dateFromString:@"21.10.2000 - 12:03:22 4 43"];
	NSLog(@"%@", date2);
	 
	 
	
	NSDate* date = [NSDate date];

	NSCalendar* calendar = [NSCalendar currentCalendar];

	NSDateComponents* components = [calendar components:NSCalendarUnitDay | NSCalendarUnitYear fromDate:date];
	
	NSLog(@"%@", components);
	 
	 
	
	NSCalendar* calendar = [NSCalendar currentCalendar];
	NSDate* date1 = [NSDate date];
	NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:-1000000];
	
	NSDateComponents* components = [calendar components:NSCalendarUnitDay | NSCalendarUnitSecond fromDate:date1 toDate:date2 options:0];
	
	NSLog(@"%@", components);

	
	 */
	
	// ASObject* obj = [ASObject new];
	ASObject* obj = [[ASObject alloc] init];
	

	

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
