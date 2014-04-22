//
//  NSDate+DKHelper.h
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#ifndef DKHelper_NSDate_h__
#define DKHelper_NSDate_h__

#import <UIKit/UIKit.h>

@interface NSDate (NSString)

#pragma mark - NSDate+NSString

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;
+ (NSDate *)dateFromDayString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)currentDate;
- (NSDate *)dateByAddingOneMonthInterval;

@end

#endif