//
//  NSString+DKHelper.m
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#import "NSString+DKHelper.h"

@implementation NSString (DKHelper)

#pragma mark - NSString+NSDate

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    return [df stringFromDate:date];
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    if (!date) return @"n/a";
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    return [df stringFromDate:date];
}

+ (NSString *)monthNameFromDate:(NSDate *)date {
    if (!date) return @"n/a";
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM"];
    return [[df standaloneMonthSymbols] objectAtIndex:([[df stringFromDate:date] integerValue] - 1)];
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
