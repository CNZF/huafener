//
//  LYEnums.h
//  huafener
//
//  Created by 杨俊杰 on 2019/9/2.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 Tabbar 弹层上视图

 - CenterBtnViewType_Unitary:       一元
 - CenterBtnViewType_Point:         花粉币专区
 - CenterBtnViewType_Article:       花语
 - CenterBtnViewType_ShortVideo:    短视频
 */

typedef NS_ENUM(NSInteger, CenterBtnViewType) {
    CenterBtnViewType_Unitary  =  0,
    CenterBtnViewType_Point,
    CenterBtnViewType_Article,
    CenterBtnViewType_ShortVideo,
};

@interface LYEnums : NSObject

@end

NS_ASSUME_NONNULL_END
