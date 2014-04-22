//
//  DKHelper.h
//  Pons
//
//  Created by kevin delord on 16/01/14.
//  Copyright (c) 2014 smartmobilefactory. All rights reserved.
//

#ifndef DKHelper_h__
#define DKHelper_h__

#pragma mark - NSObject+Block

@interface NSObject (Block)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end

#pragma mark - UIView+RoundCorner

@interface UIView (RoundCorner)

- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius;

@end

#pragma mark - NSString+NSDate

@interface NSString (NSDate)

+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)monthNameFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

@end

#pragma mark - NSString+Helper

@interface NSString (Helper)

- (NSString *)removeDuplicateCharacters;
- (NSString *)randomizedString;

@end;

#pragma mark - NSString+Regex

@interface NSString (Regex)

- (NSString *)firstOccuranceForPattern:(NSString *)pattern;

@end;

#pragma mark - UIImage+Retina4

@interface UIImage (Retina4)

+ (void)initialize;
+ (UIImage *)retina4ImageNamed:(NSString *)imageName;

@end

#pragma mark - NSDate+NSString

@interface NSDate (NSString)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;
+ (NSDate *)dateFromDayString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)currentDate;
- (NSDate *)dateByAddingOneMonthInterval;

@end

#pragma mark - CGRect Methods

@interface UIView (CGRect)

+ (void)logRect:(CGRect)f container:(CGRect)container;
+ (BOOL)isFrame:(CGRect)frame insideOfContainer:(CGRect)container;
+ (CGRect)setFrame:(CGRect)frame insideOfContainer:(CGRect)container;
+ (CGSize)adjustSize:(CGSize)size toCGRect:(CGRect)rect;
+ (CGSize)adjustSize:(CGSize)size withSize:(CGSize)rSize;

- (void)setFrameOrigin:(CGPoint)origin;
- (void)setFrameSize:(CGSize)size;
- (void)setFrameWidth:(CGFloat)width;
- (void)setFrameHeight:(CGFloat)height;
- (void)setFrameX:(CGFloat)x;
- (void)setFrameY:(CGFloat)y;

@end

#pragma mark - CGRect Functions

CGRect CGRectSetWidth(CGRect rect, CGFloat width);
CGRect CGRectSetHeight(CGRect rect, CGFloat height);
CGRect CGRectSetSize(CGRect rect, CGSize size);
CGRect CGRectSetX(CGRect rect, CGFloat x);
CGRect CGRectSetY(CGRect rect, CGFloat y);
CGRect CGRectSetOrigin(CGRect rect, CGPoint origin);

#pragma mark - UIDevice+Model 

@interface UIDevice (Model)

+ (NSString *)platform;
+ (NSString *)platformString;
+ (BOOL)isSlowDevice;
+ (BOOL)isIPad;

@end

#pragma mark - DKLog

// Log
#define __STRING_PRETTY_FUNCTION__                  [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]

#if defined (DEBUG)
//# define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
# define DKLog(verbose, fmt, ...) if (verbose) { NSLog(fmt, ##__VA_ARGS__); }
#else
# define DKLog(...) // do nothing
#endif

// App version
#pragma mark - AppVersion
#define DK_APP_VERSION      [NSString stringWithFormat:@"Version %@ (%@)", \
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], \
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]]

// Regex
#define RGX_FILE_EXTENSION                          @".[0-9a-zA-Z]+$"
#define RGX_FILE_NAME_AND_EXTENSION                 @"[0-9a-zA-Z]+.[0-9a-zA-Z]+$"

// Numbers
#pragma mark - Numbers
#define MINMAX(v, min, max)                         ((v < min) ? min : (v > max) ? (max) : v )
#define MONTH_IN_SECONDS                            (60 * 60 * 24 * 30)
#define cL(v)                                       (long)(v)
#define cUL(v)                                      (unsigned long)(v)

// NSObjects
#pragma mark - NSObjects
#define OBJECT(dictionary, key)                     ( VALID(dictionary, key) ? [dictionary objectForKey:key] : nil )
#define VALID(dict, key)                            (dict && [dict objectForKey:key] && ![[dict objectForKey:key] isEqual:[NSNull null]])
#define GET_FLOAT(dictionary, key)                  ( VALID(dictionary, key) ? [NSNumber numberWithFloat:[[dictionary objectForKey:key] floatValue]] : nil )
#define GET_NUMBER(dictionary, key)                 ( VALID(dictionary, key) ? [NSNumber numberWithInteger:[[dictionary objectForKey:key] integerValue]] : nil )
#define GET_DATE(dictionary, key)                   ( VALID(dictionary, key) ? [NSDate dateFromString:[dictionary objectForKey:key]] : nil )
#define GET_STRING(dictionary, key)                 ( VALID(dictionary, key) ? ( ![[dictionary objectForKey:key] isEqualToString:@""] ? [dictionary objectForKey:key] : nil ) : nil )
#define GET_ASSET_URL(dictionary, key1, key2)       ( VALID(dictionary, key1) ? ( VALID([dictionary objectForKey:key1], key2) ? [[dictionary objectForKey:key1] objectForKey:key2] : nil ) : nil )

// Screen
#pragma mark - Screen
#define iOS7Delta                                   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ) ? 20 : 0 )
#define is4InchScreen                               ([UIScreen mainScreen].bounds.size.height == 568.)

// iOS version
#pragma mark - iOS Version
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// Predicates
#define OR_PREDICATE(a, b)                          (a ? [NSCompoundPredicate orPredicateWithSubpredicates:@[a, b]] : b)
#define AND_PREDICATE(a, b)                         (a ? [NSCompoundPredicate andPredicateWithSubpredicates:@[a, b]] : b)

// Common File Formats
#define IMAGE_FILE_EXTENSIONS                       @[@".tif", @".tiff", @".gif", @".jpeg", @".jpg", @".png", @".pjpeg"]
#define AUDIO_FILE_EXTENSIONS                       @[@".mp3", @".mp2", @".wma", @".aac", @".m4a", @".mp4", @".m4p"]

// Math
#define degreesToRadians(degrees)                  ((degrees * M_PI) / 180.0)
#define radiansToDegrees(radians)                  ((radians * 180.0) / M_PI)

#endif
