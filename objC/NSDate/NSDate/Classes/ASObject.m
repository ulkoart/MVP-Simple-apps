//
//  ASObject.m
//  NSDate
//
//  Created by Улько Артем Викторович on 21.10.2022.
//

#import "ASObject.h"

@interface ASObject()

@property (strong, nonatomic) NSTimer* timer;

@end

@implementation ASObject

- (instancetype)init
{
	self = [super init];
	if (self) {
		NSLog(@"ASObject - init");
		
		NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest:) userInfo:nil repeats:true];
		[timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:5]];
		self.timer = timer;
	}
	return self;
}

- (void) dealloc {
	NSLog(@"ASObject - dealloc");
}

- (void) timerTest:(NSTimer*) timer {

	NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"HH:mm:ss"];
	NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
	// [timer invalidate];
}

@end
