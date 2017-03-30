//
//  DLAgentCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/24.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DLAgentCell.h"

@interface DLAgentCell()

@end

@implementation DLAgentCell

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
    return @"DLAgentCell";
    
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.mas_equalTo(13);
        make.right.mas_equalTo(-50);
    }];
    textLabel.text = @"李校长";
    
    UILabel *addresslabel = [[UILabel alloc] init];
    addresslabel.textColor = KFPhoneColor;
    addresslabel.font = kHBFontEight;
    [self.contentView addSubview:addresslabel];
    [addresslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-15);
        make.right.mas_equalTo(-20);
    }];
    addresslabel.text = @"北京市 海淀区 中关村路";
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFPhoneColor;
    timelabel.font = kHBFontEight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.bottom.mas_equalTo(-15);
        make.left.mas_equalTo(22);
    }];
    timelabel.text = @"1869387273";

    
    
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
