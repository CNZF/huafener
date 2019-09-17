//
//  UIView+LYViewBehavior_UI.m
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "UIView+LYViewBehavior_UI.h"

@implementation UIView (LYViewBehavior_UI)

- (void)dropShadowWithView:(UIView *)view
                    Offset:(CGSize)offset
                    radius:(CGFloat)radius
                     color:(UIColor *)color
                   opacity:(CGFloat)opacity {
    
    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, view.bounds);
    view.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = offset;
    view.layer.shadowRadius = radius;
    view.layer.shadowOpacity = opacity;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    view.clipsToBounds = NO;
}

@end
