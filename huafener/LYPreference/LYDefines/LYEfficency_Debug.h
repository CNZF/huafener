//
//  LYEfficency_Debug.h
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#ifndef LYEfficency_Debug_h
#define LYEfficency_Debug_h

#endif /* LYEfficency_Debug_h */

#if defined(DEBUG) || defined(RELEASE_LOG)
#import <CocoaLumberjack/CocoaLumberjack.h>
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#define NSLog DDLogVerbose
#else
#define NSLog(...) {}
#endif

#define WS(weakSelf)    __weak __typeof(&*self)weakSelf = self;

//UI
#define GHSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define GHSCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define hpStatusHeight [HPDevice hp_statusBarHeight]
#define hpNavigationHeight [HPDevice hp_navigationBarHeight]
#define hpTopHeight [HPDevice hp_topHeight]
#define hpBottomOffset [HPDevice hp_bottomOffset]
#define hpTopOffset [HPDevice hp_topOffset]


