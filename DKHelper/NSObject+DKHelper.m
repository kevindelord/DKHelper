//
//  NSObject+DKHelper.m
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#import "NSObject+DKHelper.h"

@implementation NSObject (Block)

#pragma mark - NSObject+Block

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    int64_t delta = (int64_t)(1.0e9 * delay);
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

@end