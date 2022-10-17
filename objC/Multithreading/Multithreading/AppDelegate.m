//
//  AppDelegate.m
//  Multithreading
//
//  Created by Улько Артем Викторович on 16.10.2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	/// самый простой способ вызвать в Background
	// [self performSelectorInBackground:@selector(testThread) withObject:nil];
	
	
	/*
	for (int i = 0; i < 50; i++) {
		NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
		thread.name = [NSString stringWithFormat:@"Thread #%d", i];
		[thread start];
	}

	/// Создание треда
	// NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
	// [thread start];
	*/
	
	
	/*
	
	NSThread* thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
	NSThread* thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"0"];
	thread1.name = @"Thread 1";
	thread2.name = @"Thread 2";
	
	[thread1 start];
	[thread2 start];
	
	self.array = [NSMutableArray array];
	[self performSelector:@selector(printArray) withObject:nil afterDelay:3];
	 
	*/
	
	/// GCD

	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	void (^block1)(void) = ^{
		NSLog(@"Kek");
		NSLog(@"%@ Main - ?", [NSThread currentThread]);
		dispatch_async(dispatch_get_main_queue(), ^ {
			NSLog(@"%@ Main - ?", [NSThread currentThread]);
		});
	};
	
	/// Создать свою очередь
	dispatch_queue_t queue1 = dispatch_queue_create("com.kek", DISPATCH_QUEUE_SERIAL);
	dispatch_queue_t queue2 = dispatch_queue_create("com.kek", DISPATCH_QUEUE_CONCURRENT);
	
	dispatch_async(queue1, block1);

	dispatch_async(queue, ^{
		[self addStringToArray:@"x"];
	});
	
	__weak id weakSelf = self;
	
	dispatch_async(queue, ^{
		[weakSelf addStringToArray:@"0"];
	});
	self.array = [NSMutableArray array];
	[self performSelector:@selector(printArray) withObject:nil afterDelay:3];

	return YES;
}

- (void) testThread {
	@autoreleasepool {
		double startTime = CACurrentMediaTime();
		
		NSLog(@"%@ started", [[NSThread currentThread] name]);
		
		for (int i = 0; i <= 20000000; i++) {
			// NSLog(@"%d", i);
		};
		
		NSLog(@"%@ finished in %f", [NSThread currentThread], CACurrentMediaTime() - startTime);
	}
}

- (void) addStringToArray:(NSString*) string {
	@autoreleasepool {
		double startTime = CACurrentMediaTime();
		NSLog(@"%@ started", [[NSThread currentThread] name]);
		
		@synchronized (self) {
			NSLog(@"%@ caclulations started", [[NSThread currentThread] name]);
			for (int i = 0; i < 2000; i++) {
				[self.array addObject:string];
			}
		}

		NSLog(@"%@ finished in %f", [NSThread currentThread], CACurrentMediaTime() - startTime);

	}
}

- (void) printArray {
	NSLog(@"%@", self.array);
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
