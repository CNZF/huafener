//
//  HPSignInWithAppleController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/30.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPSignInWithAppleController.h"
#import <AuthenticationServices/AuthenticationServices.h>

@interface HPSignInWithAppleController()<ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding>

@property (nonatomic, strong) UITextView *appleIDInfoTextView;

@property (nonatomic, strong) ASAuthorizationAppleIDButton *appleIDButton API_AVAILABLE(ios(13.0));
@property (nonatomic, strong) UIButton *wxBtn;
@property (nonatomic, strong) UIButton *zfbBtn;


@end

@implementation HPSignInWithAppleController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setChildViews];
    [self setTargetEvents];
}

- (void)setTargetEvents{
    @weakify(self)
    if (@available(iOS 13.0, *)) {
        [[self.appleIDButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            if (@available(iOS 13.0, *)) {
                // 基于用户的Apple ID授权用户，生成用户授权请求的一种机制
                ASAuthorizationAppleIDProvider *appleIDProvider = [ASAuthorizationAppleIDProvider new];
                // 创建新的AppleID 授权请求
                ASAuthorizationAppleIDRequest *request = appleIDProvider.createRequest;
                // 在用户授权期间请求的联系信息
                request.requestedScopes = @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];
                // 由ASAuthorizationAppleIDProvider创建的授权请求 管理授权请求的控制器
                ASAuthorizationController *controller = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
                // 设置授权控制器通知授权请求的成功与失败的代理
                controller.delegate = self;
                // 设置提供 展示上下文的代理，在这个上下文中 系统可以展示授权界面给用户
                controller.presentationContextProvider = self;
                // 在控制器初始化期间启动授权流
                [controller performRequests];
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}

- (void)setChildViews{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.appleIDInfoTextView];
    [self.appleIDInfoTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kNavigationH);
        make.left.right.equalTo(self.view);
        make.height.equalTo(kPaddingWithSize(600));
    }];
    
    if (@available(iOS 13.0, *)) {
        [self.view addSubview:self.appleIDButton];
        [self.appleIDButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.width.equalTo(kPaddingWithSize(100));
            make.left.equalTo(self.view).offset(kPaddingWithSize(100));
            make.bottom.equalTo(self.view).offset(-kBottomBarH - kPaddingWithSize(100));
        }];
//        [self.view layoutIfNeeded];
//        [self.appleIDButton setBorderWithCornerRadius:kPaddingWithSize(50) type:(UIRectCornerAllCorners)];
    } else {
        // Fallback on earlier versions
    }
    
}

- (ASAuthorizationAppleIDButton *)appleIDButton API_AVAILABLE(ios(13.0)){
    if (!_appleIDButton) {
        _appleIDButton = [ASAuthorizationAppleIDButton new];
        _appleIDButton.cornerRadius = kPaddingWithSize(50);
//        _appleIDButton.frame =  CGRectMake(.0, .0, kScreenWidth - 40.0, 100.0);
//        CGPoint origin = CGPointMake(20.0, CGRectGetMidY(self.view.frame));
//        CGRect frame = _appleIDButton.frame;
//        frame.origin = origin;
//        _appleIDButton.frame = frame;
//        _appleIDButton.cornerRadius = CGRectGetHeight(_appleIDButton.frame) * 0.25;
    }
    return _appleIDButton;
}

- (UITextView *)appleIDInfoTextView{
    if (!_appleIDInfoTextView) {
        _appleIDInfoTextView = [[UITextView alloc] initWithFrame:CGRectZero];
        _appleIDInfoTextView.font = kFontWithSize(32);
        NSMutableString *mStr = [NSMutableString string];
        [mStr appendString:@"显示Sign In With Apple 登录信息\n"];
        _appleIDInfoTextView.text = [mStr copy];
    }
    return _appleIDInfoTextView;
}

#pragma mark - Delegate

