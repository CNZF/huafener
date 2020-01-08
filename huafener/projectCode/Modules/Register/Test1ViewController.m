//
//  Test1ViewController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/7.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "Test1ViewController.h"
#import "TestViewController.h"
#import <RTRootNavigationController.h>
@interface Test1ViewController()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TestViewController *test;

@end

@implementation Test1ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.rt_navigationController.viewControllers.count>1) {
        Class class = NSClassFromString(@"UIViewControllerWrapperView");
       
        
    }
     NSArray * arr = [[self.rt_navigationController.view subviews][0] subviews];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
        cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld",indexPath.row];
        [cell.contentView addSubview:self.test.view];
    }
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    scrollView.contentOffset = CGPointMake(0, 0 );
    NSLog(@"++++++++++++++++++++++");
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = kScreenHeight;
    }
    return _tableView;
}
- (TestViewController *)test{
    if (!_test) {
        _test = [[TestViewController alloc] init];
        _test.view.frame = self.view.bounds;
        [self addChildViewController:_test];
    }
    return _test;
}

@end
