//
//  NSArray+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A categorized class of NSArray to add a bunch of helping methods.
 */
@interface NSArray (DKHelper)

/**
 * Return an array of the most common image file extensions.
 *
 * @discussion The extensions are: .tif, .tiff, .gif, .jpeg, .jpg, .png, .pjpeg
 */
+ (NSArray *)imageFileExtensions;

/**
 * Return an array of the most common audio file extensions.
 *
 * @discussion The extensions are: .mp3, .mp2, .wma, .aac, .m4a, .mp4, .m4p
 */
+ (NSArray *)audioFileExtensions;

/**
 * Return an array of the most common video file extensions.
 *
 * @discussion The extensions are: .avi, .flv, .wmv, .mp4, .mov, .mpg, .divx, .asf
 */
+ (NSArray *)videoFileExtensions;

@end
