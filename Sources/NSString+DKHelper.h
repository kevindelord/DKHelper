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

#pragma mark - NSString+Random

/**
 * Creates and returns a random numeric string.
 *
 * @param length The desired length of the generated string.
 * @return A random numeric NSString object.
 */
+ (instancetype _Nonnull)randomNumericString:(NSUInteger)length;

/**
 * Creates and returns a random alpha-numeric string.
 *
 * @param length The desired length of the generated string.
 * @return A random alpha-numeric NSString object.
 */
+ (instancetype _Nonnull)randomString:(NSUInteger)length;

/**
 * Creates and returns a random alpha-numeric string.
 *
 * @discussion The length of the string is randomly set between 1 and 100
 * @return A random alpha-numeric NSString object.
 */
+ (instancetype _Nonnull)randomString;

#pragma mark - NSString+NSDate

/**
 * Returns a new NSString object created from a NSDate object with a specific format. Note: The system time zone is used for the convertion.
 *
 * @param date The NSDate to convert into a string. Must not be NULL.
 * @param format The NSString object representing the format in which the date is formatted. Must not be NULL.
 * @return A NSString containing the date with the given date format. NULL if the date or the format isn't valid.
 */
+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date format:(NSString * _Nonnull)format;

/**
 * Returns a new NSString object created from a NSDate object with a specific format.
 *
 * @param date The NSDate to convert into a string. Must not be NULL.
 * @param format The NSString object representing the format in which the date is formatted. Must not be NULL.
 * @param timezone The NSTimeZone to use for the convertion. Must no be NULL
 * @return A NSString containing the date with the given date format. NULL if the date or the format isn't valid.
 */
+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date format:(NSString * _Nonnull)format timeZone:(NSTimeZone * _Nonnull)timeZone;
/**
 * Returns a new NSString object created from a NSDate object with a specific style. Note: The system time zone is used for the convertion.
 *
 * @param date The NSDate to convert into a string. Must not be NULL.
 * @param style The NSDateFormatterStyle value to configure the formatter.
 * @return A NSString containing the date with the given date style. NULL if the date isn't valid.
 */
+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date style:(NSDateFormatterStyle)style;

/**
 * Returns a new NSString object created from a NSDate object with a specific style.
 *
 * @param date The NSDate to convert into a string. Must not be NULL.
 * @param style The NSDateFormatterStyle value to configure the formatter.
 * @param timezone The NSTimeZone to use for the convertion. Must no be NULL
 * @return A NSString containing the date with the given date style. NULL if the date isn't valid.
 */
+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date style:(NSDateFormatterStyle)style timeZone:(NSTimeZone * _Nonnull)timeZone;

#pragma mark - NSString+Helper

/**
 * Returns a new NSString object created from the receiver without any duplicated characters.
 *
 * @return A NSString without any duplicated characters.
 */
- (instancetype _Nonnull)removeDuplicatedCharacters;

/**
 * Returns a new NSString object created from the receiver with a randomized characters' order.
 *
 * @return A NSString with a randomized characters' order.
 */
- (instancetype _Nonnull)randomizedString;

/**
 * Returns a new string made by removing from both ends of the receiver whitespace characters.
 *
 * @return A new string without heading and leading whitespaces.
 */
- (instancetype _Nonnull)trimWhitespaces;

/**
 * Returns a new string made by removing from both ends of the receiver any newlines and illegal characters.
 *
 * @return A new string without newlines and illegal characters.
 */
- (instancetype _Nonnull)removeAllNewlinesAndIllegalChars;

#pragma mark - NSString+Regex

/**
 * TRUE if the receiver is valid Email address; otherwise FALSE.
 *
 * @discussion Method from HockeySDK (see BITHockeyHelper.m -> bit_validateEmail(NSString))
 */
@property (nonatomic) BOOL isEmail;

/**
 * TRUE if the receiver is a numeric string; otherwise FALSE.
 */
@property (nonatomic) BOOL isNumeric;

/**
 * TRUE if the receiver is an alpha numeric string; otherwise FALSE.
 */
@property (nonatomic) BOOL isAlphaNumeric;

/**
 * TRUE if the receiver is a valid phone number string; otherwise FALSE.
 *
 * @discussion A valid phone number starts yith '00' and contains between 9 and 13 characters.
 */
@property (nonatomic) BOOL isPhoneNumber;

/**
 * Returns a new NSString object corresponding to the first occurence of a given regex pattern within the receiver's string.
 *
 * @param pattern A NSString value representing a regular expression to search with.
 * @return A NSString representing the first occurence. nil if there is no match.
 */
- (instancetype _Nullable)firstOccuranceForPattern:(NSString * _Nonnull)pattern;

/**
 * Returns a new NSString object corresponding to the last occurence of a given regex pattern within the receiver's string.
 *
 * @param pattern A NSString value representing a regular expression to search with.
 * @return A NSString representing the last occurence. nil if there is no match.
 */
- (instancetype _Nullable)lastOccuranceForPattern:(NSString * _Nonnull)pattern;

@end

#endif