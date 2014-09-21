//
//  UIDevice+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_UIDevice_h__
#define DKHelper_UIDevice_h__

#import <UIKit/UIKit.h>

/**
 * A categorized class of UIDevice to add a bunch of helping methods.
 */
@interface UIDevice (Model)

#pragma mark - UIDevice+Model

/**
 * Returns the device name as a NSString.
 *
 * @discussion Example @"iPhone5,3" for @"iPhone 5c (GSM+CDMA)"
 *
 * @return The system name of the current device
 */
+ (NSString *)platform;

/**
 * Returns a NSString describing the current device.
 *
 * @discussion Example @"iPhone 5c (GSM+CDMA)" for @"iPhone5,3"
 *
 * @return A string describing the current device with a user-friendly name.
 */
+ (NSString *)platformString;

/**
 * Returns a Boolean value indicating whether the current device is a slow one or not.
 *
 * @discussion iPod 4G, iPhone 4S, iPad 2 and older are considered as slow devices.
 *
 * @return YES if the current device is a slow one.
 */
+ (BOOL)isSlowDevice;

/**
 * Returns a Boolean value indicating whether the current device is an iPad or not.
 *
 * @return YES if the current device is an iPad.
 */
+ (BOOL)isIPad;

@end

#endif