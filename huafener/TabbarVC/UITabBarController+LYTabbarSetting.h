//
//  UITabBarController+LYTabbarSetting.h
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (LYTabbarSetting)

@property (nonatomic, strong) NSArray *imageArrays;

@property (nonatomic, strong) NSArray *selectImageArrays;

@property (nonatomic, strong) NSArray *titleArrays;

- (void)setChildViewControllers:(NSArray *)tabVcArrays;

@end

NS_ASSUME_NONNULL_END
