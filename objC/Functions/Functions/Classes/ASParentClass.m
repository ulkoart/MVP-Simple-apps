//
//  ASParentClass.m
//  Functions
//
//  Created by Улько Артем Викторович on 27.09.2022.
//

#import "ASParentClass.h"

@implementation ASParentClass

- (id)init
{
	self = [super init];
	if (self) {
		NSLog(@"ASParentClass is created");
	}
	return self;
}

+ (void) whoAreyou
{
	NSLog(@"I am ASParentClass");
}

- (void) sayHello
{
	NSLog(@"Parent says hello!");
}

- (void) say:(NSString *) string
{
	NSLog(@"%@", string);
}

- (void) say:(NSString *) string andSay:(NSString *) andString
{
	NSLog(@"%@, %@", string, andString);
}

- (NSString *) saySomething
{
	NSString * string = [self saySomeNumberString];
	return string;
}

- (NSString *) saySomeNumberString
{
	return [NSString stringWithFormat:@"%@", [NSDate date]];
}

@end
