//
//  ASDancer.m
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import "ASDancer.h"

@implementation ASDancer

- (void) dance {};

#pragma mark - ASPatient

- (BOOL) areYouOK {
	BOOL ok = arc4random() % 2;
	NSLog(@"Is dancer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
	return ok;
}

- (void) takePill {
	NSLog(@"Dancer %@ takes a pill", self.name);
}
- (void) makeShot {
	NSLog(@"Dancer %@ takes a shot", self.name);
}

@end
