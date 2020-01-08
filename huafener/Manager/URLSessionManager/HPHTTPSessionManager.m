//
//  HPHTTPSessionManager.m
//  huafener
//
//  Created by 杨俊杰 on 2019/12/30.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPHTTPSessionManager.h"
#import "HPDeviceUtils.h"
#import "HPBaseModel.h"
#import <SAMKeychain.h>
#import <AFNetworkActivityIndicatorManager.h>

static NSString * const baseUrl = @"http://localhost:8090";

NSInteger const kAFNetWoringTimeiutInterval = 10;

static BOOL netReachable;
static NSUInteger _curttenTaskIdentifier;

@implementation HPHTTPSessionManager

+ (AFHTTPSessionManager *)shareManager{

    static AFHTTPSessionManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        instance.requestSerializer = [AFHTTPRequestSerializer serializer];
        instance.responseSerializer = [AFHTTPResponseSerializer serializer];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",
                                                              @"text/xml",
                                                              @"text/json",
                                                              @"text/plain",
                                                              @"text/JavaScript",
                                                              @"application/json",
                                                              @"image/jpeg",
                                                              @"image/png",
                                                              @"application/octet-stream",nil];
        
        instance.requestSerializer.timeoutInterval = kAFNetWoringTimeiutInterval;
        //设置请求头
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        [self setHttpHeaderAndInfo:instance];
    });
    
    return instance;
}

//+ (NSURLSessionConfiguration *)setConfiguration{
//
//    NSURLSessionConfiguration * config = NSURLSessionConfiguration.defaultSessionConfiguration;
//
//
//    config.timeoutIntervalForRequest = kAFNetWoringTimeiutInterval;
//
//}


+ (NSURLSessionDataTask *)requestWith_GET_UrlString:(NSString *)urlString
                  parameters:(id)parameters
                successBlock:(HPHTTPRequestSuccessBlock)successBlock
           failureBlock:(HPHTTPRequestFailedBlock)failureBlock{
    NSURLSessionDataTask *dataTask =  [[self shareManager] GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        id jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        HPBaseModel *baseModel = [HPBaseModel mj_objectWithKeyValues:responseObject];
        NSLog(@"responseObject :%@",[baseModel yy_modelToJSONString]);
        if (baseModel.code == 200) {
            if (successBlock){
                successBlock(baseModel.obj);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.code !=-999) {
            if (failureBlock)
            {
                failureBlock(error);
            }
        }
        else{
            NSLog(@"取消队列了");
        }
    }];
    _curttenTaskIdentifier = dataTask.taskIdentifier;
    return dataTask;
}

+ (NSURLSessionDataTask *)loadDataWithOperation:(HPBaseRequestOperation<HPBaseRequestOperationProtocal>*)operation
           successBlock:(HPHTTPRequestSuccessBlock)successBlock
           failureBlock:(HPHTTPRequestFailedBlock)failureBlock
{
    NSParameterAssert([operation getUrl] != nil);
    
    NSLog(@"\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n");
    NSLog(@"%@",[self shareManager].requestSerializer.HTTPRequestHeaders);
    NSLog(@"\n******************\n%@%@\n********************",[self shareManager].baseURL.absoluteString,[operation getUrl]);
        
    //检测网络状态
    [self whetherNetReachableFailBlock:failureBlock];
    
    NSString *urlStr = configUrlPath(operation);
    
   __block NSURLSessionDataTask * dataTask;
    
    switch (operation.requestType) {
        case HPHttpRequestTypeGet:{
            
            if (operation.isAsync) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                   dataTask = [self requestWith_GET_UrlString:urlStr parameters:[operation params] successBlock:successBlock failureBlock:failureBlock];
                });
            }else{
                dataTask = [self requestWith_GET_UrlString:urlStr parameters:[operation params] successBlock:successBlock failureBlock:failureBlock];
            }
        }

            break;
        case HPHttpRequestTypePost:{
            
            if (operation.isAsync) {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                  dataTask = [self requestWith_POST_UrlString:urlStr parameters:[operation params] successBlock:successBlock failureBlock:failureBlock];
                });
            }else{
               dataTask = [self requestWith_POST_UrlString:urlStr parameters:[operation params] successBlock:successBlock failureBlock:failureBlock];
            }
            
            
        }
            break;
        default:
            break;
    }
    return dataTask;
}


