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
    return [NSDate dateFromString:string format:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
}

+ (NSDate *)dateFromDayString:(NSString *)string {
    // parameter format: @"yyyy-MM-dd"
    return [NSDate dateFromString:[NSString stringWithFormat:@"%@T00:00:00Z", string]];
}

+ (NSDate *)currentDate {
    NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSYearCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents* dateComponents = [gregorian components:unitFlags fromDate:[NSDate date]];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    [dateComponents setHour:1];
    return [gregorian dateFromComponents:dateComponents];
}

- (NSDate *)dateByAddingOneMonthInterval {
    return [self dateByAddingTimeInterval:MONTH_IN_SECONDS];
}

@end
