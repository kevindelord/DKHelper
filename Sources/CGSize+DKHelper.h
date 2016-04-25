//
//  CGSize+DKHelper.h
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#ifndef DKHelper_CGSize_h__
#define DKHelper_CGSize_h__

#import <UIKit/UIKit.h>

/**
 * Returns a new CGSize structure corresponding to a `big` size adjusted to fit into a `smaller` CGSize container.
 *
 * @discussion The ratio of the original size is conserved.
 * The receiver has to be bigger than the container; otherwise nothing happen.
 *
 * @param size The size to adjust
 * @param container The container's size into which the given size needs to fit.
 * @return A new CGSize structure.
 */
CGSize CGSizeFitToCGSize(CGSize size, CGSize container);

/**
 * Returns a new CGSize structure corresponding to a size adjusted to another CGSize value.
 *
 * @discussion The ratio of the original size is conserved.
 *
 * If the size is bigger then the container, it gets smaller; otherwise bigger.
 *
 * @param size The size to adjust
 * @param container The container's size into which the given size needs to be adjusted.
 * @return A new CGSize structure.
 */
CGSize CGSizeAdjustToCGSize(CGSize size, CGSize container);

/**
 * Returns a new CGSize structure corresponding to the given size multiplied by the given factor.
 *
 *  @param size   The base size
 *  @param factor The factor the size should be multiplied with
 *
 *  @return A new CGSize structure.
 */
CGSize CGSizeMultiply(CGSize size, CGFloat factor);

#endif