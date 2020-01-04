//
//  HPPublishFirstFSwindleView.m
//  GHZeusLibraries
//
//  Created by 杨俊杰 on 2020/1/3.
//  Copyright © 2020 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPPublishFirstFSwindleView.h"

@interface HPPublishFirstFSwindleView()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titlelabel;
@property (nonatomic, strong) UILabel *subTitlelabel;
@property (nonatomic, strong) UIButton *oneBtn;
@property (nonatomic, strong) UIButton *twoBtn;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation HPPublishFirstFSwindleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0,0,kScreenWidth,kScreenHeight);
//        self.alpha = 0.0;
        self.clipsToBounds = YES;
        [self configChildViews];
    }
    return self;
}

- (void)configChildViews{
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = GH_COLOR_FROM_RGB(0x979797);
    blackView.tag = 501;
    [self addSubview:blackView];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
    UIVisualEffectView *blackViewEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
//    blackViewEffectView.frame = CGRectMake(0,0,GHSCREEN_WIDTH,GHSCREEN_HEIGHT);
    //    shareViewEffectView.alpha = 0.7;
    blackViewEffectView.tag = 200;
    [blackView addSubview:blackViewEffectView];
    [blackViewEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(blackView);
    }];
    
    [blackView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kPaddingWithSize(630));
        make.height.equalTo(kPaddingWithSize(746));
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-kPaddingWithSize(50));
    }];
    
    [self.contentView addSubview:self.titlelabel];
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(kPaddingWithSize(30));
    }];
    
    [self.contentView addSubview:self.twoBtn];
    [self.twoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kPaddingWithSize(570));
        make.height.equalTo(kPaddingWithSize(68));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-kPaddingWithSize(40));
        make.centerX.equalTo(self);
    }];
    
    [self.contentView addSubview:self.oneBtn];
    [self.oneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kPaddingWithSize(570));
        make.height.equalTo(kPaddingWithSize(68));
        make.bottom.equalTo(self.twoBtn.mas_top).offset(-kPaddingWithSize(30));
        make.centerX.equalTo(self);
    }];
    
    [self.contentView addSubview:self.subTitlelabel];
    [self.subTitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.oneBtn.mas_top).offset(-kPaddingWithSize(77));
    }];
    
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.bottom.equalTo(self.oneBtn.mas_top).offset(-kPaddingWithSize(40));
    }];
    
    [self addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kPaddingWithSize(54));
        make.height.equalTo(kPaddingWithSize(54));
        make.top.equalTo(self.contentView.mas_bottom).offset(kPaddingWithSize(50));
        make.centerX.equalTo(self);
    }];
    
    [self.contentView bringSubviewToFront:self.titlelabel];
    [self.contentView bringSubviewToFront:self.subTitlelabel];
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView  = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = kPaddingWithSize(10);
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.image = [UIImage imageNamed:@"memberHomeBg"];
    }
    return _imageView;
}

- (UILabel *)titlelabel{
    if (!_titlelabel) {
        _titlelabel = [[UILabel alloc] init];
        _titlelabel.text = @"- 发布商品成功 -";
        _titlelabel.textColor = GH_COLOR_FROM_RGB(0x666666);
        _titlelabel.backgroundColor = [UIColor clearColor];
        _titlelabel.font = kFontWithSize(32);
    }
    return _titlelabel;
}

- (UILabel *)subTitlelabel{
    if (!_subTitlelabel) {
        _subTitlelabel = [[UILabel alloc] init];
        _subTitlelabel.text = @"如何快速交易成功？消化给你支两招！\n只需了解以下两步！看过的老板都说好！";
        _subTitlelabel.textColor = GH_COLOR_FROM_RGB(0x666666);
        _subTitlelabel.numberOfLines = 0;
        _subTitlelabel.textAlignment = NSTextAlignmentCenter;
        _subTitlelabel.backgroundColor = [UIColor clearColor];
        _subTitlelabel.font = kFontWithSize(28);
    }
    return _subTitlelabel;
}

- (UIButton *)oneBtn{
    if (!_oneBtn) {
        _oneBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _oneBtn.adjustsImageWhenHighlighted = NO;
        [_oneBtn setTitle:@"1、防诈骗小课堂" forState:(UIControlStateNormal)];
        [_oneBtn setTitleColor:GH_COLOR_FROM_RGB(0x333333) forState:(UIControlStateNormal)];
        _oneBtn.layer.borderWidth = 1;
        _oneBtn.layer.borderColor = GH_COLOR_FROM_RGB(0x333333).CGColor;
        _oneBtn.layer.cornerRadius = kPaddingWithSize(34);
        _oneBtn.layer.masksToBounds = YES;
    }
    return _oneBtn;
}

- (UIButton *)twoBtn{
    if (!_twoBtn) {
        _twoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _twoBtn.adjustsImageWhenHighlighted = NO;
        [_twoBtn setTitle:@"2、如何快速卖闲置" forState:(UIControlStateNormal)];
        [_twoBtn setTitleColor:GH_COLOR_FROM_RGB(0x333333) forState:(UIControlStateNormal)];
        _twoBtn.layer.borderWidth = 1;
        _twoBtn.layer.borderColor = GH_COLOR_FROM_RGB(0x333333).CGColor;
        _twoBtn.layer.cornerRadius = kPaddingWithSize(34);
        _twoBtn.layer.masksToBounds = YES;
    }
    return _twoBtn;
}

- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _closeBtn.adjustsImageWhenHighlighted = NO;
        _closeBtn.layer.cornerRadius = kPaddingWithSize(27);
        _closeBtn.layer.masksToBounds = YES;
        [_closeBtn setImage:[UIImage imageNamed:@"reduce_close"] forState:(UIControlStateNormal)];
        [_closeBtn addTarget:self action:@selector(qqq) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _closeBtn;
}

- (void)qqq{
    [self removeFromSuperview];
}
@end
