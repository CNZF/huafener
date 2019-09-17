//
//  MainViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/2.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "MainViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface MainViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *racTest;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * label = [UILabel new];
    label.font = kFontWithSize(20);
    NSLog(@"kPaddingWithSize%f",kPaddingWithSize(900));
    
    [[self.racTest rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    
    
//    CATextLayer *subtitleText = [[CATextLayer alloc] init];
//    [subtitleText setFont:@"Helvetica-Bold"];
//    [subtitleText setFontSize:22];
//    [subtitleText setFrame:CGRectMake(425-15-90, 60, 90, 60)];
//    [subtitleText setString:@"花粉儿"];
//    [subtitleText setAlignmentMode:kCAAlignmentCenter];
//    [subtitleText setForegroundColor:[[UIColor yellowColor] CGColor]];
//
//    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//
//    transformAnima.fromValue = @(0);
//    transformAnima.toValue = @(M_PI);
////    transformAnima.beginTime = AVCoreAnimationBeginTimeAtZero;
//    transformAnima.duration = 2.0f;
//    transformAnima.repeatCount = HUGE_VALF;
//    transformAnima.removedOnCompletion = NO;
//    transformAnima.fillMode = kCAFillModeForwards;
//    [subtitleText addAnimation:transformAnima forKey:nil];
//
//    [self.view.layer addSublayer:subtitleText];
    
}

- (IBAction)handleTap:(UITapGestureRecognizer *)sender {
    
    
}

@end
