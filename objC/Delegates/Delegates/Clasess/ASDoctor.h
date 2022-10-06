//
//  ASDoctor.h
//  Delegates
//
//  Created by Улько Артем Викторович on 06.10.2022.
//

#import <Foundation/Foundation.h>
#import "ASPatient.h"

@interface ASDoctor: NSObject <ASPatientDelegate>

@end

