//
//  HPDevice.m
//  GHZeusLibraries
//
//  Created by Zhang Weifan on 2017/11/6.
//  Copyright © 2017年 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPDevice.h"

@implementation HPDevice

+ (CGFloat)hp_statusBarHeight {
    if ([UIScreen mainScreen].bounds.size.height > 736) {
        return 44;
    }
    return 20;
}

+ (CGFloat)hp_navigationBarHeight {
    return 44;
}

+ (CGFloat)hp_topHeight {
    return [HPDevice hp_statusBarHeight]+[HPDevice hp_navigationBarHeight];
}

+ (CGFloat)hp_bottomOffset {
    if ([UIScreen mainScreen].bounds.size.height > 736) {
        return 34;
    }
    return 0;
}

+ (CGFloat)hp_topOffset {
    if ([UIScreen mainScreen].bounds.size.height > 736) {
        return 24;
    }
    return 0;
}

@end
