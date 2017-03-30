//
//  JSEditDailyMarkCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSEditDailyMarkCell.h"

@interface JSEditDailyMarkCell()<UITextViewDelegate>
@property(nonatomic,weak)UILabel *markLabel;
@property(nonatomic,weak)UIView *textBgView;
@end

@implementation JSEditDailyMarkCell

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
    return @"JSEditDailyMarkCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KFLineColorThree;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];

    
    UILabel *markLabel = [[UILabel alloc] init];
    markLabel.textColor = KFTextColorOne_h;
    markLabel.font = kHBFontThreeBold17;
    [self.contentView addSubview:markLabel];
    [markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.mas_equalTo(17);
    }];
    markLabel.text = @"备注";
    self.markLabel = markLabel;
    
    [self setTextFieldLayout];
    
}

- (void)setTextFieldLayout{
    
    UIView *textBgView = [[UIView alloc]init];
    textBgView.backgroundColor = KFLineColorThree;
    textBgView.layer.cornerRadius = 8;
    textBgView.layer.masksToBounds = YES;
    textBgView.layer.borderWidth = 0.5;
    textBgView.layer.borderColor = [KFBlueColor_2 CGColor];
    [self.contentView addSubview:textBgView];
    [textBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.markLabel.mas_bottom).offset(8);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(100);
    }];
    self.textBgView = textBgView;
    
    
    
    UIImageView *mainImage = [[UIImageView alloc] init];
    mainImage.contentMode = UIViewContentModeScaleAspectFill;
    mainImage.layer.cornerRadius = 3;
    mainImage.layer.masksToBounds = YES;
    mainImage.clipsToBounds = YES;
    [textBgView addSubview:mainImage];
    [mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(125/2);
    }];
    mainImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    
    UIImageView *gradientImage = [[UIImageView alloc] init];
    gradientImage.contentMode = UIViewContentModeScaleAspectFill;
    gradientImage.layer.cornerRadius = 5;
    gradientImage.layer.masksToBounds = YES;
    gradientImage.backgroundColor = [UIColor clearColor];
    //方案1:性能差
    gradientImage.image = [UIImage imageNamed:@"gradientView"];
    [textBgView addSubview:gradientImage];
    [gradientImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(125/2);
        make.left.mas_equalTo(8);
        make.centerY.mas_equalTo(0);
    }];
    
    UIImageView *cameraImage = [[UIImageView alloc] init];
    [textBgView addSubview:cameraImage];
    [cameraImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(gradientImage.mas_centerX).offset(0);
        make.centerY.mas_equalTo(gradientImage.mas_centerY).offset(0);
        make.width.mas_equalTo(22);
        make.height.mas_equalTo(19);
    }];
    cameraImage.image = [UIImage imageNamed:@"camera_Icon"];
    
    
    
    UITextView *textField = [[UITextView alloc] init];
    textField.backgroundColor = KFLineColorThree;
    textField.textColor = KFTextColorOne_h;
    textField.font = kHBFontEight;
    textField.text = @"Curabitur lobortis id lorem id bibendum. Ut id consectetur magna. Quisque volutpat augue enim, pulvinar lobortis nibh lacinia at. ";
    [textField setValue:KFBlueColor_2 forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:kHBFontEight forKeyPath:@"_placeholderLabel.font"];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [textBgView addSubview:textField];
    [textField isFirstResponder];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(gradientImage.mas_top).offset(0);
        make.left.mas_equalTo(gradientImage.mas_right).offset(13);
        make.right.mas_equalTo(-8);
        make.height.mas_equalTo(125/2);
    }];
    
    
    UILabel *sizelabel = [[UILabel alloc] init];
    sizelabel.textColor = KFBlueColor_2;
    sizelabel.font = kHBFontNine;
    [textBgView addSubview:sizelabel];
    [sizelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textField.mas_bottom).offset(1);
        make.right.mas_equalTo(-8);
    }];
    sizelabel.text = @"10/30";
    
    [self setTextMusicLayout];
    
}


- (void)setTextMusicLayout{
    UIButton *musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [musicBtn setImage:[UIImage imageNamed:@"record_icon_n"] forState:UIControlStateNormal];
    [musicBtn setImage:[UIImage imageNamed:@"record_icon_h"] forState:UIControlStateHighlighted];
    [musicBtn addTarget:self action:@selector(saveBtn)
       forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:musicBtn];
    [musicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textBgView.mas_bottom).offset(35);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(50);
    }];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.textColor = KFTextColorOne_h;
    namelabel.font = kHBFontSixMedium;
    [self.contentView addSubview:namelabel];
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(musicBtn.mas_top).offset(2);
        make.left.mas_equalTo(musicBtn.mas_right).offset(5);
    }];
    namelabel.text = @"添加语音";
    
    UILabel *detaillabel = [[UILabel alloc] init];
    detaillabel.textColor = KFPhoneColor;
    detaillabel.font = kHBFontEight;
    [self.contentView addSubview:detaillabel];
    [detaillabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(namelabel.mas_bottom).offset(5);
        make.left.mas_equalTo(musicBtn.mas_right).offset(5);
    }];
    detaillabel.text = @"添加并发送语音信息";
    
    UIButton *addMusicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addMusicBtn.backgroundColor = KFBlueColor;
    addMusicBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [addMusicBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addMusicBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addMusicBtn setTitleColor:KFBlueColor_2 forState:UIControlStateHighlighted];
    addMusicBtn.titleLabel.font = kHBFontFourMedium;
    [addMusicBtn addTarget:self action:@selector(saveBtn)
          forControlEvents:UIControlEventTouchUpInside];
    addMusicBtn.layer.cornerRadius = 18;
    [self.contentView addSubview:addMusicBtn];
    [addMusicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(musicBtn.mas_centerY).offset(0);
        make.right.mas_equalTo(-30);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(36);
    }];
    
}

-(void)saveBtn{

}

@end
