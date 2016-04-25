//
//  DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_h__
#define DKHelper_h__

#import <UIKit/UIKit.h>

//! Project version number for DKHelper.
FOUNDATION_EXPORT double DKHelperVersionNumber;

//! Project version string for DKHelper.
FOUNDATION_EXPORT const unsigned char DKHelperVersionString[];

#pragma mark - Imports

#import "UIView+DKHelper.h"
#import "UIDevice+DKHelper.h"
#import "NSString+DKHelper.h"
#import "NSObject+DKHelper.h"
#import "NSDate+DKHelper.h"
#import "UIColor+DKHelper.h"
#import "CGSize+DKHelper.h"
#import "CGRect+DKHelper.h"
#import "UIImageView+DKHelper.h"
#import "NSNumber+DKHelper.h"
#import "NSArray+DKHelper.h"
#import "UIScreen+DKHelper.h"
#import "NSPredicate+DKHelper.h"
#import "UIImage+DKHelper.h"
#import "NSBundle+DKHelper.h"
#import "NSOperationQueue+DKHelper.h"
#import "DKRegex.h"

#pragma mark - AppVersion

/**
 * Return a string describing the current version of the application including the build number.
 */
NSString * _Nonnull appVersion();

#pragma mark - Math

/**
 * Convert degrees to radians.
 */
CGFloat degreesToRadians(CGFloat degrees);

/**
 * Convert radians to degrees.
 */
CGFloat radiansToDegrees(CGFloat radians);

#pragma mark - Localization

/**
 * Return the localized version as a string of the key.
 *
 * @discussion This function is a short verion of "NSLocalizedString(key, nil)".
 *
 * @param key The key as a string referencing the localized entity.
 * @return The localized string of the key.
 */
NSString * _Nonnull L(NSString * _Nonnull key);

#pragma mark - Object verification

/**
 * Get an object from a dictionary.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key into the given dictionary.
 * @return If valid the object for key from the dictionary. Returns nil otherwise.
 * @see BOOL VALID(NSDictionary *dict, id key);
 */
id _Nullable OBJECT(NSDictionary * _Nullable dict, id _Nullable key);

/**
 * Get an object from a second level dictionary.
 *
 * @discussion This function add some validity tests around this: [[dictionary objectForKey:key1] objectForKey:key2]
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key1 An object used as the first key into the given dictionary.
 * @param key2 An object used as the second the given dictionary.
 * @return If valid the second level object for the keys from the dictionary. Returns nil otherwise.
 * @see BOOL VALID(NSDictionary *dict, id key);
 */
id _Nullable OBJECT_FOR_KEYS(NSDictionary * _Nullable dict, id _Nullable key1, id _Nullable key2);

/**
 * Check the validity of an object inside a dictionary.
 *
 * @param dict A NSDictionary object.
 * @param key An object used as a key into the given dictionary.
 * @return True if the dictionary if valid, the key and the value valid and different from NSNull. Returns false otherwise.
 */
BOOL VALID(NSDictionary * _Nullable dict, id _Nullable key);

#pragma mark - Getters

/**
 * Extract a CGFloat value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new CGFloat value extracted from the given dictionary. If the object isn't valid returns 0 instead.
 */
CGFloat GET_FLOAT(NSDictionary * _Nullable dict, id _Nullable key);

/**
 * Extract a NSInteger value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSInteger value extracted from the given dictionary. If the object isn't valid returns 0 instead.
 */
NSInteger GET_INTEGER(NSDictionary * _Nullable dict, id _Nullable key);

/**
 * Extract a NSNumber value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract a NSNumber value without crashing if an object isn't valid.
 *
 * If the object is a NSString the NSNumber will be generated with a NSNumberFormatterDecimalStyle and a locale set to `en_US`.
 *
 * If the object already is a NSNumber then it will be simply returned.
 *
 * If the object is none of the above nil will be returned.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSNumber value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSNumber * _Nullable GET_NUMBER(NSDictionary * _Nullable dict, id _Nullable key);

/**
 * Extract a NSDate value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 * 
 * If the object is a NSString the NSDate will be generated using the `NSDate.ISO8601StringFormat` format.
 *
 * If the object already is a NSDate then it will be simply returned.
 *
 * If the object is none of the above nil will be returned.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSDate value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSDate * _Nullable GET_DATE(NSDictionary * _Nullable dict, id _Nullable key);

/**
 * Extract a NSDate value out of a dictionary with a given key and a date format.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * If the object is a NSString the NSDate will be generated using the given format.
 *
 * If the object already is a NSDate then it will be simply returned.
 *
 * If the object is none of the above nil will be returned.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @param format the format of the given date
 * @return A new NSDate value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSDate * _Nullable GET_DATE_FORMAT(NSDictionary * _Nullable dict, id _Nullable key, NSString* _Nullable format);

/**
 * Extract a NSString value out of a dictionary with a given key.
 *
 * @discussion This function add some validity tests to extract the value without crashing if an object isn't valid.
 *
 * If the object is an empty string object, nil will be returned.
 *
 * @param dict The NSDictionary object to extract the object from.
 * @param key An object used as a key.
 * @return A new NSString value extracted from the given dictionary. If the object isn't valid returns nil instead.
 */
NSString * _Nullable GET_STRING(NSDictionary * _Nullable dict, id _Nullable key);

#pragma mark - DKLog

/**
 *  Log the formatted string if current build in on DEBUG and if the boolean is true.
 *
 *  @param verbose Enable the log or not.
 *  @param format  Format of the string to log.
 *  @param ...     Arguments of the formatted string.
 */
void DKLog(BOOL verbose, NSString * _Nonnull format, ...);

/**
 *  Log the current app version.
 */
void logAppVersion();

#pragma mark - Numbers

/**
 * Check and return a value between minimal and maximum ones. If the given value is outside its limits then returns the appropriate value.
 *
 * @param value A CGFloat value to be return if in between the 'min' and 'max' parameters
 * @param min A CGFloat value corresponding to the minimal 'min' value.
 * @param min A CGFloat value corresponding to the maximal 'max' value.
 * @return A CGFloat value corresponding to the value if it is in between the min/max limits. Otherwise returns either the minimal or maximal value.
 */
CGFloat MINMAX(CGFloat value, CGFloat min, CGFloat max);

/**
 * Cast an 'int' value as a 'long' type.
 */
long cL(NSInteger v);

/**
 * Cast an 'int' value as a 'unsigned long' type.
 */
unsigned long cUL(NSUInteger v);

#pragma mark - Preprocessor Defines

#define DK_APP_VERSION                              appVersion()
#define __STRING_PRETTY_FUNCTION__                  [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
#define is35InchScreen                              [UIScreen is35InchScreen]
#define is4InchScreen                               [UIScreen is4InchScreen]
#define is47InchScreen                              [UIScreen is47InchScreen]
#define is55InchScreen                              [UIScreen is55InchScreen]

#endif
