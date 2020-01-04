//
//  HPLoadingHUD.h
//  GHZeusLibraries
//
//  Created by rk on 2018/5/3.
//  Copyright © 2018年 花圃科技（北京）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPLoadingHUD : NSObject

//GH_SINGLETON_NAME(LoadingHUD)


+ (instancetype)sharedLoadingHUD;

/**
 展示HUD
 */
+ (void)show;


/**
 展示HUD（可选是否可交互）

 @param enabled 是否可交互
 */
+ (void)showWithUserInteractionEnabled:(BOOL)enabled;


/**
 隐藏HUD
 */
+ (void)dismiss;

@end
