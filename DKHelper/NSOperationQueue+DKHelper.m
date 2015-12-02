//
//  NSOperationQueue+DKHelper.m
//
//
//  Created by Pierre Rothmaler on 30/09/15.
//  Copyright (c) 2015 Smart Mobile Factory. All rights reserved.
//

#import "NSOperationQueue+DKHelper.h"

@implementation NSOperationQueue (DKHelper)

- (NSOperation * _Nullable)addOperationWithBlock:(nullable void (^)(NSOperation * _Nullable operation))block timeout:(NSTimeInterval)timeout timeoutBlock:(nullable void (^)(void))timeoutBlock {

	if (block == nil || timeoutBlock == nil) {
		return nil;
	}

	NSBlockOperation *blockOperation = [[NSBlockOperation alloc] init];
	NSBlockOperation __weak *weakOperation = blockOperation;

	[blockOperation addExecutionBlock:^{
		if (block != nil) {
			block(weakOperation);
		}
	}];

	[self addOperation:blockOperation];

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		if (weakOperation != nil && [weakOperation isFinished] == false) {
			[weakOperation cancel];
			if (timeoutBlock) {
				timeoutBlock();
			}
		}
	});

	return blockOperation;
}

@end
