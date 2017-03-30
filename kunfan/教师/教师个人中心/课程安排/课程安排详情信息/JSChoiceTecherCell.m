//
//  JSChoiceTecherCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSChoiceTecherCell.h"

@interface JSChoiceTecherCell()

@end

@implementation JSChoiceTecherCell

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
    return @"JSChoiceTecherCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFive;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    textLabel.text = @"选择教师";
    
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
    [femaleBtn setTitle:@"王财力" forState:UIControlStateNormal];
    [femaleBtn setTitleColor:KFTextColorThree forState:UIControlStateNormal];
    [femaleBtn setTitleColor:KFTextColorThree forState:UIControlStateHighlighted];
    femaleBtn.titleLabel.font = kHBFontFive;
    [femaleBtn addTarget:self action:@selector(editBtn)
        forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:femaleBtn];
    [femaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(iconView.mas_left).offset(-20);
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
