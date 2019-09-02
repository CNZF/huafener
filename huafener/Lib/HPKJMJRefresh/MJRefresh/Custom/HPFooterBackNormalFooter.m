//
//  HPFooterBackNormalFooter.m
//  GHZeusLibraries
//
//  Created by blank on 16/6/24.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPFooterBackNormalFooter.h"

@implementation HPFooterBackNormalFooter

- (void)prepare
{
    [super prepare];
    [self addSubview:self.noMoreView];
    [self setTitle:@"" forState:MJRefreshStateNoMoreData];
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
    if (self.state != MJRefreshStateIdle || !self.automaticallyRefresh || self.mj_y == 0) return;
    
    if (_scrollView.mj_insetT + _scrollView.mj_contentH > _scrollView.mj_h) { // 内容超过一个屏幕
        // 这里的_scrollView.mj_contentH替换掉self.mj_y更为合理
        //        if (_scrollView.mj_offsetY >= _scrollView.mj_contentH - _scrollView.mj_h + self.mj_h * self.triggerAutomaticallyRefreshPercent + _scrollView.mj_insetB - self.mj_h) {
        //            // 防止手松开时连续调用
        //            CGPoint old = [change[@"old"] CGPointValue];
        //            CGPoint new = [change[@"new"] CGPointValue];
        //            if (new.y <= old.y) return;
        //
        //            // 当底部刷新控件完全出现时，才刷新
        //            [self beginRefreshing];
        //        }
        
        if (_scrollView.mj_offsetY +500 + _scrollView.mj_h> _scrollView.mj_contentH ) {
            // 防止手松开时连续调用
            CGPoint old = [change[@"old"] CGPointValue];
            CGPoint new = [change[@"new"] CGPointValue];
            if (new.y <= old.y) return;
            
            // 当底部刷新控件完全出现时，才刷新
            [self beginRefreshing];
        }
    }
}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
    // 内容的高度
    CGFloat contentHeight = self.scrollView.mj_contentH + self.ignoredScrollViewContentInsetBottom;
    // 表格的高度
    CGFloat scrollHeight = self.scrollView.mj_h - self.scrollViewOriginalInset.top - self.scrollViewOriginalInset.bottom + self.ignoredScrollViewContentInsetBottom;
    // 设置位置和尺寸
    self.mj_y = MAX(contentHeight, scrollHeight);
}


- (void)setState:(MJRefreshState)state{
    [super setState:state];
    if (self.state == MJRefreshStateNoMoreData){
        self.noMoreView.hidden = NO;
    } else {
        self.noMoreView.hidden = YES;
    }
}

- (UIView *)noMoreView{
    if (!_noMoreView) {
        _noMoreView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, MJRefreshFooterHeight)];
        _noMoreView.backgroundColor = [UIColor clearColor];
        _noMoreView.hidden = YES;
        
        UIView *leftLineView = [[UIView alloc] initWithFrame:CGRectMake(40, MJRefreshFooterHeight / 2 - 0.5 / 2, ([UIScreen mainScreen].bounds.size.width - [UIImage imageNamed:@"nomore"].size.width - 80 - 20) / 2, 0.5)];
        leftLineView.backgroundColor = COLOR_FROM_RGB(0xdddddd);
        [_noMoreView addSubview:leftLineView];
        [_noMoreView addSubview:self.noMoreImageView];
        UIView *rightLineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.noMoreImageView.frame) + 10, MJRefreshFooterHeight / 2 - 0.5 / 2, ([UIScreen mainScreen].bounds.size.width - [UIImage imageNamed:@"nomore"].size.width - 80 - 20) / 2, 0.5)];
        rightLineView.backgroundColor = COLOR_FROM_RGB(0xdddddd);
        [_noMoreView addSubview:rightLineView];
    
    }
    return  _noMoreView;
}

- (UIImageView *)noMoreImageView{
    if (!_noMoreImageView) {
        UIImage *image = [UIImage imageNamed:@"nomore"];
        _noMoreImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - image.size.width / 2, MJRefreshFooterHeight / 2 - image.size.height / 2, image.size.width, image.size.height)];
        _noMoreImageView.image = image;
        _noMoreImageView.backgroundColor = [UIColor clearColor];
    }
    return _noMoreImageView;
}

@end
