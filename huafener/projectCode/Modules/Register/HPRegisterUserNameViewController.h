//
//  RegisterUserNameViewController.h
//  huafener
//
//  Created by 发小🐰 on 2020/1/8.
//  Copyright © 2020 杨俊杰. All rights reserved.
//

#import "HPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HPRegisterUserNameViewController : HPBaseViewController

@property (nonatomic, strong) NSMutableDictionary *parmasDic;
@property (weak, nonatomic) IBOutlet UITextField *userNameField;

@end

NS_ASSUME_NONNULL_END
