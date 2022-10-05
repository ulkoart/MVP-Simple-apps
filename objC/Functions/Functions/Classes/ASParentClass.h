//
//  ASParentClass.h
//  Functions
//
//  Created by Улько Артем Викторович on 27.09.2022.
//

#import <Foundation/Foundation.h>

@interface ASParentClass : NSObject

+ (void) whoAreyou;

- (void) sayHello;
- (void) say:(NSString *) string;
- (void) say:(NSString *) string andSay:(NSString *) andString;
- (NSString *) saySomething;

@end
