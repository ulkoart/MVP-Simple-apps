//
//  ASGovernment.m
//  Notifications
//
//  Created by Улько Артем Викторович on 09.10.2022.
//

#import "ASGovernment.h"

NSString* const ASGovernmentTaxLevelDidChangeNotification = @"ASGovernmentTaxlevelDidChangeNotification";
NSString* const ASGovernmentSalaryDidChangeNotification = @"ASGovernmentSalaryDidChangeNotification";
NSString* const ASGovernmentPensionDidChangeNotification = @"ASGovernmentPensionDidChangeNotification";
NSString* const ASGovernmentAveragePricelDidChangeNotification = @"ASGovernmentAveragePricelDidChangeNotification";

NSString* const ASGovernmentTaxLeveUserInfoKey = @"ASGovernmentTaxLeveUserInfoKey";
NSString* const ASGovernmentSalaryUserInfoKey = @"ASGovernmentSalaryUserInfoKey";
NSString* const ASGovernmentPensionUserInfoKey = @"ASGovernmentPensionUserInfoKey";
NSString* const ASGovernmentAveragePricelUserInfoKey = @"ASGovernmentAveragePricelUserInfoKey";

@implementation ASGovernment

- (instancetype)init
{
	self = [super init];
	if (self) {
		_taxLevel = 5.f;
		_salary = 1000;
		_pension = 500;
		_averagePrice = 10;
	}
	return self;
}

- (void)setTaxLevel:(CGFloat)taxLevel {
	_taxLevel = taxLevel;

	NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey: ASGovernmentTaxLeveUserInfoKey];

	[[NSNotificationCenter defaultCenter] postNotificationName: ASGovernmentTaxLevelDidChangeNotification object: nil userInfo: dictionary];
}

- (void)setSalary:(CGFloat)salary {
	_salary = salary;

	NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey: ASGovernmentSalaryUserInfoKey];

	[[NSNotificationCenter defaultCenter] postNotificationName: ASGovernmentSalaryDidChangeNotification object: nil userInfo: dictionary];
}

- (void)setPension:(CGFloat)pension {
	_pension = pension;

	NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey: ASGovernmentPensionUserInfoKey];

	[[NSNotificationCenter defaultCenter] postNotificationName: ASGovernmentPensionDidChangeNotification object: nil userInfo: dictionary];
}

- (void)setAveragePrice:(CGFloat)averagePrice {
	_averagePrice = averagePrice;

	NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey: ASGovernmentAveragePricelUserInfoKey];

	[[NSNotificationCenter defaultCenter] postNotificationName: ASGovernmentAveragePricelDidChangeNotification object: nil userInfo: dictionary];
}

@end
