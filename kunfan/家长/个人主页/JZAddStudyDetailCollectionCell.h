//
//  JZAddStudyDetailCollectionCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AddStudyClinkBlock)(void);

@interface JZAddStudyDetailCollectionCell : UICollectionViewCell

@property (nonatomic, copy) AddStudyClinkBlock addStudyClinkBlock;

+ (NSString *)identifier;
@end
