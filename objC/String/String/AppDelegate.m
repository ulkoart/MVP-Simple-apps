//
//  AppDelegate.m
//  String
//
//  Created by Улько Артем Викторович on 17.10.2022.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	/// Сравнение строк
	/*
	NSString* string1 = @"String 1";
	NSString* string2 = @"String 2";

	NSArray* array = [NSArray arrayWithObjects:string1, string2, nil];

	for (NSString* string in array) {
		if ([string isEqualToString:@"String 1"]) {
			NSLog(@"index = %d", [array indexOfObject:string]);
		}
	}
	*/
	
	/// Поиск строк по подстроке / range
	
	/*
	NSString* string = @"Hello World! World";
	NSLog(@"%@", string);

	// NSRange range = [string rangeOfString:@"World"];

	NSRange range = [string rangeOfString:@"world" options:NSCaseInsensitiveSearch | NSBackwardsSearch];
	
	if (range.location != NSNotFound) {
		NSLog(@"range = %@", NSStringFromRange(range));
	} else {
		NSLog(@"not found");
	}
	*/



	NSString* text = @"It is possible to subclass NSString (and NSMutableString), but doing so requires providing storage facilities for the string (which is not inherited by subclasses) and implementing two primitive methods. The abstract NSString and NSMutableString classes are the public interface of a class cluster consisting mostly of private, concrete classes that create and return a string object appropriate for a given situation. Making your own concrete subclass of this cluster imposes certain requirements (discussed in Methods to Override).";
	/*
	/// Поиск и обрезка
	// text = [text substringToIndex:10]; // до
	// text = [text substringWithRange:NSMakeRange(10, 15)];
	
	NSRange range = [text rangeOfString:@"The abstract NSString"];

	if (range.location != NSNotFound) {
		text = [text substringToIndex:range.location];
	}

	NSLog(@"%@", text);
	*/
	
	
	/*
	/// Подсчет слов
	NSRange searchRange = NSMakeRange(0, [text length]);
	NSInteger counter = 0;
	
	while (YES) {
		NSRange range = [text rangeOfString:@"NSString" options:0 range:searchRange];

		if (range.location != NSNotFound) {
			NSInteger index = range.location + range.length;
			searchRange.location = index;
			searchRange.length = (NSInteger)[text length] - index;
			counter++;
			
			NSLog(@"range = %@", NSStringFromRange(range));
		} else {
			break;
		}
	}

	NSLog(@"counter = %d", counter);
	*/
	

	/*
	/// Заменить все подстроки на
	text = [text stringByReplacingOccurrencesOfString:@"NSString" withString:@"KEK"];
	NSLog(@"%@", text);
	*/

	text = [text uppercaseString];
	NSLog(@"%@", text);

	text = [text lowercaseString];
	NSLog(@"%@", text);

	text = [text capitalizedString];
	NSLog(@"%@", text);

	NSLog(@"%d", [@"512" intValue]);

	text = [text stringByReplacingOccurrencesOfString:@"," withString:@"LOL"];
	NSArray* array = [text componentsSeparatedByString:@" "];
	NSLog(@"%@", array);

	text = [array componentsJoinedByString:@"_"];
	NSLog(@"%@", text);

	NSString* s1 = @"Hello ";
	NSString* s2 = @"World!";

	NSString* s3 = [s1 stringByAppendingString:s2];

	NSLog(@"%@", s3);

	return YES;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
	// Called when a new scene session is being created.
	// Use this method to select a configuration to create the new scene with.
	return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
	// Called when the user discards a scene session.
	// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
