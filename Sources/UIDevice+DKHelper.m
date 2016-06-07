//
//  UIDevice+DKHelper.m
//  DKHelper
//
//  Created by kevin delord on 24/04/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "UIDevice+DKHelper.h"
#import "NSString+DKHelper.h"
#import <sys/sysctl.h>

@implementation UIDevice (Model)

@dynamic isIPad, isSlowDevice;

#pragma mark - UIDevice+Model

+ (NSString * _Nonnull)currentPlatform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString * _Nonnull)currentPlatformName {
	NSString *platformString = [UIDevice currentPlatform];
	return [self platformNameFromString:platformString];
}

+ (NSString * _Nonnull)platformNameFromString:(NSString * _Nonnull)platform {
	// https://www.theiphonewiki.com/wiki/Models
	// https://en.wikipedia.org/wiki/List_of_iOS_devices
	// Apple TV
	if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
	if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3G";
	if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3G";
	if ([platform isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4G";

	// Apple Watch
	if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch";
	if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch";

	// iPhone
	if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone";
	if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
	if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
	if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
	if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
	if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
	if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
	if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
	if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
	if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C (GSM)";
	if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C (GSM+CDMA)";
	if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
	if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S (GSM+CDMA)";
	if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
	if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
	if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
	if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
	if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";

	// iPod
	if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch";
	if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
	if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
	if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
	if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
	if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";

	// iPad
	if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
	if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
	if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
	if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
	if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
	if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
	if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
	if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
	if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
	if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
	if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
	if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
	if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
	if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
	if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
	if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
	if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro (WiFi)";
	if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro (Cellular)";
	if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro (WiFi)";
	if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro (Cellular)";

	// iPad Mini
	if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
	if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
	if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
	if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
	if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
	if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
	if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
	if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
	if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China Model)";
	if ([platform isEqualToString:@"iPad5,1"])      return @"iPad mini 4 (WiFi)";
	if ([platform isEqualToString:@"iPad5,2"])      return @"iPad mini 4 (Cellular)";

	// Simulator
	if ([platform isEqualToString:@"i386"])         return @"Simulator";
	if ([platform isEqualToString:@"x86_64"])       return @"Simulator";

	return platform;
}

+ (BOOL)isSlowDeviceForPlatform:(NSString * _Nonnull)platform {
	NSArray * slowPlatforms = [NSArray arrayWithObjects:
									@"iPhone1,1", // iPhone 1G
									@"iPhone1,2", // iPhone 3G
									@"iPhone2,1", // iPhone 3GS
									@"iPhone3,1", // iPhone 4
									@"iPhone3,2", // iPhone 4
									@"iPhone3,3", // Verizon iPhone 4
									@"iPhone4,1", // iPhone 4S

									@"iPod1,1", // iPod Touch
									@"iPod2,1", // iPod Touch 2G
									@"iPod3,1", // iPod Touch 3G
									@"iPod4,1", // iPod Touch 4G

									@"iPad1,1", // iPad 1
									@"iPad2,1", // iPad 2 (WiFi)
									@"iPad2,2", // iPad 2 (GSM)
									@"iPad2,3", // iPad 2 (CDMA)
									@"iPad2,4", // iPad 2 (WiFi)

									@"iPad2,5", // iPad Mini (WiFi)
									@"iPad2,6", // iPad Mini (GSM)
									@"iPad2,7", // iPad Mini (GSM+CDMA)
									nil];

	return [slowPlatforms containsObject:platform];
}

- (BOOL)isSlowDevice {
    NSString *currentPlatform = [UIDevice currentPlatform];
	return [UIDevice isSlowDeviceForPlatform:currentPlatform];
}

- (BOOL)isIPad {
    return [self.model hasPrefix:@"iPad"];
}

#pragma mark - System Version

+ (BOOL)systemVersionEqualTo:(NSString * _Nonnull)version {
	if (version.isNumeric == false) {
		return false;
	}
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)systemVersionGreaterThan:(NSString * _Nonnull)version {
	if (version.isNumeric == false) {
		return false;
	}
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)systemVersionGreaterThanOrEqualTo:(NSString * _Nonnull)version {
	if (version.isNumeric == false) {
		return false;
	}
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

+ (BOOL)systemVersionLessThan:(NSString * _Nonnull)version {
	if (version.isNumeric == false) {
		return false;
	}
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)systemVersionLessThanOrEqualTo:(NSString * _Nonnull)version {
	if (version.isNumeric == false) {
		return false;
	}
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

@end
