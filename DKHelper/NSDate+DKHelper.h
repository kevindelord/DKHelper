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

/**
 * Returns a new NSDate object created from a string with a specified format.
 *
 * @param string The NSString object representing the date.
 * @param format The NSString object representing the format in which the string is formatted.
 * @discussion Example of code will be [NSDate dateFromString:@"1970-01-01" format:@"yyyy-MM-dd"];
 * @return A NSDate created from a given string. NULL if the date isn't valid.
 */
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

/**
 * Returns a new NSDate object created from a string with a default format.
 *
 * @param string The NSString object representing the date. The string must be formated like @"yyyy-MM-dd"
 * @return A NSDate created with the ISO8601 format. NULL if the date isn't valid.
 */
+ (NSDate *)dateFromDayString:(NSString *)string;

/**
 * Returns a new NSDate object created from a string with a IOS8601 default format.
 *
 * @param string The NSString object representing the date. The string must be formated like @"yyyy-MM-dd'T'HH:mm:ss'Z'"
 * @return A NSDate object created with the ISO8601 format. NULL if the date isn't valid.
 */
+ (NSDate *)dateFromString:(NSString *)string;

/**
 * Returns a new NSDate object containing the current date of the day with a IOS8601 default format.
 * The number of hours, minutes, seconds and the GMT timezone is set to 0.
 *
 * @return A NSDate containing the current date of the day. The date format is the ISO8601 one.
 */
+ (NSDate *)currentDayDate;

/**
 * Returns a new NSDate object that is set to the receiver's date plus one month in the future.
 *
 * @return A NSDate set one month in the future from the receiver's date.
 */
- (NSDate *)dateByAddingOneMonthInterval;

@end

#endif