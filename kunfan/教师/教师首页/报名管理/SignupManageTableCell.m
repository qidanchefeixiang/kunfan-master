//
//  SignupManageTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "SignupManageTableCell.h"

@interface SignupManageTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation SignupManageTableCell

#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public Method
+ (NSString *)identifier {
    return @"SignupManageTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.mas_equalTo(25/2);
        make.right.mas_equalTo(-50);
    }];
    textLabel.text = @"Anthony Collins";
    
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFPhoneColor;
    timelabel.font = kHBFontEight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textLabel.mas_bottom).offset(13/2);
        make.left.mas_equalTo(22);
    }];
    timelabel.text = @"1869387273";
    
    UILabel *birthdaylabel = [[UILabel alloc] init];
    birthdaylabel.textColor = KFPhoneColor;
    birthdaylabel.font = kHBFontEight;
    [self.contentView addSubview:birthdaylabel];
    [birthdaylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(timelabel.mas_bottom).offset(0);
        make.left.mas_equalTo(22);
    }];
    birthdaylabel.text = @"家长生日：1879年3月12日";
    
    UILabel *classlabel = [[UILabel alloc] init];
    classlabel.textColor = KFPhoneColor;
    classlabel.font = kHBFontSix;
    [self.contentView addSubview:classlabel];
    [classlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(textLabel.mas_centerY).offset(0);
        make.right.mas_equalTo(-20);
    }];
    classlabel.text = @"初中三年级 二班";
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KFLineColorThree;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

@end
