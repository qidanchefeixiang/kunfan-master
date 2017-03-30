//
//  JSFunctionBtnsCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JSPageHeaderBtnDelegate <NSObject>

-(void)JSPageCurrentBtn:(NSInteger)current;

@end


typedef void(^JSHomepageBlock)(NSIndexPath* _Nullable index);

@interface JSFunctionBtnsCell : UITableViewCell

@property(nonatomic,weak)id<JSPageHeaderBtnDelegate>_Nullable delegate;

@property (nonatomic, copy) JSHomepageBlock _Nullable JSHomepageBlock;
@property(nullable,nonatomic,strong)UIButton *currentBtn;
@property (strong, nonatomic,nullable) NSArray *buttons;
@property(nullable,nonatomic,strong)UILabel *titleLabel;
+ ( NSString * _Nullable )identifier;

@end
