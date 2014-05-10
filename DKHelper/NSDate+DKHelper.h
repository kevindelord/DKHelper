//
//  NSDate+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_NSDate_h__
#define DKHelper_NSDate_h__

#import <UIKit/UIKit.h>

@interface NSDate (NSString)

#pragma mark - NSDate+NSString

/**
 * Returns a new NSDate object created from a string with a specified format.
 *
 * @discussion Example of code will be [NSDate dateFromString:@"1970-01-01" format:@"yyyy-MM-dd"];
 *
 * @param string The NSString object representing the date.
 * @param format The NSString object representing the format in which the string is formatted.
 * @return A NSDate created from a given string. NULL if the date isn't valid.
 */
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

/**
 * Returns a new NSDate object created from a string.
 *
 * @discussion The string has to be formatted with the ISO8601 date format.
 *
 * @param string The NSString object representing the date.
 * @return A NSDate created from a given string. NULL if the date isn't valid.
 */
+ (NSDate *)dateFromISOString:(NSString *)string;

/**
 * Returns a new NSDate object created from a string with a default format.
 *
 * @param string The NSString object representing the date. The string must be formated like @"yyyy-MM-dd"
 * @return A NSDate created with the ISO8601 format. NULL if the date isn't valid.
 */
+ (NSDate *)dateFromDayString:(NSString *)string;

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

/**
 * Returns a new NSDate object that is set to the receiver's date plus one day in the future.
 *
 * @return A NSDate set one day in the future from the receiver's date.
 */
- (NSDate *)dateByAddingOneDayInterval;

/**
 * Returns a new NSString object created from the receiver's date.
 *
 * @return A NSString containing the date as a string of the receiver.
 */
- (NSString *)stringValue;

/**
 * Returns a new NSString object created from the receiver's date with the ISO8601 format.
 *
 * @return A ISO8601 formatted NSString containing the receiver's date.
 */
- (NSString *)ISO8601StringValue;

/**
 * Returns a new NSString object containing the name of the month of the receiver.
 *
 * @return A NSString containing the month name of the receiver. The string is localized with the current NSLocale.
 */
- (NSString *)monthName;

/**
 * Returns a new NSString object containing the name of the day of the receiver.
 *
 * @return A NSString containing the day name of the receiver. The string is localized with the current NSLocale.
 */
- (NSString *)dayName;

/**
 * Returns a new NSDate object containing the same date as the current object set at midnight.
 *
 * @return A NSDate containing a date with the hours, minutes and seconds set at 0.
 */
- (NSDate *)midnightDate;

@end

#endif