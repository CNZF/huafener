//
//  CenterBtnModel.h
//  huafener
//
//  Created by 杨俊杰 on 2019/9/2.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CenterBtnModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, copy) NSString *target;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, assign) CenterBtnViewType type;

@end

NS_ASSUME_NONNULL_END
