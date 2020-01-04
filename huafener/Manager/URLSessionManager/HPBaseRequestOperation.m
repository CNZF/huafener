//
//  HPBaseRequestOperation.m
//  huafener
//
//  Created by 杨俊杰 on 2020/1/2.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPBaseRequestOperation.h"

@implementation HPBaseRequestOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isAsync = YES;
        self.requestType = HPHttpRequestTypePost;
    }
    return self;
}

- (nonnull NSString *)getUrl {
    return getMappingUrl(self.requestMapping);
}

- (nonnull id)params {
    return getMappingUrlParams(self.requestMapping);
}


#pragma mark -- 私有
static inline id getMappingUrlParams(HPURLRequestMapping mapping){
    switch (mapping) {
        case HPReqMap_Placeholder:
            return @{};
            break;
        case HPReqMap_getBrandsGrouped:
            return @{};
            break;
        case HPReqMap_XX:
            return @{};
        break;
        case HPReqMap_XXX:
            return @{};
        break;
        default:
            return @{};
            break;
    }
}

static inline NSString * getMappingUrl(HPURLRequestMapping mapping){
    switch (mapping) {
        case HPReqMap_Placeholder:
            return @"";
            break;
        case HPReqMap_getBrandsGrouped:
            return @"brand/v1/getBrandsGrouped";;
            break;
        case HPReqMap_XX:
            return @"";
        break;
        case HPReqMap_XXX:
            return @"";
        break;
        default:
            return @"";
            break;
    }
}

@end
