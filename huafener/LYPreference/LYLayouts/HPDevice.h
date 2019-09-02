//
//  HPDevice.h
//  GHZeusLibraries
//
//  Created by Zhang Weifan on 2017/11/6.
//  Copyright © 2017年 花圃科技（北京）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface HPDevice : NSObject


/**
 状态栏高度

 @return 高度
 */
+ (CGFloat)hp_statusBarHeight;


/**
 导航栏高度

 @return 高度
 */
+ (CGFloat)hp_navigationBarHeight;


/**
 导航栏加状态栏高度

 @return 高度
 */
+ (CGFloat)hp_topHeight;


/**
 底部高度

 @return 高度
 */
+ (CGFloat)hp_bottomOffset;

+ (CGFloat)hp_topOffset;

@end
