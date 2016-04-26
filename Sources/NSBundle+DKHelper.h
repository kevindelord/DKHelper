//
//  NSBundle+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 25/05/15.
//  Copyright (c) 2015 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (DKHelper)

#pragma mark - Static functions

/**
 * Returns the value related to the given key in the main bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns the value associated with the key from the main bundle property list (Info.plist). The localized value of a key is returned when one is available.
 */
+ (id _Nonnull)entryInPListForKey:(NSString * _Nonnull)key;

/**
 * Returns the value related to the given key in the main bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns a NSString value associated with the key from the main bundle property list (Info.plist). The localized value of a key is returned when one is available.
 */
+ (NSString * _Nonnull)stringEntryInPListForKey:(NSString * _Nonnull)key;

/**
 * Returns the value related to the given key in the main bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns a BOOL value associated with the key in the main bundle property list (Info.plist).
 */
+ (BOOL)booleanEntryInPListForKey:(NSString * _Nonnull)key;

/**
 * Returns the value related to the given key in the main bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns a NSNumber value associated with the key from the main bundle property list (Info.plist). The localized value of a key is returned when one is available.
 */
+ (NSNumber * _Nonnull)numberEntryInPListForKey:(NSString * _Nonnull)key;

#pragma mark - Instance functions

/**
 * Returns the value related to the given key in the current bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns the value associated with the key from the current bundle property list (Info.plist). The localized value of a key is returned when one is available.
 */
- (id _Nonnull)entryInPListForKey:(NSString * _Nonnull)key;

/**
 * Returns the value related to the given key in the current bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns a NSString value associated with the key from the current bundle property list (Info.plist). The localized value of a key is returned when one is available.
 */
- (NSString * _Nonnull)stringEntryInPListForKey:(NSString * _Nonnull)key;

/**
 * Returns the value related to the given key in the current bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns a BOOL value associated with the key in the current bundle property list (Info.plist).
 */
- (BOOL)booleanEntryInPListForKey:(NSString * _Nonnull)key;

/**
 * Returns the value related to the given key in the current bundle information property list.
 *
 * @discussion This function will raise an exception if no value for the given key has been found.
 * Use this function to get static/setup data.
 *
 * @param key A key in the receiver's property list.
 * @return Returns a NSNumber value associated with the key from the current bundle property list (Info.plist). The localized value of a key is returned when one is available.
 */
- (NSNumber * _Nonnull)numberEntryInPListForKey:(NSString * _Nonnull)key;

@end
