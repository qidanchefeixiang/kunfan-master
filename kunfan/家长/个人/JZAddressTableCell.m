//
//  JZAddressTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/21.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZAddressTableCell.h"

@interface JZAddressTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation JZAddressTableCell

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
    return @"JZAddressTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFBlueColor_2;
    textLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    textLabel.text = @"地区";
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"cellMore_Icon"];
    [self.contentView addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(12/2);
        make.height.mas_equalTo(22/2);
    }];
    
    UIButton *addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addressBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [addressBtn setTitle:@"请选择" forState:UIControlStateNormal];
    [addressBtn setTitleColor:KFTextColorOne_h forState:UIControlStateNormal];
    [addressBtn setTitleColor:KFTextColorOne_h forState:UIControlStateHighlighted];
    addressBtn.titleLabel.font = kHBFontFiveBold;
    [addressBtn addTarget:self action:@selector(editBtn)
        forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:addressBtn];
    [addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
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
