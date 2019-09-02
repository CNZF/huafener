//
//  HPPublishTopButtonView.m
//  GHZeusLibraries
//
//  Created by Zhang Weifan on 2018/8/21.
//  Copyright © 2018年 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPPublishTopButtonView.h"
#import "CenterBtnModel.h"

@interface HPPublishTopButtonView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) CenterBtnModel *model;
@end

@implementation HPPublishTopButtonView


- (instancetype)initWithFrame:(CGRect)frame Model:(CenterBtnModel *)model {
    if (self = [super initWithFrame:frame]) {
        
        self.model = model;
        self.detailLabel.text = model.subTitle;
        self.titleLabel.text = model.title;
        self.imageView.image = [UIImage imageNamed:model.urlStr];
        
        [self addSubview:self.detailLabel];
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.arrowImageView];
        
        [self resetFrame];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                        image:(UIImage *)image
                       detail:(NSString *)detail {
    if (self = [super initWithFrame:frame]) {
        self.detailLabel.text = detail;
        self.titleLabel.text = title;
        self.imageView.image = image;
        
        [self addSubview:self.detailLabel];
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.arrowImageView];
        
        [self resetFrame];
    }
    return self;
}

- (void)resetFrame {
    
    [self.detailLabel sizeToFit];
    
    CGFloat leftConstarin= 0.0;
//    if ([self.titleLabel.text containsString:@"花粉币"]) {
//        leftConstarin = (self.width-_detailLabel.width)/2;
//    }
//    if ([self.titleLabel.text containsString:@"视频"]) {
//        leftConstarin = (self.width-_detailLabel.width)/2-12;
//    }
//    if ([self.titleLabel.text containsString:@"花语"]) {
//        leftConstarin = (self.width-_detailLabel.width)/2;
//    }
//
//    if ([self.titleLabel.text containsString:@"一元"]) {
//        leftConstarin = (self.width-_detailLabel.width)/2-12;
//    }
    switch (self.model.type) {
        case CenterBtnViewType_Unitary:
            leftConstarin = (self.width-_detailLabel.width)/2-12;
            break;
        case CenterBtnViewType_Point:
            leftConstarin = (self.width-_detailLabel.width)/2;
            break;
        case CenterBtnViewType_Article:
            leftConstarin = (self.width-_detailLabel.width)/2;
            break;
        case CenterBtnViewType_ShortVideo:
            leftConstarin = (self.width-_detailLabel.width)/2-12;
            break;
        default:
            break;
    }
    
    self.detailLabel.frame = CGRectMake(leftConstarin, self.height/2, _detailLabel.width, _detailLabel.height);
    
    UIImage *image = self.imageView.image;
    self.imageView.frame = CGRectMake(self.detailLabel.left, self.height/4-image.size.height/2, image.size.width, image.size.height);
    
    [self.titleLabel sizeToFit];
    self.titleLabel.frame =  CGRectMake(self.imageView.right+5, 0, self.titleLabel.frame.size.width, self.height/2);
    
    self.arrowImageView.frame = CGRectMake(self.titleLabel.right+5, self.arrowImageView.top, self.arrowImageView.width, self.arrowImageView.height);
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectZero;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
        _titleLabel.textColor = GH_COLOR_FROM_RGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2)];
        _detailLabel.textColor = GH_COLOR_FROM_RGB(0x888888);
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
        UIImage *arrowImage = [UIImage imageNamed:@"publish_top_arrow"];
        _arrowImageView.image = arrowImage;
        _arrowImageView.frame = CGRectMake(0, self.height/4-arrowImage.size.height/2, arrowImage.size.width, arrowImage.size.height);
    }
    return _arrowImageView;
}

@end
