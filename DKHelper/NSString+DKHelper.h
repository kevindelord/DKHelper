//
//  NSString+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_NSString_h__
#define DKHelper_NSString_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of NSString to add a bunch of helping methods.
 */
@interface NSString (DKHelper)

#pragma mark - NSString+NSDate

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
 * @param pattern A NSString value representing a regular expression to search with.
 * @return A NSString representing the first occurence. NULL if there is no match.
 */
- (NSString *)firstOccuranceForPattern:(NSString *)pattern;

@end

#endif