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

#pragma mark - Object verification

id              OBJECT(NSDictionary *dict, id key);
id              OBJECT_FOR_KEYS(NSDictionary *dict, id key1, id key2);
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

// Log
#define __STRING_PRETTY_FUNCTION__                  [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]

// Screen
#define is35InchScreen                              [UIScreen is35InchScreen]
#define is4InchScreen                               [UIScreen is4InchScreen]
#define is47InchScreen                              [UIScreen is47InchScreen]
#define is55InchScreen                              [UIScreen is55InchScreen]

// iOS version
#define iOS7Delta                                   [UIDevice iOS7Delta]
#define SYSTEM_VERSION_EQUAL_TO(v)                  [UIDevice systemVersionEqualTo:v]
#define SYSTEM_VERSION_GREATER_THAN(v)              [UIDevice systemVersionGreaterThan:v]
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  [UIDevice systemVersionGreaterThanOrEqualTo:v]
#define SYSTEM_VERSION_LESS_THAN(v)                 [UIDevice systemVersionLessThan:v]
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     [UIDevice systemVersionLessThanOrEqualTo:v]

// Common File Formats
#define IMAGE_FILE_EXTENSIONS                       NSArray.imageFileExtensions
#define AUDIO_FILE_EXTENSIONS                       NSArray.audioFileExtensions
#define VIDEO_FILE_EXTENSIONS                       NSArray.videoFileExtensions

#endif
