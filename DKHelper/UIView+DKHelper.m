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

@end
