//
//  ASDeveloper.h
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import <UIKit/UIKit.h>
#import "ASPatient.h"

@interface ASDeveloper: NSObject <ASPatient>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString* name;

- (void) work;



@end
