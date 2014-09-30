//
//  DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_h__
#define DKHelper_h__

#pragma mark - Imports

#import "UIView+DKHelper.h"
#import "UIDevice+DKHelper.h"
#import "NSString+DKHelper.h"
#import "UIImage+DKHelper.h"
#import "NSObject+DKHelper.h"
#import "NSDate+DKHelper.h"
#import "UIColor+DKHelper.h"
#import "CGSize+DKHelper.h"
#import "CGRect+DKHelper.h"
#import "UIImageView+DKHelper.h"
#import "NSNumber+DKHelper.h"
#import "NSArray+DKHelper.h"
#import "UIScreen+DKHelper.h"

#pragma mark - AppVersion

/**
 * Return a string describing the current version of the application including the build number.
 */
NSString *      appVersion();

#pragma mark - Math

/**
 * Convert degrees to radians.
 */
CGFloat         degreesToRadians(CGFloat degrees);

/**
 * Convert radians to degrees.
 */
CGFloat         radiansToDegrees(CGFloat radians);

#pragma mark - Localization

/**
 * Return the localized version as a string of the key.
 *
 * @discussion This function is a short verion of "NSLocalizedString(key, nil)".
 * @param key The key as a string referencing the localized entity.
 * @return The localized string of the key.
 */
NSString *      L(NSString *key);

#pragma mark - Object verification

/**
 * Get an object from a dictionary.
 *
 * @param dict A NSDictionary object.
 * @param key An object used as a key into the given dictionary.
 * @return If valid returns the object for key from the dictionary. Returns nil otherwise.
 * @see BOOL VALID(NSDictionary *dict, id key);
 */
id              OBJECT(NSDictionary *dict, id key);

/**
 * Get an object from a second level dictionary.
 *
 * @discussion This function add some validity test around this: [[dictionary objectForKey:key1] objectForKey:key2]
 * @param dict A NSDictionary object.
 * @param key1 An object used as the first key into the given dictionary.
 * @param key2 An object used as the second the given dictionary.
 * @return If valid returns the second level object for the keys from the dictionary. Returns nil otherwise.
 * @see BOOL VALID(NSDictionary *dict, id key);
 */
id              OBJECT_FOR_KEYS(NSDictionary *dict, id key1, id key2);

/**
 * Check the validity of an object inside a dictionary.
 *
 * @param dict A NSDictionary object.
 * @param key An object used as a key into the given dictionary.
 * @return Returns true if the dictionary and if the object for key exist and are different from NSNull. Returns false otherwise.
 */
BOOL            VALID(NSDictionary *dict, id key);

#pragma mark - Getters

CGFloat         GET_FLOAT(NSDictionary *dict, id key);
NSInteger       GET_INTEGER(NSDictionary *dict, id key);
NSNumber *      GET_NUMBER(NSDictionary *dict, id key);
NSDate *        GET_DATE(NSDictionary *dict, id key);
NSString *      GET_STRING(NSDictionary *dict, id key);

#pragma mark - Regex

NSString *      RGX_FILE_EXTENSION();
NSString *      RGX_FILE_NAME_AND_EXTENSION();

#pragma mark - DKLog

void            DKLog(BOOL verbose, NSString *format, ...);

#pragma mark - Numbers

BOOL            MINMAX(CGFloat v, CGFloat min, CGFloat max);
long            cL(int v);
unsigned long   cUL(int v);

#pragma mark - Predicate

NSPredicate *   OR_PREDICATE(NSPredicate *a, NSPredicate *b);
NSPredicate *   AND_PREDICATE(NSPredicate *a, NSPredicate *b);

#pragma mark - Preprocessor Defines

#define DK_APP_VERSION                              appVersion()
#define __STRING_PRETTY_FUNCTION__                  [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
#define iOS7Delta                                   [UIDevice iOS7Delta]
#define is35InchScreen                              [UIScreen is35InchScreen]
#define is4InchScreen                               [UIScreen is4InchScreen]
#define is47InchScreen                              [UIScreen is47InchScreen]
#define is55InchScreen                              [UIScreen is55InchScreen]

#endif
