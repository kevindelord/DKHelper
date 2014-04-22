//
//  UIView+DKHelper.h
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#ifndef DKHelper_UIView_h__
#define DKHelper_UIView_h__

#import <UIKit/UIKit.h>

@interface UIView (DKHelper)

#pragma mark - UIView+RoundCorner

- (void)roundCorner:(UIRectCorner)corner radius:(CGFloat)cornerRadius;

#pragma mark - CGRect Methods

+ (void)logRect:(CGRect)f container:(CGRect)container;
+ (BOOL)isFrame:(CGRect)frame insideOfContainer:(CGRect)container;
+ (CGRect)setFrame:(CGRect)frame insideOfContainer:(CGRect)container;
+ (CGSize)adjustSize:(CGSize)size toCGRect:(CGRect)rect;
+ (CGSize)adjustSize:(CGSize)size withSize:(CGSize)rSize;

- (void)setFrameOrigin:(CGPoint)origin;
- (void)setFrameSize:(CGSize)size;
- (void)setFrameWidth:(CGFloat)width;
- (void)setFrameHeight:(CGFloat)height;
- (void)setFrameX:(CGFloat)x;
- (void)setFrameY:(CGFloat)y;

#pragma mark - CGRect Functions

CGRect CGRectSetWidth(CGRect rect, CGFloat width);
CGRect CGRectSetHeight(CGRect rect, CGFloat height);
CGRect CGRectSetSize(CGRect rect, CGSize size);
CGRect CGRectSetX(CGRect rect, CGFloat x);
CGRect CGRectSetY(CGRect rect, CGFloat y);
CGRect CGRectSetOrigin(CGRect rect, CGPoint origin);

@end

#endif