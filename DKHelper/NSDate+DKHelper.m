//
//  NSDate+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSDate+DKHelper.h"
#import "DKHelper.h"

#pragma mark - NSDate+NSString

@implementation NSDate (NSString)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = format;
    df.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    return [df dateFromString:string];
}

+ (NSDate *)dateFromISOString:(NSString *)string {
    return [NSDate dateFromString:string format:ISO8601_DATE_FORMAT];
}

+ (NSDate *)dateFromDayString:(NSString *)string {
    return [NSDate dateFromString:[NSString stringWithFormat:@"%@T00:00:00Z", string] format:ISO8601_DATE_FORMAT];
}

+ (NSDate *)currentDayDate {
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSTimeZoneCalendarUnit;
    NSDateComponents* dateComponents = [gregorian components:unitFlags fromDate:[NSDate date]];
    dateComponents.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    [dateComponents setHour:0];
    return [gregorian dateFromComponents:dateComponents];
}

- (NSDate *)midnightDate {
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSTimeZoneCalendarUnit;
    NSDateComponents* dateComponents = [gregorian components:unitFlags fromDate:self];
    dateComponents.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    [dateComponents setHour:0];
    return [gregorian dateFromComponents:dateComponents];
}

- (NSDate *)dateByAddingOneMonthInterval {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:1];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)dateByAddingOneDayInterval {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:1];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSString *)stringValue {
    return [NSString stringWithFormat:@"%@", self];
}

- (NSString *)ISO8601StringValue {
    return [NSString stringFromDate:self format:ISO8601_DATE_FORMAT];
}

- (NSString *)monthName {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSMonthCalendarUnit fromDate:self];
    return [[[NSDateFormatter new] standaloneMonthSymbols] objectAtIndex:([comps month] - 1)];
}

- (NSString *)dayName {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:self];
    return [[[NSDateFormatter new] standaloneWeekdaySymbols] objectAtIndex:([comps weekday] - 1)];
}

@end
