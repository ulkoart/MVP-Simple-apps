//
//  AppDelegate.h
//  Parameters
//
//  Created by Улько Артем Викторович on 29.09.2022.
//

#import <UIKit/UIKit.h>

@class ASObject;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// @property (strong, nonatomic) ASObject* object;
// @property (assign, nonatomic) NSInteger intData;

@property (copy, nonatomic, getter = getObject, setter = setObject:) ASObject* object;

@end

