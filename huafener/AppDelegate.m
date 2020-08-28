//
//  AppDelegate.m
//  Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Configs.h"

#import <RTRootNavigationController.h>

#import "HPBaseNavigationController.h"
#import "HPTabbarViewController.h"

#import "UncaughtExceptionHandler.h"
#import "HPHTMLAlertView.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setRootController];
    
    //全局配置
    [AppDelegate configLibPerformance];
    
    
//    InstallUncaughtExceptionHandler();
//    NSSetUncaughtExceptionHandler(&HpUncaughtExceptionHandler);

    int i = 102930000 , j=0;
    
    while (i>0) {
        if (i%10==0) {
            j++;
        }
        i = i/10;
    }
    
    
    NSLog(@"j=%d",j);
    
    return YES;
}


//void HpUncaughtExceptionHandler(NSException *exception) {
//    NSArray *arr = [exception callStackSymbols];
//    NSString *reason = [exception reason];
//    NSString *name = [exception name];
//
//
//    UIAlertView *alert =
//        [[UIAlertView alloc]
//            initWithTitle:NSLocalizedString(@"Unhandled exception", nil)
//            message:[NSString stringWithFormat:NSLocalizedString(
//                @"You can try to continue but the application may be unstable.\n\n"
//                @"Debug details follow:\n%@\n%@", nil),
//                [exception reason],
//                [[exception userInfo] objectForKey:@""]]
//            delegate:nil
//            cancelButtonTitle:NSLocalizedString(@"Quit", nil)
//            otherButtonTitles:NSLocalizedString(@"Continue", nil), nil];
//    [alert show];
//
//    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
//    CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
//
//    while (1)
//    {
//        for (NSString *mode in (__bridge NSArray *)allModes)
//        {
//            CFRunLoopRunInMode((CFStringRef)mode, 0.001, false);
//        }
////        CFRelease(allModes);
////        NSSetUncaughtExceptionHandler(&HandleException);
//    }
    
    
//    NSLog(@"<<<<<<<<<<<%@\n《《《《《《《《《《《%@\n============%@",arr, reason, name);
//}


//设置初始页面
- (void)setRootController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.tabbarController = [[HPTabbarViewController alloc] init];
    HPBaseNavigationController *rt = [[HPBaseNavigationController alloc] initWithRootViewController:self.tabbarController];
    
    self.window.rootViewController = rt;
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
