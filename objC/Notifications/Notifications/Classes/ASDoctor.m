//
//  ASDoctor.m
//  Notifications
//
//  Created by Улько Артем Викторович on 09.10.2022.
//

#import "ASDoctor.h"
#import "ASGovernment.h"

@implementation ASDoctor

#pragma mark - Init

- (instancetype)init
{
	self = [super init];
	if (self) {
		NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];

		[nc addObserver:self selector: @selector(salaryChangeNotification:) name:ASGovernmentSalaryDidChangeNotification object:nil];

		[nc addObserver:self selector: @selector(averagePriceChangeNotification:) name:ASGovernmentAveragePricelDidChangeNotification object:nil];
	}
	return self;
}

-(void) dealloc {
	NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
	[nc removeObserver:self];
}

#pragma mark - Notifications

- (void) salaryChangeNotification:(NSNotification*) notification {
	NSNumber* value = [notification.userInfo objectForKey:ASGovernmentSalaryUserInfoKey];
	CGFloat salary = [value floatValue];

	if (salary < self.salary) {
		NSLog(@"Doctor are not happy");
	} else {
		NSLog(@"Doctor are happy");
	}

	self.salary = salary;
}

- (void) averagePriceChangeNotification:(NSNotification*) notification {
	
}

@end
