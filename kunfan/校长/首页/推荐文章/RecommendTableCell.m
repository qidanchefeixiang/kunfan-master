//
//  RecommendTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/7.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "RecommendTableCell.h"

@interface RecommendTableCell()
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;
@end

@implementation RecommendTableCell

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
    return @"RecommendTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.clipsToBounds = YES;
    [self.contentView addSubview:mainImage];
    self.mainImage = mainImage;
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = 1;
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFour;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(15);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-20);
    }];
    textLabel.text = @"第89期：如何最大化成都发挥招聘的作用";
    
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.numberOfLines = 2;
    detailLabel.textColor = KFTextColorTwo;
    detailLabel.font = kHBFontSevenLight;
    [self.contentView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(15);
        make.top.mas_equalTo(textLabel.mas_bottom).offset(0);
        make.right.mas_equalTo(-20);
    }];
    detailLabel.text = @"最大化成都发挥招聘的作用最大化成都发挥招聘的作用最大化都发挥招聘";
    

    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFTextColorThree;
    timelabel.font = kHBFontEightLight;
    [self.contentView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainImage.mas_right).offset(15);
        make.bottom.mas_equalTo(-25);
    }];
    timelabel.text = @"编者：李老师";
    
    
}
@end
