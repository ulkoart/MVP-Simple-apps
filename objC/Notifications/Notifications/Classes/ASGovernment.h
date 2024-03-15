//
//  ASGovernment.h
//  Notifications
//
//  Created by Улько Артем Викторович on 09.10.2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString* const ASGovernmentTaxLevelDidChangeNotification;
extern NSString* const ASGovernmentSalaryDidChangeNotification;
extern NSString* const ASGovernmentPensionDidChangeNotification;
extern NSString* const ASGovernmentAveragePricelDidChangeNotification;

extern NSString* const ASGovernmentTaxLeveUserInfoKey;
extern NSString* const ASGovernmentSalaryUserInfoKey;
extern NSString* const ASGovernmentPensionUserInfoKey;
extern NSString* const ASGovernmentAveragePricelUserInfoKey;

@interface ASGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end
