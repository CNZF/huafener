//
//  UITabBarController+LYTabbarSetting.m
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "UITabBarController+LYTabbarSetting.h"

static NSString *const imageArrayKey = @"TabImageKey";

static NSString *const selectImageArrayKey = @"selectTabImageKey";

static NSString *const titleArrayKey = @"titleArrayKey";

@implementation UITabBarController (LYTabbarSetting)

- (void)setImageArrays:(NSArray *)imageArrays{
    objc_setAssociatedObject(self, &imageArrayKey, imageArrays, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)imageArrays{
    return objc_getAssociatedObject(self, &imageArrayKey);
}

- (void)setSelectImageArrays:(NSArray *)selectImageArrays{
    objc_setAssociatedObject(self, &selectImageArrayKey, selectImageArrays, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)selectImageArrays{
    return objc_getAssociatedObject(self, &selectImageArrayKey);
}

- (void)setTitleArrays:(NSArray *)titleArrays{
    objc_setAssociatedObject(self, &titleArrayKey, titleArrays, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSArray *)titleArrays{
    return objc_getAssociatedObject(self, &titleArrayKey);
}

//添加子控制器
- (void)setChildViewControllers:(NSArray *)tabVcArrays{
    
    for (NSInteger i = 0; i<tabVcArrays.count; i++) {
        [self addChildrenViewController:tabVcArrays[i]
                               andTitle:self.titleArrays[i] andImageName:self.imageArrays[i] selectImage:self.selectImageArrays[i]];
    }
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName selectImage:(NSString *)seleImageName{
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:seleImageName];
    childVC.title = title;
    childVC.view.backgroundColor = GH_Color_Random;
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:baseNav];
}


@end
