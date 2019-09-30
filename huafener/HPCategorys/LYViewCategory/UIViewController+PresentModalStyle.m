//
//  UIViewController+PresentModalStyle.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/30.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "UIViewController+PresentModalStyle.h"

@implementation UIViewController (PresentModalStyle)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzled_presentViewController:animated:completion:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)swizzled_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion{
    if(@available(iOS 13.0, *)) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self swizzled_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
