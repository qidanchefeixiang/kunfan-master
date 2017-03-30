//
//  JSAssignClassCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSAssignClassCell.h"

@interface JSAssignClassCell()

@end

@implementation JSAssignClassCell

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
    return @"JSAssignClassCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-50);
    }];
    textLabel.text = @"Anthony Collins";
    
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFPhoneColor;
    timelabel.font = kHBFontEight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textLabel.mas_bottom).offset(2);
        make.left.mas_equalTo(22);
    }];
    timelabel.text = @"1869387273";
    
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"cellMore_Icon"];
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(12/2);
        make.height.mas_equalTo(22/2);
    }];
    
    UIButton *femaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    femaleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [femaleBtn setTitle:@"初中三年级 二班" forState:UIControlStateNormal];
    [femaleBtn setTitleColor:KFPhoneColor forState:UIControlStateNormal];
    [femaleBtn setTitleColor:KFPhoneColor forState:UIControlStateHighlighted];
    femaleBtn.titleLabel.font = kHBFontSeven;
    [femaleBtn addTarget:self action:@selector(editBtn)
        forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:femaleBtn];
    [femaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(iconView.mas_left).offset(-10);
        make.centerY.mas_equalTo(0);
    }];

    
    
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


- (void)editBtn{

}
@end
