//
//  UIFont+qqq.h
//  huafener
//
//  Created by 杨俊杰 on 2019/9/10.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (qqq)
/**
 创建 PingFang 字体.
 
 @param size 设计图上的字体大小. 方法内部会进行适配.
 @return 如果不支持(iOS 8), 则返回系统字体
 */
+ (UIFont *)pingFangOfSize:(CGFloat)size;

/**
 创建 PingFang-Medium 字体.
 
 @param size 设计图上的字体大小. 方法内部会进行适配.
 @return 如果不支持(iOS 8), 则返回系统字体
 */
+ (UIFont *)pingFangMediumOfSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
