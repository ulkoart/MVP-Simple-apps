//
//  ASChildClass.m
//  Functions
//
//  Created by Улько Артем Викторович on 27.09.2022.
//

#import "ASChildClass.h"

@implementation ASChildClass

- (id)init
{
	self = [super init];
	if (self) {
		NSLog(@"ASChildClass is created");
	}
	return self;
}

- (NSString *) saySomeNumberString
{
	return @"Something";
}

- (NSString *) saySomething
{
	return [self saySomeNumberString];
}

@end
