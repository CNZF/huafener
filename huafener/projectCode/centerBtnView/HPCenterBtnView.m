//
//  HPCenterBtnView.m
//  GHZeusLibraries
//
//  Created by 张冠华 on 16/4/15.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//

#import "HPCenterBtnView.h"
#import <QuartzCore/CALayer.h>
#import "HPPublishTopButtonView.h"
#import "RFRotate.h"
#import "CenterBtnModel.h"

#define KPublishButtonHeight 65


@interface HPCenterBtnView ()

@property (strong, nonatomic) UIButton *itemButton;//商品
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UILabel *itemDetailLabel;

@property (strong, nonatomic) UIButton  *consignButton;//寄卖
@property (nonatomic, strong) UILabel *consignLabel;
@property (nonatomic, strong) UILabel *consignDetailLabel;

@property (nonatomic, strong) UIButton *liveButton;//直播
@property (nonatomic, strong) UILabel *liveLabel;

@property (nonatomic, strong) UILabel *topCampaignLabel;
@property (nonatomic, strong) NSMutableArray *campaignsBtnArray;
@property (nonatomic, strong) NSArray *campaigns;

@end

@implementation HPCenterBtnView

- (UIButton *)customButtonWithImage:(UIImage *)image andFrame:(CGRect)frame {
    UIButton *camButtonNode = [UIButton buttonWithType:UIButtonTypeCustom];
    camButtonNode.frame = frame;
    [camButtonNode setBackgroundColor:[UIColor clearColor]];
    [camButtonNode.layer setCornerRadius:camButtonNode.frame.size.width/2];
    [camButtonNode setClipsToBounds:YES];
    camButtonNode.contentMode = UIViewContentModeScaleAspectFit;
    [camButtonNode setImage:image forState:UIControlStateNormal];
    return camButtonNode;
}

- (UILabel *)customLabelWithText:(NSString *)text color:(UIColor *)textColor andFrame:(CGRect)frame {
    UILabel *cameraLabel = [[UILabel alloc] initWithFrame:frame];
    cameraLabel.backgroundColor = [UIColor clearColor];
    cameraLabel.textColor = textColor;
    cameraLabel.font = [UIFont systemFontOfSize:14];
    cameraLabel.text = text;
    cameraLabel.textAlignment = NSTextAlignmentCenter;
    cameraLabel.hidden = YES;
    return cameraLabel;
}

- (UILabel *)customDetailLabelWithText:(NSString *)text color:(UIColor *)textColor andFrame:(CGRect)frame {
    UILabel *cameraLabel = [[UILabel alloc] initWithFrame:frame];
    cameraLabel.backgroundColor = [UIColor clearColor];
    cameraLabel.textColor = textColor;
    cameraLabel.font = [UIFont systemFontOfSize:11];
    cameraLabel.text = text;
    cameraLabel.textAlignment = NSTextAlignmentCenter;
    cameraLabel.numberOfLines = 0;
    cameraLabel.hidden = YES;
    return cameraLabel;
}

- (void)setupTopButtons {
//    NSMutableArray *titleArray = [NSMutableArray arrayWithArray:@[[NSString stringWithFormat:@"%@专区",@"花粉币"], @"花语"]];
//    NSMutableArray *detailArray = [NSMutableArray arrayWithArray:@[[NSString stringWithFormat:@"赚%@，兑好礼", @"花粉币"], @"参与话题，分享生活"]];
//    NSMutableArray *imageArray = [NSMutableArray arrayWithArray:@[[UIImage imageNamed:@"public_top_point_copy"], [UIImage imageNamed:@"public_top_article_copy"]]];

    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"centerBtnList" ofType:@"plist"];
    //获取本地文件列表  NSArray
    NSArray *listDatas = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSArray *centerDatas = [CenterBtnModel mj_objectArrayWithKeyValuesArray:listDatas];
    
