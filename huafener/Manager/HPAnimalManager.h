//
//  AnimalManager.h
//  huafener
//
//  Created by 杨俊杰 on 2019/12/18.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef  NS_ENUM(NSInteger,HPAnimaleType){
    CABasicAnimation_Transform_Rotation_x = 0,
    CABasicAnimation_Transform_Rotation_y,
    CABasicAnimation_Transform_Rotation_z
};

@interface HPAnimalManager : NSObject

+ (void)hpCABasicAnimationWithAnimalType:(HPAnimaleType)type AndView:(id)view;

@end

NS_ASSUME_NONNULL_END
