//
//  HPBaseRequestOperation.h
//  huafener
//
//  Created by 杨俊杰 on 2020/1/2.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HPBaseRequestOperationProtocal.h"

typedef NS_ENUM(NSUInteger, HPHttpRequestType)
{
    HPHttpRequestTypePost = 0,
    HPHttpRequestTypeGet
};

typedef NS_ENUM(NSInteger, HPURLRequestMapping)
{
    HPReqMap_Placeholder = 0, //占位，默认无返回
    HPReqMap_getBrandsGrouped = 1,
    HPReqMap_getOtpCode = 2,
    HPReqMap_login = 3
};

NS_ASSUME_NONNULL_BEGIN

@interface HPBaseRequestOperation : NSObject<HPBaseRequestOperationProtocal>

@property (nonatomic, assign) BOOL isAsync;

@property (nonatomic, assign) HPHttpRequestType requestType;

@property (nonatomic, assign) HPURLRequestMapping requestMapping;

- (instancetype)initWithParams:(id)params;

@end

NS_ASSUME_NONNULL_END
