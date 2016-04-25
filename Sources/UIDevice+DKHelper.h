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

#define SYSTEM_VERSION_EQUAL_TO(v)                  [UIDevice systemVersionEqualTo:v]
#define SYSTEM_VERSION_GREATER_THAN(v)              [UIDevice systemVersionGreaterThan:v]
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  [UIDevice systemVersionGreaterThanOrEqualTo:v]
#define SYSTEM_VERSION_LESS_THAN(v)                 [UIDevice systemVersionLessThan:v]
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     [UIDevice systemVersionLessThanOrEqualTo:v]

/**
 * A categorized class of UIDevice to add a bunch of helping methods.
 */
@interface UIDevice (Model)

#pragma mark - UIDevice+Model

/**
 * Returns the current device name as a NSString.
 *
 * @discussion Example @"iPhone5,3" for @"iPhone 5c (GSM+CDMA)"
 *
 * @return The system name of the current device.
 */
+ (NSString * _Nonnull)currentPlatform;

/**
 * Returns a NSString describing the current device.
 *
 * @discussion For example, returns @"iPhone 5C (GSM)" for iPhone 5c.
 *
 * @return A string describing the current device with a user-friendly name.
 * @return If recognized, a string describing the current devicewith an user-friendly name; otherwise returns the device factory name.
 */
+ (NSString * _Nonnull)currentPlatformName;

/**
 * Returns a NSString describing the given platform string.
 *
 * @discussion For example, returns @"iPhone 5C (GSM)" for @"iPhone5,3".
 * If the given string does not match the device list, the parameter string is returned.
 *
 * @see https://www.theiphonewiki.com/wiki/Models
 *
 * @param platform A platform string representing an iOS device, for example @"iPhone5,3".
 * @return If recognized, a string describing the given platform with an user-friendly name; otherwise returns the given parameter.
 */
+ (NSString * _Nonnull)platformNameFromString:(NSString * _Nonnull)platform;

/**
 * Returns a Boolean value indicating whether the device related to the given platform is a slow or not.
 *
 * @discussion iPod 4G, iPhone 4S, iPad 2, the first iPad Minis and older are considered as slow devices.
 *
 * @return YES if the related device is a slow one.
 */
+ (BOOL)isSlowDeviceForPlatform:(NSString * _Nonnull)platform;

/**
 * Returns a Boolean value indicating whether the current device is a slow one or not.
 *
 * @discussion iPod 4G, iPhone 4S, iPad 2, the first iPad Minis and older are considered as slow devices.
 *
 * @return YES if the current device is a slow one.
 */
@property (nonatomic) BOOL isSlowDevice;

/**
 * Returns a Boolean value indicating whether the current device is an iPad or not.
 *
 * @return YES if the current device is an iPad.
 */
@property (nonatomic) BOOL isIPad;

#pragma mark - System Version

/**
 * Return true if the system version is equal to the given parameter.
 */
+ (BOOL)systemVersionEqualTo:(NSString * _Nonnull)version;

/**
 * Return true if the system version is greater than the given parameter.
 */
+ (BOOL)systemVersionGreaterThan:(NSString * _Nonnull)version;

/**
 * Return true if the system version is greater or equal to the given parameter.
 */
+ (BOOL)systemVersionGreaterThanOrEqualTo:(NSString * _Nonnull)version;

/**
 * Return true if the system version is less than the given parameter.
 */
+ (BOOL)systemVersionLessThan:(NSString * _Nonnull)version;

/**
 * Return true if the system version is less than or equal to the given parameter.
 */
+ (BOOL)systemVersionLessThanOrEqualTo:(NSString * _Nonnull)version;

@end

#endif