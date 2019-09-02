//
//  GHLayout.m
//  GHTestWebViewDemo
//
//  Created by 张冠华 on 16/4/8.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//

#import "UIView+GHLayout.h"
#import <objc/runtime.h>

static const float padDefaultWidth = 768.0f;
static const float padDefaultOrientationWidth = 1024.0f;
static const float phoneDefaultWidth = 320.0f;
static const float phoneDefaultOrientationWidth = 480.0f;

float layoutOff = 0;

static CGRect calculateFrameWithPercentage(CGFloat superViewWidth,CGRect preRect,CGFloat percentage)
{
    return CGRectMake(preRect.origin.x,
                      preRect.origin.y,
                      superViewWidth * percentage,
                      superViewWidth * percentage / preRect.size.width * preRect.size.height);
}

#define HARDWARE_TYPE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? 1: 0
#define SAVE_ORIENTATION(__TYPE__) [[NSUserDefaults standardUserDefaults] setInteger:__TYPE__ forKey:@"ORIENTATION"];
#define GET_ORIENTATION [[NSUserDefaults standardUserDefaults] integerForKey:@"ORIENTATION"]

void layout__swizzle(Class c,SEL origSEL,SEL newSEL);

void layout__swizzle(Class c,SEL origSEL,SEL newSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method newMethod = nil;
    
    if (!origMethod){
        origMethod = class_getClassMethod(c, origSEL);
        newMethod = class_getClassMethod(c, newSEL);
    }else{
        newMethod = class_getInstanceMethod(c, newSEL);
    }
    
    if (!origMethod||!newMethod) {
        return;
    }
    
    if(class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else{
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@implementation GHLayoutParam

- (CGFloat)landWidth
{
    return self.hardwareSize.width > self.hardwareSize.height ? self.hardwareSize.width : self.hardwareSize.height;
}

- (CGFloat)portraitWidth
{
    return self.hardwareSize.width < self.hardwareSize.height ? self.hardwareSize.width : self.hardwareSize.height;
}

@end

@interface UIViewController (orientationChange)
@property (nonatomic, assign) BOOL  isLand;
@property (nonatomic, assign) BOOL  isPortrait;
@end

@implementation UIViewController (orientationChange)

- (void)setIsLand:(BOOL)isLand
{
    objc_setAssociatedObject(self, @selector(isLand), @(isLand), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isLand
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsPortrait:(BOOL)isPortrait
{
    objc_setAssociatedObject(self, @selector(isPortrait), @(isPortrait), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isPortrait
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)gh_viewWillAppear:(BOOL)animated
{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)gh_viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
}

- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation
{
    UIDevice *device = [UIDevice currentDevice];
    
    switch (GET_ORIENTATION) {
        case GHHardwareOrientationAllType:
            self.isPortrait = YES;
            self.isLand = YES;
            break;
        case GHHardwareOrientationLandscapeType:
            self.isLand = YES;
            self.isPortrait = NO;
            break;
        case GHHardwareOrientationPortraitType:
            self.isPortrait = YES;
            self.isLand = NO;
            break;
        default:
            break;
    }
    
    if (UIDeviceOrientationIsLandscape(device.orientation)) {
        if (self.isLand) {
            
        }else return;
    }else if(UIDeviceOrientationIsPortrait(device.orientation)) {
        if (self.isPortrait) {
            
        }else return;
    }else {
        return;
    }

    for (UIView * v_ in self.view.subviews) {
        if (v_.isUseLayout) {
            if (v_.layoutParam) {
                v_.layoutParam.previousFrame = calculateFrameWithPercentage(v_.superview.frame.size.width,
                                                                            v_.layoutParam.previousFrame,
                                                                            v_.layoutParam.percentage);
                v_.layoutParam.percentage = v_.layoutParam.previousFrame.size.width / v_.superview.frame.size.width;
            }
            [v_ orientationChangeViewsFrame];
        }
    }
}

@end

@implementation UIView (GHLayout)

+ (void)startUseGHLayout:(GHHardwareOrientationType)type
{
    SAVE_ORIENTATION(type);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        layout__swizzle([UIViewController class],@selector(viewWillAppear:),@selector(gh_viewWillAppear:));
        layout__swizzle([UIViewController class],@selector(viewDidDisappear:),@selector(gh_viewDidDisappear:));
    });
}

- (void)orientationChangeViewsFrame
{
    for (UIView * v_ in self.subviews) {
        if (v_.isUseLayout) {
            if (v_.layoutParam) {
                v_.layoutParam.previousFrame = calculateFrameWithPercentage(self.layoutParam.previousFrame.size.width,
                                                                            v_.layoutParam.previousFrame,
                                                                            v_.layoutParam.percentage);
                v_.layoutParam.percentage = v_.layoutParam.previousFrame.size.width / self.layoutParam.previousFrame.size.width;
            }
            [v_ orientationChangeViewsFrame];
        }
    }
    
    if (!self.layoutParam) {
        self.layoutParam = [[GHLayoutParam alloc] init];
        self.layoutParam.previousFrame = CGRectMake(self.frame.origin.x,
                                                    self.frame.origin.y,
                                                    self.frame.size.width,
                                                    self.frame.size.height);
        self.layoutParam.hardwareSize = [UIScreen mainScreen].bounds.size;
        self.layoutParam.percentage = self.layoutParam.previousFrame.size.width / self.superview.frame.size.width;
    }
    
    [self setLayoutFrame:self.layoutParam.previousFrame AndLayoutType:self.layoutType];
}

- (void)setLayoutFrame:(CGRect)layoutFrame AndLayoutType:(GHLayoutType)layoutType_
{
    BOOL    isIpad_ = HARDWARE_TYPE;
    
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationIsLandscape(deviceOrientation)) {
        if (isIpad_) {
            self.layoutOffParam = self.layoutParam.landWidth / padDefaultOrientationWidth;
        }else {
            self.layoutOffParam = self.layoutParam.landWidth / phoneDefaultOrientationWidth;
        }
    }else if(UIDeviceOrientationIsPortrait(deviceOrientation)) {
        if (isIpad_) {
            self.layoutOffParam = self.layoutParam.portraitWidth / padDefaultWidth;
        }else {
            self.layoutOffParam = self.layoutParam.portraitWidth / phoneDefaultWidth;
        }
    }
    
    switch (layoutType_) {
        case GHLineLayoutType:
            [self setDefaultX:layoutFrame.origin.x];
            [self setDefaultY:layoutFrame.origin.y];
            [self setLayoutSize:layoutFrame.size];
            break;
        case GHAllAdapterLayoutType:
            [self setLayoutX:layoutFrame.origin.x];
            [self setLayoutY:layoutFrame.origin.y];
            [self setLayoutSize:layoutFrame.size];
            break;
        case GHNotChangeLayoutType:
            [self setDefaultX:layoutFrame.origin.x];
            [self setDefaultY:layoutFrame.origin.y];
            [self setSize:layoutFrame.size];
            break;
        case GHWidthTensileType:
            [self setDefaultX:layoutFrame.origin.x];
            [self setDefaultY:layoutFrame.origin.y];
            [self setLayoutWidth:layoutFrame.size.width];
            [self setHeight:layoutFrame.size.height];
            break;
        default:
            break;
    }
    [self setLayoutType:layoutType_];
}

- (void)setIsUseLayout:(BOOL)isUseLayout
{
    if (isUseLayout) {
       [self orientationChangeViewsFrame];
    }
    objc_setAssociatedObject(self, @selector(isUseLayout), @(isUseLayout), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isUseLayout
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setLayoutOffParam:(float)layoutOffParam
{
    objc_setAssociatedObject(self, @selector(layoutOffParam), [NSNumber numberWithFloat:layoutOffParam], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (float)layoutOffParam
{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setLayoutType:(GHLayoutType)layoutType
{
    objc_setAssociatedObject(self, @selector(layoutType), @(layoutType), OBJC_ASSOCIATION_ASSIGN);
}

- (GHLayoutType)layoutType
{
    return [objc_getAssociatedObject(self, _cmd) intValue];
}

- (void)setLayoutParam:(GHLayoutParam *)layoutParam
{
    objc_setAssociatedObject(self, @selector(layoutParam), layoutParam, OBJC_ASSOCIATION_RETAIN);
}

- (GHLayoutParam *)layoutParam
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setDefaultX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)defaultX
{
    return self.frame.origin.x;
}

- (void)setDefaultY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)defaultY
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

/* Layout frame */

- (void)setLayoutX:(CGFloat)layoutX
{
    CGRect frame = self.frame;
    frame.origin.x = layoutX * self.layoutOffParam;
    self.frame = frame;
}

- (CGFloat)layoutX
{
    return self.frame.origin.x;
}

- (void)setLayoutY:(CGFloat)layoutY
{
    CGRect frame = self.frame;
    frame.origin.y = layoutY * self.layoutOffParam;
    self.frame = frame;
}

- (CGFloat)layoutY
{
    return self.frame.origin.y;
}

- (void)setLayoutCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX * self.layoutOffParam;
    self.center = center;
}

- (CGFloat)layoutCenterX
{
    return self.center.x;
}

- (void)setLayoutCenterY:(CGFloat)layoutCenterY
{
    CGPoint center = self.center;
    center.y = layoutCenterY * self.layoutOffParam;
    self.center = center;
}

- (CGFloat)layoutCenterY
{
    return self.center.y;
}

- (void)setLayoutWidth:(CGFloat)layoutWidth
{
    CGRect frame = self.frame;
    frame.size.width = layoutWidth * self.layoutOffParam;
    self.frame = frame;
}

- (CGFloat)layoutWidth
{
    return self.frame.size.width;
}

- (void)setLayoutHeight:(CGFloat)layoutHeight
{
    CGRect frame = self.frame;
    frame.size.height = layoutHeight * self.layoutOffParam;
    self.frame = frame;
}

- (CGFloat)layoutHeight
{
    return self.frame.size.height;
}

- (void)setLayoutSize:(CGSize)layoutSize
{
    CGRect frame = self.frame;
    frame.size.width = layoutSize.width * self.layoutOffParam;
    frame.size.height = layoutSize.height * self.layoutOffParam;
    self.frame = frame;
}

- (CGSize)layoutSize
{
    return self.frame.size;
}


@end
