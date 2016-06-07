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

+ (UIImage * _Null_unspecified)scaleImage:(UIImage * _Nonnull)image size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage * _Null_unspecified)resizedImageToSize:(CGSize)newSize {

    CGSize adjustedSize = CGSizeAdjustToCGSize(self.size, newSize);
    return [UIImage scaleImage:self size:adjustedSize];
}

- (UIImage * _Null_unspecified)resizedImageToScreenSize {

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
