//
//  UIImageView+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 5/10/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIImageView+DKHelper.h"

@implementation UIImageView (DKHelper)

- (instancetype _Nonnull)initWithImageNamed:(NSString * _Nonnull)imageName {
    return [self initWithImage:[UIImage imageNamed:imageName]];
}

- (instancetype _Nonnull)initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = image;
    }
    return self;
}

- (instancetype _Nonnull)initWithFrame:(CGRect)frame imageNamed:(NSString * _Nonnull)imageName {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:imageName];
    }
    return self;
}

@end
