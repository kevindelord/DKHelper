//
//  DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "DKHelper.h"

#pragma mark - AppVersion

NSString * _Nonnull appVersion() {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [NSString stringWithFormat:@"Version %@ (%@)", info[@"CFBundleShortVersionString"], info[@"CFBundleVersion"]];
}

#pragma mark - Math

CGFloat degreesToRadians(CGFloat degrees) {
    return ((degrees * M_PI) / 180.0);
}

CGFloat radiansToDegrees(CGFloat radians) {
    return ((radians * 180.0) / M_PI);
}

#pragma mark - Object verification

id          OBJECT_FOR_KEYS(NSDictionary *dict, id key1, id key2) {
    return (VALID(dict, key1) ? ( VALID(dict[key1], key2) ? dict[key1][key2] : nil ) : nil);
}

id          OBJECT(NSDictionary *dict, id key) {
	return (VALID(dict, key) ? dict[key] : nil);
}

BOOL        VALID(NSDictionary *dict, id key) {
    return (key != nil && [key isEqual:[NSNull null]] == false &&
			dict != nil && dict[key] != nil && [dict[key] isEqual:[NSNull null]] == false);
}

#pragma mark - Localization

NSString * _Nonnull L(NSString * _Nonnull key) {
    return NSLocalizedString(key, nil);
}

#pragma mark - Getters

CGFloat GET_FLOAT(NSDictionary * _Nullable dict, id _Nullable key) {
    return (VALID(dict, key) ? [dict[key] floatValue] : 0.);
}

NSInteger GET_INTEGER(NSDictionary * _Nullable dict, id _Nullable key) {
    return (VALID(dict, key) ? [dict[key] integerValue] : 0);
}

NSNumber * _Nullable GET_NUMBER(NSDictionary * _Nullable dict, id _Nullable key) {
    id obj = OBJECT(dict, key);
    if (obj && [obj isKindOfClass:[NSString class]]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
		[f setLocale: [NSLocale localeWithLocaleIdentifier:@"en_US"]];
        return [f numberFromString:(NSString *)obj];

    } else if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return obj;
    }
    return nil;
}

NSDate * _Nullable GET_DATE(NSDictionary * _Nullable dict, id key) {
    if (VALID(dict, key)) {
        if ([dict[key] isKindOfClass:[NSDate class]]) {
            return dict[key];
        } else if ([dict[key] isKindOfClass:[NSString class]]) {
            return [NSDate dateFromISOString:dict[key]];
        }
    }
    return nil;
}

NSDate * _Nullable GET_DATE_FORMAT(NSDictionary * _Nullable dict, id _Nullable key, NSString* _Nullable format) {
	if (format != nil && VALID(dict, key)) {
		if ([dict[key] isKindOfClass:[NSDate class]]) {
			return dict[key];
		} else if ([dict[key] isKindOfClass:[NSString class]]) {
			return [NSDate dateFromString:dict[key] format:format];
		}
	}
	return nil;
}

NSString * _Nullable GET_STRING(NSDictionary * _Nullable dict, id key) {
    return ( VALID(dict, key) ? ( [dict[key] isEqualToString:@""] == false ? dict[key] : nil ) : nil);
}

#pragma mark - Numbers

CGFloat MINMAX(CGFloat value, CGFloat min, CGFloat max) {
    return ((value <= min) ? min : (value >= max) ? (max) : value);
}

long cL(NSInteger v) {
    return (long)(v);
}

unsigned long cUL(NSUInteger v) {
    return (unsigned long)(v);
}

#pragma mark - DKLog

void DKLog(BOOL verbose, NSString * _Nonnull format, ...) {
#if defined (DEBUG)
    if (verbose) {
        va_list args;
        va_start(args, format);
        NSString *content = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        NSLog(@"%@", content);
    }
#else
    // do nothing
#endif
}
