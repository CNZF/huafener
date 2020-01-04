//
//  HPWWANDetailInfoTool.h
//  huafener
//
//  Created by 杨俊杰 on 2019/12/27.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HPReachabilityStatus){
    HPReachabilityStatusWifi = 0,      //wifi
    HPReachabilityStatusWWAN_4G = 1,
    HPReachabilityStatusWWAN_3G = 2,
    HPReachabilityStatusWWAN_2G = 3,
    HPReachabilityStatusNotReachable = 4, //没有网络
    HPReachabilityStatusUnknown = 5,
};


NS_ASSUME_NONNULL_BEGIN
@interface HPNetworkReachabilityDetailInfoTool : NSObject

+ (void)getNetWorkReachability;

@end

NS_ASSUME_NONNULL_END
