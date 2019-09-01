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