#warning TODU: 判断类型，根据数据删除数组内模型
//    if ([HPUserBaseInformation kvsModel].grantedOne) {
//        [titleArray insertObject:@"一元店  " atIndex:0];
//        [detailArray insertObject:@"1元商品，爱分享" atIndex:0];
//        [imageArray insertObject:[UIImage imageNamed:@"one_publish"] atIndex:0];
//    }
//
//    if ([HPUserBaseInformation kvsModel].canCreateVlog) {
//        [titleArray addObject:@"短视频  "];
//        [detailArray addObject:@"记录美好生活"];
//        [imageArray addObject:[UIImage imageNamed:@"public_top_articlevideo_copy"]];
//    }
    
    
    CGFloat width = GHSCREEN_WIDTH/2;
    for (int i = 0; i < centerDatas.count; i++) {
        CGRect frame = CGRectMake((i%2)*width, (i/2+1)*60 + (i/2)*20 +hpStatusHeight, width, 55);
//        HPPublishTopButtonView *topView = [[HPPublishTopButtonView alloc] initWithFrame:frame title:titleArray[i] image:imageArray[i] detail:detailArray[i]];
        HPPublishTopButtonView *topView = [[HPPublishTopButtonView alloc] initWithFrame:frame Model:centerDatas[i]];
        topView.userInteractionEnabled = YES;
//        [topView bk_whenTapped:^{
//            NSString *title = titleArray[i];
//            if ([title isEqualToString:@"花粉币专区"]) {
//                [self pushCompaignPublish];
//
//            }
//            if ([title isEqualToString:@"花语"]) {
//                [self pushArticleView];
//            }
//
//            if ([title containsString:@"短视频"]) {
//                [self pushShortVideoView];
//            }
//
//            if ([title containsString:@"一元店"]) {
//                [self pushOneZonePublish];
//            }
//        }];
        [self addSubview:topView];
    }
}

