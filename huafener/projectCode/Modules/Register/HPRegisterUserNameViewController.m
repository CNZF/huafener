//
//  RegisterUserNameViewController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/8.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPRegisterUserNameViewController.h"

@interface HPRegisterUserNameViewController ()

@end

@implementation HPRegisterUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)login:(id)sender {
    [self.parmasDic setValue:[self.userNameField text] forKey:@"userName"];
    HPBaseRequestOperation *op = [[HPBaseRequestOperation alloc] initWithParams:self.parmasDic];
    op.requestMapping = HPReqMap_login;
    [HPHTTPSessionManager loadDataWithOperation:op successBlock:^(id  _Nonnull responseObject) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
