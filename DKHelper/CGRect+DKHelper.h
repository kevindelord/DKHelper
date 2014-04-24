//
//  CGRect+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_CGRect_h__
#define DKHelper_CGRect_h__

/**
 * Returns a Boolean value indicating whether a frame is inside a container.
 *
 * @param frame The frame
 * @param container The container in which the frame is supposed to be.
 * @return YES if the frame is inside the given container.
 */
BOOL    CGRectInsideContainer(CGRect frame, CGRect container);
CGRect  CGRectSetWidth(CGRect rect, CGFloat width);
CGRect  CGRectSetHeight(CGRect rect, CGFloat height);
CGRect  CGRectSetSize(CGRect rect, CGSize size);
CGRect  CGRectSetX(CGRect rect, CGFloat x);
CGRect  CGRectSetY(CGRect rect, CGFloat y);
CGRect  CGRectSetOrigin(CGRect rect, CGPoint origin);


#endif