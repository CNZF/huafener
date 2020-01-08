//
//  HPRegisterViewController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/5.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPRegisterViewController.h"

@interface HPRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *telphoneField;
@property (weak, nonatomic) IBOutlet UITextField *optCodeField;

@property (nonatomic, strong) NSDictionary *parmasDic;

@end

@implementation HPRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parmasDic = [NSMutableDictionary dictionary];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)getOtpCode:(id)sender {
    
    HPBaseRequestOperation *op = [[HPBaseRequestOperation alloc] initWithParams:@{@"telePhone":[self.telphoneField text]}];
    op.requestMapping = HPReqMap_getOtpCode;
    [HPHTTPSessionManager loadDataWithOperation:op successBlock:^(id  _Nonnull responseObject) {
        [self.parmasDic setValue:responseObject[@"code"] forKey:@"code"];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (IBAction)login:(id)sender {
    [self.parmasDic setValue:[self.telphoneField text] forKey:@"tel"];
    HPBaseRequestOperation *op = [[HPBaseRequestOperation alloc] initWithParams:self.parmasDic];
    op.requestMapping = HPReqMap_login;
    [HPHTTPSessionManager loadDataWithOperation:op successBlock:^(id  _Nonnull responseObject) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
