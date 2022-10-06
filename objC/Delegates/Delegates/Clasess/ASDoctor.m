//
//  ASDoctor.m
//  Delegates
//
//  Created by Улько Артем Викторович on 06.10.2022.
//

#import "ASDoctor.h"

@implementation ASDoctor

#pragma mark - ASPatientDelegate

- (void) patientFeelsBad: (ASPatient* ) patient {
	NSLog(@"Patient %@ feels bad", patient.name);

	if (patient.temperature >= 37.f && patient.temperature <= 40.f) {
		[patient takePill];
	} else if (patient.temperature > 40.f) {
		[patient makeShot];
	} else {
		NSLog(@"Patient %@ should rest", patient.name);
	}
}

- (void) patient:(ASPatient*) patient iHaveQuestion:(NSString*) question {
	NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
