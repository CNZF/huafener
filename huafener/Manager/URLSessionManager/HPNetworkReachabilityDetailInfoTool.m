//
//  HPWWANDetailInfoTool.m
//  huafener
//
//  Created by 杨俊杰 on 2019/12/27.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPNetworkReachabilityDetailInfoTool.h"
#import "HPHTTPSessionManager.h"
#import <AFNetworking.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


@implementation HPNetworkReachabilityDetailInfoTool

+ (void)getNetWorkReachability{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝网络");
                [HPHTTPSessionManager netReachAbleChange:YES];
               [self getWWANDetailInfo];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                [HPHTTPSessionManager netReachAbleChange:YES];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                [HPHTTPSessionManager netReachAbleChange:NO];
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                [HPHTTPSessionManager netReachAbleChange:NO];
                break;
            default:
                break;
        }
    }];
}


+ (HPReachabilityStatus)getWWANDetailInfo{
    NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                               CTRadioAccessTechnologyGPRS,
                               CTRadioAccessTechnologyCDMA1x];
    
    NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,
                               CTRadioAccessTechnologyWCDMA,
                               CTRadioAccessTechnologyHSUPA,
                               CTRadioAccessTechnologyCDMAEVDORev0,
                               CTRadioAccessTechnologyCDMAEVDORevA,
                               CTRadioAccessTechnologyCDMAEVDORevB,
                               CTRadioAccessTechnologyeHRPD];
    
    NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
    // 该 API 在 iOS7 以上系统才有效
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        CTTelephonyNetworkInfo *teleInfo= [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
        if ([typeStrings4G containsObject:accessString]) {
            NSLog(@"4G网络");
            return HPReachabilityStatusWWAN_4G;
        } else if ([typeStrings3G containsObject:accessString]) {
            NSLog(@"3G网络");
            return HPReachabilityStatusWWAN_3G;
        } else if ([typeStrings2G containsObject:accessString]) {
            NSLog(@"2G网络");
            return HPReachabilityStatusWWAN_2G;
        } else {
            NSLog(@"未知网络");
            return HPReachabilityStatusUnknown;
        }
    } else {
        NSLog(@"未知网络");
        return HPReachabilityStatusUnknown;
    }
}

@end
