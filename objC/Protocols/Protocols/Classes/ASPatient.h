//
//  ASPatient.h
//  Protocols
//
//  Created by Улько Артем Викторович on 04.10.2022.
//

#import <Foundation/Foundation.h>

@protocol ASPatient <NSObject>

@property (strong, nonatomic) NSString* name;

@required
- (BOOL) areYouOK;
- (void) takePill;
- (void) makeShot;

@optional
- (NSString*) howIsYourFamily;
- (NSString*) howIsYouJob;

@end
