//
//  JSEditNameCourseCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSEditNameCourseCell.h"


@interface JSEditNameCourseCell()<UITextFieldDelegate>
@property (nonatomic, weak) UIImageView *mainImage;
@property (nonatomic, weak) UIImageView *tagImage;
@property (nonatomic, weak) UIImageView *detailImage;

@end

@implementation JSEditNameCourseCell

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
    return @"JSEditNameCourseCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
//    self.backgroundColor = [UIColor redColor];
    
    UIView *timeBgView = [[UIView alloc]init];
    timeBgView.backgroundColor = KFBlueColor;
    timeBgView.layer.cornerRadius = 10;
    timeBgView.layer.masksToBounds = YES;
    [self.contentView addSubview:timeBgView];
    [timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(190/2);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.text = @"2017年3月4日";
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.font = kHBFontTenLight;
    [timeBgView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];

    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFive;
    [self.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(timeBgView.mas_bottom).offset(18);
    }];
    textLabel.text = @"课程安排";
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = KFLineColorThree;
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    textField.textColor = KFTextColorOne_h;
    textField.font = kHBFontFiveBold;
    textField.placeholder = @"课程名字";
    [textField setValue:KFTextColorThree forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:kHBFontSeven forKeyPath:@"_placeholderLabel.font"];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    [self.contentView addSubview:textField];
    [textField isFirstResponder];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textLabel.mas_bottom).offset(8);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
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


@end
