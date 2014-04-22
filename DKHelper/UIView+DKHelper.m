//
//  UIView+DKHelper.m
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#import "UIView+DKHelper.h"

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

+ (void)logRect:(CGRect)f container:(CGRect)container {
    NSLog(@"    frame: %0.f %0.f %0.f %0.f", f.origin.x, f.origin.y, f.size.width, f.size.height);
    NSLog(@"container: %0.f %0.f %0.f %0.f", container.origin.x, container.origin.y, container.size.width, container.size.height);
    NSLog(@"---- %d %d %d %d ----",
          (int)f.origin.x >= (int)container.origin.x,
          ((int)f.origin.x + (int)f.size.width) <= ((int)container.origin.x + (int)container.size.width),
          (int)f.origin.y >= (int)container.origin.y,
          ((int)f.origin.y + (int)f.size.height) <= ((int)container.origin.y + (int)container.size.height));
}

+ (BOOL)isFrame:(CGRect)frame insideOfContainer:(CGRect)container {
    return (
            (int)frame.origin.x >= (int)container.origin.x
            && ((int)frame.origin.x + (int)frame.size.width) <= ((int)container.size.width + (int)container.origin.x)
            && (int)frame.origin.y >= (int)container.origin.y
            && ((int)frame.origin.y + (int)frame.size.height) <= ((int)container.size.height + (int)container.origin.y)
            );
}

+ (CGRect)setFrame:(CGRect)frame insideOfContainer:(CGRect)container {
    
    if (frame.origin.x < container.origin.x)
        frame.origin.x = container.origin.x;
    else if ((frame.origin.x + frame.size.width) > (container.origin.x + container.size.width))
        frame.origin.x = (container.origin.x + container.size.width) - frame.size.width;
    
    if (frame.origin.y < container.origin.y)
        frame.origin.y = container.origin.y;
    else if ((frame.origin.y + frame.size.height) > (container.origin.y + container.size.height))
        frame.origin.y = (container.origin.y + container.size.height) - frame.size.height;
    
    return frame;
}

+ (CGSize)adjustSize:(CGSize)size toCGRect:(CGRect)rect {
    CGFloat w = size.width;
    CGFloat h = size.height;
    
    if (w > rect.size.width) {
        h = h / (w / rect.size.width);
        w = rect.size.width;
    }
    if (h > rect.size.height) {
        w = w / (h / rect.size.height);
        h = rect.size.height;
    }
    return CGSizeMake(w, h);
}

+ (CGSize)adjustSize:(CGSize)size withSize:(CGSize)rSize {
    CGFloat w = size.width / rSize.width;
    CGFloat h = rSize.height * w;
    w *= rSize.width;
    
    return CGSizeMake(w, h);
}

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

#pragma mark - CGRect Functions

CGRect CGRectSetWidth(CGRect rect, CGFloat width) {
    return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}

CGRect CGRectSetHeight(CGRect rect, CGFloat height) {
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}

CGRect CGRectSetSize(CGRect rect, CGSize size) {
    return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height);
}

CGRect CGRectSetX(CGRect rect, CGFloat x) {
    return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height);
}

CGRect CGRectSetY(CGRect rect, CGFloat y) {
    return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}

CGRect CGRectSetOrigin(CGRect rect, CGPoint origin) {
    return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height);
}

@end
