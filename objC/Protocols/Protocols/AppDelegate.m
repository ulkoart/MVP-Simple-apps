//
//  AppDelegate.m
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import "AppDelegate.h"
#import "ASPatient.h"
#import "ASStudent.h"
#import "ASDancer.h"
#import "ASDeveloper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	ASDancer* dancer1 = [[ASDancer alloc] init];
	dancer1.name = @"dancer1";
	
	ASDancer* dancer2 = [[ASDancer alloc] init];
	[dancer2 setName:@"dancer2"];

	ASStudent* student1 = [[ASStudent alloc] init];
	student1.name = @"student1";
	
	ASStudent* student2 = [[ASStudent alloc] init];
	student2.name = @"student2";
	
	ASStudent* student3 = [[ASStudent alloc] init];
	student3.name = @"student3";
	
	ASDeveloper* developer1 = [[ASDeveloper alloc] init];
	[developer1 setName:@"developer1"];
	
	NSObject* fake = [[NSObject alloc] init];

	NSArray* patients = [NSArray arrayWithObjects:
						 fake,
						 dancer1,
						 dancer2,
						 student1,
						 student2,
						 student3,
						 developer1,
						 nil
	];

	for (id <ASPatient> patient in patients) {
		if ([patient conformsToProtocol: @protocol(ASPatient)]) {
			NSLog(@"Patient name = %@", patient.name);

			// проверка может ли обьект выполнить опциональное свойство протокола
			if ([patient respondsToSelector: @selector(howIsYourFamily)]) {
				NSLog(@"How is your family? \n%@", [patient howIsYourFamily]);
			}

			if ([patient respondsToSelector: @selector(howIsYouJob)]) {
				NSLog(@"How is your job? \n%@", [patient howIsYouJob]);
			}

			if (![patient areYouOK]) {
				[patient takePill];

				if (![patient areYouOK]) {
					[patient makeShot];
				}
			}

			NSLog(@"==================");
		} else {
			NSLog(@"fake");
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
