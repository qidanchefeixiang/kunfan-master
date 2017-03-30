//
//  JSEditDailyNumberCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSEditDailyNumberCell.h"

@interface JSEditDailyNumberCell()

@end

@implementation JSEditDailyNumberCell

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
    return @"JSEditDailyNumberCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFive;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.centerY.mas_equalTo(0);
    }];
    textLabel.text = @"接待学生人数";
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setImage:[UIImage imageNamed:@"JSDaily_Add_icon_h"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"JSDaily_Add_icon_n"] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(saveBtn)
             forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-30);
        make.width.height.mas_equalTo(25);
    }];

    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorOne_h;
    timelabel.font = kHBFontFive;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(addBtn.mas_left).offset(-15);
    }];
    timelabel.text = @"0+";
    
    UIButton *reduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [reduceBtn setImage:[UIImage imageNamed:@"JSDaily_Record_icon_e"] forState:UIControlStateNormal];
    [reduceBtn setImage:[UIImage imageNamed:@"JSDaily_Record_icon_h"] forState:UIControlStateHighlighted];
    [reduceBtn addTarget:self action:@selector(saveBtn)
     forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:reduceBtn];
    [reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(timelabel.mas_left).offset(-15);
        make.width.height.mas_equalTo(25);
    }];

}

- (void)saveBtn{

}
@end
