//
//  LYEfficency_Debug.h
//  GPX_Location
//
//  Created by 赵发 on 2019/9/1.
//  Copyright © 2019 赵发. All rights reserved.
//

#ifndef HPDefineEfficency_h
#define HPDefineEfficency_h

#endif /* HPDefineEfficency_h */

#pragma mark -- LOG

#if defined(DEBUG) || defined(RELEASE_LOG)
#import <CocoaLumberjack/CocoaLumberjack.h>
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#define NSLog DDLogVerbose
#else
#define NSLog(...) {}
#endif


#define WS(weakSelf)         __weak __typeof(&*self)weakSelf = self;

#pragma mark -- Frame

#define GHSCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
#define GHSCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height

#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height
#define kScreenSize         [UIScreen mainScreen].bounds.size

#define kStatusH            ((kScreenHeight > 736.0f) ? 44.0f : 20.0f)
#define kNavigationBarH     44.0f
#define kNavigationH        (kStatusH + kNavigationBarH)
#define kBottomBarH         ((kScreenHeight > 736.0f) ? 34.0f : 0.0f)

#pragma mark -- Adapter

#define kDeviceScaleFactor   (kScreenWidth / 375.0f)
#define kPaddingWithSize(size)   ceil((size / 2) * kDeviceScaleFactor)
#define kFontWithSize(size)  [UIFont systemFontOfSize:size*kDeviceScaleFactor]

