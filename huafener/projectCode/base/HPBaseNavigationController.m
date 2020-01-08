//
//  HPBaseNavigationController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/7.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPBaseNavigationController.h"

@interface HPBaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *pan;

@end

@implementation HPBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    
    // 获取系统自带滑动手势的target对象
    id target = self.interactivePopGestureRecognizer.delegate;
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:internalAction];
    // 设置手势代理，拦截手势触发
    self.pan.delegate = self;
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:self.pan];
    
    // 禁止使用系统自带的滑动手势
    self.interactivePopGestureRecognizer.delegate = nil;
    self.interactivePopGestureRecognizer.enabled = NO;
    
        
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSArray *arr = self.view.subviews;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    UIView *view = [[self.interactivePopGestureRecognizer.view subviews][0] subviews][0];
    if (self.viewControllers.count > 1)
    {
        self.pan.enabled = YES;
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    else
    {
        self.pan.enabled = NO;
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (self.viewControllers.count > 1)
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    else
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    //怀疑偶发的手势卡死依旧是系统手势问题, 因此再次判断系统手势, 让其失效.
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return NO;
    }
    
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1 || self.viewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    
    if (self.childViewControllers.count) {
        if ([self.childViewControllers.lastObject isKindOfClass:[RTContainerController class]]) {
             RTContainerController *vc = self.childViewControllers.lastObject;
            if (vc.contentViewController.rt_disableInteractivePop) {
                return NO;
            }
        }
    }
    
    // Prevent calling the handler when the gesture begins in an opposite direction.
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint translation = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:gestureRecognizer.view];
        BOOL isLeftToRight = [UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionLeftToRight;
        CGFloat multiplier = isLeftToRight ? 1 : - 1;
        if ((translation.x * multiplier) <= 0) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return NO;
}


@end
