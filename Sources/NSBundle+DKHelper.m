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
	return [[NSBundle mainBundle] entryInPListForKey:key];
}

+ (NSString * _Nonnull)stringEntryInPListForKey:(NSString * _Nonnull)key {
	return [[NSBundle mainBundle] stringEntryInPListForKey:key];
}

+ (BOOL)booleanEntryInPListForKey:(NSString * _Nonnull)key {
	return [[NSBundle mainBundle] booleanEntryInPListForKey:key];
}

+ (NSNumber * _Nonnull)numberEntryInPListForKey:(NSString * _Nonnull)key {
	return [[NSBundle mainBundle] numberEntryInPListForKey:key];
}

- (id)entryInPListForKey:(NSString *)key {
	id value = [self objectForInfoDictionaryKey:key];
	if (value == nil) {
		#ifndef UNITTEST
		NSString *reason = [NSString stringWithFormat:@"Invalid '%@' key in Info.plist file", key];
		[[NSException exceptionWithName:@"Plist error" reason:reason userInfo:nil] raise];
		#endif
	}
	return value;
}

- (NSString * _Nonnull)stringEntryInPListForKey:(NSString * _Nonnull)key {
	return [self entryInPListForKey:key];
}

- (BOOL)booleanEntryInPListForKey:(NSString * _Nonnull)key {
	return [[self entryInPListForKey:key] boolValue];
}

- (NSNumber * _Nonnull)numberEntryInPListForKey:(NSString * _Nonnull)key {
	NSNumberFormatter *formatter = [NSNumberFormatter new];
	formatter.numberStyle = NSNumberFormatterDecimalStyle;
	formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
	return [formatter numberFromString:[self stringEntryInPListForKey:key]];
}

@end
