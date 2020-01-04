//
//  HPBaseRequestOperationProtocal.h
//  huafener
//
//  Created by 杨俊杰 on 2020/1/2.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HPBaseRequestOperationProtocal <NSObject>

@required

- (NSString *)getUrl;

- (id)params;

@end

NS_ASSUME_NONNULL_END
