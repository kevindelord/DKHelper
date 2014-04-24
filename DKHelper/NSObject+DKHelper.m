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

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    if (block != nil) {
        int64_t delta = (int64_t)(1.0e9 * delay);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
    }
}

@end