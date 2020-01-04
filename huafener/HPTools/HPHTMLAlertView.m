//
//  HPHTMLAlertView.m
//  GHZeusLibraries
//
//  Created by 杨俊杰 on 2018/10/10.
//  Copyright © 2018 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPHTMLAlertView.h"
#import "HPLoadingHUD.h"
#import <WebKit/WebKit.h>

@interface HPHTMLAlertView ()<WKNavigationDelegate>

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *cancleButton;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, assign) BOOL showCancleBtn;

@property (nonatomic, copy) void (^primaryBlock)(void);
@property (nonatomic, copy) void (^subsidaryBlock)(void);

@end


@implementation HPHTMLAlertView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    self.backgroundColor = GH_COLOR_FROM_RGBA(0x000000, 0.7f);
    [self addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.bgView];

    UIButton *confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [confirmButton setTitle:@"我知道了" forState:(UIControlStateNormal)];
//    confirmButton.titleLabel.font = kFontPingFontMediumWithSize(32);
    [confirmButton setTitleColor:GH_COLOR_FROM_RGB(0x449DFA) forState:(UIControlStateNormal)];
    [confirmButton addTarget:self action:@selector(confirmButtonClicked) forControlEvents:(UIControlEventTouchUpInside)];
    self.confirmButton = confirmButton;
    [self.bgView addSubview:confirmButton];
    [confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.height.equalTo(46);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.bottom.equalTo(0);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = GH_COLOR_FROM_RGB(0xE2E2E2);
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.height.equalTo(0.6);
        make.bottom.equalTo(confirmButton.mas_top);
    }];
    [self.bgView addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(18);
        make.right.equalTo(-14);
        make.height.equalTo(50);
    }];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.webView.mas_bottom).offset(48);
        make.left.equalTo(34);
        make.right.equalTo(-34);
        make.center.equalTo(0);
    }];
}

- (void)layoutSubviewsBuild{
    if (self.showCancleBtn) {
        
        [self.confirmButton setTitle:@"确认放弃" forState:UIControlStateNormal];
        UIView *lineView = [[UIView alloc] init];
//        lineView.backgroundColor = GH_LINE_COLOR;
        [self.bgView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.height.equalTo(46);
            make.width.equalTo(0.5);
            make.bottom.equalTo(0);
        }];
        
        UIButton *cancleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [cancleButton setTitle:@"取消" forState:(UIControlStateNormal)];
//        cancleButton.titleLabel.font = kFontPingFontMediumWithSize(32);
        [cancleButton setTitleColor:GH_COLOR_FROM_RGB(0x333333) forState:(UIControlStateNormal)];
        [cancleButton addTarget:self action:@selector(cancleButtonCClick) forControlEvents:(UIControlEventTouchUpInside)];
        self.cancleButton = cancleButton;
        [self.bgView addSubview:self.cancleButton];
        [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(46);
            make.left.equalTo(0);
            make.right.equalTo(lineView.mas_left);
            make.bottom.equalTo(0);
            make.width.equalTo(self.confirmButton);
        }];
        
        
        [self.confirmButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.height.equalTo(46);
            make.left.equalTo(lineView.mas_right);
            make.right.equalTo(0);
            make.bottom.equalTo(0);
            make.width.equalTo(self.cancleButton);
        }];
        
        
    }
}

- (void)loadWebViewWithContent:(NSString *)content {
    NSString *firstWebBody = @"<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no\" />\
    <!DOCTYPE html> <html lang=\"en\"> <head><meta charset=\"UTF-8\"> <title>Title</title></head> <body>";
    NSString *endWebBody = @"</body></html>";
    NSString *htmlString = [NSString stringWithFormat:@"%@%@%@", firstWebBody, content, endWebBody];
    [self.webView loadHTMLString:htmlString baseURL:nil];
}

- (void)confirmButtonClicked {
    UIViewAnimationCurve animationCurve = 7;
    [UIView beginAnimations:@"hideTF" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:animationCurve];
    self.backgroundView.center = CGPointMake(GHSCREEN_WIDTH / 2, GHSCREEN_HEIGHT / 2);
    self.backgroundView.alpha = 0;
    self.backgroundView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    [UIView commitAnimations];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.4];
    
    !self.clickConfirmBlock ? : self.clickConfirmBlock();
}

