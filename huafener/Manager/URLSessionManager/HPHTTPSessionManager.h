//
//  HPHTTPSessionManager.h
//  huafener
//
//  Created by 杨俊杰 on 2019/12/30.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HPBaseRequestOperation.h"

NS_ASSUME_NONNULL_BEGIN

/**
 http通讯成功的block

 @param responseObject 返回的数据
 */
typedef void (^HPHTTPRequestSuccessBlock)(id responseObject);

/**
 http通讯失败后的block

 @param error 返回的错误信息
 */
typedef void (^HPHTTPRequestFailedBlock)(NSError *error);

/**
 超时时间
 */

extern NSInteger const kAFNetWoringTimeiutInterval;

@interface HPHTTPSessionManager : AFHTTPSessionManager

+ (AFHTTPSessionManager *)shareManager;

/**
 基本数据请求 NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)loadDataWithOperation:(HPBaseRequestOperation<HPBaseRequestOperationProtocal> *)operation
           successBlock:(HPHTTPRequestSuccessBlock)successBlock
           failureBlock:(HPHTTPRequestFailedBlock)failureBlock;

#pragma mark -- TODU 下载，上传任务等封装

/**
 下载请求
 */
//+(void)loadDataWithOperation:(HPBaseRequestOperation<HPBaseRequestOperationProtocal> *)operation
//    successBlock:(HPHTTPRequestSuccessBlock)successBlock
//    failureBlock:(HPHTTPRequestFailedBlock)failureBlock;

/**
 取消队列
 */
+ (void)cancelDataTask;
/**
 取消当前任务
 */
+ (void)cancelCurttentTask;
/**
 网络状态变更
 */
+ (void)netReachAbleChange:(BOOL)isReachAble;

@end

NS_ASSUME_NONNULL_END
