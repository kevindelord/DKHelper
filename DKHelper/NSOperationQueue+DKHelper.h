//
//  NSOperationQueue+Timeout.h
//
//
//  Created by Pierre Rothmaler on 30/09/15.
//  Copyright (c) 2015 Smart Mobile Factory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperationQueue (Timeout)

- (NSOperation *)addOperationWithBlock:(void (^)(NSOperation *operation))block timeout:(NSTimeInterval)timeout timeoutBlock:(void (^)(void))timeoutBlock;

@end
