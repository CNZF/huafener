//
//  HomeTabViewController.m
//  huafener
//
//  Created by 杨俊杰 on 2019/9/19.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPHomeTabViewController.h"
#import "MainViewController.h"
#import "HPSignInWithAppleController.h"
#import <AFNetworking.h>
#import "HPLoadingHUD.h"

#import "HPHTTPSessionManager.h"
//#import <Aspects.h>

#import "HPHomeTabOperation.h"
#import "HPPublishFirstFSwindleView.h"
#import "TestViewController.h"
#import "Test1ViewController.h"
#import <RTRootNavigationController.h>

FOUNDATION_EXPORT NSString * const AFName;

@interface HPHomeTabViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) AFHTTPSessionManager *manager2;



@end

@implementation HPHomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"XX"];
    
   
    
    
//
//    self.manager = [AFHTTPSessionManager manager];
//    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
////
////    self.manager2 = [AFHTTPSessionManager manager];
////    self.manager2.requestSerializer = [AFHTTPRequestSerializer serializer];
////    self.manager2.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    NSLog(@"%@",[self debugDescription]);
//    [NSObject mj_objectWithKeyValues:@{}];
//    NSLog(@"你大爷的子类调用了");

    
    
   
    
}

- (void)getAllMethods{
    //获取所有方法
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList([self class], &outCount);
    for (int i = 0; i<outCount; i++) {
        //1.获取方法
        Method method = methods[i];
        SEL methodName = method_getName(method);
        NSLog(@"方法名:%@",NSStringFromSelector(methodName));
        
        //2.获取方法里的输入参数
        unsigned int argCount = method_getNumberOfArguments(method);
        char argName[512] = {};
        for (int j = 0; j< argCount; j++) {
            method_getArgumentType(method, j, argName, 512);
            NSLog(@"参数类型:%s",argName);
            memset(argName, '\0', strlen(argName));
        }
       
        //3.获取方法返回值类型
        char retType[512] = {};
        method_getReturnType(method, retType, 512);
        NSLog(@"返回类型值类型:%s",retType);
        
        //4.输出返回类型输入参数混合编码格式: "返回值类型"+基地址偏移+"@"+基地址偏移+":"+基地址偏移+"输入参数1类型"+基地址偏移+"输入参数2类型"+基地址偏移+....
        NSLog(@"返回类型输入参数混合编码:%s",method_getTypeEncoding(method));
    }
    free(methods);
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
   
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    NSLog(@"qqq:%@",[[AFNetworkReachabilityManager sharedManager] localizedNetworkReachabilityStatusString]);
    
    
    
//    [HPLoadingHUD show];
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        SEL sel = @selector(dismiss:);
////
////
//        [self performSelector:sel withObject:nil afterDelay:5];
//        NSLog(@"NSRunLoop : %@",[NSRunLoop currentRunLoop]);
//        [[NSRunLoop currentRunLoop] run];
//        NSLog(@"NSRunLoop : %@",[NSRunLoop currentRunLoop]);
//
//    });
    
//    [self performSelectorInBackground:@selector(dismiss:) withObject:@"周佳华"];
//    [self performSelector:@selector(dismiss:) withObject:@"周小华"];
}

- (void)dismiss:(id)obj{
    NSLog(@"%@",obj);
    NSLog(@"%@",[obj class]);
    NSLog(@"%@",[NSThread currentThread]);
    [HPLoadingHUD dismiss];
}

- (void)loadData{
    
    
    @try {
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    // 也就是说  AFHTTPSessionManager 创建的只是任务，线程需要去自己开辟
//    NSLog(@"方法一 %@",[NSThread currentThread]);
//    [self request];
//    [self request];

    
    WS(weakSelf)
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [weakSelf request];
//        NSLog(@"方法一 %@",[NSThread currentThread]);
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [weakSelf request];
//        NSLog(@"方法二 %@",[NSThread currentThread]);
//    });

//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [weakSelf request2];
//        NSLog(@"方法四 %@",[NSThread currentThread]);
//    });
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSArray *arr = [NSArray array];
    arr[1];
    
//    HPSignInWithAppleController *signWithApple = [[HPSignInWithAppleController alloc] init];
//    [self presentViewController:signWithApple animated:YES completion:nil];
//    [self.navigationController pushViewController:signWithApple animated:YES];
//    [self test];
    
//    UIView * view = [[UIView alloc] initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:view];
    
//    HPPublishFirstFSwindleView * view = [HPPublishFirstFSwindleView new];
//
//    [UIView animateWithDuration:0.3 animations:^{
//        view.alpha = 1.0;
//    }];
//    [self.view addSubview:view];
//    [self test];
//    [self test];
    
    Test1ViewController * test = [[Test1ViewController alloc] init];
    [self.rt_navigationController pushViewController:test animated:YES];
}

- (void)test{
    
    HPBaseRequestOperation *operation = [HPBaseRequestOperation new];
    operation.isAsync = NO;
    operation.requestMapping = HPReqMap_getBrandsGrouped;
    NSURLSessionDataTask * dataTask = [HPHTTPSessionManager loadDataWithOperation:operation successBlock:^(id  _Nonnull responseObject) {
        NSString *code = responseObject[@"code"];
        NSLog(@"%@",code);
        getUserName();
    } failureBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    NSLog(@"dataTask: %@",dataTask);
}

static void* getName(NSString *name){
    return (__bridge void *)(name);
}

extern void getUserName(){
    
}

@end
