//
//  HPCustomTabbar.m
//  huafener
//
//  Created by 赵发 on 2019/9/18.
//  Copyright © 2019 赵发. All rights reserved.
//

#import "HPCustomTabbar.h"
#import "UITabBarController+LYTabbarSetting.h"

#define tabbarNumbers 3

@implementation HPCustomTabbar

# pragma mark - 添加按钮
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.plusButton];
        [self setTabbarBeheaves];
    }
    return self;
}

- (void)setTabbarBeheaves{
    //单纯的去掉之后视图会穿透
    [self setBackgroundImage:[UIImage new]];
    [self setShadowImage:[UIImage new]];
    //给其设置颜色之后，视图穿透消失
    [self setBackgroundColor:GH_COLOR_FROM_RGB(0xffffff)];
    
    self.translucent = NO;
    
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:GH_COLOR_FROM_RGB(0x333333),NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateNormal];
    
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:GH_COLOR_FROM_RGB(0xff6677),NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica"size:12.0f],NSFontAttributeName,nil]forState:UIControlStateSelected];
    
    //设置阴影
    [self dropShadowWithView:self
                      Offset:CGSizeMake(0, -1)
                      radius:1
                       color:[UIColor blackColor]
                     opacity:0.05];
}

# pragma mark - 重新布局
- (void)layoutSubviews{
    [super layoutSubviews];
    
    UIRectCorner  corner = UIRectCornerTopLeft | UIRectCornerTopRight;
    [_plusButton setBorderWithCornerRadius:30 type:corner];
    // 设置中间按钮的位置
    self.plusButton.center = CGPointMake(CGRectGetWidth(self.frame) * 0.5, 10);
    
    // 设置其他的按钮的位置
    CGFloat w = CGRectGetWidth(self.frame) / tabbarNumbers;
    CGFloat index = 0;
    for (UIView *childView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([childView isKindOfClass:class]) {
            childView.frame = CGRectMake(w * index, CGRectGetMinY(childView.frame), w, CGRectGetHeight(childView.frame));
            index ++;
            if (index == getCenterNumber()) {
                index ++;
            }
        }
    }
}

static inline NSInteger getCenterNumber(){
    return tabbarNumbers/2;
}

# pragma mark - CustomTabBarDelegate
- (void)respondsToPlusButton{
    if ([self.customTabbarCenterBtnDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.customTabbarCenterBtnDelegate tabBarDidClickPlusButton:self.plusButton];
    }
}

# pragma mark - 重写hitTest方法以响应点击超出tabBar的加号按钮
///处理超出区域点击无效的问题
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.hidden){
        return [super hitTest:point withEvent:event];
    }else {
        //转换坐标
        CGPoint tempPoint = [self.plusButton convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.plusButton.bounds, tempPoint)){
            //返回按钮
            return _plusButton;
        }else {
            return [super hitTest:point withEvent:event];
        }
    }
}

- (UIButton *)plusButton{
    if (!_plusButton) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _plusButton.adjustsImageWhenHighlighted = NO;
        
        //图片大小最好为60*60
        [_plusButton setImage:[UIImage imageNamed:@"tabBarCenterBtn"] forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"tabBarCenterBtn"] forState:UIControlStateHighlighted];
        [_plusButton setTitle:@"发布" forState:UIControlStateNormal];
        [_plusButton setTitle:@"发布" forState:UIControlStateHighlighted];
        
        _plusButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_plusButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_plusButton setTitleColor:GH_Color_Random forState:UIControlStateSelected];
        
        UIImage *buttonImg = [_plusButton imageForState:UIControlStateNormal];
        CGFloat titleWidth = [_plusButton.titleLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:13],NSFontAttributeName, nil]].width;
        [_plusButton setTitleEdgeInsets:UIEdgeInsetsMake(buttonImg.size.height, -buttonImg.size.width, 0, 0)];
        [_plusButton setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, 0, -titleWidth)];
        _plusButton.frame = CGRectMake(0, 0, _plusButton.imageView.image.size.width, 80);
        [_plusButton addTarget:self action:@selector(respondsToPlusButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusButton;
}

@end
