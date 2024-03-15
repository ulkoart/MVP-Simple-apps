//
//  ASStudent.h
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import <UIKit/UIKit.h>
#import "ASPatient.h"

@interface ASStudent: NSObject <ASPatient>

@property (strong, nonatomic) NSString* universityName;
@property (strong, nonatomic) NSString* name;

- (void) study;

@end
