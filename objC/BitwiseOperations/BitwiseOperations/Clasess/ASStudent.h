//
//  ASStudent.h
//  BitwiseOperations
//
//  Created by Улько Артем Викторович on 18.10.2022.
//

#import <Foundation/Foundation.h>

typedef enum {
	ASStudentSubjectTypeBiology 		= 1 << 0,
	ASStudentSubjectTypeMath 			= 1 << 1,
	ASStudentSubjectTypeDevelopment 	= 1 << 2,
	ASStudentSubjectTypeEngineering 	= 1 << 3,
	ASStudentSubjectTypeArt 			= 1 << 4,
	ASStudentSubjectTypePhycology 		= 1 << 5,
	ASStudentSubjectTypeAnatomy 		= 1 << 6,
} ASStudentSubjectType;

@interface ASStudent : NSObject

/*
@property (assign, nonatomic) BOOL studiesBiology;
@property (assign, nonatomic) BOOL studiesMath;
@property (assign, nonatomic) BOOL studiesDevelopment;
@property (assign, nonatomic) BOOL studiesEngineering;
@property (assign, nonatomic) BOOL studiesArt;
@property (assign, nonatomic) BOOL studiesPhycology;
@property (assign, nonatomic) BOOL studiesAnatomy;
*/

@property (assign, nonatomic) ASStudentSubjectType subjectType;

@end
