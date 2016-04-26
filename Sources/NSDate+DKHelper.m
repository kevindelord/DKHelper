//
//  NSDate+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSDate+DKHelper.h"
#import "DKHelper.h"

@implementation NSDate (DKHelper)

#pragma mark - Comparison

- (BOOL)isOlderOrEqualThan:(NSDateComponents * _Nonnull)dateComponent {
	// Check if the selected date is older or equal to the given parameter.
	NSDate *veryOldDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponent toDate:[NSDate date] options:0];
	NSComparisonResult result = [self compare:veryOldDate];
	return (result == NSOrderedAscending || result == NSOrderedSame);
}

- (BOOL)isOlderOrEqualThan:(NSInteger)years months:(NSInteger)months days:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds {
	NSDateComponents *dateComponent = [NSDateComponents new];
	dateComponent.year = -(years);
	dateComponent.month = -(months);
	dateComponent.day = -(days);
	dateComponent.hour = -(hours);
	dateComponent.minute = -(minutes);
	dateComponent.second = -(seconds);
	return [self isOlderOrEqualThan:dateComponent];
}

- (BOOL)isOlderOrEqualThanYearInterval:(NSInteger)years {
	return [self isOlderOrEqualThan:years months:0 days:0 hours:0 minutes:0 seconds:0];
}

- (BOOL)isOlderOrEqualThanMonthInterval:(NSInteger)months {
	return [self isOlderOrEqualThan:0 months:months days:0 hours:0 minutes:0 seconds:0];
}

- (BOOL)isOlderOrEqualThanDayInterval:(NSInteger)days {
	return [self isOlderOrEqualThan:0 months:0 days:days hours:0 minutes:0 seconds:0];
}

- (BOOL)isOlderOrEqualThanHourInterval:(NSInteger)hours {
	return [self isOlderOrEqualThan:0 months:0 days:0 hours:hours minutes:0 seconds:0];
}

- (BOOL)isOlderOrEqualThanMinuteInterval:(NSInteger)minutes {
	return [self isOlderOrEqualThan:0 months:0 days:0 hours:0 minutes:minutes seconds:0];
}

- (BOOL)isOlderOrEqualThanSecondInterval:(NSInteger)seconds {
	return [self isOlderOrEqualThan:0 months:0 days:0 hours:0 minutes:0 seconds:seconds];
}

#pragma mark - NSDate+NSString

+ (instancetype _Nullable)dateFromString:(NSString * _Nonnull)string style:(NSDateFormatterStyle)style {
	NSDateFormatter *df = [NSDateFormatter new];
	df.timeZone = [NSTimeZone defaultTimeZone];
	df.dateStyle = style;
	df.timeStyle = style;
	df.locale = [NSLocale currentLocale];
	return [df dateFromString:string];
}

+ (instancetype _Nullable)dateFromString:(NSString * _Nonnull)string format:(NSString * _Nonnull)format {
	NSDateFormatter *df = [NSDateFormatter new];
	df.dateFormat = format;
	df.timeZone = [NSTimeZone defaultTimeZone];
	return [df dateFromString:string];
}

+ (instancetype _Nullable)dateFromISOString:(NSString * _Nonnull)string {
    return [NSDate dateFromString:string format:NSDate.ISO8601StringFormat];
}

+ (instancetype _Nullable)dateFromDayString:(NSString * _Nonnull)string {
    return [NSDate dateFromString:[NSString stringWithFormat:@"%@T00:00:00Z", string] format:NSDate.ISO8601StringFormat];
}

- (NSString * _Nonnull)stringValue {
    return [NSString stringWithFormat:@"%@", self];
}

- (NSString * _Nonnull)ISO8601StringValue {
    return [NSString stringFromDate:self format:NSDate.ISO8601StringFormat];
}

#pragma mark - Display methods

- (NSString * _Nonnull)monthName {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitMonth fromDate:self];
    return [[[NSDateFormatter new] standaloneMonthSymbols] objectAtIndex:([comps month] - 1)];
}

- (NSString * _Nonnull)dayName {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:self];
    return [[[NSDateFormatter new] standaloneWeekdaySymbols] objectAtIndex:([comps weekday] - 1)];
}

