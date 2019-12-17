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
#import "HomeTabViewController.h"
#import "MineTabViewController.h"
#import "HPMessageMainController.h"
#import "HPConsigmentMainController.h"

#import "ZZCustomAlertView.h"
#import "HPCenterBtnView.h"


#import "ViewController.h"

@interface HPTabbarViewController ()<CustomTabBarDelegate>

@property (nonatomic, strong) NSArray *tabVCs;

@property (nonatomic, strong) HPCustomTabbar *hp_tabbar;

@property (nonatomic, strong) HomeTabViewController *homeTabController;

@property (nonatomic, strong) MineTabViewController *mineTabController;

@property (nonatomic, strong) HPConsigmentMainController *consigmentTabController;

@property (nonatomic, strong) HPMessageMainController *messageTabController;

@property (nonatomic, strong) ZZCustomAlertView *alertView;

@end

@implementation HPTabbarViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setConfig_UI];
    [self setConfig_Datas];
    
}


- (void)setConfig_Datas{
    
}


- (void)setConfig_UI{
    
    [self setValue:self.hp_tabbar forKey:@"tabBar"];
    self.titleArrays = @[@"首页",@"寄卖",@"消息",@"我的"];
    self.imageArrays = @[@"home",@"classN",@"message",@"mine"];
    self.selectImageArrays =
    @[@"home_high",@"classN_high",@"message_high",@"mine_high"];
    [self setChildViewControllers:self.tabVCs];
    
    self.selectedIndex = 0;
}

#pragma mark
#pragma mark -- TabbarAction
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
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

- (HomeTabViewController *)homeTabController{
    if (!_homeTabController) {
        _homeTabController = [[HomeTabViewController alloc] init];
    }
    return _homeTabController;
}

- (MineTabViewController *)mineTabController{
    if (!_mineTabController) {
        _mineTabController = [[MineTabViewController alloc] init];
    }
    return _mineTabController;
}

- (HPConsigmentMainController *)consigmentTabController{
    if (!_consigmentTabController) {
        _consigmentTabController = [[HPConsigmentMainController alloc] init];
    }
    return _consigmentTabController;
}

- (HPMessageMainController *)messageTabController{
    if (!_messageTabController) {
        _messageTabController = [[HPMessageMainController alloc] init];
    }
    return _messageTabController;
}

- (NSArray *)tabVCs{
    if (!_tabVCs) {
        
        RTContainerNavigationController *rtc_home = [[RTContainerNavigationController alloc] initWithRootViewController:self.homeTabController];
        RTContainerNavigationController *rtc_consigment = [[RTContainerNavigationController alloc] initWithRootViewController:self.consigmentTabController];
        RTContainerNavigationController *rtc_message = [[RTContainerNavigationController alloc] initWithRootViewController:self.messageTabController];
        RTContainerNavigationController *rtc_mine = [[RTContainerNavigationController alloc] initWithRootViewController:self.mineTabController];
        
        _tabVCs = @[rtc_home,rtc_consigment,rtc_message,rtc_mine];
    }
    return _tabVCs;
}

@end
