//
//  KFNavigationTabBar.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/18.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabBarDidClickAtIndex)(NSInteger buttonIndex);

@interface KFNavigationTabBar : UIView
@property(nonatomic,copy)TabBarDidClickAtIndex didClickAtIndex;
-(instancetype)initWithTitles:(NSArray *)titles;
-(void)scrollToIndex:(NSInteger)index;
@property(nonatomic,strong)UIColor *sliderBackgroundColor;
@property(nonatomic,strong)UIColor *buttonNormalTitleColor;
@property(nonatomic,strong)UIColor *buttonSelectedTileColor;

@end
