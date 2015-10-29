//
//  NSBundle+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import "NSBundle+DKHelper.h"

@implementation NSBundle (DKHelper)

+ (id)entryInPListForKey:(NSString *)key {
    id value = [NSBundle.mainBundle objectForInfoDictionaryKey:key];
    if (value == nil) {
        NSString *reason = [NSString stringWithFormat:@"Invalid '%@' key in Info.plist file", key];
        [[NSException exceptionWithName:@"Plist error" reason:reason userInfo:nil] raise];
    }
    return value;
}

+ (NSString *)stringEntryInPListForKey:(NSString *)key {
	return [self entryInPListForKey:key];
}

+ (BOOL)booleanEntryInPListForKey:(NSString *)key {
	return [[self entryInPListForKey:key] boolValue];
}

+ (NSNumber *)numberEntryInPListForKey:(NSString *)key {
	NSNumberFormatter *formatter = [NSNumberFormatter new];
	formatter.numberStyle = NSNumberFormatterDecimalStyle;
	return [formatter numberFromString:[self stringEntryInPListForKey:key]];
}

@end
