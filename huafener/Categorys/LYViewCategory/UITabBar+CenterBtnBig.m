//
//  UITabBar+qqq.m
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "UITabBar+CenterBtnBig.h"

@implementation UITabBar (CenterBtnBig)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //这块取3，不是2的原因，还不是很清晰，得持续分析分析
    UIView *tabbarBtn = self.subviews[3];
    //就是说什么呢，当前点point 在tabbarBtn  的相对位置
    CGPoint newP = [self convertPoint:point toView:tabbarBtn];
    if (CGRectContainsPoint(tabbarBtn.subviews[0].frame, newP)) {
        return tabbarBtn;
    }else{
        return [super hitTest:point withEvent:event];
    }
}

@end
