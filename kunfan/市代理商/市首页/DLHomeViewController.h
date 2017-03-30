//
//  DLHomeViewController.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/24.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "BaseViewController.h"

@protocol pageHeaderBtnDelegate <NSObject>

-(void)pageCurrentBtn:(NSInteger)current;

@end

@interface DLHomeViewController : BaseViewController
@property(nonatomic,weak)id<pageHeaderBtnDelegate>_Nullable delegate;

@end
