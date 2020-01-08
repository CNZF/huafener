//
//  HPBaseModel.h
//  huafener
//
//  Created by 发小🐰 on 2020/1/5.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPBaseModel : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) id obj;
@property (nonatomic, assign) int code;
@property (nonatomic, assign) int level;
@end

NS_ASSUME_NONNULL_END
