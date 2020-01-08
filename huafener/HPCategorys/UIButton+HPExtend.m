//
//  UIButton+HPExtend.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/8.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "UIButton+HPExtend.h"

@implementation UIButton (HPExtend)

//- (void)enable:(BOOL)ret enableColor:(UIColor *)enableColor disEnableColor:(UIColor *)disEnableColor {
//    self.enabled = ret;
//    if (self.enabled) {
//        self.backgroundColor = enableColor;
//    }else{
//        self.backgroundColor = disEnableColor;
//    }
//}

- (void)enable:(BOOL)ret enableColor:(UIColor *)enableColor disEnableColor:(UIColor *)disEnableColor block:(void(^)(UIColor *color))block{
    self.enabled = ret;
    if (ret) {
        block(enableColor);
    }else{
        block(disEnableColor);
    }
}

@end
