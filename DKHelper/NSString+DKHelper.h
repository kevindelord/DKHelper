//
//  NSString+DKHelper.h
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#ifndef DKHelper_NSString_h__
#define DKHelper_NSString_h__

#import <UIKit/UIKit.h>

@interface NSString (DKHelper)

#pragma mark - NSString+NSDate

/**
 * Returns a new NSString object containing the name of the month for the given NSDate.
 *
 * @param date The NSDate from which the month name will be generated.
 * @return A NSString containing the date with the ISO8601 date format. The string is localized with the current NSLocale. NULL if the date isn't valid.
 */
+ (NSString *)monthNameFromDate:(NSDate *)date;

/**
 * Returns a new NSString object created from a NSDate object with a specific format.
 *
 * @param date The NSDate to convert into a string.
 * @param format The NSString object representing the format in which the date is formatted.
 * @return A NSString containing the date with the given date format. NULL if the date isn't valid.
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

#pragma mark - NSString+Helper

/**
 * Returns a new NSString object created from the receiver without any duplicated characters.
 *
 * @return A NSString without any duplicated characters.
 */
- (NSString *)removeDuplicateCharacters;

/**
 * Returns a new NSString object created from the receiver with a randomized characters' order.
 *
 * @return A NSString with a randomized characters' order.
 */
- (NSString *)randomizedString;

#pragma mark - NSString+Regex

/**
 * Returns a new NSString object corresponding to the first occurence of a given regex pattern within the receiver's string.
 *
 * @return A NSString representing the first occurence. NULL if there is no match.
 */
- (NSString *)firstOccuranceForPattern:(NSString *)pattern;

@end

#endif