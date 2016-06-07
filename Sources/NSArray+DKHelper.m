//
//  NSArray+DKHelper.m
//  DKHelper
//
//  Created by Kévin Delord on 29/09/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "NSArray+DKHelper.h"

@implementation NSArray (DKHelper)

+ (instancetype _Nonnull)imageFileExtensions {
    return @[@".tif", @".tiff", @".gif", @".jpeg", @".jpg", @".png", @".pjpeg"];
}

+ (instancetype _Nonnull)audioFileExtensions {
    return @[@".mp3", @".mp2", @".wma", @".aac", @".m4a", @".mp4", @".m4p"];
}

+ (instancetype _Nonnull)videoFileExtensions {
    return @[@".avi", @".flv", @".wmv", @".mp4", @".mov", @".mpg", @".divx", @".asf"];
}

@end
