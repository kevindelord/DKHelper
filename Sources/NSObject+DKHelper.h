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

/**
 * A categorized class of NSObject to add a bunch of helping methods.
 */
@interface NSObject (Block)

#pragma mark - NSObject+Block

/**
 * Performs a code block after a given delay.
 *
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on the main thread.
 */
- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(nullable void (^)(void))block;

/**
 * Performs a code block on the main thread.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on the main thread.
 */
- (void)performBlockInMainThread:(nullable void (^)(void))block;

/**
 * Performs a code block on a background thread.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 */
- (void)performBlockInBackground:(nullable void (^)(void))block;

/**
 * Performs a code block on a background thread and call a completion block on the main thread when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed. It will be executed on the main thread.
 */
- (void)performBlockInBackground:(nullable void (^)(void))block completion:(nullable void (^)(void))completionBlock;

/**
 * Performs a code block after a given delay and call a completion block when it's done.
 *
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed. It will be executed on the main thread.
 */
- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(nullable void (^)(void))block completion:(nullable void (^)(void))completionBlock;

/**
 * Performs a code block and call a completion block when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed. It will be executed on the main thread.
 */
- (void)performBlock:(nullable void (^)(void))block completion:(nullable void (^)(void))completionBlock;

@end

/**
 * Performs a code block after a given delay.
 *
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on the main thread.
 */
void performBlockAfterDelay(NSTimeInterval delay, dispatch_block_t _Nullable block);


/**
 * Performs a code block on the main thread.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on the main thread.
 */
void performBlockInMainThread(dispatch_block_t _Nullable block);

/**
 * Performs a code block on a background thread.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 */
void performBlockInBackground(dispatch_block_t _Nullable block);

/**
 * Performs a code block on a background thread and call a completion block on the main thread when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed. It will be executed on the main thread.
 */
void performBlockInBackgroundWithCompletionBlock(dispatch_block_t _Nullable block, dispatch_block_t _Nullable completionBlock);

/**
 * Performs a code block after a given delay and call a completion block when it's done.
 *
 * @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed. It will be executed on the main thread.
 */
void performBlockAfterDelayWithCompletionBlock(NSTimeInterval delay, dispatch_block_t _Nullable block, dispatch_block_t _Nullable completionBlock);

/**
 * Performs a code block and call a completion block when it's done.
 *
 * @param block A block object containing the code to execute. This block takes no parameters and has no return value. It will be executed on a background thread.
 * @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed. It will be executed on the main thread.
 */
void performBlockWithCompletionBlock(dispatch_block_t _Nullable block, dispatch_block_t _Nullable completionBlock);

#endif
