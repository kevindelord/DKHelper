//
//  UIColor+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 4/22/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DKHelper)

#pragma mark - DEBUG colors

+ (UIColor *)redColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)greenColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)blueColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)yellowColorWithAlpha:(CGFloat)alpha;

#pragma mark - RGB(A)

+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue;
+ (UIColor *)r:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;

@end
