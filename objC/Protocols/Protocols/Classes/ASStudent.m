//
//  ASStudent.m
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import "ASStudent.h"

@implementation ASStudent

- (void) study {};

#pragma mark - ASPatient

- (BOOL) areYouOK {
	BOOL ok = arc4random() % 2;
	NSLog(@"Is student %@ ok? %@", self.name, ok ? @"YES" : @"NO");
	return ok;
}

- (void) takePill {
	NSLog(@"Student %@ takes a pill", self.name);
}
- (void) makeShot {
	NSLog(@"Student %@ takes a shot", self.name);
}

@end
