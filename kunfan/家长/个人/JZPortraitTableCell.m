//
//  JZPortraitTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/21.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZPortraitTableCell.h"

@interface JZPortraitTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation JZPortraitTableCell

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
    return @"JZPortraitTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFBlueColor_2;
    textLabel.font = kHBFontFiveBold;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
    }];
    textLabel.text = @"头像";

    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textLabel.mas_centerY).offset(0.5);
        make.left.mas_equalTo(textLabel.mas_right).offset(35/2);
        //make.width.height.mas_equalTo(45);
    }];
    mainImage.image = [UIImage imageNamed:@"portraitEdit_Icon"];
    
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
