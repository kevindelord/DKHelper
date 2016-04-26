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

/**
 * A categorized class of NSDate to add a bunch of helping methods.
 */
@interface NSDate (DKHelper)

#pragma mark - Comparison

/**
 * Check whether the date receiver is older or equal than the current date time updated with new components.
 *
 * @param dateComponent The NSDateComponents object used to update the current date time.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThan:(NSDateComponents * _Nonnull)dateComponent;

/**
 * Check whether the date receiver is older or equal than the given parameters.
 *
 * @param years The number of years.
 * @param months The number of months.
 * @param days The number of days.
 * @param hours The number of hours.
 * @param minutes The number of minutes.
 * @param seconds The number of seconds.
 * @return TRUE if the receiver is older or equal than the given parameters; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThan:(NSInteger)years months:(NSInteger)months days:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds;

/**
 * Check whether the date receiver is older or equal than n years.
 *
 * @param year The number of years.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThanYearInterval:(NSInteger)year;

/**
 * Check whether the date receiver is older or equal than n months.
 *
 * @param months The number of months.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThanMonthInterval:(NSInteger)month;

/**
 * Check whether the date receiver is older or equal than n days.
 *
 * @param days The number of days.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThanDayInterval:(NSInteger)days;

/**
 * Check whether the date receiver is older or equal than n hours.
 *
 * @param hours The number of hours.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThanHourInterval:(NSInteger)hours;

/**
 * Check whether the date receiver is older or equal than n minutes.
 *
 * @param minutes The number of minutes.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThanMinuteInterval:(NSInteger)minutes;

/**
 * Check whether the date receiver is older or equal than n seconds.
 *
 * @param seconds The number of seconds.
 * @return TRUE if the receiver is older or equal than the given parameter; FALSE otherwise.
 */
- (BOOL)isOlderOrEqualThanSecondInterval:(NSInteger)seconds;

#pragma mark - NSDate+NSString

/**
 * Returns a new NSDate object created from a string with a specified style.
 *
 * @discussion The system time zone is used.
 *
 * @param string The NSString object representing the date.
 * @param dateSytle The NSDateFormatterStyle object representing the style of the date.
 * @return A NSDate created from a given string. NULL if the date isn't valid.
 */
+ (instancetype _Nullable)dateFromString:(NSString * _Nonnull)string style:(NSDateFormatterStyle)dateStyle;

/**
 * Returns a new NSDate object created from a string with a specified format.
 *
 * @discussion Example of code will be [NSDate dateFromString:@"1970-01-01" format:@"yyyy-MM-dd"];
 * @discussion The system time zone is used.
 *
 * @param string The NSString object representing the date.
 * @param format The NSString object representing the format in which the string is formatted.
 * @return A NSDate created from a given string. NULL if the date isn't valid.
 */
+ (instancetype _Nullable)dateFromString:(NSString * _Nonnull)string format:(NSString * _Nonnull)format;

/**
 * Returns a new NSDate object created from a string.
 *
 * @discussion The string has to be formatted with the ISO8601 date format.
 *
 * @param string The NSString object representing the date.
 * @return A NSDate created from a given string. NULL if the date isn't valid.
 */
+ (instancetype _Nullable)dateFromISOString:(NSString * _Nonnull)string;

/**
 * Returns a new NSDate object created from a string with a default format.
 *
 * @param string The NSString object representing the date. The string must be formated like @"yyyy-MM-dd"
 * @return A NSDate created with the ISO8601 format. NULL if the date isn't valid.
 */
+ (instancetype _Nullable)dateFromDayString:(NSString * _Nonnull)string;

/**
 * Returns a new NSString object created from the receiver's date.
 *
 * @return A NSString containing the date as a string of the receiver.
 */
- (NSString * _Nonnull)stringValue;

/**
 * Returns a new NSString object created from the receiver's date with the ISO8601 format.
 *
 * @return A ISO8601 formatted NSString containing the receiver's date.
 */
- (NSString * _Nonnull)ISO8601StringValue;

#pragma mark - Getter Methods

/**
 * Returns the year component of the receiver as a NSInteger.
 *
 * @return A NSInteger corresponding to the year component of the receiver.
 */
- (NSInteger)year;

/**
 * Returns the month component of the receiver as a NSInteger.
 *
 * @return A NSInteger corresponding to the month component of the receiver.
 */
- (NSInteger)month;

/**
 * Returns the day component of the receiver as a NSInteger.
 *
 * @return A NSInteger corresponding to the day component of the receiver.
 */
- (NSInteger)day;

/**
 * Returns the hour component of the receiver as a NSInteger.
 *
 * @return A NSInteger corresponding to the hour component of the receiver.
 */
- (NSInteger)hour;

/**
 * Returns the minute component of the receiver as a NSInteger.
 *
 * @return A NSInteger corresponding to the minute component of the receiver.
 */
