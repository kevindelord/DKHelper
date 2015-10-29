//
//  NSObject+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSObject+DKHelper.h"

@implementation NSObject (Block)

#pragma mark - NSObject+Block

- (void)performBlock:(void (^)(void))block completion:(void (^)(void))completionBlock {
	if (block != nil) {
		block();
		if (completionBlock != nil) {
			completionBlock();
		}
	}
}

- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(void (^)(void))block completion:(void (^)(void))completionBlock {
	if (block != nil) {
		int64_t delta = (int64_t)(1.0e9 * delay);
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), ^(void){
			block();

			if (completionBlock != nil) {
				completionBlock();
			}
		});
	}
}

- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(void (^)(void))block {
	if (block != nil) {
		int64_t delta = (int64_t)(1.0e9 * delay);
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
	}
}

- (void)performBlockInBackground:(void (^)(void))block {
	if (block != nil) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^(void) {
			block();
		});
	}
}

- (void)performBlockInBackground:(void (^)(void))block completion:(void (^)(void))completionBlock {
	if (block != nil) {
		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^(void) {
			block();

			if (completionBlock != nil) {
				dispatch_async(dispatch_get_main_queue(), completionBlock);
			}
		});
	}
}

@end