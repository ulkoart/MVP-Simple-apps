//
//  ASObject.m
//  Parameters
//
//  Created by Улько Артем Викторович on 29.09.2022.
//

#import "ASObject.h"

@implementation ASObject

- (instancetype)init
{
	self = [super init];
	if (self) {
		NSLog(@"object is created");
	}
	return self;
}

- (void) dealloc
{
	NSLog(@"Object is deallocated");
}

- (id)copyWithZone:(nullable NSZone *)zone {
	ASObject* newObject =  [[ASObject alloc] init];
	// newObject.name = self.name;
	newObject.name = [self.name copy];
	return newObject;
}

@end
