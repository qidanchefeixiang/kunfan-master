//
//  JZAddStudyDetailCollectionCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZAddStudyDetailCollectionCell.h"

@interface JZAddStudyDetailCollectionCell ()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@property (nonatomic, weak) UILabel *textLabel;
@end
@implementation JZAddStudyDetailCollectionCell
+ (NSString *)identifier{
    return @"JZAddStudyDetailCollectionCell";
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    
    UIView *timeBgView = [[UIView alloc]init];
    timeBgView.backgroundColor = KFLineColorThree;
    timeBgView.layer.cornerRadius = 10;
    timeBgView.layer.masksToBounds = YES;
    [self.contentView addSubview:timeBgView];
    [timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = KFTextColorThree;
    lineView.layer.cornerRadius = 2;
    lineView.layer.masksToBounds = YES;
    [timeBgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(20);
    }];
    
    
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.textColor = KFTextColorTwo;
    timeLabel.font = kHBFontEightLight;
    [self.contentView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.centerY.mas_equalTo(lineView.mas_centerY).offset(0);
    }];
    timeLabel.text = @"2017年3月4日";
    
    
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.textColor = KFPhoneColor;
    detailLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    detailLabel.text = @"点击添加课程";
   
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addStudy)];
    [detailLabel addGestureRecognizer:labelTapGestureRecognizer];
    detailLabel.userInteractionEnabled = YES;
    
    
}

- (void)addStudy{
    if (self.addStudyClinkBlock) {
        self.addStudyClinkBlock();
    }
}
@end
