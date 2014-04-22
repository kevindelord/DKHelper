//
//  UIColor+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 4/22/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIColor+DKHelper.h"

@implementation UIColor (DKHelper)

#pragma mark - DEBUG colors

+ (UIColor *)redColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:255. g:0 b:0 a:alpha];
}

+ (UIColor *)greenColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:0 g:255. b:0 a:alpha];
}

+ (UIColor *)blueColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:0 g:0 b:255. a:alpha];
}

+ (UIColor *)yellowColorWithAlpha:(CGFloat)alpha {
    return [UIColor r:255. g:255. b:0 a:alpha];
}

#pragma mark - RGB(A)

+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue {
    return [UIColor r:red g:green b:blue a:1];
}

+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255. green:green / 255. blue:blue / 255. alpha:alpha];
}

@end