+ (NSURLSessionDataTask *)requestWith_POST_UrlString:(NSString *)urlString
                  parameters:(id)parameters
                successBlock:(HPHTTPRequestSuccessBlock)successBlock
           failureBlock:(HPHTTPRequestFailedBlock)failureBlock{
    
    NSURLSessionDataTask *dataTask = [[self shareManager] POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n响应数据\n");
        NSLog(@"responseObject :%@",[jsonDict yy_modelToJSONString]);
        HPBaseModel *baseModel = [HPBaseModel mj_objectWithKeyValues:jsonDict];
        if (baseModel.code == 200) {
            if (successBlock){
                successBlock(baseModel.obj);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.code !=-999) {
            if (failureBlock)
            {
                failureBlock(error);
            }
        }
        else{
            NSLog(@"取消队列了");
        }
    }];
    _curttenTaskIdentifier = dataTask.taskIdentifier;
    return dataTask;
}

+ (void)cancelCurttentTask{
    for (NSURLSessionDataTask *task in [self shareManager].tasks) {
        if (task.taskIdentifier == _curttenTaskIdentifier) {
            [task cancel];
        }
    }
}

+ (void)cancelDataTask
{
    NSMutableArray *dataTasks = [NSMutableArray arrayWithArray:[self shareManager].dataTasks];
    for (NSURLSessionDataTask *taskObj in dataTasks) {
        [taskObj cancel];
    }
}

#pragma mark
#pragma mark -- Help
static NSString * configUrlPath(HPBaseRequestOperation<HPBaseRequestOperationProtocal>* op){
    
    NSLocalizedStringFromTable(@"Unknown", @"AFNetworking", nil);
    NSString *urlString = [op getUrl];
    if (@available(iOS 9.0, *)) {
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }else {
        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    return urlString;
}

+ (void)netReachAbleChange:(BOOL)isReachAble{
    netReachable = isReachAble;
}


+ (void)whetherNetReachableFailBlock:(HPHTTPRequestFailedBlock)failureBlock{
    if (!netReachable) {
       failureBlock([NSError errorWithDomain:@"网络连接失败" code:-10001 userInfo:nil]);
       return ;
    }
}


#pragma mark
#pragma mark -- Header相关
+ (void)setHttpHeaderAndInfo:(AFHTTPSessionManager*)_manager{
    NSMutableDictionary *headerFileds = [_manager.requestSerializer.HTTPRequestHeaders mutableCopy];
    if (!headerFileds) {
        headerFileds = [NSMutableDictionary dictionary];
    }
    [headerFileds setValue:[self getDeviceId] forKey:@"x-device-id"];
    [headerFileds setValue:@"ios" forKey:@"X-Platform"];
    [headerFileds setValue:@"com.huapubj.huafer" forKey:@"X-App-Id"];
    NSDictionary *dic = @{@"model" : [self getDeviceName], @"version": [self getSystemVersion]};
    [headerFileds setValue:[dic yy_modelToJSONString] forKey:@"X-OS"];
    [headerFileds enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [_manager.requestSerializer setValue:obj forHTTPHeaderField:key];
    }];
    
}

+ (NSString *)getDeviceId
{
    NSString * currentDeviceUUIDStr = [SAMKeychain passwordForService:@" "account:@"uuid"];
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""])
    {
        NSUUID * currentDeviceUUID  =[[UIDevice currentDevice] identifierForVendor];
        currentDeviceUUIDStr = [currentDeviceUUID UUIDString];
        currentDeviceUUIDStr = [currentDeviceUUIDStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        currentDeviceUUIDStr = [currentDeviceUUIDStr lowercaseString];
        [SAMKeychain setPassword: currentDeviceUUIDStr forService:@" "account:@"uuid"];
    }
    return currentDeviceUUIDStr;
}

+ (NSString *)getSystemVersion {
    static NSString *v;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        v = [UIDevice currentDevice].systemVersion;
    });
    return v;
}

+ (NSString *)getDeviceName {
    static NSString *deviceName;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceName = [HPDeviceUtils getDeviceName];
    });
    return deviceName;
}

@end
