//
//  DKHelper.m
//  Pons
//
//  Created by kevin delord on 16/01/14.
//  Copyright (c) 2014 smartmobilefactory. All rights reserved.
//

#import "DKHelper.h"
#import <objc/runtime.h>
#import <sys/types.h>
#import <sys/sysctl.h>

#pragma mark - NSObject+Block

@implementation NSObject (Block)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    int64_t delta = (int64_t)(1.0e9 * delay);
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

@end

#pragma mark - NSString+NSDate

@implementation NSString (NSDate)

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
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

@end

#pragma mark - NSString+Helper

@implementation NSString (Helper)

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

@end

#pragma mark - NSString+Regex

@implementation NSString (Regex)

- (NSString *)firstOccuranceForPattern:(NSString *)pattern {
    NSRange searchedRange = NSMakeRange(0, [self length]);
    NSError  *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:searchedRange];
    if (match.numberOfRanges == 0)
        return nil;
    return [self substringWithRange:[match rangeAtIndex:0]];
}

@end;


#pragma mark - UIImage+Retina4

static Method origImageNamedMethod = nil;

@implementation UIImage (Retina4)

+ (void)initialize {
    origImageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(self, @selector(retina4ImageNamed:)));
}

+ (UIImage *)retina4ImageNamed:(NSString *)imageName {
    NSMutableString *imageNameMutable = [imageName mutableCopy];
    NSRange retinaAtSymbol = [imageName rangeOfString:@"@"];
    if (retinaAtSymbol.location != NSNotFound) {
        [imageNameMutable insertString:@"-568h" atIndex:retinaAtSymbol.location];
    } else {
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        if ([UIScreen mainScreen].scale == 2.f && screenHeight == 568.0f) {
            NSRange dot = [imageName rangeOfString:@"."];
            if (dot.location != NSNotFound)
                [imageNameMutable insertString:@"-568h@2x" atIndex:dot.location];
            else
                [imageNameMutable appendString:@"-568h@2x"];
        }
    }
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageNameMutable ofType:@""];
    if (imagePath)
        return [UIImage retina4ImageNamed:imageNameMutable];
    else
        return [UIImage retina4ImageNamed:imageName];

    return nil;
}

@end

#pragma mark - NSDate+NSString

@implementation NSDate (NSString)

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    return [df dateFromString:string];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string format:@"yyyy-MM-dd'T'HH:mm:ssz"];
}