- (NSInteger)minute;

/**
 * Returns the second component of the receiver as a NSInteger.
 *
 * @return A NSInteger corresponding to the second component of the receiver.
 */
- (NSInteger)second;

/**
 * Returns a new NSDate object containing the same date as the current object set at midnight.
 *
 * @discussion The time zone GMT+0 is used.
 *
 * @return A NSDate containing a date with the hours, minutes and seconds set at 0.
 */
- (instancetype _Nullable)midnightDate;

/**
 * Returns a new NSDate object containing the current date of the day with a IOS8601 default format.
 *
 * @discussion The number of hours, minutes, seconds and the GMT timezone is set to 0.
 * @discussion The time zone GMT+0 is used.
 *
 * @return A NSDate containing the current date of the day. The date format is the ISO8601 one.
 */
+ (instancetype _Nullable)currentDayDate;

#pragma mark - Display methods

/**
 * Returns a new NSString object containing the name of the month of the receiver.
 *
 * @return A NSString containing the month name of the receiver. The string is localized with the current NSLocale.
 */
- (NSString * _Nonnull)monthName;

/**
 * Returns a new NSString object containing the name of the day of the receiver.
 *
 * @return A NSString containing the day name of the receiver. The string is localized with the current NSLocale.
 */
- (NSString * _Nonnull)dayName;

/**
 * Returns a localized string representing the current NSDate object with its day number, month name, hour and minute.
 *
 * @discussion The styles used for the NSDateFormatter are `LongStyle` for the date and `ShortStyle` for the time.
 * @return A localized string representing the current NSDate object.
 */
- (NSString * _Nonnull)fullDisplayTime;

/**
 * Returns a localized string representing the current NSDate object with its hour and minute.
 *
 * @discussion The styles used for the NSDateFormatter are `NoStyle` for the date and `ShortStyle` for the time.
 * @return A localized string representing the current NSDate object.
 */
- (NSString * _Nonnull)hourDisplayTime;

/**
 * Returns a localized string representing the current NSDate object using the `MediumStyle` format.
 *
 * @discussion The styles used for the NSDateFormatter are `MediumStyle` for the date and `NoStyle` for the time.
 * @return A localized string representing the current NSDate object.
 */
- (NSString * _Nonnull)displayableString;

#pragma mark - Log methods

/**
 * Log the receiver on the console using a NSDateFormatter object with all time styles and the given date style.
 *
 * @param dateStyle The dateStyle used by the NSDateFormatter to log the current receiver on the console.
 */
- (void)logCurrentDateWithDateStyleAndAllTimeStyle:(NSDateFormatterStyle)dateStyle;

/**
 * Log the receiver on the console using a NSDateFormatter object with all date and time styles.
 */
- (void)logAllFormats;

#pragma mark - Adding Interval

/**
 * Returns a new NSDate object with new date conponents.
 *
 * @param years The number of year units.
 * @param months The number of month units.
 * @param days The number of day units.
 * @param hours The number of hour units.
 * @param minutes The number of minute units.
 * @param seconds The number of second units.
 * @return A NSDate set with new date components from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingIntervalsWithYear:(NSInteger)years months:(NSInteger)months days:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds;

/**
 * Returns a new NSDate object with n years interval from the receiver's.
 *
 * @param yearInterval The number of year units.
 * @return A NSDate set with n years from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingYearInterval:(NSInteger)yearInterval;

/**
 * Returns a new NSDate object with n months interval from the receiver's.
 *
 * @param monthInterval The number of month units.
 * @return A NSDate set with n months from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingMonthInterval:(NSInteger)monthInterval;

/**
 * Returns a new NSDate object with n days interval from the receiver's.
 *
 * @param dayInterval The number of day units.
 * @return A NSDate set with n days from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingDayInterval:(NSInteger)dayInterval;

/**
 * Returns a new NSDate object with n hours interval from the receiver's.
 *
 * @param hourInterval The number of hour units.
 * @return A NSDate set with n hours from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingHourInterval:(NSInteger)hourInterval;

/**
 * Returns a new NSDate object with n minutes interval from the receiver's.
 *
 * @param minuteInterval The number of minute units.
 * @return A NSDate set with n minutes from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingMinuteInterval:(NSInteger)minuteInterval;

/**
 * Returns a new NSDate object with n seconds interval from the receiver's.
 *
 * @param secondInterval The number of second units.
 * @return A NSDate set with n seconds from the receiver's date.
 */
- (instancetype _Nullable)dateByAddingSecondInterval:(NSInteger)secondInterval;

#pragma mark - ISO formats

/**
 * Returns the default ISO 8601 date format as a string.
 *
 * @return A NSString object corresponding to the default ISO 8601 date format.
 */
+ (NSString * _Nonnull)ISO8601StringFormat;

@end

#endif