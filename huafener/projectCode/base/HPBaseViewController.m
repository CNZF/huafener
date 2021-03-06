//
//  BaseViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/2.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPBaseViewController.h"

@interface HPBaseViewController ()

@end

@implementation HPBaseViewController

#ifdef DEBUG
    static NSMutableDictionary *s_allocInfo;
#endif

- (instancetype)init
{
    self = [super init];
    if (self) {
//#ifdef DEBUG
        [self alloc_init];
//#endif
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//#ifdef DEBUG
        [self alloc_init];
//#endif
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Controller-Memory-Infomation : %@", s_allocInfo);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)alloc_init{
#ifdef DEGUG
    NSLog(@"----------------创建类----------------%@", NSStringFromClass([self class]));
    if (!s_allocInfo) {
        s_allocInfo = [NSMutableDictionary dictionary];
    }
    s_allocInfo[NSStringFromClass([self class])] = @([s_allocInfo[NSStringFromClass([self class])] intValue] + 1);
    
#endif
}

- (void)dealloc{
//#ifdef DEBUG
    
    [SVProgressHUD showErrorWithStatus:@"✅👌"];
#ifdef DEBUG
    NSLog(@"----------------释放类----------------%@",  NSStringFromClass([self class]));
    s_allocInfo[NSStringFromClass([self class])] = @([s_allocInfo[NSStringFromClass([self class])] intValue] - 1);
    if ([s_allocInfo[NSStringFromClass([self class])] intValue] == 0) {
        [s_allocInfo removeObjectForKey:NSStringFromClass([self class])];
    }
    NSLog(@"%@", s_allocInfo);
#endif
    
}

@end
