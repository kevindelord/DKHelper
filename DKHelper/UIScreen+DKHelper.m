//
//  UIScreen+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIScreen+DKHelper.h"

@implementation UIScreen (DKHelper)

+ (BOOL)is35InchScreen {
    return (CGRectGetHeight([UIScreen mainScreen].bounds) == 480. && CGRectGetWidth([UIScreen mainScreen].bounds) == 320.);
}

+ (BOOL)is4InchScreen {
    return (CGRectGetHeight([UIScreen mainScreen].bounds) == 568. && CGRectGetWidth([UIScreen mainScreen].bounds) == 320.);
}

+ (BOOL)is47InchScreen {
    return (CGRectGetHeight([UIScreen mainScreen].bounds) == 667. && CGRectGetWidth([UIScreen mainScreen].bounds) == 375.);
}

+ (BOOL)is55InchScreen {
    return (CGRectGetHeight([UIScreen mainScreen].bounds) == 736. && CGRectGetWidth([UIScreen mainScreen].bounds) == 414.);
}

@end
