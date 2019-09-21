//
//  UIView+LYViewBehavior_UI.h
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIView (LYViewBehavior_UI)


#pragma mark -- 设置阴影
- (void)dropShadowWithView:(UIView *)view
                    Offset:(CGSize)offset
                    radius:(CGFloat)radius
                     color:(UIColor *)color
                   opacity:(CGFloat)opacity;


#pragma mark -- 设置圆角
- (void)setBorderWithCornerRadius:(CGFloat)cornerRadius
                             type:(UIRectCorner)corners;

#pragma mark -- 设置圆角及边框
- (void)setBorderWithCornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                             type:(UIRectCorner)corners;

@end

NS_ASSUME_NONNULL_END
