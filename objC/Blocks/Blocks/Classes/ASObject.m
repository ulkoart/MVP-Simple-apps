//
//  ASObject.m
//  Blocks
//
//  Created by Улько Артем Викторович on 13.10.2022.
//

#import "ASObject.h"

@interface ASObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end

@implementation ASObject

- (instancetype)init
{
	self = [super init];
	if (self) {
		__weak ASObject* weakSelf = self;
		self.objectBlock = ^{
			NSLog(@"%@", weakSelf.name);
		};
	}
	return self;
}

- (void) dealloc {
	NSLog(@"ASObject is dealloc");
};

- (void) testMethod:(ObjectBlock) block {
	block();
}

@end