- (instancetype)initWithFrame:(CGRect)frame campaigns:(NSArray *)campaigns {
    if (self = [super initWithFrame:frame]) {
        self.campaignsBtnArray = [NSMutableArray array];
        self.campaigns = campaigns;
        [self setupTopButtons];
        //卖闲置
        _itemButton = [self customButtonWithImage:[UIImage imageNamed:@"centerPublish_good"] andFrame:CGRectMake(GHSCREEN_WIDTH / 2 - KPublishButtonHeight / 2,GHSCREEN_HEIGHT - 70, KPublishButtonHeight, KPublishButtonHeight)];
        [_itemButton addTarget:self action:@selector(puchGoodView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_itemButton];
        
        CGFloat lableWidth = 100.0;
        _itemLabel = [self customLabelWithText:@"个人店铺卖闲置" color:GH_COLOR_FROM_RGB(0xff6677) andFrame:CGRectMake(CGRectGetMinX(_itemButton.frame) + CGRectGetWidth(_itemButton.frame)/2 - lableWidth/2, GHSCREEN_HEIGHT - 139, lableWidth, 20)];
        [self addSubview:_itemLabel];
        _itemDetailLabel = [self customDetailLabelWithText:@"自由发布自主定价\n家中闲置轻松变现" color:GH_COLOR_FROM_RGB(0xff6677) andFrame:CGRectMake(CGRectGetMinX(_itemLabel.frame), CGRectGetMaxY(_itemLabel.frame) + 5, lableWidth, 30)];
        [self addSubview:_itemDetailLabel];
        
        //寄卖
        _consignButton = [self customButtonWithImage:[UIImage imageNamed:@"centerPublish_article"] andFrame:CGRectMake(GHSCREEN_WIDTH / 2 - KPublishButtonHeight / 2,GHSCREEN_HEIGHT - 70, KPublishButtonHeight, KPublishButtonHeight)];
        [_consignButton addTarget:self action:@selector(pushConsignPublish) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_consignButton];
        CGFloat consignWidth = 120.0;
        _consignLabel = [self customLabelWithText:@"HUAFER LAB寄卖" color:GH_COLOR_FROM_RGB(0xff6677)  andFrame:CGRectMake(CGRectGetMinX(_consignButton.frame) + CGRectGetWidth(_consignButton.frame)/2 - consignWidth/2, GHSCREEN_HEIGHT - 139, consignWidth, 20)];
        [self addSubview:_consignLabel];
        _consignDetailLabel = [self customDetailLabelWithText:@"管家一站式服务\n闲置物品秒变现" color:GH_COLOR_FROM_RGB(0xff6677) andFrame:CGRectMake(CGRectGetMinX(_consignLabel.frame), CGRectGetMaxY(_consignLabel.frame) + 5, consignWidth, 30)];
        [self addSubview:_consignDetailLabel];
        
        //直播
        _liveButton = [self customButtonWithImage:[UIImage imageNamed:@"centerPublish_live"] andFrame:CGRectMake(GHSCREEN_WIDTH / 2 - KPublishButtonHeight / 2,GHSCREEN_HEIGHT - 70, KPublishButtonHeight, KPublishButtonHeight)];
        [_liveButton addTarget:self action:@selector(pushLivePublish) forControlEvents:UIControlEventTouchUpInside];
        _liveButton.hidden = YES;
        [self addSubview:_liveButton];
        CGFloat liveWidth = 100.0;
        _liveLabel = [self customLabelWithText:@"直播" color:GH_COLOR_FROM_RGB(0xff6677)  andFrame:CGRectMake(CGRectGetMinX(_liveButton.frame) + CGRectGetWidth(_liveButton.frame)/2 - liveWidth/2, GHSCREEN_HEIGHT - 139, liveWidth, 20)];
        [self addSubview:_liveLabel];
        
        CGFloat margin_x = 0;//最左边和右边距屏幕边界
        CGFloat origin_y = 0;//普通宝贝起始y
//        if (![HPUserBaseInformation kvsModel].canCreateLiveRoom) {
//            //两个
            margin_x = (GHSCREEN_WIDTH-140)/235*70.0f;
            origin_y = hpBottomOffset+235;
//        } else {
//            //三个
//            margin_x = (GHSCREEN_WIDTH-210)/165*45.0f;
//            origin_y = hpBottomOffset+235;
//        }
        
        if (1) {
            [RFRotate rotate:_itemButton withDuration:0.0f andDegrees:90];
            [RFRotate rotate:_itemButton withDuration:0.4 andDegrees:-90];

            [RFRotate rotate:_consignButton withDuration:0.0f andDegrees:-90];
            [RFRotate rotate:_consignButton withDuration:0.4 andDegrees:90];
            [self addCenterButtonWithImage:[UIImage imageNamed:@"centerPublish_cancel"] highlightImage:[UIImage imageNamed:@"centerPublish_cancel"]];
            [UIView animateWithDuration:0.3f animations:^{
                _itemButton.frame = CGRectMake(margin_x,GHSCREEN_HEIGHT - origin_y, KPublishButtonHeight, KPublishButtonHeight);
                _consignButton.frame = CGRectMake(GHSCREEN_WIDTH-KPublishButtonHeight-margin_x, _itemButton.frame.origin.y, KPublishButtonHeight, KPublishButtonHeight);
                _consignLabel.frame = CGRectMake(CGRectGetMinX(_consignButton.frame) + CGRectGetWidth(_consignButton.frame)/2 - consignWidth/2, GHSCREEN_HEIGHT-origin_y+70, consignWidth, 20);
                _itemLabel.frame = CGRectMake(CGRectGetMinX(_itemButton.frame) + CGRectGetWidth(_itemButton.frame)/2 - lableWidth/2, GHSCREEN_HEIGHT -origin_y+70, lableWidth, 20);
                _itemDetailLabel.frame = CGRectMake(CGRectGetMinX(_itemLabel.frame), CGRectGetMaxY(_itemLabel.frame) + 5, lableWidth, 30);
                _consignDetailLabel.frame = CGRectMake(CGRectGetMinX(_consignLabel.frame), CGRectGetMaxY(_consignLabel.frame) + 5, consignWidth, 30);
            } completion:^(BOOL finish){
                [UIView animateWithDuration:0.1 animations:^{
                    _itemButton.frame = CGRectMake(margin_x,GHSCREEN_HEIGHT - origin_y, KPublishButtonHeight, KPublishButtonHeight);
                    _consignButton.frame = CGRectMake(GHSCREEN_WIDTH-KPublishButtonHeight-margin_x , _itemButton.frame.origin.y , KPublishButtonHeight, KPublishButtonHeight);
                    _itemLabel.hidden = NO;
                    _consignLabel.hidden = NO;
                    _itemDetailLabel.hidden = NO;
                    _consignDetailLabel.hidden = NO;
                }];
            }];
        } else {
            _liveButton.hidden = NO;
            _itemLabel.text = @"个人闲置";
            _itemDetailLabel.hidden = YES;
            _consignLabel.text = @"LAB寄卖";
            _consignDetailLabel.hidden = YES;
            
            [RFRotate rotate:_itemButton withDuration:0.0f andDegrees:90];
            [RFRotate rotate:_itemButton withDuration:0.4 andDegrees:-90];

            [RFRotate rotate:_consignButton withDuration:0.0f andDegrees:-90];
            [RFRotate rotate:_consignButton withDuration:0.4 andDegrees:90];
            
            [RFRotate rotate:_liveButton withDuration:0.0f andDegrees:-90];
            [RFRotate rotate:_liveButton withDuration:0.4 andDegrees:90];
            
            [self addCenterButtonWithImage:[UIImage imageNamed:@"centerPublish_cancel"] highlightImage:[UIImage imageNamed:@"centerPublish_cancel"]];
            [UIView animateWithDuration:0.3f animations:^{
                _itemButton.frame = CGRectMake(margin_x,GHSCREEN_HEIGHT - origin_y, KPublishButtonHeight, KPublishButtonHeight);
                _liveButton.frame = CGRectMake(GHSCREEN_WIDTH-KPublishButtonHeight-margin_x, _itemButton.frame.origin.y, KPublishButtonHeight, KPublishButtonHeight);
                _consignButton.frame = CGRectMake(GHSCREEN_WIDTH/2 - KPublishButtonHeight/2, _itemButton.frame.origin.y, KPublishButtonHeight, KPublishButtonHeight);
//
                _consignLabel.frame = CGRectMake(CGRectGetMinX(_consignButton.frame) + CGRectGetWidth(_consignButton.frame)/2 - consignWidth/2, GHSCREEN_HEIGHT-origin_y+70, consignWidth, 20);
                _itemLabel.frame = CGRectMake(CGRectGetMinX(_itemButton.frame) + CGRectGetWidth(_itemButton.frame)/2 - lableWidth/2, GHSCREEN_HEIGHT -origin_y+70, lableWidth, 20);
                _liveLabel.frame = CGRectMake(CGRectGetMinX(_liveButton.frame) + CGRectGetWidth(_liveButton.frame)/2 - liveWidth/2, GHSCREEN_HEIGHT -origin_y+70, liveWidth, 20);
            } completion:^(BOOL finish){
                [UIView animateWithDuration:0.1 animations:^{
                    _itemButton.frame = CGRectMake(margin_x,GHSCREEN_HEIGHT - origin_y, KPublishButtonHeight, KPublishButtonHeight);
                    _liveButton.frame = CGRectMake(GHSCREEN_WIDTH-KPublishButtonHeight-margin_x , _itemButton.frame.origin.y , KPublishButtonHeight, KPublishButtonHeight);
                    _consignButton.frame = CGRectMake(GHSCREEN_WIDTH/2 - KPublishButtonHeight/2, _itemButton.frame.origin.y , KPublishButtonHeight, KPublishButtonHeight);

                    _itemLabel.hidden = NO;
                    _consignLabel.hidden = NO;
                    _liveLabel.hidden = NO;
                }];
            }];
        }
//
//        CGFloat bannerWidth = GHSCREEN_WIDTH - 2 * [HPAPPTheme paddingWithSize:40];
//        CGFloat bannerHeight = [HPAPPTheme paddingWithSize:120];
//        CGFloat spaceTop = [HPAPPTheme paddingWithSize:30];
//        WS(weakSelf);
//        if (campaigns.count > 0 ) {
//            [self addSubview:self.topCampaignLabel];
//            for (NSInteger i = 0; i < campaigns.count; i++) {
////                HPKVSCampaignsModel *campaignsModel = campaigns[i];
//                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//                imageView.layer.masksToBounds = YES;
//                imageView.layer.cornerRadius = 6;
//                imageView.alpha = 0;
//                imageView.tag = i+100;
//                imageView.clipsToBounds = YES;
//                imageView.contentMode = UIViewContentModeScaleAspectFill;
//                imageView.userInteractionEnabled = YES;
//                [imageView bk_whenTapped:^{
//
//                    if (self.touchCompaignBlock) {
//                        self.touchCompaignBlock(campaignsModel);
//                    }
//                }];
        
//                [imageView sd_setImageWithURL:[NSURL URLWithString:campaignsModel.joinBtn.icon]];
//                [self.campaignsBtnArray addObject:imageView];
//                [self addSubview:imageView];
//
//                if (campaigns.count == 1) {
//                    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//                        make.centerY.equalTo(weakSelf.mas_centerY).offset([HPAPPTheme paddingWithSize:36]);
//                        make.left.equalTo(weakSelf).offset([HPAPPTheme paddingWithSize40]);
//                        make.width.equalTo(@(bannerWidth));
//                        make.height.equalTo(@(bannerHeight));
//                    }];
//
//                } else {
//
//                    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//                        make.centerY.equalTo(weakSelf.mas_centerY).offset([HPAPPTheme paddingWithSize:111] - (spaceTop + bannerHeight) * i);
//                        make.left.equalTo(weakSelf).offset([HPAPPTheme paddingWithSize40]);
//                        make.width.equalTo(@(bannerWidth));
//                        make.height.equalTo(@(bannerHeight));
//                    }];
//                }
                
//                if (i == campaigns.count - 1) {
//                    [self.topCampaignLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//                        make.bottom.equalTo(imageView.mas_top).offset(-[HPAPPTheme paddingWithSize:30]);
//                        make.left.equalTo(weakSelf).offset([HPAPPTheme paddingWithSize40]);
//                    }];
//                }
//            }
        }
//
//        [UIView animateWithDuration:0.4 animations:^{
//            for (UIImageView *imageView in self.campaignsBtnArray) {
//                imageView.alpha = 1;
//            }
//        }];
//    }
    return self;
}
    

//- (UILabel *)topCampaignLabel {
//    if (!_topCampaignLabel) {
//        _topCampaignLabel = [[UILabel alloc]initWithFrame:CGRectZero];
//        _topCampaignLabel.textColor = [UIColor whiteColor];
//        _topCampaignLabel.text = @"点击发布活动商品";
//        _topCampaignLabel.font = kFontPingFontWithSize(30);
//    }
//    return _topCampaignLabel;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)puchGoodView {
    if (self.touchGoodBlock) {
        self.touchGoodBlock();
    }
}