- (NSString * _Nonnull)fullDisplayTime {
	return [NSDateFormatter localizedStringFromDate:self dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString * _Nonnull)hourDisplayTime {
	return [NSDateFormatter localizedStringFromDate:self dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString * _Nonnull)displayableString {
    return [NSDateFormatter localizedStringFromDate:self dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Log methods

- (void)logCurrentDateWithDateStyleAndAllTimeStyle:(NSDateFormatterStyle)dateStyle {
	NSLog(@"%@", [NSDateFormatter localizedStringFromDate:self dateStyle:dateStyle timeStyle:NSDateFormatterNoStyle]);
	NSLog(@"%@", [NSDateFormatter localizedStringFromDate:self dateStyle:dateStyle timeStyle:NSDateFormatterShortStyle]);
	NSLog(@"%@", [NSDateFormatter localizedStringFromDate:self dateStyle:dateStyle timeStyle:NSDateFormatterMediumStyle]);
	NSLog(@"%@", [NSDateFormatter localizedStringFromDate:self dateStyle:dateStyle timeStyle:NSDateFormatterLongStyle]);
	NSLog(@"%@", [NSDateFormatter localizedStringFromDate:self dateStyle:dateStyle timeStyle:NSDateFormatterFullStyle]);
}

- (void)logAllFormats {
	[self logCurrentDateWithDateStyleAndAllTimeStyle:NSDateFormatterNoStyle];
	[self logCurrentDateWithDateStyleAndAllTimeStyle:NSDateFormatterShortStyle];
	[self logCurrentDateWithDateStyleAndAllTimeStyle:NSDateFormatterMediumStyle];
	[self logCurrentDateWithDateStyleAndAllTimeStyle:NSDateFormatterLongStyle];
	[self logCurrentDateWithDateStyleAndAllTimeStyle:NSDateFormatterFullStyle];
}

#pragma mark - Getter methods

- (NSInteger)year {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = [NSTimeZone defaultTimeZone];
    return [[calendar components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = [NSTimeZone defaultTimeZone];
    return [[calendar components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = [NSTimeZone defaultTimeZone];
    return [[calendar components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = [NSTimeZone defaultTimeZone];
    return [[calendar components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = [NSTimeZone defaultTimeZone];
    return [[calendar components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	calendar.timeZone = [NSTimeZone defaultTimeZone];
    return [[calendar components:NSCalendarUnitSecond fromDate:self] second];
}

+ (instancetype _Nullable)currentDayDate {
	NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitTimeZone;
	NSDateComponents* dateComponents = [gregorian components:unitFlags fromDate:[NSDate date]];
	dateComponents.timeZone = [NSTimeZone defaultTimeZone];
	[dateComponents setMinute:0];
	[dateComponents setSecond:0];
	[dateComponents setHour:0];
	return [gregorian dateFromComponents:dateComponents];
}

- (instancetype _Nullable)midnightDate {
	NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitTimeZone;
	NSDateComponents* dateComponents = [gregorian components:unitFlags fromDate:self];
	dateComponents.timeZone = [NSTimeZone defaultTimeZone];
	[dateComponents setMinute:0];
	[dateComponents setSecond:0];
	[dateComponents setHour:0];
	return [gregorian dateFromComponents:dateComponents];
}

#pragma mark - Adding Interval

- (instancetype _Nullable)dateByAddingIntervalsWithYear:(NSInteger)years months:(NSInteger)months days:(NSInteger)days hours:(NSInteger)hours minutes:(NSInteger)minutes seconds:(NSInteger)seconds {
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setYear:years];
    [dateComponents setMonth:months];
    [dateComponents setDay:days];
    [dateComponents setHour:hours];
    [dateComponents setMinute:minutes];
    [dateComponents setSecond:seconds];
    return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
}

- (instancetype _Nullable)dateByAddingYearInterval:(NSInteger)yearInterval {
    return [self dateByAddingIntervalsWithYear:yearInterval months:0 days:0 hours:0 minutes:0 seconds:0];
}

- (instancetype _Nullable)dateByAddingMonthInterval:(NSInteger)monthInterval {
    return [self dateByAddingIntervalsWithYear:0 months:monthInterval days:0 hours:0 minutes:0 seconds:0];
}

- (instancetype _Nullable)dateByAddingDayInterval:(NSInteger)dayInterval {
    return [self dateByAddingIntervalsWithYear:0 months:0 days:dayInterval hours:0 minutes:0 seconds:0];
}

- (instancetype _Nullable)dateByAddingHourInterval:(NSInteger)hourInterval {
    return [self dateByAddingIntervalsWithYear:0 months:0 days:0 hours:hourInterval minutes:0 seconds:0];
}

- (instancetype _Nullable)dateByAddingMinuteInterval:(NSInteger)minuteInterval {
    return [self dateByAddingIntervalsWithYear:0 months:0 days:0 hours:0 minutes:minuteInterval seconds:0];
}

- (instancetype _Nullable)dateByAddingSecondInterval:(NSInteger)secondInterval {
    return [self dateByAddingIntervalsWithYear:0 months:0 days:0 hours:0 minutes:0 seconds:secondInterval];
}

#pragma mark - ISO formats

+ (NSString * _Nonnull)ISO8601StringFormat {
    return @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
}

@end
