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

/**
 * A categorized class of UIView to add a bunch of helping methods.
 */
@interface UIView (DKHelper)

#pragma mark - UIView+Load

/**
 * Loads and returns a view from a nib file within the main bundle.
 *
 * @param name The name as a NSString of the nib file in the main bundle.
 * @return If exist the loaded view; otherwise nil.
 */
+ (instancetype _Nullable)loadFromNib:(NSString * _Nonnull)name;

/**
 * Loads and returns a view from a nib file.
 *
 * @param name The name as a NSString of the nib file in the given bundle.
 * @param bundle The NSBundle to load the nib file from.
 * @return If exist the loaded view; otherwise nil.
 */
+ (instancetype _Nullable)loadFromNib:(NSString * _Nonnull)name fromBundle:(NSBundle * _Nonnull)bundle;

#pragma mark - UIView+Constraints

/**
 * Creates and add layout constraints to adjust the receiver to match its superview dimensions and position.
 *
 * @return The added layout contraints. Empty array if the receiver does not have a superview.
 */
- (NSArray<NSLayoutConstraint *> * _Nonnull)matchParentConstraints;

#pragma mark - UIView+Layer

/**
 * Creates and returns a new vertical gradient view.
 *
 * @param rect The location and dimensions of the new view.
 * @param topColor The top color of the gradient.
 * @param bottomColor The bottom color of the gradient.
 * @return A new UIView object with a gradient color.
 */
+ (UIView * _Nonnull)verticalGradientLayer:(CGRect)rect topColor:(UIColor * _Nonnull)topColor bottomColor:(UIColor * _Nonnull)bottomColor;

/**
 * Rounds the specified corner(s) of the receiver with a given radius.
 *
 * @discussion By default set the layer's maskToBound value to NO
 *
 * @param corner A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle or all of them.
 * @param cornerRadius A CGFloat value corresponding to the radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
 */
- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius;

/**
 * Rounds the specified corner(s) of the receiver with a given radius.
 *
 * @param corner A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle or all of them.
 * @param cornerRadius A CGFloat value corresponding to the radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height.
 * @param maskToBounds A Boolean value to apply, if true, an implicit mask matching the layer bounds (will tell the UIView not to draw everything that is outside itself).
 */
- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius maskToBounds:(BOOL)maskToBounds;

#pragma mark - CGRect Methods

/**
 * Origin of the receiver's frame in CGPoint.
 */
@property (nonatomic) CGPoint frameOrigin;

/**
 * Size of the receiver's frame in CGSize.
 */
@property (nonatomic) CGSize frameSize;

/**
 * Returns the size.width of the receiver's frame.
 */
@property (nonatomic) CGFloat frameWidth;

/**
 * Height of the receiver's frame in CGFloat.
 */
@property (nonatomic) CGFloat frameHeight;

/**
 * X origin of the receiver's frame in CGFloat.
 */
@property (nonatomic) CGFloat frameX;

/**
 * Y origin of the receiver's frame in CGFloat.
 */
@property (nonatomic) CGFloat frameY;

@end

#endif