//
//  HPLoadingHUD.m
//  GHZeusLibraries
//
//  Created by rk on 2018/5/3.
//  Copyright © 2018年 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPLoadingHUD.h"

//#import "HPAdView.h"

@interface HPLoadingHUD ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, weak)   UIImageView *loadingImgView;

@property (nonatomic, getter = isRunning) BOOL running;
@property (nonatomic, assign) BOOL enabled;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HPLoadingHUD

+ (instancetype)sharedLoadingHUD{
    
    static HPLoadingHUD *_loadingHud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loadingHud = [[super allocWithZone:NULL] init];
    });
    return _loadingHud;
}

+ (id) allocWithZone:(struct _NSZone *)zone {
    return [HPLoadingHUD sharedLoadingHUD] ;
}

- (id)copyWithZone:(NSZone *)zone {
    return [HPLoadingHUD sharedLoadingHUD] ;
}
 
- (id)mutableCopyWithZone:(NSZone *)zone {
    return [HPLoadingHUD sharedLoadingHUD] ;
}


+ (void)show {
    [[HPLoadingHUD sharedLoadingHUD] show];
}

+ (void)showWithUserInteractionEnabled:(BOOL)enabled {
    [[HPLoadingHUD sharedLoadingHUD] showWithUserInteractionEnabled:enabled];
}

+ (void)dismiss {
    [[HPLoadingHUD sharedLoadingHUD] dismiss];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)show {
    [self showWithUserInteractionEnabled:YES];
}

- (void)showWithUserInteractionEnabled:(BOOL)enabled {
    if (self.isRunning) {
        return;
    }
    self.running = YES;
    self.enabled = enabled;
    [self addLoadingView:self.loadingView];
    self.loadingView.hidden = NO;
    [self.loadingImgView startAnimating];
    
    self.timer = [NSTimer timerWithTimeInterval:20.0
                                         target:self
                                       selector:@selector(dismiss)
                                       userInfo:nil
                                        repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)dismiss {
    
    if ([NSThread isMainThread]) {
        self.running = NO;
        self.loadingView.hidden = YES;
        if (!self.enabled) {
            [self.bgView removeFromSuperview];
        }
        [self.loadingView removeFromSuperview];
        [self.loadingImgView stopAnimating];
        
        [self.timer invalidate];
        self.timer = nil;
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.running = NO;
            self.loadingView.hidden = YES;
            if (!self.enabled) {
                [self.bgView removeFromSuperview];
            }
            [self.loadingView removeFromSuperview];
            [self.loadingImgView stopAnimating];
            
            [self.timer invalidate];
            self.timer = nil;
        });
    }
}

- (void)addLoadingView:(UIView *)loadingView {
    if (loadingView.superview) {
        [loadingView.superview bringSubviewToFront:loadingView];
        return;
    }
//    UIView *adView = [HPAdView isShown];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (!self.enabled) { //不可用，添加View
        [keyWindow addSubview:self.bgView];
    }
    [keyWindow addSubview:loadingView];
    loadingView.center = keyWindow.center;
//    if (adView) [keyWindow bringSubviewToFront:adView];
}

#pragma mark - Getter & Setter

- (UIView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _loadingView.backgroundColor = GH_COLOR_FROM_RGB(0xEEEEEE);
        _loadingView.layer.cornerRadius = 25;
        
        [self addLoadingView:_loadingView];
    }
    return _loadingView;
}

- (UIImageView *)loadingImgView {
    if (!_loadingImgView) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        
        NSMutableArray<UIImage *> *imgs = [NSMutableArray arrayWithCapacity:5];
        for (int i = 1; i <= 5; ++i) {
            NSString *imgName = [NSString stringWithFormat:@"xiaohua%d", i];
            [imgs addObject:[UIImage imageNamed:imgName]];
        }

        imgView.animationImages = imgs;
        imgView.contentMode = UIViewContentModeCenter;
        imgView.backgroundColor = [UIColor clearColor];
        
        [self.loadingView addSubview:imgView];
        _loadingImgView = imgView;
    }
    return _loadingImgView;
}

- (UIView *)bgView {
    if (!_bgView) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        _bgView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    }
    return _bgView;
}

@end
