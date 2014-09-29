//
//  DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "DKHelper.h"

#pragma mark - AppVersion

NSString *  appVersion() {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [NSString stringWithFormat:@"Version %@ (%@)", info[@"CFBundleShortVersionString"], info[@"CFBundleVersion"]];
}

#pragma mark - Math

CGFloat     degreesToRadians(CGFloat degrees) {
    return ((degrees * M_PI) / 180.0);
}

CGFloat     radiansToDegrees(CGFloat radians) {
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
    return (dict && dict[key] && ![dict[key] isEqual:[NSNull null]]);
}

#pragma mark - Getters

CGFloat     GET_FLOAT(NSDictionary *dict, id key) {
    return (VALID(dict, key) ? [dict[key] floatValue] : 0.);
}

NSInteger  GET_INTEGER(NSDictionary *dict, id key) {
    return (VALID(dict, key) ? [dict[key] integerValue] : 0);
}

NSNumber *  GET_NUMBER(NSDictionary *dict, id key) {
    return (VALID(dict, key) ? @([dict[key] integerValue]) : nil);
}

NSDate *    GET_DATE(NSDictionary *dict, id key) {
    return (VALID(dict, key) ? [NSDate dateFromISOString:dict[key]] : nil);
}

NSString *  GET_STRING(NSDictionary *dict, id key) {
    return ( VALID(dict, key) ? ( ![dict[key] isEqualToString:@""] ? dict[key] : nil ) : nil);
}
