//
//  DKRegex.m
//  DKHelper
//
//  Created by kevin delord on 30/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "DKRegex.h"

@implementation DKRegex

+ (NSString * _Nonnull)fileExtension {
    return @"[.]+[0-9a-zA-Z]+$";
}

+ (NSString * _Nonnull)filenameAndExtension {
    return @"[0-9a-zA-Z]+[.]+[0-9a-zA-Z]+$";
}

@end
