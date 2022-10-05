//
//  ASBoxer.h
//  Properties
//
//  Created by Улько Артем Викторович on 28.09.2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ASBoxer : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age; // int
@property (assign, nonatomic) CGFloat height; // float
@property (assign, nonatomic) CGFloat weight; // float

- (NSInteger) howOldAreYou;

@end
