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

+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)monthNameFromDate:(NSDate *)date;
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

#pragma mark - NSString+Helper

- (NSString *)removeDuplicateCharacters;
- (NSString *)randomizedString;

#pragma mark - NSString+Regex

- (NSString *)firstOccuranceForPattern:(NSString *)pattern;

@end

#endif