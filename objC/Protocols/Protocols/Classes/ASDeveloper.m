//
//  ASDeveloper.m
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import "ASDeveloper.h"

@implementation ASDeveloper

- (void) work {}

#pragma mark - ASPatient

- (BOOL) areYouOK {
	BOOL ok = arc4random() % 2;
	NSLog(@"Is developer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
	return ok;
}

- (void) takePill {
	NSLog(@"Developer %@ takes a pill", self.name);
}
- (void) makeShot {
	NSLog(@"Developer %@ takes a shot", self.name);
}

- (NSString*) howIsYouJob {
	return @"My job is awesome";
}

- (NSString*) howIsYourFamily {
	return @"My family is doing well!";
}

@end
