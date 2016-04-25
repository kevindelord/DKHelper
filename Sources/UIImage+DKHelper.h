//
//  UIImage+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIImage to add a bunch of helping methods.
 */
@interface UIImage (DKHelper)

/**
 * Creates a new UIImage object that fit the given size;
 *
 * @param image The image to resize.
 * @param size The desired image size.
 * @return A new UIImage object.
 */
+ (UIImage * _Null_unspecified)scaleImage:(UIImage * _Nonnull)image size:(CGSize)size;

/**
 * Creates a new UIImage object that fit given size.
 *
 * @discussion The ratio of the receiver is kept.
 *
 * @return A new UIImage object.
 */
- (UIImage * _Null_unspecified)resizedImageToSize:(CGSize)newSize;

/**
 * Creates a new UIImage object that fit the current screen size.
 *
 * @discussion The ratio of the receiver is kept.
 *
 * @return A new UIImage object.
 */
- (UIImage * _Null_unspecified)resizedImageToScreenSize;

/**
 *  Calculated the size of the UIImage in pixels instead of points
 *
 *  @return Size of the image in pixels
 */
- (CGSize)sizeInPixel;

@end
