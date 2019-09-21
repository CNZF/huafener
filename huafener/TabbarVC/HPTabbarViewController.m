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

#import "HomeTabViewController.h"
#import "MineTabViewController.h"

#import "ZZCustomAlertView.h"
#import "HPCenterBtnView.h"


#import "ViewController.h"

@interface HPTabbarViewController ()<CustomTabBarDelegate>

@property (nonatomic, strong) ZZCustomAlertView *alertView;

@property (nonatomic, strong) HPCustomTabbar *hp_tabbar;

@property (nonatomic, strong) NSArray *tabVCs;


@property (nonatomic, strong) HomeTabViewController *homeTabController;

@property (nonatomic, strong) MineTabViewController *mineTabController;

@end

@implementation HPTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArrays = @[@"首页",@"我的"];
    self.imageArrays = @[@"home",@"mine"];
    self.selectImageArrays = @[@"home_high",@"mine_high"];
    [self setChildViewControllers:self.tabVCs];
    [self setValue:self.hp_tabbar forKey:@"tabBar"];

}
#pragma mark -- Action
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

//自定义tabbar
- (HPCustomTabbar *)hp_tabbar{
    if (!_hp_tabbar) {
        _hp_tabbar = [[HPCustomTabbar alloc] init];
        _hp_tabbar.customTabbarCenterBtnDelegate = self;
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

- (NSArray *)tabVCs{
    if (!_tabVCs) {
        _tabVCs = @[self.homeTabController,self.mineTabController];
    }
    return _tabVCs;
}

@end
