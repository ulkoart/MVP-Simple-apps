//
//  AppDelegate.m
//  Blocks
//
//  Created by Улько Артем Викторович on 13.10.2022.
//

#import "AppDelegate.h"
#import "ASObject.h"

typedef void (^OurTestBlock)(void); // можно обьявлять форматы блоков для более удобного кода
typedef NSString* (^OurTestBlock2)(NSInteger);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock testBlock;
@property (strong, nonatomic) NSString* name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	// [self testMethod];
	// [self testMethodWithParams:@"String" value:1];
	// NSString* result = [self testMethodWithReturnValueAndParams:@"STRING" value:222];
	// NSLog(@"testMethodWithReturnValueAndParams - %@", result);
	
	// Блок, который ничего не принимает и не возвращает
	void (^testBlock)(void);
	testBlock = ^{
		NSLog(@"test Block");
	};
	
	// testBlock(); // вызов блока
	
	// Блок который принимает параметры и ничего не возвращает
	void (^testBlockWithParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
		NSLog(@"testBlockWithParams %@ %ld", string, intValue);
	};

	// testBlockWithParams(@"STRING", 11); // вызов блока
	
	// Блок, который принимает и возвращает
	NSString* (^testBlockWithReturnValueAndParams)(NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
		return [NSString stringWithFormat:@"testBlockWithReturnValueAndParams %@ %ld", string, intValue];
	};

	// NSString* resultFromBlock = testBlockWithReturnValueAndParams(@"STRING", 33);
	// NSLog(@" %@", resultFromBlock);

	__block NSString* testString = @"How it possible?";
	__block NSInteger i = 0;
	void (^testBlock2)(void);
	testBlock2 = ^{
		NSLog(@"test Block");
		NSLog(@"%@", testString);
		i = i + 1;
		NSLog(@"%d", i);
		testString = [NSString stringWithFormat:@"How it possible? %d", i];
	};
//	testBlock2();
//	testBlock2();
//	testBlock2();
//	testBlock2();
//	testBlock2();

	OurTestBlock testBlock3 = ^{
		
	};

//	[self testBlocksMethod: ^{
//		NSLog(@"BLOCK!!!");
//	}];
//	[self testBlocksMethod:testBlock];

	ASObject* obj = [[ASObject alloc] init];
	obj.name = @"OBJECT";

	__weak ASObject* weakObj = obj;

	OurTestBlock tb = ^{
		NSLog(@"%@", weakObj.name);
	};
	tb();

	self.testBlock = tb; // obj будет держаться за счет того, что блок это свойство AppDelegate
	
	ASObject* obj1 = [[ASObject alloc] init];
	obj.name = @"OBJECT 1";
	self.name = @"HELLO";
	
	[obj1 testMethod:^{
		NSLog(@"%@", self.name);
	}];
	

	return YES;
}

- (void) testMethod {
	NSLog(@"test Method");
}

- (void) testMethodWithParams:(NSString*) string value:(NSInteger) intValue {
	NSLog(@"testMethodWithParams %@ %ld", string, (long)intValue);
}

- (NSString*) testMethodWithReturnValueAndParams:(NSString*) string value:(NSInteger) intValue {
	return [NSString stringWithFormat:@"testMethodWithParams %@ %ld", string, intValue];
}

- (void) testBlocksMethod:(void(^)(void)) testBlock {
	NSLog(@"testBlocksMethod");
	testBlock();
}

- (void) testBlocksMethod2:(OurTestBlock) testBlock {
	NSLog(@"testBlocksMethod");
	testBlock();
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
