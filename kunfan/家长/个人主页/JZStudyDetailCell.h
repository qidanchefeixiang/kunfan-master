//
//  JZStudyDetailCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/20.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PushEditStudyVCBlock)(void);

@interface JZStudyDetailCell : UITableViewCell
@property (nonatomic, assign) BOOL  isAddStudy;
@property (nonatomic, copy) PushEditStudyVCBlock pushEditStudyVCBlock;

+ (NSString *)identifier;
@end
