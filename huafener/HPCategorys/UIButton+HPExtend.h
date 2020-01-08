//
//  UIButton+HPExtend.h
//  huafener
//
//  Created by 发小🐰 on 2020/1/8.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HPExtend)

//- (void)enable:(BOOL)ret enableColor:(UIColor *)enableColor disEnableColor:(UIColor *)disEnableColor block:(void(^)(UIColor *color))block;

- (void)enable:(BOOL)ret enableColor:(UIColor *)enableColor disEnableColor:(UIColor *)disEnableColor block:(void(^)(UIColor *color))block;
@end

NS_ASSUME_NONNULL_END
