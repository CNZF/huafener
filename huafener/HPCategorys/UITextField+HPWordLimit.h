//
//  UITextField+HPWordLimit.h
//  huafener
//
//  Created by 发小🐰 on 2020/1/8.
//  Copyright © 2020 杨俊杰. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (HPWordLimit)

- (void)lc_wordLimit:(NSInteger)count;

@property (nonatomic, copy, readonly) IBInspectable NSString *lc_maxLength;//限制字数

@end

NS_ASSUME_NONNULL_END
