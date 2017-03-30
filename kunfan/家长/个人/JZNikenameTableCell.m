//
//  JZNikenameTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/21.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZNikenameTableCell.h"


@interface JZNikenameTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation JZNikenameTableCell

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
    return @"JZNikenameTableCell";
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
    textLabel.text = @"昵称";
    
    UITextField *textField = [[UITextField alloc] init];
    textField.textAlignment = NSTextAlignmentRight;
    textField.textColor = KFTextColorOne_h;
    textField.font = kHBFontFiveBold;
    [self.contentView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(70);
        make.centerY.mas_equalTo(0);
    }];
    textField.placeholder = @"王校长";
    [textField setValue:KFTextColorOne_h forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:kHBFontFiveBold forKeyPath:@"_placeholderLabel.font"];
    [textField isFirstResponder];
    
    
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
