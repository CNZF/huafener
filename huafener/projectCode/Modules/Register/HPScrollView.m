//
//  HPScrollView.m
//  huafener
//
//  Created by 发小🐰 on 2020/1/7.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPScrollView.h"
#import "HPTableView.h"
@implementation HPScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{

    UIView * gesView = gestureRecognizer.view;
    UIView *oGesView = otherGestureRecognizer.view;


    NSLog(@"%f",self.contentOffset.x);
    
     Class cls = NSClassFromString(@"UILayoutContainerView");
    if ((self.contentOffset.x == 0 && ![oGesView isMemberOfClass:[cls class]]) ||  self.contentOffset.x > 0) {
        return NO;
    }
    
    
//    Class cls = NSClassFromString(@"UILayoutContainerView");
//    if (([oGesView isMemberOfClass:[HPScrollView class]] && [gesView isMemberOfClass:[HPTableView class]]) ||
//        ([gesView isMemberOfClass:[HPScrollView class]] && [oGesView isMemberOfClass:[cls class]]) ||
//        ([gesView isMemberOfClass:[HPScrollView class]] && [oGesView isMemberOfClass:[UITableView class]]) ||([gesView isMemberOfClass:[HPScrollView class]] && [oGesView isMemberOfClass:[HPScrollView class]])) {
//        return NO;
//    }

    return YES;
}


//- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
//    UIView * gesView = gestureRecognizer.view;
//    UIView *oGesView = otherGestureRecognizer.view;
//
//
//    Class cls = NSClassFromString(@"UILayoutContainerView");
//    if (([oGesView isMemberOfClass:[HPTableView class]] && [gesView isKindOfClass:[HPScrollView class]]) || ([oGesView isMemberOfClass:[UITableView class]] && [gesView isKindOfClass:[HPScrollView class]])) {
//        return NO;
//    }
//
//
//    return YES;
//}


@end


