//
//  JZStudyDetailCollectionCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/20.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZStudyDetailCollectionCell.h"

@interface JZStudyDetailCollectionCell ()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@property (nonatomic, weak) UILabel *textLabel;
@end
@implementation JZStudyDetailCollectionCell
+ (NSString *)identifier{
    return @"JZStudyDetailCollectionCell";
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    
//    UIImageView *topNewsMoreImage = [[UIImageView alloc] init];
//    [self.contentView addSubview:topNewsMoreImage];
//    topNewsMoreImage.contentMode = UIViewContentModeScaleAspectFill;
//    topNewsMoreImage.layer.cornerRadius = 5;
//    topNewsMoreImage.layer.masksToBounds = YES;
//    [topNewsMoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.left.mas_equalTo(0);
//        make.width.height.mas_equalTo(100);
//    }];
//    topNewsMoreImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
//    
//    UIImageView *gradientImage = [[UIImageView alloc] init];
//    gradientImage.contentMode = UIViewContentModeScaleAspectFill;
//    gradientImage.layer.cornerRadius = 5;
//    gradientImage.layer.masksToBounds = YES;
//    gradientImage.backgroundColor = [UIColor clearColor];
//    //方案1:性能差
//    gradientImage.image = [UIImage imageNamed:@"gradientView"];
//    [topNewsMoreImage addSubview:gradientImage];
//    [gradientImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.right.left.bottom.mas_equalTo(0);
//    }];
    
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
    detailLabel.textColor = KFTextColorOne_h;
    detailLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(0);
        make.top.mas_equalTo(timeLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    detailLabel.text = @"如何最大化成都发挥招聘的作用？";
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.layer.cornerRadius = 14;
    nameLabel.layer.masksToBounds = YES;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.backgroundColor = KFBlueColor;
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = kHBFontEight;
    [self.contentView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(detailLabel.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(28);
    }];
    nameLabel.text = @"初二 二班";
    
    
}
@end
