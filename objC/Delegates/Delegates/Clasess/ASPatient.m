//
//  ASPatient.m
//  Delegates
//
//  Created by Улько Артем Викторович on 06.10.2022.
//

#import "ASPatient.h"

@implementation ASPatient

- (BOOL) howAreYou {

	BOOL iFeelGood = arc4random() % 2;

	if (!iFeelGood) {
		[self.delegate patientFeelsBad:self];
	}
	
	return iFeelGood;
}

- (void) takePill {
	NSLog(@"%@ takes a pill", self.name);
}

- (void) makeShot {
	NSLog(@"%@ make a shot", self.name);
}

@end
