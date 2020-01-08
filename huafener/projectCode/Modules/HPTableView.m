//
//  HPTableView.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/7.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPTableView.h"
#import "HPScrollView.h"
@interface HPTableView ()<UIGestureRecognizerDelegate>


@end

@implementation HPTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    UIView * gesView = gestureRecognizer.view;
    UIView *oGesView = otherGestureRecognizer.view;

    Class cls = NSClassFromString(@"UILayoutContainerView");
    if ([gesView isKindOfClass:[HPTableView class]] && [oGesView isKindOfClass:[cls class]]) {
        return NO;
    }

    if ([gesView isKindOfClass:[HPTableView class]] && [oGesView isKindOfClass:[HPScrollView class]]) {
        return NO;
    }
    return YES;
}

@end
