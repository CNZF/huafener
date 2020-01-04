//
//  HPHTMLTipTypeManager.m
//  GHZeusLibraries
//
//  Created by 杨俊杰 on 2019/12/24.
//  Copyright © 2019 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPHTMLTipTypeManager.h"

@implementation HPHTMLTipTypeManager

+ (NSString *)getTypeStrWithType:(HPHTMLAlertType)type{
    
    NSString *typeKey = @"";
    
    switch (type) {
        case HPHTMLTypeConsignmentPricing:
            typeKey = @"consignment-pricing";
            break;
        case HPHTMLTypeConsignmentStandard:
            typeKey = @"consignment-standard";
            break;
        case HPHTMLTypeAppraisalInitial:
            typeKey = @"appraisal-initial";
            break;
        case HPHTMLTypeAppraisalInitialPinkage:
            typeKey = @"appraisal-initial-pinkage";
            break;
        case HPHTMLTypeAppraisalPinkage:
            typeKey = @"appraisal-pinkage";
            break;
        case HPHTMLTypeConsignmentCoupons:
            typeKey = @"consignment-coupons";
            break;
        case HPHTMLTypeShopCoupons:
            typeKey = @"shop-coupons";
            break;
        case HPHTMLTypeConsigmentChangePrice:
            typeKey = @"consignment-publish-tips";
            break;
        case HPHTMLTypeOrderCancelAppraisalProof:
            typeKey = @"order-tips-cancel-appraisal-proof";
            break;
        default:
            break;
    }
    return typeKey;
}

@end
