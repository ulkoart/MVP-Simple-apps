//
//  AppDelegate.m
//  Selectors
//
//  Created by Улько Артем Викторович on 10.10.2022.
//

#import "AppDelegate.h"
#import "ASObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	/*
	ASObject* obj = [[ASObject alloc] init];

	SEL selector1 = @selector(testMethod); // без параметров
	SEL selector2 = @selector(testMethod:); // 1 параметр
	SEL selector3 = @selector(testMethod:parametr:); // 2 параметр

	[self performSelector:selector1];
	[self performSelector:selector2 withObject:@"TEST STRING"];
	[self performSelector:selector3 withObject:@"TEST STRING - 1" withObject:@"TEST STRING - 2"];
	[obj performSelector:selector1];

	NSString* secret = [obj performSelector:@selector(superSecretText)];
	NSLog(@"secret - %@", secret);
	
//	[self performSelector:@selector(testMethodParametr1:) withObject:[NSNumber numberWithInt:11]]; // нельзя передать примитив

	NSString* string = NSStringFromSelector(selector1);
	SEL sel = NSSelectorFromString(string);
	
	*/

	// NSString* testString = [self testMethodParametr1:1 parametr2:1.0f parametr3:1.1f];
	// NSLog(@"%@", testString);

	// [self performSelector:selector1 withObject:nil afterDelay:5.f]; // с задержкой 5 сек
	
	SEL selector = @selector(testMethodParametr1:parametr2:parametr3:);
	NSMethodSignature* signature = [AppDelegate instanceMethodSignatureForSelector:selector];
	NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];

	[invocation setTarget:self];
	[invocation setSelector:selector];

	NSInteger intValue = 2;
	CGFloat floatValue = 3.1f;
	double doubleValue = 5.5f;
	
	NSInteger* p1 = &intValue;
	CGFloat* p2 = &floatValue;
	double* p3 = &doubleValue;
	
	[invocation setArgument:p1 atIndex:2];
	[invocation setArgument:p2 atIndex:3];
	[invocation setArgument:p3 atIndex:4];
	
	[invocation invoke];

	__unsafe_unretained NSString* string = nil;
	[invocation getReturnValue:&string];

	NSLog(@"%@", string);
	
	return YES;
}

- (void) testMethod {
	NSLog(@"testMethod");
}

- (void) testMethod:(NSString* ) string {
	NSLog(@"testMethod %@", string);
}

- (void) testMethod:(NSString* ) string parametr:(NSString* ) string2 {
	NSLog(@"testMethod %@ + %@", string, string2);
}

- (NSString*) testMethodParametr1:(NSInteger) intValue parametr2:(CGFloat) floatValue parametr3:(double) doubleValue {
	return [NSString stringWithFormat:@"testMethodParametr1: %d, parametr2: %f, parametr3: %f", intValue, floatValue, doubleValue];
	// NSLog(@"testMethodParametr1: %d", intValue);
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
