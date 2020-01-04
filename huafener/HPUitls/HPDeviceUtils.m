//
//  HPDeviceUtils.m
//  GHZeusLibraries
//
//  Created by 杨俊杰 on 2019/7/5.
//  Copyright © 2019 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPDeviceUtils.h"
#import <sys/utsname.h>

@implementation HPDeviceUtils

+ (NSString *)getDeviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    //simulator
    if ([platform isEqualToString:@"i386"])          return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])        return @"Simulator";
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])     return @"iPhone_1G";
    if ([platform isEqualToString:@"iPhone1,2"])     return @"iPhone_3G";
    if ([platform isEqualToString:@"iPhone2,1"])     return @"iPhone_3GS";
    if ([platform isEqualToString:@"iPhone3,1"])     return @"iPhone_4";
    if ([platform isEqualToString:@"iPhone3,2"])     return @"iPhone_4";
    if ([platform isEqualToString:@"iPhone4,1"])     return @"iPhone_4s";
    if ([platform isEqualToString:@"iPhone5,1"])     return @"iPhone_5";
    if ([platform isEqualToString:@"iPhone5,2"])     return @"iPhone_5";
    if ([platform isEqualToString:@"iPhone5,3"])     return @"iPhone_5C";
    if ([platform isEqualToString:@"iPhone5,4"])     return @"iPhone_5C";
    if ([platform isEqualToString:@"iPhone6,1"])     return @"iPhone_5S";
    if ([platform isEqualToString:@"iPhone6,2"])     return @"iPhone_5S";
    if ([platform isEqualToString:@"iPhone7,1"])     return @"iPhone_6P";
    if ([platform isEqualToString:@"iPhone7,2"])     return @"iPhone_6";
    if ([platform isEqualToString:@"iPhone8,1"])     return @"iPhone_6s";
    if ([platform isEqualToString:@"iPhone8,2"])     return @"iPhone_6s_P";
    if ([platform isEqualToString:@"iPhone8,4"])     return @"iPhone_SE";
    if ([platform isEqualToString:@"iPhone9,1"])     return @"iPhone_7";
    if ([platform isEqualToString:@"iPhone9,3"])     return @"iPhone_7";
    if ([platform isEqualToString:@"iPhone9,2"])     return @"iPhone_7P";
    if ([platform isEqualToString:@"iPhone9,4"])     return @"iPhone_7P";
    if ([platform isEqualToString:@"iPhone10,1"])    return @"iPhone_8";
    if ([platform isEqualToString:@"iPhone10,4"])    return @"iPhone_8";
    if ([platform isEqualToString:@"iPhone10,2"])    return @"iPhone_8P";
    if ([platform isEqualToString:@"iPhone10,5"])    return @"iPhone_8P";
    if ([platform isEqualToString:@"iPhone10,3"])    return @"iPhone_X";
    if ([platform isEqualToString:@"iPhone10,6"])    return @"iPhone_X";
    if ([platform isEqualToString:@"iPhone11,2"])    return @"iPhone_X_S";
    if ([platform isEqualToString:@"iPhone11,4"])    return @"iPhone_X_S_MAX";
    if ([platform isEqualToString:@"iPhone11,6"])    return @"iPhone_X_S_MAX";
    if ([platform isEqualToString:@"iPhone11,8"])    return @"iPhone_X_R";
    return @"Unknown";
    
}

@end
