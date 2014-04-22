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

+ (void)initialize;
+ (UIImage *)retina4ImageNamed:(NSString *)imageName;

@end

#endif