//
//  GHLayout.h
//  GHTestWebViewDemo
//
//  Created by 张冠华 on 16/4/8.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.

#import <UIKit/UIKit.h>

typedef enum {
    GHLineLayoutType = 0 ,          //x,y不变,W，H改变
    GHWidthTensileType = 1,         //x,y,h不变，W改变
    GHAllAdapterLayoutType = 2 ,    //frame全部发生改变
    GHNotChangeLayoutType = 3       //完全不发生改变
}GHLayoutType;

typedef enum {
    GHHardwareOrientationAllType = 0,          //全适配
    GHHardwareOrientationLandscapeType,    //默认只支持横屏
    GHHardwareOrientationPortraitType      //默认只支持竖屏
}GHHardwareOrientationType;

@interface GHLayoutParam : NSObject
@property   (nonatomic, assign) CGRect  previousFrame;
@property   (nonatomic, assign) CGFloat percentage;
@property   (nonatomic, assign) CGSize  hardwareSize;
- (CGFloat)landWidth;
- (CGFloat)portraitWidth;
@end

@interface  UIView (GHLayout)
+ (void)startUseGHLayout:(GHHardwareOrientationType)type;
- (void)orientationChangeViewsFrame;
- (void)setLayoutFrame:(CGRect)layoutFrame AndLayoutType:(GHLayoutType)layoutType;
@property (nonatomic, assign) CGFloat defaultX;
@property (nonatomic, assign) CGFloat defaultY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/*
    改变该处会使用
 */
@property (nonatomic, assign) GHLayoutType  layoutType;
@property (nonatomic, strong) GHLayoutParam *layoutParam;
@property (nonatomic, assign) BOOL    isUseLayout;              //default NO    默认不使用自动布局
@property (nonatomic, assign) CGFloat layoutX;
@property (nonatomic, assign) CGFloat layoutY;
@property (nonatomic, assign) CGFloat layoutCenterX;
@property (nonatomic, assign) CGFloat layoutCenterY;
@property (nonatomic, assign) CGFloat layoutWidth;
@property (nonatomic, assign) CGFloat layoutHeight;
@property (nonatomic, assign) CGSize layoutSize;
@property (nonatomic, assign) float  layoutOffParam;

@end
