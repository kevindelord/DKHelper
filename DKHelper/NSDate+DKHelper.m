//
//  NSDate+DKHelper.m
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#import "NSDate+DKHelper.h"
#import "DKHelper.h"

#pragma mark - NSDate+NSString

@implementation NSDate (NSString)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    return [df dateFromString:string];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string format:ISO8601_DATE_FORMAT];
}

+ (NSDate *)dateFromDayString:(NSString *)string {
    return [NSDate dateFromString:[NSString stringWithFormat:@"%@T00:00:00Z", string]];
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

- (NSDate *)dateByAddingOneMonthInterval {
    return [self dateByAddingTimeInterval:MONTH_IN_SECONDS];
}

@end
