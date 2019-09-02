//
//  HPRefreshStateHeader.m
//  GHZeusLibraries
//
//  Created by blank on 16/6/14.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPRefreshStateHeader.h"
#define HPIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define HPGHSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define HPGHSCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define HPSCREEN_MAX_LENGTH (MAX(HPGHSCREEN_WIDTH, HPGHSCREEN_HEIGHT))
#define HPIS_IPHONE_X (HPIS_IPHONE && HPSCREEN_MAX_LENGTH > 736.0)

@interface HPTitlesShareTool : NSObject
@property (nonatomic, strong) NSArray * titles;
@property (nonatomic, assign) int   titleIndex;
@property (nonatomic, strong) NSArray *beginImagesArray;
@property (nonatomic, strong) NSArray *animationingImagesArray;
+ (HPTitlesShareTool *)sharedManager;
- (NSString *)showTitle;
@end

@implementation HPTitlesShareTool

+ (HPTitlesShareTool *)sharedManager
{
    static HPTitlesShareTool *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
        
        sharedAccountManagerInstance.titles = [[NSArray alloc] initWithObjects:@"",nil];
//                            @"hi~你好~",
//                            @"我叫花粉儿，你叫什么名字？",
//                            @"下雨天，宝宝和花粉儿更配哦",
//                            @"刷刷更漂亮哦",
//                            @"不刷一样漂亮，有镜子为证",
//                            @"真的不刷了嘛？",
//                            @"你负责美，闲置物品就包在我身上了！",
//                            @"好无聊，来刷个花粉儿吧",
//                            @"嗯，你真的很有品味！",
//                            @"你猜会不会刷出彩虹？",
//                            @"你也很喜欢蓝蓝的天对不对",
//                            @"环保是要从伸手可触的小事做起的",
//                            @"我可爱吗？",
//                            @"世界辣么大，是想看就能看的吗",
//                            @"但花粉儿可以随时看",
//                            @"家里闲置的椅子绊了我的右脚",
//                            @"你一定是超级利害的美萌辣妈！",
//                            @"上得了厅堂，当得了厨娘",
//                            @"玩得了花粉儿，整得了时尚",
//                            @"你猜猜我有什么不一样",
//                            @"我在和小伙伴玩耍，你要加入吗",
//                            @"前方有正能量",
//                            @"一棵小树苗",
//                            @"浇水修枝",
//                            @"长成参天栋梁要至少10年",
//                            @"多留一棵为宝宝提供清新氧气怎么样？",
//                            @"一起在花粉儿分享闲置吧",
//                            @"你一定是个热爱生活的好妈妈哦~",
//                            @"尽量线上支付，花粉儿交易有保障哦",
//                            @"生活就要追求品质哦",
//                            @"用了花粉儿，家里的空间变大了吧",nil];
        sharedAccountManagerInstance.beginImagesArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"refreshIdle-1"],[UIImage imageNamed:@"refreshIdle-2"],[UIImage imageNamed:@"refreshIdle-3"],[UIImage imageNamed:@"refreshIdle-4"],[UIImage imageNamed:@"refreshIdle-5"],[UIImage imageNamed:@"refreshIdle-6"],[UIImage imageNamed:@"refreshIdle-7"],[UIImage imageNamed:@"refreshIdle-8"],[UIImage imageNamed:@"refreshIdle-9"],[UIImage imageNamed:@"refreshIdle-10"],[UIImage imageNamed:@"refreshIdle-11"],[UIImage imageNamed:@"refreshIdle-12"],[UIImage imageNamed:@"refreshIdle-13"],[UIImage imageNamed:@"refreshIdle-14"],[UIImage imageNamed:@"refreshIdle-15"],[UIImage imageNamed:@"refreshIdle-16"],[UIImage imageNamed:@"refreshIdle-17"],[UIImage imageNamed:@"refreshIdle-18"],[UIImage imageNamed:@"refreshIdle-19"],[UIImage imageNamed:@"refreshIdle-20"],[UIImage imageNamed:@"refreshIdle-21"],[UIImage imageNamed:@"refreshIdle-22"],[UIImage imageNamed:@"refreshIdle-23"],[UIImage imageNamed:@"refreshIdle-24"],[UIImage imageNamed:@"refreshIdle-25"],[UIImage imageNamed:@"refreshIdle-26"],[UIImage imageNamed:@"refreshIdle-27"],[UIImage imageNamed:@"refreshIdle-28"],[UIImage imageNamed:@"refreshIdle-29"],[UIImage imageNamed:@"refreshIdle-30"],[UIImage imageNamed:@"refreshIdle-31"],[UIImage imageNamed:@"refreshIdle-32"],[UIImage imageNamed:@"refreshIdle-33"],[UIImage imageNamed:@"refreshIdle-34"],[UIImage imageNamed:@"refreshIdle-35"],[UIImage imageNamed:@"refreshIdle-36"],[UIImage imageNamed:@"refreshIdle-37"],[UIImage imageNamed:@"refreshIdle-38"],[UIImage imageNamed:@"refreshIdle-39"],[UIImage imageNamed:@"refreshIdle-40"],[UIImage imageNamed:@"refreshIdle-41"],[UIImage imageNamed:@"refreshIdle-42"],[UIImage imageNamed:@"refreshIdle-43"],[UIImage imageNamed:@"refreshIdle-44"],[UIImage imageNamed:@"refreshIdle-45"],[UIImage imageNamed:@"refreshIdle-46"],[UIImage imageNamed:@"refreshIdle-47"],[UIImage imageNamed:@"refreshIdle-48"],[UIImage imageNamed:@"refreshIdle-49"],[UIImage imageNamed:@"refreshIdle-50"],[UIImage imageNamed:@"refreshIdle-51"],[UIImage imageNamed:@"refreshIdle-52"],[UIImage imageNamed:@"refreshIdle-53"],[UIImage imageNamed:@"refreshIdle-54"],[UIImage imageNamed:@"refreshIdle-55"],[UIImage imageNamed:@"refreshIdle-56"],[UIImage imageNamed:@"refreshIdle-57"],[UIImage imageNamed:@"refreshIdle-58"],[UIImage imageNamed:@"refreshIdle-59"],[UIImage imageNamed:@"refreshIdle-60"],[UIImage imageNamed:@"refreshIdle-61"],nil];
        sharedAccountManagerInstance.animationingImagesArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"refreshPulling-1"],[UIImage imageNamed:@"refreshPulling-2"],[UIImage imageNamed:@"refreshPulling-3"],[UIImage imageNamed:@"refreshPulling-4"],[UIImage imageNamed:@"refreshPulling-5"],[UIImage imageNamed:@"refreshPulling-6"], nil];
        sharedAccountManagerInstance.titleIndex = -1;

        
    });
    return sharedAccountManagerInstance;
}

