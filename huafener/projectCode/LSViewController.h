//
//  LSViewController.h
//  huafener
//
//  Created by 杨俊杰 on 2020/5/13.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSViewController : HPBaseViewController

@property (nonatomic, copy) LSViewController *(^getTitle)(NSString *title);

@property (nonatomic, copy) LSViewController *(^getBackGroud)(UIColor *color);

@end

NS_ASSUME_NONNULL_END
