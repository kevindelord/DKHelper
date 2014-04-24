//
//  NSObject+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_NSObject_h__
#define DKHelper_NSObject_h__

#import <UIKit/UIKit.h>

@interface NSObject (Block)

#pragma mark - NSObject+Block

/**
 * Performs a code block after a given delay.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value.
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 */
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end

#endif