- (NSString *)showTitle
{
    if ([[HPTitlesShareTool sharedManager] titleIndex] == [[HPTitlesShareTool sharedManager] titles].count-1) {
        [[HPTitlesShareTool sharedManager] setTitleIndex:0];
    }else {
        [HPTitlesShareTool sharedManager].titleIndex ++;
        NSLog(@"%d",[HPTitlesShareTool sharedManager].titleIndex);
    }
    
    @try {
        return [[[HPTitlesShareTool sharedManager] titles] objectAtIndex:[[HPTitlesShareTool sharedManager] titleIndex]];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        
    }
}

@end

@interface HPRefreshStateHeader ()
@end

@implementation HPRefreshStateHeader

static HPTitlesShareTool *_instance;

static bool isfc_ = NO;

static bool isPerFc_ = NO;

#pragma mark - 覆盖父类的方法

- (void)placeSubviews
{
    [super placeSubviews];
//    [self.gifView setFrame:CGRectMake(.0f, 10.0f, self.gifView.frame.size.width, self.gifView.frame.size.height)];

    //修改之后
    [self.gifView setFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width, self.gifView.frame.size.height)];
    self.gifView.contentMode = UIViewContentModeBottom;
    CGRect frame = self.gifView.frame;
    self.gifView.frame = self.stateLabel.frame;
    self.gifView.frame = CGRectMake(self.gifView.frame.origin.x, 0, self.gifView.frame.size.width, self.frame.size.height);
//    self.gifView.animationDuration = 10;
    self.stateLabel.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 0);

    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [self.scrollView convertRect:self.scrollView.bounds toView:window];
    CGFloat rectY = rect.origin.y;
    if (HPIS_IPHONE_X && rectY > 44) { //如果是iPhoneX并且有NavagationBar
        /* 根据图片设置控件的高度 */
        UIImage *image = self.gifView.image;
        if (image.size.height > self.mj_h) {
            self.mj_h = image.size.height;
        } else {
            self.mj_h = MJRefreshHeaderHeight;
        }
    }
}

- (void)prepare
{
    [super prepare];
    
    [self setImages:[HPTitlesShareTool sharedManager].animationingImagesArray duration:0.9 forState:MJRefreshStateRefreshing];
    
    [self setImages:[HPTitlesShareTool sharedManager].beginImagesArray duration:.2 forState:MJRefreshStateIdle];
    
    [self setImages:[HPTitlesShareTool sharedManager].animationingImagesArray duration:0.9 forState:MJRefreshStatePulling];
    if (!isPerFc_) {
        // 初始化文字
        [self setTitle:@"" forState:MJRefreshStateIdle];
        [self setTitle:@"" forState:MJRefreshStatePulling];
        [self setTitle:@"" forState:MJRefreshStateRefreshing];
    }else isPerFc_ = YES;
}

- (void)hiddenStateLabel
{
    self.gifView.hidden = YES;
    self.stateLabel.hidden = YES;
}

- (void)hiddenTimeLabel
{
    [self setTitle:@"" forState:MJRefreshStateIdle];
    
    [self setTitle:@"" forState:MJRefreshStatePulling];
    
    [self setTitle:@"" forState:MJRefreshStateRefreshing];
    
    [self.lastUpdatedTimeLabel removeFromSuperview];
    
}

- (void)endRefreshing
{
    [self setImages:@[] duration:0.9 forState:MJRefreshStateIdle];
    [self.stateLabel setFrame:CGRectMake(.0f, .0f, self.frame.size.width, self.frame.size.height)];
    
    if (isfc_) {
        NSString * title_ = [[HPTitlesShareTool sharedManager] showTitle];
        
        // 初始化文字

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setTitle:title_ forState:MJRefreshStateIdle];
            [self setTitle:title_ forState:MJRefreshStatePulling];
            [self setTitle:title_ forState:MJRefreshStateRefreshing];
        });

    }else {
        isfc_ = YES;
    }
    
    if ([self.scrollView isKindOfClass:[UICollectionView class]]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [super endRefreshing];
            [self performSelector:@selector(gifViewAnimationRepeatCount) withObject:nil afterDelay:0.3];
        });
    } else {
        [super endRefreshing];
        [self performSelector:@selector(gifViewAnimationRepeatCount) withObject:nil afterDelay:0.3];
    }
}

- (void)gifViewAnimationRepeatCount{
    [self setImages:[HPTitlesShareTool sharedManager].beginImagesArray duration:.2 forState:MJRefreshStateIdle];
}
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
}

@end
