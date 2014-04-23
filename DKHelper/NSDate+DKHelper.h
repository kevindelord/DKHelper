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

#define ISO8601_DATE_FORMAT         @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"

@interface NSDate (NSString)

#pragma mark - NSDate+NSString

/**
 * Returns a new NSDate object created from a string with a specified format.
 *
 * @param string The date as a string.
 * @param format The date format of the string.
 * @discussion Example of code will be [NSDate dateFromString:@"1970-01-01" format:@"yyyy-MM-dd"];
 * @return The new NSDate object created from a given string.
 */
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

/**
 * Returns a new NSDate object created from a string with a default format.
 *
 * @param string The date as a string. The string must be formated like @"yyyy-MM-dd"
 * @return The new NSDate object created with the ISO8601 format. NULL if the date is wrong.
 */
+ (NSDate *)dateFromDayString:(NSString *)string;

/**
 * Returns a new NSDate object created from a string with a IOS8601 default format.
 *
 * @param string The date as a string. The string must be formated like @"yyyy-MM-dd'T'HH:mm:ss'Z'"
 * @return The new NSDate object created with the ISO8601 format. NULL if the date is wrong.
 */
+ (NSDate *)dateFromString:(NSString *)string;

/**
 * Returns a new NSDate object containing the current date of the day with a IOS8601 default format.
 *
 * @return The new NSDate object containing the current date of the day. The date format is the ISO8601 one.
 * The number of hours, minutes and seconds is set to 0.
 */
+ (NSDate *)currentDayDate;

/**
 * Returns a new NSDate object that is set to the receiver's date plus one month in the future.
 *
 * @return The new NSDate object set one month in the future from the receiver's date.
 */
- (NSDate *)dateByAddingOneMonthInterval;

@end

#endif