- (void)pushArticleView {
    if (self.touchArticleBlock) {
        self.touchArticleBlock();
    }
}

- (void)pushShortVideoView{
    if (self.touchShortVideoBlock) {
        self.touchShortVideoBlock();
    }
}

//一元专区
- (void)pushOneZonePublish {
    if (self.touchOneZoneBlock) {
        self.touchOneZoneBlock();
    }
}

- (void)pushCompaignPublish {

    //一元专区修改为花粉币专区
    if (self.touchPointBlock) {
        self.touchPointBlock();
    }
}

- (void)pushConsignPublish {
    if (self.touchConsignBlock) {
        self.touchConsignBlock();
    }
}

- (void)pushLivePublish {
    if (self.touchLiveBlock) {
        self.touchLiveBlock();
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UIImageView *imageView in self.campaignsBtnArray) {
        if (imageView == [touches anyObject].view) {
            return;
        }
    }
//    if ([[touches anyObject].view isKindOfClass:[HPPublishTopButtonView class]]) {
//        return;
//    }
//    [RFRotate rotate:[self viewWithTag:250] withDuration:0.3 andDegrees:-45];
    _consignLabel.hidden = YES;
    _itemLabel.hidden = YES;
    _liveLabel.hidden = YES;
    _topCampaignLabel.hidden = YES;
    _itemDetailLabel.hidden = YES;
    _consignDetailLabel.hidden = YES;
    [UIView animateWithDuration:0.2f animations:^{
        self->_itemButton.frame = CGRectMake(GHSCREEN_WIDTH / 2,GHSCREEN_HEIGHT - KPublishButtonHeight/2 - 5, 0, 0);
        self->_consignButton.frame = CGRectMake(GHSCREEN_WIDTH / 2,GHSCREEN_HEIGHT - KPublishButtonHeight/2 - 5, 0, 0);
        self->_liveButton.frame = CGRectMake(GHSCREEN_WIDTH / 2,GHSCREEN_HEIGHT - KPublishButtonHeight/2 - 5, 0, 0);

//        [_itemButton.layer setCornerRadius:_consignButton.layoutWidth/2];
//        [_consignButton.layer setCornerRadius:_consignButton.layoutWidth/2];
//        [_liveButton.layer setCornerRadius:_liveButton.layoutWidth/2];
//
//        if (![HPUserBaseInformation kvsModel].canCreateLiveRoom) {
//            [RFRotate rotate:_itemButton withDuration:0.3f andDegrees:90];
//            [RFRotate rotate:_consignButton withDuration:0.3f andDegrees:-90];
//        }else{
//            [RFRotate rotate:_itemButton withDuration:0.3f andDegrees:90];
//            [RFRotate rotate:_consignButton withDuration:0.3f andDegrees:-90];
//            [RFRotate rotate:_liveButton withDuration:0.3f andDegrees:-90];
//        }
    } completion:^(BOOL finish){
        if (self.touchSelfViewBlock) {
            self.touchSelfViewBlock();
        }
    }];

    [UIView animateWithDuration:0.2 animations:^{
        for (UIImageView *imageView in self.campaignsBtnArray) {
            imageView.alpha = 0;
        }
    }];
}

