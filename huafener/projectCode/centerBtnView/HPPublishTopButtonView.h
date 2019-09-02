//
//  HPPublishTopButtonView.h
//  GHZeusLibraries
//
//  Created by Zhang Weifan on 2018/8/21.
//  Copyright © 2018年 花圃科技（北京）有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CenterBtnModel;
@interface HPPublishTopButtonView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                        image:(UIImage *)image
                       detail:(NSString *)detail;

- (instancetype)initWithFrame:(CGRect)frame
                        Model:(CenterBtnModel *)model;

@end
