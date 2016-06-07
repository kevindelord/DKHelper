//
//  CGSize+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "CGSize+DKHelper.h"

CGSize CGSizeFitToCGSize(CGSize size, CGSize container) {
    CGFloat w = size.width;
    CGFloat h = size.height;

    if (w > container.width) {
        h = h / (w / container.width);
        w = container.width;
    }
    if (h > container.height) {
        w = w / (h / container.height);
        h = container.height;
    }
    return CGSizeMake(w, h);
}

CGSize CGSizeAdjustToCGSize(CGSize size, CGSize container) {

	CGFloat w = size.width;
	CGFloat h = size.height;

	if (w < container.width) {
		h = h * (container.width / w);
		w = container.width;
	} else if (w > container.width) {
		h = h / (w / container.width);
		w = container.width;
	}

	if (h < container.height) {
		w = w * (container.height / h);
		h = container.height;
	} else if (h > container.height) {
		w = w / (h / container.height);
		h = container.height;
	}

    return CGSizeMake(w, h);
}

CGSize CGSizeMultiply(CGSize size, CGFloat factor) {
	return CGSizeMake(size.width * factor, size.height * factor);
}