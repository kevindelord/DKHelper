//
//  UIImage+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIImage+DKHelper.h"
#import <objc/runtime.h>

static Method origImageNamedMethod = nil;

@implementation UIImage (Retina4)

#pragma mark - UIImage+Retina4

// original code here: https://gist.github.com/sserye/3719620
+ (void)initialize {
    origImageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(self, @selector(retina4ImageNamed:)));
}

// original code here: https://gist.github.com/sserye/3719620
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
