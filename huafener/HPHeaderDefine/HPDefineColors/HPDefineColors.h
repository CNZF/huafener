//
//  LYColors.h
//  GPX_Location
//
//  Created by 杨俊杰 on 2019/9/1.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#ifndef HPDefineColors_h
#define HPDefineColors_h


#endif /* HPDefineColors_h */

#define GH_COLOR_FROM_RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define GH_COLOR_FROM_RGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define GH_Color_Random [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define HPTEXTCOLOR_333 GH_COLOR_FROM_RGB (0x333333)
#define HPTEXTCOLOR_888 GH_COLOR_FROM_RGB (0x888888)
#define HPTEXTCOLOR_ccc GH_COLOR_FROM_RGB (0xcccccc)
#define HPTEXTCOLOR_f67 GH_COLOR_FROM_RGB (0xff6677)
#define HPTEXTCOLOR_line GH_COLOR_FROM_RGB(0xE2E2E2)
