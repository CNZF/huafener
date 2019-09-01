//
//  UITabBarController+LYTabbarSetting.m
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "UITabBarController+LYTabbarSetting.h"

@implementation UITabBarController (LYTabbarSetting)

- (void)setUIBeheaves{
    //单纯的去掉之后视图会穿透
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    //给其设置颜色之后，视图穿透消失
    [self.tabBar setBackgroundColor:GH_COLOR_FROM_RGB(0xffffff)];
    
    self.tabBar.translucent = NO;
    
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:GH_COLOR_FROM_RGB(0x333333),NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateNormal];
    
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:GH_COLOR_FROM_RGB(0xff6677),NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateSelected];
    
    //设置阴影
    [self.tabBar dropShadowWithView:self.tabBar
                      Offset:CGSizeMake(0, -1)
                      radius:1
                       color:[UIColor blackColor]
                     opacity:0.05];
    //中间按钮设置
    NSInteger tabItems = self.tabBar.items.count;
    UITabBarItem *item = self.tabBar.items[self.tabBar.items.count/2];
    if  (tabItems/2 == 0) return;
    for (NSInteger i = 0; i<tabItems; i++) {
        if (i == tabItems/2) {
            item.imageInsets =UIEdgeInsetsMake(-20,0, 20,0);
            
            NSLog(@"%@",[self.tabBar.subviews[i] subviews]);
            
            
        }
    }
    
    
    
    
}


@end
