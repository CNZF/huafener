//  代码地址: https://github.com/CoderMJLee/MJRefresh
//  代码地址: http://code4app.com/ios/%E5%BF%AB%E9%80%9F%E9%9B%86%E6%88%90%E4%B8%8B%E6%8B%89%E4%B8%8A%E6%8B%89%E5%88%B7%E6%96%B0/52326ce26803fabc46000000

#import "UIScrollView+MJRefresh.h"
#import "UIScrollView+MJExtension.h"
#import "UIView+MJExtension.h"

#import "MJRefreshNormalHeader.h"
#import "MJRefreshGifHeader.h"

#import "MJRefreshBackNormalFooter.h"
#import "MJRefreshBackGifFooter.h"
#import "MJRefreshAutoNormalFooter.h"
#import "MJRefreshAutoGifFooter.h"

#import "HPFooterBackNormalFooter.h"
#import "HPRefreshAutoFooter.h"
#import "HPRefreshStateHeader.h"

#define COLOR_FROM_RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
