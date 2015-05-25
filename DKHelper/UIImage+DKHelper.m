//
//  UIImage+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import "UIImage+DKHelper.h"

@implementation UIImage (DKHelper)

+ (UIImage *)scaleImage:(UIImage *)image size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)resizedImageToScreenSize {

    CGRect screenSize = UIScreen.mainScreen.bounds;
    CGSize size = CGSizeMake(0, screenSize.size.height);
    CGFloat ratio = 0.0;

    if (self.size.height < screenSize.size.height) {
        ratio = screenSize.size.height / self.size.height;
        size.width = self.size.width * ratio;
    } else {
        ratio = self.size.height / screenSize.size.height;
        size.width = self.size.width / ratio;
    }
    return [UIImage scaleImage:self size:size];
}

@end
