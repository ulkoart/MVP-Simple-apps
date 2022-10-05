//
//  ASBoxer.m
//  Properties
//
//  Created by Улько Артем Викторович on 28.09.2022.
//

#import "ASBoxer.h"

@interface ASBoxer()
@property (assign, nonatomic) NSInteger nameCount; // закрытое свойство
@end

@implementation ASBoxer
@synthesize name = _name; // если нужно переопределить геттер и сеттер одновременно

- (id)init {
	self = [super init];
	if (self) {
		self.nameCount = 0;
	}
	return self;
}

- (void) setName:(NSString *)name {
	NSLog(@"setter setName is called");
	_name = name;
}

- (NSString *) name {
	self.nameCount = self.nameCount + 1;
	// self.nameCount++;
	// self.nameCount += 1;
	NSLog(@"getter name is called %ld times", self.nameCount);
	return _name;
}

- (NSInteger) age {
	NSLog(@"getter age is called");
	return _age;
}

- (NSInteger) howOldAreYou {
	return self.age;
}

@end
