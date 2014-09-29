//
//  NSPredicate+DKHelper.h
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicate (DKHelper)

- (NSPredicate *)OR:(NSPredicate *)predicate;
- (NSPredicate *)AND:(NSPredicate *)predicate;

@end
