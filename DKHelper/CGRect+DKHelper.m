//
//  CGRect+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "CGRect+DKHelper.h"

BOOL CGRectInsideContainer(CGRect frame, CGRect container) {

    return (
            (int)CGRectGetMinX(frame) >= (int)CGRectGetMinX(container)
            && ((int)CGRectGetMinX(frame)+ (int)CGRectGetWidth(frame)) <= ((int)CGRectGetWidth(container) + (int)CGRectGetMinX(container))
            && (int)CGRectGetMinY(frame) >= (int)CGRectGetMinY(container)
            && ((int)CGRectGetMinY(container) + (int)CGRectGetHeight(frame)) <= ((int)CGRectGetHeight(container) + (int)CGRectGetMinY(container))
            );
}

CGRect CGRectSetInsideContainer(CGRect frame, CGRect container) {

	if ((CGRectGetMinX(frame) + CGRectGetWidth(frame)) > (CGRectGetMinX(container) + CGRectGetWidth(container))) {
		frame.origin.x = (CGRectGetMinX(container) + CGRectGetWidth(container)) - CGRectGetWidth(frame);
	} else if (CGRectGetMinX(frame) < CGRectGetMinX(container)) {
        frame.origin.x = CGRectGetMinX(container);
	}

	if ((CGRectGetMinY(frame) + CGRectGetHeight(frame)) > (CGRectGetMinY(container) + CGRectGetHeight(container))) {
        frame.origin.y = (CGRectGetMinY(container) + CGRectGetHeight(container)) - CGRectGetHeight(frame);
	} else if (CGRectGetMinY(frame) < CGRectGetMinY(container)) {
        frame.origin.y = CGRectGetMinY(container);
	}

    return frame;
}

CGRect CGRectSetWidth(CGRect rect, CGFloat width) {
    return CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), width, CGRectGetHeight(rect));
}

CGRect CGRectSetHeight(CGRect rect, CGFloat height) {
    return CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), height);
}

CGRect CGRectSetX(CGRect rect, CGFloat x) {
    return CGRectMake(x, CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect));
}

CGRect CGRectSetY(CGRect rect, CGFloat y) {
    return CGRectMake(CGRectGetMinX(rect), y, CGRectGetWidth(rect), CGRectGetHeight(rect));
}

CGRect CGRectSetOrigin(CGRect rect, CGPoint origin) {
    return CGRectMake(origin.x, origin.y, CGRectGetWidth(rect), CGRectGetHeight(rect));
}

CGRect CGRectSetSize(CGRect rect, CGSize size) {
	return CGRectMake(CGRectGetMinX(rect), CGRectGetMinY(rect), size.width, size.height);
}
