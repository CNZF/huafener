//
//  TestViewController.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/7.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "TestViewController.h"
#import "HPTableView.h"
#import "HPScrollView.h"
#import <RTRootNavigationController.h>
#import "Test1ViewController.h"

@interface TestViewController ()<UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) HPTableView *tableView;
@property (nonatomic, strong) HPTableView *tableView1;

@property (nonatomic, strong) HPScrollView *scroller;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
       
       self.scroller = [[HPScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - kNavigationH - kBottomBarH)];
       self.scroller.contentSize = CGSizeMake(kScreenWidth*2, kScreenHeight - kNavigationH - kBottomBarH);
       self.scroller.backgroundColor = [UIColor cyanColor];
       self.scroller.bounces = NO;
       self.scroller.pagingEnabled = YES;
       
       [self.view addSubview:self.scroller];
    
    
    [self.scroller addSubview:self.tableView];
    [self.scroller addSubview:self.tableView1];
    
//    [self.tableView1.panGestureRecognizer requireGestureRecognizerToFail:self.scroller.panGestureRecognizer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView.contentOffset.x > 0) {
//        self.rt_disableInteractivePop = YES;
//    }else{
//        self.rt_disableInteractivePop = NO;
//    }
    NSLog(@"-----------");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"CELL"];
        cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld",indexPath.row];
        
        if (tableView == self.tableView) {
            cell.backgroundColor = [UIColor darkGrayColor];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Test1ViewController * test = [[Test1ViewController alloc] init];
    [self.rt_navigationController pushViewController:test animated:YES];
}

- (HPTableView *)tableView{
    if (!_tableView) {
        _tableView = [[HPTableView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth , kScreenHeight - kNavigationH - kBottomBarH) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100.0f;
    }
    return _tableView;
}
- (HPTableView *)tableView1{
    if (!_tableView1) {
        _tableView1 = [[HPTableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0,kScreenWidth , kScreenHeight - kNavigationH - kBottomBarH) style:(UITableViewStylePlain)];
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
        _tableView1.rowHeight = 100.0f;
    }
    return _tableView1;
}



@end
