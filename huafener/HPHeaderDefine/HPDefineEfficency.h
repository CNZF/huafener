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
#define kFontWithSize(size)  [UIFont systemFontOfSize:size*kDeviceScaleFactor/2]

#pragma mark -- singleton

#define HPKeyWindow          [UIApplication sharedApplication].keyWindow

//number
//int型转换字符串
#define GH_INT_STRING(int_type) [NSString stringWithFormat:@"%d",int_type]

//float型转换字符串
#define GH_FLOAT_STRING(float_type) [NSString stringWithFormat:@"%f",float_type]

// 判断设备类型
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH > 736.0)

//System version utils
#define GH_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define GH_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define GH_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define GH_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define GH_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//连接单例的字符串和参数
#define GH_SINGLETON_NAME(name) + (instancetype)shared##name;

#define GH_SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = ［self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\

#if __has_feature(objc_arc) // ARC

#define GH_SYNTHESIZE_SINGLETON_FOR_CLASS_M(name) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
});\
return _instance; \
} \
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}

#else // 非ARC

#define GH_SYNTHESIZE_SINGLETON_FOR_CLASS_M(name) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (oneway void)release \
{ \
\
} \
\
- (id)autorelease \
{ \
return _instance; \
} \
\
- (id)retain \
{ \
return _instance; \
} \
\
- (NSUInteger)retainCount \
{ \
return 1; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}

#define HPNSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);  //避免xcode打印不全

#endif
