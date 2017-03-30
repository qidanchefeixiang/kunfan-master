//
//  JSAddSexCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSAddSexCell.h"

@interface JSAddSexCell()<UITextFieldDelegate>
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation JSAddSexCell

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
    return @"JSAddSexCell";
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
    textLabel.text = @"性别";
    
    UIButton *femaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    femaleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [femaleBtn setTitle:@"女" forState:UIControlStateNormal];
    [femaleBtn setTitleColor:KFBlueColor forState:UIControlStateNormal];
    [femaleBtn setTitleColor:KFBlueColor forState:UIControlStateHighlighted];
    femaleBtn.titleLabel.font = kHBFontFiveBold;
    [femaleBtn addTarget:self action:@selector(editBtn)
        forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:femaleBtn];
    [femaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
    }];
    
    
    UIButton *maleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    maleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [maleBtn setTitle:@"男" forState:UIControlStateNormal];
    [maleBtn setTitleColor:KFBlueColor_2 forState:UIControlStateNormal];
    [maleBtn setTitleColor:KFBlueColor_2 forState:UIControlStateHighlighted];
    maleBtn.titleLabel.font = kHBFontFiveBold;
    [maleBtn addTarget:self action:@selector(editBtn)
      forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:maleBtn];
    [maleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(femaleBtn.mas_left).offset(-20);
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
