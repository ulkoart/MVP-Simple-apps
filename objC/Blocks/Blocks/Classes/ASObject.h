//
//  ASObject.h
//  Blocks
//
//  Created by Улько Артем Викторович on 13.10.2022.
//

#import <Foundation/Foundation.h>

typedef void (^ObjectBlock)(void);

@interface ASObject : NSObject

@property (strong, nonatomic) NSString* name;

- (void) testMethod:(ObjectBlock) block;

@end