//! 授权成功地回调
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization  API_AVAILABLE(ios(13.0)){
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"%@", controller);
    NSLog(@"%@", authorization);
    
    NSLog(@"authorization.credential：%@", authorization.credential);
    
    NSMutableString *mStr = [NSMutableString string];
    mStr = [_appleIDInfoTextView.text mutableCopy];
    
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        // 用户登录使用ASAuthorizationAppleIDCredential
        ASAuthorizationAppleIDCredential *appleIDCredential = authorization.credential;
        NSString *user = appleIDCredential.user;
        //  需要使用钥匙串的方式保存用户的唯一信息 这里暂且处于测试阶段 是否的NSUserDefaults
        [[NSUserDefaults standardUserDefaults] setValue:user forKey:@"QiShareCurrentIdentifier"];
        [mStr appendString:user?:@""];
        NSString *familyName = appleIDCredential.fullName.familyName;
        [mStr appendString:familyName?:@""];
        NSString *givenName = appleIDCredential.fullName.givenName;
        [mStr appendString:givenName?:@""];
        NSString *email = appleIDCredential.email;
        [mStr appendString:email?:@""];
        NSLog(@"mStr：%@", mStr);
        [mStr appendString:@"\n"];
        _appleIDInfoTextView.text = mStr;
        
    } else if ([authorization.credential isKindOfClass:[ASPasswordCredential class]]) {
        // 用户登录使用现有的密码凭证
        ASPasswordCredential *passwordCredential = authorization.credential;
        // 密码凭证对象的用户标识 用户的唯一标识
        NSString *user = passwordCredential.user;
        // 密码凭证对象的密码
        NSString *password = passwordCredential.password;
        [mStr appendString:user?:@""];
        [mStr appendString:password?:@""];
        [mStr appendString:@"\n"];
        NSLog(@"mStr：%@", mStr);
        _appleIDInfoTextView.text = mStr;
    } else {
        NSLog(@"授权信息均不符");
        mStr = [@"授权信息均不符" mutableCopy];
        _appleIDInfoTextView.text = mStr;
    }
}

//! 授权失败的回调
- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error  API_AVAILABLE(ios(13.0)){
    
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"错误信息：%@", error);
    NSString *errorMsg = nil;
    switch (error.code) {
        case ASAuthorizationErrorCanceled:
            errorMsg = @"用户取消了授权请求";
            break;
        case ASAuthorizationErrorFailed:
            errorMsg = @"授权请求失败";
            break;
        case ASAuthorizationErrorInvalidResponse:
            errorMsg = @"授权请求响应无效";
            break;
        case ASAuthorizationErrorNotHandled:
            errorMsg = @"未能处理授权请求";
            break;
        case ASAuthorizationErrorUnknown:
            errorMsg = @"授权请求失败未知原因";
            break;
    }
    
    NSMutableString *mStr = [_appleIDInfoTextView.text mutableCopy];
    [mStr appendString:errorMsg];
    [mStr appendString:@"\n"];
    _appleIDInfoTextView.text = [mStr copy];
    
    if (errorMsg) {
        return;
    }
    
    if (error.localizedDescription) {
        NSMutableString *mStr = [_appleIDInfoTextView.text mutableCopy];
        [mStr appendString:error.localizedDescription];
        [mStr appendString:@"\n"];
        _appleIDInfoTextView.text = [mStr copy];
    }
    NSLog(@"controller requests：%@", controller.authorizationRequests);
    /* // 取消授权的时候也会调用这里
     ((ASAuthorizationAppleIDRequest *)(controller.authorizationRequests[0])).requestedScopes
     <__NSArrayI 0x2821e2520>(
     full_name,
     email
     )
     */
}


//! Tells the delegate from which window it should present content to the user.
//! 告诉代理应该在哪个window 展示内容给用户
- (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller  API_AVAILABLE(ios(13.0)){
    
    NSLog(@"调用展示window方法：%s", __FUNCTION__);
    // 返回window
    return self.view.window;
}


@end
