//
//  AppDelegate.m
//  Delegates
//
//  Created by Улько Артем Викторович on 06.10.2022.
//

#import "AppDelegate.h"
#import "ASPatient.h"
#import "ASDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	ASPatient* patient1 = [[ASPatient alloc] init];
	patient1.name = @"Vova";
	patient1.temperature = 36.6f;

	ASPatient* patient2 = [[ASPatient alloc] init];
	patient2.name = @"Petya";
	patient2.temperature = 40.2f;

	ASPatient* patient3 = [[ASPatient alloc] init];
	patient2.name = @"Dima";
	patient2.temperature = 37.1f;

	ASPatient* patient4 = [[ASPatient alloc] init];
	patient2.name = @"Sasha";
	patient2.temperature = 38.f;

	ASDoctor* doctor = [[ASDoctor alloc] init];

	patient1.delegate = doctor;
	patient2.delegate = doctor;
	patient3.delegate = doctor;
	patient4.delegate = doctor;

	[patient1 howAreYou];
	[patient2 howAreYou];

	return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {

	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
}

@end
