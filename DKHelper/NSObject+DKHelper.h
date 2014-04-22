//
//  NSObject+DKHelper.h
//  
//
//  Created by Kévin Delord on 4/22/14.
//
//

#ifndef DKHelper_NSObject_h__
#define DKHelper_NSObject_h__

#import <UIKit/UIKit.h>

@interface NSObject (Block)

#pragma mark - NSObject+Block

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end

#endif