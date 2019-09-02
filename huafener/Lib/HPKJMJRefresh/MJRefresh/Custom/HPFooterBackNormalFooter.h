//
//  HPFooterBackNormalFooter.h
//  GHZeusLibraries
//
//  Created by blank on 16/6/24.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//

#import "MJRefreshAutoNormalFooter.h"
#import "MJRefresh.h"
//MJRefreshBackNormalFooter 不带自动刷新的
//MJRefreshAutoNormalFooter 带自动刷新的
@interface HPFooterBackNormalFooter : MJRefreshAutoNormalFooter
@property (nonatomic, strong) UIView *noMoreView;
@property (nonatomic, strong) UIImageView *noMoreImageView;
@end