- (void)cancleButtonCClick {
    UIViewAnimationCurve animationCurve = 7;
    [UIView beginAnimations:@"hideTF" context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:animationCurve];
    self.backgroundView.center = CGPointMake(GHSCREEN_WIDTH / 2, GHSCREEN_HEIGHT / 2);
    self.backgroundView.alpha = 0;
    self.backgroundView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    [UIView commitAnimations];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.4];
}

#pragma mark -WKWebViewDelegate

//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    self.backgroundView.hidden = NO;
//
//    WS(weakSelf)
//    [self.webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id result, NSError * _Nullable error) {
//        CGFloat height = [result floatValue];
//        NSLog(@"%f", height);
//        if (height >= KScreenHeight - 180) {
//            height = KScreenHeight - 180;
//        } else if (height <= 100) {
//            height = 100;
//        }
//        [weakSelf.webView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(0);
//            make.left.equalTo(18);
//            make.right.equalTo(-14);
//            make.height.equalTo(height);
//        }];
//        [weakSelf.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.webView.mas_bottom).offset(48);
//            make.left.equalTo(34);
//            make.right.equalTo(-34);
//            make.center.equalTo(0);
//        }];
//
//
//        weakSelf.bgView.hidden = NO;weakSelf.backgroundView.transform = CGAffineTransformMakeScale(0.3, 0.3);
//        weakSelf.backgroundView.center = CGPointMake(GHSCREEN_WIDTH / 2, GHSCREEN_HEIGHT / 2);
//        weakSelf.backgroundView.alpha = 0;
//        UIViewAnimationCurve animationCurve = 7;
//        [UIView beginAnimations:@"hideTF" context:nil];
//        [UIView setAnimationDuration:0.4];
//        [UIView setAnimationCurve:animationCurve];
//        weakSelf.backgroundView.alpha = 1;
//        weakSelf.backgroundView.center = CGPointMake(GHSCREEN_WIDTH / 2, GHSCREEN_HEIGHT / 2);
//        weakSelf.backgroundView.transform = CGAffineTransformMakeScale(1.0, 1.0);
//        [UIView commitAnimations];
//        [HPLoadingHUD dismiss];
//    }];
//}

- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GHSCREEN_WIDTH, GHSCREEN_HEIGHT)];
        _backgroundView.backgroundColor = [UIColor clearColor];
    }
    return _backgroundView;
}

//- (UIView *)bgView {
//    if (!_bgView) {
//        _bgView = [[UIView alloc] initWithFrame:CGRectMake(34, KScreenHeight/2-160, KScreenWidth - 68, 320)];
//        _bgView.backgroundColor = [UIColor whiteColor];
//        _bgView.layer.masksToBounds = YES;
//        _bgView.layer.cornerRadius = 5;
//        _bgView.hidden = YES;
//    }
//    return _bgView;
//}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

