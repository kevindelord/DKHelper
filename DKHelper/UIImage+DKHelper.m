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

@implementation UIImage (DKHelper)

#pragma mark - UIImage Initializer

+ (void)initialize {
    origImageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(origImageNamedMethod, class_getClassMethod(self, @selector(dynamicImageNamed:)));
}

+ (UIImage *)dynamicImageNamed:(NSString *)imageName {

    // only change the name if no '@2x' or '@3x' are specified
    if ([imageName rangeOfString:@"@"].location == NSNotFound) {

        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat scale = [UIScreen mainScreen].scale;

        // generate the current valid file extension depending on the current device screen size.
        NSString *extension = @"";
        if (scale == 3.f) {
            extension = @"@3x";
        } else if (scale == 2.f && h == 568.0f && w == 320.0f) {
            extension = @"-568h@2x";
        } else if (scale == 2.f && h == 667.0f && w == 375.0f) {
            extension = @"-667h@2x";
        } else if (scale == 2.f && h == 480.0f && w == 320.0f) {
            extension = @"@2x";
        }

        // add the extension to the image name
        NSRange dot = [imageName rangeOfString:@"."];
        NSMutableString *imageNameMutable = [imageName mutableCopy];
        if (dot.location != NSNotFound)
            [imageNameMutable insertString:extension atIndex:dot.location];
        else
            [imageNameMutable appendString:extension];

        // if exist returns the corresponding UIImage
        if ([[NSBundle mainBundle] pathForResource:imageNameMutable ofType:@""]) {
            return [UIImage dynamicImageNamed:imageNameMutable];
        }
    }
    // otherwise returns an UIImage with the original filename.
    return [UIImage dynamicImageNamed:imageName];
}

@end
