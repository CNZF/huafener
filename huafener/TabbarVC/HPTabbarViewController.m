//
//  LYViewController.m
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPTabbarViewController.h"
#import "UITabBarController+LYTabbarSetting.h"
#import "HPCustomTabbar.h"

#import <RTRootNavigationController.h>
#import "HPHomeTabViewController.h"
#import "HPVoidTabViewController.h"
#import "HPConsigmentMainController.h"
#import "HPMessageMainController.h"
#import "HPMineTabViewController.h"


#import "ZZCustomAlertView.h"
#import "HPCenterBtnView.h"


#import "ViewController.h"

@interface HPTabbarViewController ()<CustomTabBarDelegate,UITabBarControllerDelegate>

@property (nonatomic, strong) NSArray *tabVCs;

@property (nonatomic, strong) HPCustomTabbar *hp_tabbar;

@property (nonatomic, strong) HPHomeTabViewController *homeTabController;

@property (nonatomic, strong) HPMineTabViewController *mineTabController;

@property (nonatomic, strong) HPVoidTabViewController *voidTabController;

@property (nonatomic, strong) HPConsigmentMainController *consigmentTabController;

@property (nonatomic, strong) HPMessageMainController *messageTabController;

//ignore
@property (nonatomic, strong) ZZCustomAlertView *alertView;

@property (nonatomic, strong) UITabBarItem *preTabBarItem;

@end

@implementation HPTabbarViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setConfig_UI];
    [self setConfig_Datas];
    self.delegate = self;
}


- (void)setConfig_Datas{
    
}


- (void)setConfig_UI{
    
    [self setValue:self.hp_tabbar forKey:@"tabBar"];
    self.titleArrays = @[@"首页",@"自营",@"",@"消息",@"我的"];
    self.imageArrays = @[@"home",@"classN",@"",@"message",@"mine"];
    self.selectImageArrays =
    @[@"home_high",@"classN_high",@"",@"message_high",@"mine_high"];
    [self setChildViewControllers:self.tabVCs];
    
    self.selectedIndex = 0;
    self.preTabBarItem = self.hp_tabbar.items[self.selectedIndex];
}

#pragma mark
#pragma mark -- TabbarAction
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//
//    if ([item.title isEqualToString:@"消息"]) {
//        self.homeTabController.navigationController.tabBarItem.image = [UIImage imageNamed:@"home_good_like_h"];
//    }else if([item.title isEqualToString:@"我的"]){
//        self.homeTabController.tabBarItem.image = [UIImage imageNamed:@"like_selected"];
//    }else{
//        self.homeTabController.tabBarItem.image = [UIImage imageNamed:@"home"];
//    }
//
    
//    NSLog(@"%@",self.preTabBarItem.title);
//    UIImage * image = self.preTabBarItem.image;
//    image = [UIImage imageNamed:@"homeSearch"];
//    self.hp_tabbar.items[0].image = image;
    
    
    
//    [self.hp_tabbar reLayoutOutSubViews];
    
    
//    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//    rotationAnimation.duration = 1.5;
//    rotationAnimation.cumulative = YES;
//    rotationAnimation.repeatCount = MAXFLOAT;
//    [preTabbarItem.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
//
//    rotationAnimation0 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation0.toValue = [NSNumber numberWithFloat: -M_PI * 2.0 ];
//    rotationAnimation0.duration = 3;
//    rotationAnimation0.cumulative = YES;
//    rotationAnimation0.repeatCount = MAXFLOAT;
//    [self.circleImageView.layer addAnimation:rotationAnimation0 forKey:@"rotationAnimation0"];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (viewController.navigationController && viewController.navigationController.viewControllers && [viewController.childViewControllers.firstObject isKindOfClass:[HPVoidTabViewController class]]) {
        return NO;
    }
    [self firstMethod];
    return YES;
}

- (void)firstMethod {
    static NSInteger index = 0;
    UITabBarItem *item = self.homeTabController.navigationController.tabBarItem;
    if (index % 2 == 1) {
        item.title = @"首页";
        item.image = [UIImage imageNamed:@"home"];
        item.selectedImage = [UIImage imageNamed:@"home_high"];
    } else {
        item.title = @"历史";
        item.image = [UIImage imageNamed:@"home_good_like_h"];
        item.selectedImage = [UIImage imageNamed:@"home_good_like_h"];
    }
    index++;
    NSLog(@"%ld", index);
}

- (void)tabBarDidClickPlusButton:(UIButton *)sender{
    HPCenterBtnView *btnView_ = [[HPCenterBtnView alloc] initWithFrame:[UIScreen mainScreen].bounds campaigns:@[]];
    
    _alertView = [ZZCustomAlertView alertViewWithParentView:[UIApplication sharedApplication].keyWindow andContentView:btnView_];
    _alertView.shouldBlurBackground = YES;
    _alertView.allowTapBackgroundToDismiss = NO;
    _alertView.shadowColor = [UIColor whiteColor];
    _alertView.shadowAlpha = 0.60f;
    [_alertView show];
    
    WS(weakSelf);
    btnView_.touchSelfViewBlock = ^{
        [weakSelf.alertView dismissWithCompletionBlock:^(BOOL finished) {
            weakSelf.alertView = nil;
        }];
    };

}
#pragma mark
#pragma mark -- setter && getter

//自定义tabbar
- (HPCustomTabbar *)hp_tabbar{
    if (!_hp_tabbar) {
        _hp_tabbar = [[HPCustomTabbar alloc] init];
        _hp_tabbar.customTabbarCenterBtnDelegate = self;
        
        _hp_tabbar.centerBtnPosition = HPTabbarCenterButtonPositionBulge;
    }
    return _hp_tabbar;
}

- (HPHomeTabViewController *)homeTabController{
    if (!_homeTabController) {
        _homeTabController = [[HPHomeTabViewController alloc] init];
    }
    return _homeTabController;
}


- (HPConsigmentMainController *)consigmentTabController{
    if (!_consigmentTabController) {
        _consigmentTabController = [[HPConsigmentMainController alloc] init];
    }
    return _consigmentTabController;
}

- (HPVoidTabViewController *)voidTabController{
    if (!_voidTabController) {
        _voidTabController = [[HPVoidTabViewController alloc] init];
    }
    return _voidTabController;
}

- (HPMessageMainController *)messageTabController{
    if (!_messageTabController) {
        _messageTabController = [[HPMessageMainController alloc] init];
    }
    return _messageTabController;
}

- (HPMineTabViewController *)mineTabController{
    if (!_mineTabController) {
        _mineTabController = [[HPMineTabViewController alloc] init];
    }
    return _mineTabController;
}


- (NSArray *)tabVCs{
    if (!_tabVCs) {
        
        RTContainerNavigationController *rtc_home = [[RTContainerNavigationController alloc] initWithRootViewController:self.homeTabController];
        RTContainerNavigationController *rtc_consigment = [[RTContainerNavigationController alloc] initWithRootViewController:self.consigmentTabController];
        RTContainerNavigationController *rtc_void = [[RTContainerNavigationController alloc] initWithRootViewController:self.voidTabController];
        RTContainerNavigationController *rtc_message = [[RTContainerNavigationController alloc] initWithRootViewController:self.messageTabController];
        RTContainerNavigationController *rtc_mine = [[RTContainerNavigationController alloc] initWithRootViewController:self.mineTabController];
        
        _tabVCs = @[rtc_home,rtc_consigment,rtc_void,rtc_message,rtc_mine];
    }
    return _tabVCs;
}

@end