+ (void)showAlertViewWithContent:(NSString *)content showCancleBtn:(BOOL)showCancleBtn confirmBlcok:(ClickConfirmBlock)clickConfirmBlock {

    HPHTMLAlertView *alertView = [[HPHTMLAlertView alloc] initWithFrame:CGRectMake(0, 0, GHSCREEN_WIDTH, GHSCREEN_HEIGHT)];
    alertView.showCancleBtn = showCancleBtn;
    [alertView layoutSubviewsBuild];
    alertView.clickConfirmBlock = ^{
        !clickConfirmBlock ?: clickConfirmBlock();
    };
    [alertView loadWebViewWithContent:content];
    alertView.tag = 8888;
    alertView.backgroundView.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

+ (void)showAlertViewWithTypeStr:(NSString *)typeStr confirmBlcok:(ClickConfirmBlock)clickConfirmBlock {
    if (!typeStr.length) {
        return;
    }
    WS(weakSelf)
    [HPLoadingHUD showWithUserInteractionEnabled:NO];
//    HPPreventFraudMgr *preventFraudMgr = [[HPPreventFraudMgr alloc] init];
//    preventFraudMgr.key = typeStr;
//    [preventFraudMgr loadDataWithSuccessCallback:^(HPRequestBaseManager *manager) {
//        NSString *content = manager.task.responseObject[@"obj"][@"htmlTips"];
//        [weakSelf showAlertViewWithContent:content showCancleBtn:NO confirmBlcok:clickConfirmBlock];
//    } failCallback:^(HPRequestBaseManager *manager) {
//        [HPLoadingHUD dismiss];
//    }];
}

+ (void)showAlertViewWithType:(HPHTMLAlertType)type confirmBlcok:(ClickConfirmBlock)clickConfirmBlock {
    [HPLoadingHUD showWithUserInteractionEnabled:NO];
//    HPPreventFraudMgr *preventFraudMgr = [[HPPreventFraudMgr alloc] init];
//    preventFraudMgr.key = [HPHTMLTipTypeManager getTypeStrWithType:type];
//    WS(weakSelf)
//    [preventFraudMgr loadDataWithSuccessCallback:^(HPRequestBaseManager *manager) {
//        NSString *content = manager.task.responseObject[@"obj"][@"htmlTips"];
//        [weakSelf showAlertViewWithContent:content showCancleBtn:NO confirmBlcok:clickConfirmBlock];
//    } failCallback:^(HPRequestBaseManager *manager) {
//        [HPLoadingHUD dismiss];
//    }];
}


+ (void)showAlertViewWithType:(HPHTMLAlertType)type showCancleButton:(BOOL)showCancleBtn confirmBlcok:(ClickConfirmBlock)clickConfirmBlock{
    [HPLoadingHUD showWithUserInteractionEnabled:NO];
//    HPPreventFraudMgr *preventFraudMgr = [[HPPreventFraudMgr alloc] init];
//    preventFraudMgr.key = [HPHTMLTipTypeManager getTypeStrWithType:type];
//    WS(weakSelf)
//    [preventFraudMgr loadDataWithSuccessCallback:^(HPRequestBaseManager *manager) {
//        NSString *content = manager.task.responseObject[@"obj"][@"htmlTips"];
//        [weakSelf showAlertViewWithContent:content showCancleBtn:showCancleBtn confirmBlcok:clickConfirmBlock];
//    } failCallback:^(HPRequestBaseManager *manager) {
//        [HPLoadingHUD dismiss];
//        
//    }];
}


+ (void)showAlertViewWithTitle:(NSString *)title
                          type:(HPHTMLAlertType)type
                 primaryString:(NSString *)primaryStr
               subsidaryString:(NSString *)subsidaryStr
                  primaryBlock:(void (^)(void))primaryBlock
                subsidaryBlock:(void (^)(void))subsidaryBlock{
    
    [HPLoadingHUD showWithUserInteractionEnabled:NO];
//    HPPreventFraudMgr *preventFraudMgr = [[HPPreventFraudMgr alloc] init];
//    preventFraudMgr.key = [HPHTMLTipTypeManager getTypeStrWithType:type];
//    __weak typeof(self) weakSelf = self;
//    [preventFraudMgr loadDataWithSuccessCallback:^(HPRequestBaseManager *manager) {
//        NSString *content = manager.task.responseObject[@"obj"][@"htmlTips"];
//        [weakSelf showAlertViewWithContent:content
//                                     Title:title
//                             primaryString:primaryStr
//                           subsidaryString:subsidaryStr
//                              primaryBlock:primaryBlock
//                            subsidaryBlock:subsidaryBlock];
//    } failCallback:^(HPRequestBaseManager *manager) {
//        [HPLoadingHUD dismiss];
//    }];
}

#pragma mark -- private
+ (void)showAlertViewWithContent:(NSString *)content
                           Title:(NSString *)title
                   primaryString:(NSString *)primaryStr
                 subsidaryString:(NSString *)subsidaryStr
                    primaryBlock:(void (^)(void))primaryBlock
                  subsidaryBlock:(void (^)(void))subsidaryBlock{

    HPHTMLAlertView *alertView = [[HPHTMLAlertView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    alertView.primaryBlock = primaryBlock;
    alertView.subsidaryBlock = subsidaryBlock;
    [alertView loadWebViewWithContent:content];
    alertView.tag = 8888;
    alertView.backgroundView.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}


@end
