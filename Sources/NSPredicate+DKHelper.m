//
//  NSPredicate+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSPredicate+DKHelper.h"

@implementation NSPredicate (DKHelper)

- (NSPredicate * _Nonnull)OR:(NSPredicate * _Nullable)predicate {
	if (predicate == nil) {
        return self;
    }
    return [NSCompoundPredicate orPredicateWithSubpredicates:@[self, predicate]];
}

- (NSPredicate * _Nonnull)AND:(NSPredicate * _Nullable)predicate {
    if (predicate == nil) {
        return self;
    }
    return [NSCompoundPredicate andPredicateWithSubpredicates:@[self, predicate]];
}

@end

NSPredicate * _Nullable OR_PREDICATE(NSPredicate * _Nullable a, NSPredicate * _Nullable b) {
	return (a != nil ? [a OR:b] : b);
}

NSPredicate * _Nullable AND_PREDICATE(NSPredicate * _Nullable a, NSPredicate * _Nullable b) {
	return (a != nil ? [a AND:b] : b);
}