+ (NSDate *)dateFromDayString:(NSString *)string {
    // parameter format: @"yyyy-MM-dd"
    return [NSDate dateFromString:[NSString stringWithFormat:@"%@T00:00:00z", string]];
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

#pragma mark - UIView+RoundCorner

@implementation UIView (RoundCorner)

- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius {
    // Create the path (with only the top-left corner rounded)
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
}

@end

#pragma mark - CGRect Methods

@implementation UIView (CGRect)

+ (void)logRect:(CGRect)f container:(CGRect)container {
    NSLog(@"    frame: %0.f %0.f %0.f %0.f", f.origin.x, f.origin.y, f.size.width, f.size.height);
    NSLog(@"container: %0.f %0.f %0.f %0.f", container.origin.x, container.origin.y, container.size.width, container.size.height);
    NSLog(@"---- %d %d %d %d ----",
          (int)f.origin.x >= (int)container.origin.x,
          ((int)f.origin.x + (int)f.size.width) <= ((int)container.origin.x + (int)container.size.width),
          (int)f.origin.y >= (int)container.origin.y,
          ((int)f.origin.y + (int)f.size.height) <= ((int)container.origin.y + (int)container.size.height));
}

+ (BOOL)isFrame:(CGRect)frame insideOfContainer:(CGRect)container {
    return (
            (int)frame.origin.x >= (int)container.origin.x
            && ((int)frame.origin.x + (int)frame.size.width) <= ((int)container.size.width + (int)container.origin.x)
            && (int)frame.origin.y >= (int)container.origin.y
            && ((int)frame.origin.y + (int)frame.size.height) <= ((int)container.size.height + (int)container.origin.y)
            );
}

+ (CGRect)setFrame:(CGRect)frame insideOfContainer:(CGRect)container {
    
    if (frame.origin.x < container.origin.x)
        frame.origin.x = container.origin.x;
    else if ((frame.origin.x + frame.size.width) > (container.origin.x + container.size.width))
        frame.origin.x = (container.origin.x + container.size.width) - frame.size.width;
    
    if (frame.origin.y < container.origin.y)
        frame.origin.y = container.origin.y;
    else if ((frame.origin.y + frame.size.height) > (container.origin.y + container.size.height))
        frame.origin.y = (container.origin.y + container.size.height) - frame.size.height;
    
    return frame;
}

+ (CGSize)adjustSize:(CGSize)size toCGRect:(CGRect)rect {
    CGFloat w = size.width;
    CGFloat h = size.height;
    
    if (w > rect.size.width) {
        h = h / (w / rect.size.width);
        w = rect.size.width;
    }
    if (h > rect.size.height) {
        w = w / (h / rect.size.height);
        h = rect.size.height;
    }
    return CGSizeMake(w, h);
}

+ (CGSize)adjustSize:(CGSize)size withSize:(CGSize)rSize {
    CGFloat w = size.width / rSize.width;
    CGFloat h = rSize.height * w;
    w *= rSize.width;
    
    return CGSizeMake(w, h);
}

- (void)setFrameWidth:(CGFloat)width {
    self.frame = CGRectSetWidth(self.frame, width);
}

- (void)setFrameHeight:(CGFloat)height {
    self.frame = CGRectSetHeight(self.frame, height);
}

- (void)setFrameX:(CGFloat)x {
    self.frame = CGRectSetX(self.frame, x);
}

- (void)setFrameY:(CGFloat)y {
    self.frame = CGRectSetY(self.frame, y);
}

- (void)setFrameOrigin:(CGPoint)origin {
    self.frame = CGRectSetOrigin(self.frame, origin);
}

- (void)setFrameSize:(CGSize)size {
    self.frame = CGRectSetSize(self.frame, size);
}

#pragma mark - CGRect Functions

CGRect CGRectSetWidth(CGRect rect, CGFloat width) {
    return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}

CGRect CGRectSetHeight(CGRect rect, CGFloat height) {
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}

CGRect CGRectSetSize(CGRect rect, CGSize size) {
    return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

CGRect CGRectSetX(CGRect rect, CGFloat x) {
    return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}

CGRect CGRectSetY(CGRect rect, CGFloat y) {
    return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}

CGRect CGRectSetOrigin(CGRect rect, CGPoint origin) {
    return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}

@end

#pragma mark - UIDevice+Model

@implementation UIDevice (Model)

+ (NSString *)platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)platformString {
    NSString *platform = [UIDevice platform];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (UK+Europe+Asis+China)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (UK+Europe+Asis+China)";
    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini Retina (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini Retina (GSM+CDMA)";
    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

+ (BOOL)isSlowDevice {
	// this method considers any iPhone 4 and older as a slow device
    NSArray * forbiddenPlatforms = [NSArray arrayWithObjects:
                                    @"iPhone1,1", // iPhone 1G
                                    @"iPhone1,2", // iPhone 3G
                                    @"iPhone2,1", // iPhone 3GS
                                    @"iPhone3,1", // iPhone 4
                                    @"iPhone3,3", // Verizon iPhone 4
                                    @"iPod1,1", // iPod 1G
                                    @"iPod2,1", // iPod 2G
                                    @"iPod3,1", // iPod 3G
                                    @"iPad1,1", // iPad 1
                                    nil];
    
    NSString *currentPlatform = [UIDevice platform];
    for (NSString *platform in forbiddenPlatforms) {
        if ([platform isEqualToString:currentPlatform])
            return NO;
    }
    return YES;
}

+ (BOOL)isIPad {
    NSString *currentModel = [UIDevice currentDevice].model;
    return [currentModel hasPrefix:@"iPad"];
}

@end
