//
//  HPPublishViewController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/11.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPPublishViewController.h"
#import "HPPublishOperation.h"
#import "HPOrderdetailOperation.h"
#import "HPGetGoodListOP.h"

@interface HPPublishViewController ()
@property (weak, nonatomic) IBOutlet UITextField *goodNameField;
@property (weak, nonatomic) IBOutlet UITextField *goodPriceField;
@property (weak, nonatomic) IBOutlet UITextField *goodDescribeField;
@property (weak, nonatomic) IBOutlet UITextField *imgField;
@property (weak, nonatomic) IBOutlet UITextField *goodStockField;

@property (nonatomic, strong) HPPublishOperation *operation;

@end

@implementation HPPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)publishGood:(id)sender {
        
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:self.goodNameField.text forKey:@"goodname"];
    [dic setValue:self.goodPriceField.text forKey:@"goodprice"];
    [dic setValue:self.goodStockField.text forKey:@"stock"];
    [dic setValue:self.goodDescribeField.text forKey:@"description"];
    [dic setValue:self.imgField.text forKey:@"imageurls"];
    
    self.operation = [[HPPublishOperation alloc] initWithParams:dic];
    
    [HPHTTPSessionManager loadDataWithOperation:self.operation successBlock:^(id  _Nonnull responseObject) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } failureBlock:^(NSError * _Nonnull error) {
        
    }];
}
- (IBAction)getOrderDetail:(id)sender {
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    [dic setValue:@(43) forKey:@"goodId"];
    HPOrderdetailOperation *orderOp = [[HPOrderdetailOperation alloc] initWithParams:dic];
    
    [HPHTTPSessionManager loadDataWithOperation:orderOp successBlock:^(id  _Nonnull responseObject) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } failureBlock:^(NSError * _Nonnull error) {
        
    }];
}
- (IBAction)getList:(id)sender {
    HPGetGoodListOP *orderOp = [[HPGetGoodListOP alloc] initWithParams:nil];
    
    [HPHTTPSessionManager loadDataWithOperation:orderOp successBlock:^(id  _Nonnull responseObject) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } failureBlock:^(NSError * _Nonnull error) {
        
    }];
}

@end
