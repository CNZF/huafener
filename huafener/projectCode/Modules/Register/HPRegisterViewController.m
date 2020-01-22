//
//  HPRegisterViewController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/5.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPRegisterViewController.h"
#import "HPRegisterUserNameViewController.h"

@interface HPRegisterViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *telphoneField;
@property (weak, nonatomic) IBOutlet UITextField *optCodeField;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic, strong) NSMutableDictionary *parmasDic;

@end

@implementation HPRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parmasDic = [NSMutableDictionary dictionary];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldValueChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)textFieldValueChanged:(NSNotification *)notification {
    [self.nextBtn enable:(self.telphoneField.text.length && self.optCodeField.text.length) enableColor:GH_COLOR_FROM_RGB(0xff6677) disEnableColor:GH_COLOR_FROM_RGB(0x333333) block:^(UIColor * _Nonnull color) {
        self.nextBtn.backgroundColor = color;
    }];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

static NSURLSessionDataTask * _Nonnull extracted(HPRegisterViewController *object, HPBaseRequestOperation *op) {
    return [HPHTTPSessionManager loadDataWithOperation:op successBlock:^(id  _Nonnull responseObject) {
        [object.parmasDic setValue:responseObject[@"code"] forKey:@"code"];
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)getOtpCode:(id)sender {
    
    HPBaseRequestOperation *op = [[HPBaseRequestOperation alloc] initWithParams:@{@"telePhone":[self.telphoneField text]}];
    op.requestMapping = HPReqMap_getOtpCode;
    extracted(self, op);
    
}
- (IBAction)pushToRegisterController:(id)sender {
    HPRegisterUserNameViewController *userVc = [[UIStoryboard storyboardWithName:@"RLF" bundle:nil] instantiateViewControllerWithIdentifier:@"HPRegisterUserNameViewController"];
    [self.parmasDic setValue:self.telphoneField.text forKey:@"tel"];
    userVc.parmasDic = self.parmasDic;
    [self.rt_navigationController pushViewController:userVc animated:YES complete:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

@end
