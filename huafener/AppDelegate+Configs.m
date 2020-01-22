//
//  AppDelegate+Configs.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/8.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "AppDelegate+Configs.h"
#import <IQKeyboardManager.h>

#import "HPNetworkReachabilityDetailInfoTool.h"

@implementation AppDelegate (Configs)

+ (void)configLibPerformance{
    
#pragma mark -- 日志系统
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
#pragma mark -- IQKeyBoardManager
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    
#pragma makr -- 网络状态获取
    [HPNetworkReachabilityDetailInfoTool getNetWorkReachability];
}

@end
