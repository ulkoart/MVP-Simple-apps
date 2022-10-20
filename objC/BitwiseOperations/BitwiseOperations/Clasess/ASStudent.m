//
//  ASStudent.m
//  BitwiseOperations
//
//  Created by Улько Артем Викторович on 18.10.2022.
//

#import "ASStudent.h"

@implementation ASStudent

- (NSString*) answerByType:(ASStudentSubjectType) type {
	return self.subjectType & type ? @"yes" : @"no";
}

- (NSString*) description {
	/*
	return [NSString stringWithFormat:
			@"Student studies"
			"biology = %@\n"
			"math = %@\n"
			"development = %@\n"
			"engineering = %@\n"
			"art = %@\n"
			"phycology = %@\n"
			"anatomy = %@\n",
			self.studiesBiology ? @"yes" : @"no",
			self.studiesMath ? @"yes" : @"no",
			self.studiesDevelopment ? @"yes" : @"no",
			self.studiesEngineering ? @"yes" : @"no",
			self.studiesArt ? @"yes" : @"no",
			self.studiesPhycology ? @"yes" : @"no",
			self.studiesAnatomy ? @"yes" : @"no"
	];
	*/

	return [NSString stringWithFormat:
			@"Student studies"
			"biology = %@\n"
			"math = %@\n"
			"development = %@\n"
			"engineering = %@\n"
			"art = %@\n"
			"phycology = %@\n"
			"anatomy = %@\n",
			[self answerByType:ASStudentSubjectTypeBiology],
			[self answerByType:ASStudentSubjectTypeMath],
			[self answerByType:ASStudentSubjectTypeDevelopment],
			[self answerByType:ASStudentSubjectTypeEngineering],
			[self answerByType:ASStudentSubjectTypeArt],
			[self answerByType:ASStudentSubjectTypePhycology],
			[self answerByType:ASStudentSubjectTypeAnatomy]
	];
}

@end

