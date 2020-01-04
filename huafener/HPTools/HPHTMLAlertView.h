//
//  HPHTMLAlertView.h
//  GHZeusLibraries
//
//  Created by 杨俊杰 on 2018/10/10.
//  Copyright © 2018 花圃科技（北京）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPHTMLTipTypeManager.h"

#define kLocalAppraisalHtml @"<div style='font-family:PingFangSC;color:#333'><div style=height:15px></div><div style='font-size:16px;font-weight:bold;text-align:center;'>放弃证明</div><div style=height:15px></div><div style=font-size:14px><div style=height:6px></div><div>无法提供正品证明，商品将不能通过鉴定，订单将取消。</div><div style='height: 12px'></div></div></div>"

typedef void (^ClickConfirmBlock) (void);
typedef void (^ClickCancleClickBlock) (void);

@interface HPHTMLAlertView : UIView


@property (nonatomic, copy) ClickConfirmBlock clickConfirmBlock;


/**
 根据类型展示弹框

 @param type 类型
 @param clickConfirmBlock 确认
 */
+ (void)showAlertViewWithType:(HPHTMLAlertType)type confirmBlcok:(ClickConfirmBlock)clickConfirmBlock;

+ (void)showAlertViewWithType:(HPHTMLAlertType)type showCancleButton:(BOOL)showCancleBtn confirmBlcok:(ClickConfirmBlock)clickConfirmBlock;


/**
 根据HTML展示弹框

 @param content html
 @param clickConfirmBlock 确认
 */
+ (void)showAlertViewWithContent:(NSString *)content showCancleBtn:(BOOL)showCancleBtn confirmBlcok:(ClickConfirmBlock)clickConfirmBlock;


+ (void)showAlertViewWithTypeStr:(NSString *)typeStr confirmBlcok:(ClickConfirmBlock)clickConfirmBlock;


/// 接口 -- HTML弹窗
/// @param title 标题
/// @param url 请求地址
/// @param primaryStr 主按钮标题
/// @param subsidaryStr 副按钮标题
/// @param primaryBlock confirmBlock description
/// @param subsidaryBlock subsidaryBlock description
+ (void)showAlertViewWithTitle:(NSString *)title
                          type:(HPHTMLAlertType)url
                 primaryString:(NSString *)primaryStr
               subsidaryString:(NSString *)subsidaryStr
                  primaryBlock:(void (^)(void))primaryBlock
                subsidaryBlock:(void (^)(void))subsidaryBlock;

@end

