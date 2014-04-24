//
//  UIView+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_UIView_h__
#define DKHelper_UIView_h__

#import <UIKit/UIKit.h>

@interface UIView (DKHelper)

#pragma mark - UIView+RoundCorner

/**
 * Rounds the specified corner(s) of the receiver with a given radius.
 *
 * @param corner A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle.
 * @param cornerRadius A CGFloat value corresponding to the radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
 * @return A NSString containing the date with the given date format. NULL if the date isn't valid.
 */
- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius;

#pragma mark - CGRect Methods

/**
 * Set the origin of the receiver's frame.
 *
 * @param origin The new CGPoint value.
 */
- (void)setFrameOrigin:(CGPoint)origin;

/**
 * Set the size of the receiver's frame.
 *
 * @param size The new CGSize value.
 */
- (void)setFrameSize:(CGSize)size;

/**
 * Set the size.width of the receiver's frame.
 *
 * @param width The new CGFloat value.
 */
- (void)setFrameWidth:(CGFloat)width;

/**
 * Set the height of the receiver's frame.
 *
 * @param height The new CGFloat value.
 */
- (void)setFrameHeight:(CGFloat)height;

/**
 * Set the origin.x of the receiver's frame.
 *
 * @param x The new CGFloat value.
 */
- (void)setFrameX:(CGFloat)x;

/**
 * Set the origin.y of the receiver's frame.
 *
 * @param y The new CGFloat value.
 */
- (void)setFrameY:(CGFloat)y;

@end

#endif