//
//  HomeTabViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/19.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPHomeTabViewController.h"
#import "MainViewController.h"
#import "HPSignInWithAppleController.h"

@interface HPHomeTabViewController ()

@end

@implementation HPHomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"XX"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HPSignInWithAppleController *signWithApple = [[HPSignInWithAppleController alloc] init];
//    [self presentViewController:signWithApple animated:YES completion:nil];
    [self.navigationController pushViewController:signWithApple animated:YES];
}

@end
