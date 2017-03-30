//
//  LoginViewController.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^LoginBlock)(void);
@interface LoginViewController : BaseViewController
@property (nonatomic, copy) LoginBlock loginBlock;
@end
