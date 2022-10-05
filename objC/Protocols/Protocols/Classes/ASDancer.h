//
//  ASDancer.h
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import <UIKit/UIKit.h>
#import "ASPatient.h"

@interface ASDancer: NSObject <ASPatient>

@property (strong, nonatomic) NSString* favoriteDance;
@property (strong, nonatomic) NSString* name;

- (void) dance;

@end
