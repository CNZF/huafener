//
//  HomeTabViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/19.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HomeTabViewController.h"
#import "MainViewController.h"
#import "HPSignInWithAppleController.h"
@interface HomeTabViewController ()

@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HPSignInWithAppleController *signWithApple = [[HPSignInWithAppleController alloc] init];
    [self presentViewController:signWithApple animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
