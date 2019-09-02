//
//  LYViewController.m
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "LYTabbarViewController.h"
#import "UITabBarController+LYTabbarSetting.h"

#import "ZZCustomAlertView.h"
#import "HPCenterBtnView.h"

@interface LYTabbarViewController ()

@property (nonatomic, strong) ZZCustomAlertView   *alertView;

@end

@implementation LYTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUIBeheaves];
    NSLog(@"%ld",self.selectedIndex);
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([item.title isEqualToString:@"发布"]) {
        
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
}

@end
