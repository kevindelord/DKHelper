//
//  NSPredicate+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A categorized class of NSPredicate to add a bunch of helping methods.
 */
@interface NSPredicate (DKHelper)

/**
 * Returns a predicate applying a 'OR' logic on the current object with the given parameter.
 *
 * @param predicate The predicate to apply to the current object. If nil, only the current object will be returned.
 * @return A predicate object.
 */
- (NSPredicate * _Nonnull)OR:(NSPredicate * _Nullable)predicate;

/**
 * Returns a predicate applying a 'AND' logic on the current object with the given parameter.
 *
 * @param predicate The predicate to apply to the current object. If nil, only the current object will be returned.
 * @return A predicate object.
 */
- (NSPredicate * _Nonnull)AND:(NSPredicate * _Nullable)predicate;

@end

/**
 * Create and return a 'OR' predicate out of two given predicates.
 *
 * @param a A NSPredicate object. If nil will be ignored.
 * @param b A NSPredicate object. If nil will be ignored.
 * @return A new NSPredicate object created from the parameters one with a 'OR' statement. Could return nil if both parameters are.
 */
NSPredicate * _Nullable OR_PREDICATE(NSPredicate * _Nullable a, NSPredicate * _Nullable b);

/**
 * Create and return a 'AND' predicate out of two given predicates.
 *
 * @param a A NSPredicate object. If nil will be ignored.
 * @param b A NSPredicate object. If nil will be ignored.
 * @return A new NSPredicate object created from the parameters one with a 'AND' statement. Could return nil if both parameters are.
 */
NSPredicate * _Nullable AND_PREDICATE(NSPredicate * _Nullable a, NSPredicate * _Nullable b);
