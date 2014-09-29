//
//  DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "DKHelper.h"

NSString *  appVersion() {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    return [NSString stringWithFormat:@"Version %@ (%@)", info[@"CFBundleShortVersionString"], info[@"CFBundleVersion"]];
}

CGFloat     degreesToRadians(CGFloat degrees) {
    return ((degrees * M_PI) / 180.0);
}

CGFloat     radiansToDegrees(CGFloat radians) {
    return ((radians * 180.0) / M_PI);
}
