//
//  UIView+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIView+DKHelper.h"
#import "DKHelper.h"

@implementation UIView (DKHelper)

#pragma mark - UIView+RoundCorner

- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius {
    // Create the path (with only the top-left corner rounded)
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.layer.mask = maskLayer;
}

#pragma mark - CGRect Methods

- (void)setFrameWidth:(CGFloat)width {
    self.frame = CGRectSetWidth(self.frame, width);
}

- (void)setFrameHeight:(CGFloat)height {
    self.frame = CGRectSetHeight(self.frame, height);
}

- (void)setFrameX:(CGFloat)x {
    self.frame = CGRectSetX(self.frame, x);
}

- (void)setFrameY:(CGFloat)y {
    self.frame = CGRectSetY(self.frame, y);
}

- (void)setFrameOrigin:(CGPoint)origin {
    self.frame = CGRectSetOrigin(self.frame, origin);
}

- (void)setFrameSize:(CGSize)size {
    self.frame = CGRectSetSize(self.frame, size);
}

#pragma mark - CGRect Methods (Getter)

/**
 * Returns the origin value of the receiver's frame.
 */
- (CGPoint)frameOrigin {
    return self.frame.origin;
}

/**
 * Returns the size value of the receiver's frame.
 */
- (CGSize)frameSize {
    return self.frame.size;
}

/**
 * Returns the size.width of the receiver's frame.
 */
- (CGFloat)frameWidth {
    return self.frame.size.width;
}

/**
 * Returns the height of the receiver's frame.
 */
- (CGFloat)frameHeight {
    return self.frame.size.height;
}

/**
 * Returns the origin.x of the receiver's frame.
 */
- (CGFloat)frameX {
    return self.frame.origin.x;
}

/**
 * Set the origin.y of the receiver's frame.
 */
- (CGFloat)frameY {
    return self.frame.origin.y;
}

@end
