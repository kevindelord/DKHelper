//
//  UIDevice+DKHelper.h
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#ifndef DKHelper_UIDevice_h__
#define DKHelper_UIDevice_h__

#import <UIKit/UIKit.h>

@interface UIDevice (Model)

#pragma mark - UIDevice+Model

+ (NSString *)platform;
+ (NSString *)platformString;
+ (BOOL)isSlowDevice;
+ (BOOL)isIPad;

@end

#endif