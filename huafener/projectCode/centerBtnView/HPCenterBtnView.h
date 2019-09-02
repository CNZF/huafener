//
//  HPCenterBtnView.h
//  GHZeusLibraries
//
//  Created by 张冠华 on 16/4/15.
//  Copyright © 2016年 花圃科技（北京）有限公司. All rights reserved.
//


//#import "HPKVSCampaignsModel.h"

typedef void (^ touchGoodBlock)(void);
typedef void (^ touchArticleBlock)(void);
typedef void (^ touchShortVideoBlock)(void);
typedef void (^ touchSelfViewBlock)(void);
typedef void (^ touchOneZoneBlock)(void);
//typedef void (^ touchCompaignBlock)(HPKVSCampaignsModel *campaignsModel);
typedef void (^ touchConsignBlock)(void);
typedef void (^ touchPointBlock)(void);
typedef void (^ touchLiveBlock)(void);

@interface HPCenterBtnView : UIView

@property (copy, nonatomic) touchGoodBlock touchGoodBlock;
@property (copy, nonatomic) touchArticleBlock     touchArticleBlock;
@property (copy, nonatomic) touchSelfViewBlock  touchSelfViewBlock;
//@property (nonatomic, copy) touchCompaignBlock touchCompaignBlock;
@property (nonatomic, copy) touchOneZoneBlock touchOneZoneBlock;
@property (nonatomic, copy) touchConsignBlock touchConsignBlock;
@property (nonatomic, copy) touchPointBlock touchPointBlock;         //发布积分商品
@property (nonatomic, copy) touchLiveBlock touchLiveBlock;           //发布直播
@property (nonatomic, copy) touchShortVideoBlock touchShortVideoBlock;           //短视频

- (instancetype)initWithFrame:(CGRect)frame campaigns:(NSArray *)campaigns;
@end
