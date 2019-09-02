//
//  HPRefreshStateHeader.h
//  GHZeusLibraries
//
//  Created by blank on 16/6/14.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//

#import "MJRefreshGifHeader.h"
#import "MJRefresh.h"

@interface HPRefreshStateHeader : MJRefreshGifHeader
@property (nonatomic, copy) void(^ willRefresh)();
- (void)hiddenStateLabel;
- (void)hiddenTimeLabel;
@end
