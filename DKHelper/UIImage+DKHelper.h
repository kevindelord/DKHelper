//
//  UIImage+DKHelper.h
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#ifndef DKHelper_UIImage_h__
#define DKHelper_UIImage_h__

#import <UIKit/UIKit.h>

@interface UIImage (Retina4)

#pragma mark - UIImage+Retina4

//
// Method to override the imageNamed: method with the retina4ImageNamed: one.
// The new methode and its implementation will be executed instead of the default  UIImage::imageNamed:
//
+ (void)initialize;

/**
 * Returns a new UIImage object created from a filename.
 *
 * @param imageName The filename as a string of the image.
 * @discussion This method will automatically add the needed image suffix for the current device ("@2x", "-568h@2x" or nothing).
 * @return The new UIImage object created from a given string.
 */
+ (UIImage *)retina4ImageNamed:(NSString *)imageName;

@end

#endif