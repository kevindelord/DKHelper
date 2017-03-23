//
//  UIImage+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import "UIImage+DKHelper.h"
#import "CGSize+DKHelper.h"

@implementation UIImage (DKHelper)

+ (UIImage * __nullable)scaleImage:(UIImage * _Nonnull)image size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage * __nullable)resizedImageToSize:(CGSize)newSize {

    CGSize adjustedSize = CGSizeAdjustToCGSize(self.size, newSize);
    return [UIImage scaleImage:self size:adjustedSize];
}

- (UIImage * __nullable)resizedImageToScreenSize {

    CGRect screenSize = UIScreen.mainScreen.bounds;
    return [self resizedImageToSize:screenSize.size];
}

- (CGSize)sizeInPixel {

	CGSize imageSize = self.size;
	imageSize.width *= self.scale;
	imageSize.height *= self.scale;
	return imageSize;
}

@end