- (void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    CGFloat height = 82;
    button.frame = CGRectMake(GHSCREEN_WIDTH / 2 - height / 2, GHSCREEN_HEIGHT - height - 34, height, height);
    [button addTarget:self action:@selector(cancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 250;
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    [self addSubview:button];
}

- (void)cancelClicked:(UIButton *)button {
//    [RFRotate rotate:button withDuration:0.3 andDegrees:-45];
    _consignLabel.hidden = YES;
    _itemLabel.hidden = YES;
    _liveLabel.hidden = YES;
    _topCampaignLabel.hidden = YES;
    _itemDetailLabel.hidden = YES;
    _consignDetailLabel.hidden = YES;
    [UIView animateWithDuration:0.2f animations:^{
        self->_itemButton.frame = CGRectMake(GHSCREEN_WIDTH / 2,GHSCREEN_HEIGHT - KPublishButtonHeight/2 - 5, 0, 0);
        self->_consignButton.frame = CGRectMake(GHSCREEN_WIDTH / 2,GHSCREEN_HEIGHT - KPublishButtonHeight/2 - 5, 0, 0);
        self->_liveButton.frame = CGRectMake(GHSCREEN_WIDTH / 2,GHSCREEN_HEIGHT - KPublishButtonHeight/2 - 5, 0, 0);
        
//        [_itemButton.layer setCornerRadius:_consignButton.layoutWidth/2];
//        [_consignButton.layer setCornerRadius:_consignButton.layoutWidth/2];
//        [_liveButton.layer setCornerRadius:_liveButton.layoutWidth/2];
//        if (![HPUserBaseInformation kvsModel].canCreateLiveRoom) {
//            [RFRotate rotate:_itemButton withDuration:0.3f andDegrees:90];
//            [RFRotate rotate:_consignButton withDuration:0.3f andDegrees:-90];
//        }else{
//            [RFRotate rotate:_itemButton withDuration:0.3f andDegrees:90];
//            [RFRotate rotate:_consignButton withDuration:0.3f andDegrees:-90];
//            [RFRotate rotate:_liveButton withDuration:0.3f andDegrees:-90];
//        }
    } completion:^(BOOL finish){
        if (self.touchSelfViewBlock) {
            self.touchSelfViewBlock();
        }
    }];
}

- (void)dealloc{
    NSLog(@"HPCenterView释放了");
}

@end
