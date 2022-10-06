//
//  ASPatient.h
//  Delegates
//
//  Created by Улько Артем Викторович on 06.10.2022.
//

#import <UIKit/UIKit.h>

@protocol ASPatientDelegate;

@interface ASPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) CGFloat temperature;
// @property (weak, nonatomic) ASDoctor <ASPatientDelegate> * doctor;
// @property (weak, nonatomic) NSObject <ASPatientDelegate> * doctor;
@property (weak, nonatomic) id <ASPatientDelegate> delegate;

- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;

@end
// @protocol ASPatientDelegate можно и без NSObject
@protocol ASPatientDelegate <NSObject>
@required
- (void) patientFeelsBad: (ASPatient* ) patient;
- (void) patient:(ASPatient*) patient iHaveQuestion:(NSString*) question;

@end
