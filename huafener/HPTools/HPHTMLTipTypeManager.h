//
//  HPHTMLTipTypeManager.h
//  GHZeusLibraries
//
//  Created by 杨俊杰 on 2019/12/24.
//  Copyright © 2019 花圃科技（北京）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, HPHTMLAlertType) {
    HPHTMLTypeConsignmentPricing =              1<<0,     //寄卖定价
    HPHTMLTypeConsignmentStandard =             1<<1,     //寄卖标准
    HPHTMLTypeAppraisalInitial =                1<<2,     //初次鉴定提示文案
    HPHTMLTypeAppraisalInitialPinkage =         1<<3,     //初次鉴定包含包邮文案
    HPHTMLTypeAppraisalPinkage =                1<<4,     //鉴定包邮文案
    HPHTMLTypeConsignmentCoupons =              1<<5,     //寄卖服务费优惠券
    HPHTMLTypeShopCoupons =                     1<<6,     //店铺优惠券
    HPHTMLTypeConsigmentChangePrice =           1<<7,     //店铺优惠券
    HPHTMLTypeOrderCancelAppraisalProof =       1<<8,     //放弃证明
    HPHTMLTypeOrderCancelAppraisalProof_Other = 1<<9,     //放弃证明_(超时不通过 || 超时人工处理)
};

typedef NS_ENUM(NSInteger, HPHTMLALertColorType) {
    HPHTMLALertColorTypDefault = 1<<0 ,  //默认 标题（黑）, 按钮（0x449DFA 蓝）
    HPHTMLALertColorTypCaseOne = 1<<1 ,  //默认 标题（黑）, 按钮左（0xff6677 ）, 按钮右（0x449DFA）
};

@interface HPHTMLTipTypeManager : NSObject

+ (NSString *)getTypeStrWithType:(HPHTMLAlertType)type;

@end

NS_ASSUME_NONNULL_END
