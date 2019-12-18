//
//  AnimalManager.m
//  huafener
//
//  Created by 杨俊杰 on 2019/12/18.
//  Copyright © 2019 杨俊杰. All rights reserved.
//

#import "HPAnimalManager.h"

@implementation HPAnimalManager

+ (void)hpCABasicAnimationWithAnimalType:(HPAnimaleType)type AndView:(id)view{
    
    switch (type) {
        case CABasicAnimation_Transform_Rotation_x:
            
            break;
        case CABasicAnimation_Transform_Rotation_y:
        
            break;
        case CABasicAnimation_Transform_Rotation_z:
            {
                //z轴旋转180度
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
                //速度控制函数，控制动画运行的节奏
                animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                animation.duration = 0.2;       //执行时间
                animation.repeatCount = 1;      //执行次数
                animation.removedOnCompletion = YES;
                animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
                animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
                [[view layer] addAnimation:animation forKey:nil];
            }
            break;
            
            
        default:
            break;
    }
    
    
}

@end
