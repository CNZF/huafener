//
//  HPCustomTabbar.h
//  huafener
//
//  Created by 赵发 on 2019/9/18.
//  Copyright © 2019 赵发. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HPCustomTabBar;

typedef NS_ENUM(NSInteger, HPTabbarCenterButtonPosition){
    HPTabbarCenterButtonPositionCenter,  //居中
    HPTabbarCenterButtonPositionBulge    // 凸出一半
};

@protocol CustomTabBarDelegate <UITabBarDelegate>

@optional
// 当点击自定义tabbar的时候
- (void)tabBarDidClickPlusButton:(UIButton *)tabBar;

@end


@interface HPCustomTabbar : UITabBar

@property (nonatomic, strong) UIButton *plusButton;

@property (nonatomic, weak) id<CustomTabBarDelegate> customTabbarCenterBtnDelegate;

@end

NS_ASSUME_NONNULL_END
