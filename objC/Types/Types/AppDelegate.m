//
//  AppDelegate.m
//  Types
//
//  Created by Улько Артем Викторович on 03.10.2022.
//

#import "AppDelegate.h"
#import "ASStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	


	BOOL boolVar = YES; // NO

	NSInteger intVar = 10;

	NSUInteger uIntVar = 100;

	CGFloat floatVar = 1.5f;

	double doubleVar = 2.5f;

	NSNumber* boolObject = [NSNumber numberWithBool:boolVar];
	NSNumber* intObject = [NSNumber numberWithInt:intVar];
	NSNumber* uIntObject = [NSNumber numberWithUnsignedInteger:uIntVar];
	NSNumber* floatObject = [NSNumber numberWithFloat:floatVar];
	NSNumber* doubleObject = [NSNumber numberWithDouble:doubleVar];

	NSArray* array = [NSArray arrayWithObjects:boolObject, intObject, uIntObject, floatObject, doubleObject, nil];

	NSLog(@"boolVar = %d, intVar = %ld, uIntVar = %ld, floatVar = %f, doubleVar = %f",
		  [[array objectAtIndex:0] boolValue],
		  [[array objectAtIndex:1] intValue],
		  [[array objectAtIndex:2] unsignedIntegerValue],
		  [[array objectAtIndex:3] floatValue],
		  [[array objectAtIndex:4] doubleValue]
		);
	
	/*

	NSLog(@"boolVar = %d", boolVar);
	NSLog(@"intVar = %ld", intVar);
	NSLog(@"uIntVar = %ld", uIntVar);
	NSLog(@"floatVar = %f", floatVar);
	NSLog(@"doubleVar = %f", doubleVar);

	NSLog(@"SIZES:");

	NSLog(@"boolVar = %ld", sizeof(boolVar));
	NSLog(@"intVar = %ld", sizeof(intVar));
	NSLog(@"uIntVar = %ld", sizeof(uIntVar));
	NSLog(@"floatVar = %ld", sizeof(floatVar));
	NSLog(@"doubleVar = %ld", sizeof(doubleVar));

	ASStudent* studentA = [[ASStudent alloc] init];

	studentA.name = @"Best Student";

	NSLog(@"Student A name = %@", [studentA name]);

	ASStudent* studentB = studentA;

	studentB.name = @"Bad Student";

	NSLog(@"Student A name = %@", [studentA name]);

	NSInteger a = 10;
	NSLog(@"a = %ld", a);

	NSInteger b = a;
	b = 5;
	NSLog(@"a = %ld", a);
	NSLog(@"b = %ld", b);

	NSInteger *c = &a; // создать указатель

	*c = 8;

	NSLog(@"a = %ld", a);
	
	NSInteger test = 0;
	NSInteger result = [self test:a testVar:&test];
	
	NSLog(@"test = %ld", test);
	
	*/
	
	/*
	
	ASStudent* student = [[ASStudent alloc] init];
	student.gender = ASGEnderMale;

	CGPoint point;
	CGSize size;
	CGRect rect;

	rect.origin = point;
	rect.size = size;

	rect = CGRectMake(0, 0, 30, 60);
	
	*/
	
	CGPoint point1 = CGPointMake(0, 5);
	CGPoint point2 = CGPointMake(3, 4);
	CGPoint point3 = CGPointMake(2, 8);
	CGPoint point4 = CGPointMake(7, 1);
	CGPoint point5 = CGPointMake(4, 4);

	NSArray* array2 = [NSArray arrayWithObjects:
					   [NSValue valueWithCGPoint:point1],
					   [NSValue valueWithCGPoint:point2],
					   [NSValue valueWithCGPoint:point3],
					   [NSValue valueWithCGPoint:point4],
					   [NSValue valueWithCGPoint:point5],
					   nil
	];
	
	for (NSValue* value in array2) {
		CGPoint p = [value CGPointValue];
		NSLog(@"point = %@", NSStringFromCGPoint(p));
	}

	

	return YES;
}

- (int) test:(NSInteger) test testVar:(NSInteger*) testPointer {
	*testPointer = 5;
	return test;
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
