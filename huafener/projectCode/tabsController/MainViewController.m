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
//#import <Flutter/Flutter.h>

@interface MainViewController ()<UIGestureRecognizerDelegate>

//@property (nonatomic, strong) FlutterViewController *flutterVC;


@property (weak, nonatomic) IBOutlet UIButton *racTest;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel * label = [UILabel new];
    label.font = kFontWithSize(20);
    NSLog(@"kPaddingWithSize%f",kPaddingWithSize(900));
    @weakify(self)
    [[self.racTest rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
//        @strongify(self)
        
//        [self.navigationController pushViewController:self.flutterVC animated:YES];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (FlutterViewController *)flutterVC{
//    if (!_flutterVC) {
//        _flutterVC = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
//#pragma mark -- 传值
//        _flutterVC.navigationItem.title = @"Demo";
//        [_flutterVC setInitialRoute:@"home"];
//        // 要与main.dart中一致
//        NSString *channelName = @"com.pages.your/native_post";
//
//        FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:_flutterVC];
//        // 代理FlutterStreamHandler
//        [evenChannal setStreamHandler:self];
//
        
#pragma mark -- 界面回调
//        [_flutterVC setInitialRoute:@"MyApp"];
//        NSString *channelName = @"com.pages.your/native_get";
//        FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:_flutterVC];
//        [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//            // call.method 获取 flutter 方法名
//            // call.arguments 获取到 flutter 给到的参数
//            // result 是给flutter的回调， 该回调只能使用一次
//            NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
//            if ([call.method isEqualToString:@"iOSFlutter"]) {
//                //如果隐藏iOS原生方法，需要做f返回处理
//                [self.navigationController popViewControllerAnimated:YES];
//            }
//            // flutter传参给iOS
//            if ([call.method isEqualToString:@"iOSFlutter1"]) {
//                NSDictionary *dic = call.arguments;
//                NSLog(@"arguments = %@", dic);
//            }
//            // iOS给flutter返回值
//            if ([call.method isEqualToString:@"iOSFlutter2"]) {
//                if (result) {
//                    result(@"返回给flutter的内容");
//                }
//            }
//        }];
//    }
//    return _flutterVC;
//}
//
//- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
//    if (events) {
//        events(@"push传值给flutter的vc");
//    }
//    if (arguments) {
//        NSLog(@"arguments :%@",arguments);
//    }
//    return nil;
//}
//
//- (FlutterError *)onCancelWithArguments:(id)arguments{
//    NSLog(@"%@", arguments);
//    return nil;
//}

@end
