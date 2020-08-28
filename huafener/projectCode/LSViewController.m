//
//  LSViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2020/5/13.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "LSViewController.h"

@interface LSViewController ()

@end

@implementation LSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (LSViewController * _Nonnull (^)(NSString * _Nonnull))getTitle{
    return ^(NSString *title){
        return self;
    };
}

@end
