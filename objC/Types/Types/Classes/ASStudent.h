//
//  ASStudent.h
//  Types
//
//  Created by Улько Артем Викторович on 03.10.2022.
//

#import <UIKit/UIKit.h>

typedef enum {
	ASGEnderMale, // 0
	ASGEnderFemale // 1
} ASGender;

@interface ASStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic,) ASGender gender;

@end
