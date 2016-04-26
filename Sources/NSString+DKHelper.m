//
//  NSString+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSString+DKHelper.h"
#import "DKHelper.h"

@implementation NSString (DKHelper)

@dynamic isEmail, isAlphaNumeric, isNumeric, isPhoneNumber;

#pragma mark - NSString+Random

+ (instancetype _Nonnull)randomNumericString:(NSUInteger)length {

    NSString *letters = @"0123456789";
    NSTimeInterval base = [NSDate timeIntervalSinceReferenceDate];

    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i=0; i < length; i++){
        NSUInteger index = (arc4random_uniform(base) % letters.length);
        [randomString appendFormat:@"%C", [letters characterAtIndex:index]];
    }
    return randomString;
}

+ (instancetype _Nonnull)randomString:(NSUInteger)length {

    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSTimeInterval base = [NSDate timeIntervalSinceReferenceDate];

    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i=0; i < length; i++){
        NSUInteger index = (arc4random_uniform(base) % letters.length);
        [randomString appendFormat:@"%C", [letters characterAtIndex:index]];
    }
    return randomString;
}

+ (instancetype _Nonnull)randomString {
	NSTimeInterval base = [NSDate timeIntervalSinceReferenceDate];
	NSUInteger length = MINMAX((arc4random_uniform(base) % 100), 1, 100);
	return [NSString randomString:length];
}

#pragma mark - NSString+NSDate

+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date style:(NSDateFormatterStyle)style {
	return [self stringFromDate:date style:style timeZone:[NSTimeZone defaultTimeZone]];
}

+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date style:(NSDateFormatterStyle)style timeZone:(NSTimeZone * _Nonnull)timeZone {
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.timeZone = timeZone;
	df.dateStyle = style;
	return [df stringFromDate:date];
}

+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date format:(NSString * _Nonnull)format {
    return [self stringFromDate:date format:format timeZone:[NSTimeZone defaultTimeZone]];
}

+ (instancetype _Nonnull)stringFromDate:(NSDate * _Nonnull)date format:(NSString * _Nonnull)format timeZone:(NSTimeZone * _Nonnull)timeZone {
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateFormat = format;
	df.timeZone = timeZone;
	return [df stringFromDate:date];
}

#pragma mark - NSString+Helper

- (instancetype _Nonnull)randomizedString {

    srandom((unsigned int)time(NULL));

    NSMutableString *str = [NSMutableString stringWithString:self];
    NSMutableString *result = [NSMutableString new];

    for (int i = 0 ; i < self.length ; i++) {
        NSInteger index = arc4random() % str.length;
        NSString *character = [NSString stringWithFormat:@"%c", [str characterAtIndex:index]];
        [result insertString:character atIndex:0];
        [str deleteCharactersInRange:NSMakeRange(index, 1)];
    }
    return result;
}

- (instancetype _Nonnull)removeDuplicatedCharacters {
    NSMutableSet *seenCharacters = [NSMutableSet set];
    NSMutableString *result = [NSMutableString string];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        if (![seenCharacters containsObject:substring]) {
            [seenCharacters addObject:substring];
            [result appendString:substring];
        }
    }];
    return result;
}

- (instancetype _Nonnull)trimWhitespaces {
    return [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
}

- (instancetype _Nonnull)removeAllNewlinesAndIllegalChars {
    return [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

#pragma mark - NSString+Regex

- (BOOL)isEmail {
    NSString *regex = @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isNumeric {
	NSString *regex = @"^[-]*[0-9]+(.[0-9]+)?$";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	return [predicate evaluateWithObject:self];
}

- (BOOL)isAlphaNumeric {
    NSString *regex = @"[A-Z0-9a-z]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPhoneNumber {
    NSString *regex = @"^00[0-9]{9,13}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (instancetype _Nullable)firstOccuranceForPattern:(NSString * _Nonnull)pattern {
    NSRange searchedRange = NSMakeRange(0, [self length]);
    NSError * error = nil;

    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:searchedRange];
	if (match.numberOfRanges == 0) {
        return nil;
	}
    return [self substringWithRange:[match rangeAtIndex:0]];
}

- (instancetype _Nullable)lastOccuranceForPattern:(NSString * _Nonnull)pattern {
	NSRange searchedRange = NSMakeRange(0, [self length]);
	NSError * error = nil;

	NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
	if ([regex numberOfMatchesInString:self options:0 range:searchedRange] <= 0) {
		return nil;
	}
	NSArray *matches = [regex matchesInString:self options:0 range:searchedRange];
	NSTextCheckingResult *match = [matches objectAtIndex:matches.count - 1];
	NSRange range = [match rangeAtIndex:0];
	return [self substringWithRange:range];
}

@end
