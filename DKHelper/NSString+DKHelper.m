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

#pragma mark - NSString+NSDate

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    if (!date || !format) return nil;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = format;
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    return [df stringFromDate:date];
}

#pragma mark - NSString+Helper

- (NSString *)removeDuplicateCharacters {
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

- (NSString *)randomizedString {
    
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

#pragma mark - NSString+Regex

- (NSString *)firstOccuranceForPattern:(NSString *)pattern {
    NSRange searchedRange = NSMakeRange(0, [self length]);
    NSError  *error = nil;

    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:searchedRange];
    if (match.numberOfRanges == 0)
        return nil;
    return [self substringWithRange:[match rangeAtIndex:0]];
}

@end
