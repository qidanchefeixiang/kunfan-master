//
//  DLAddAddressCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/25.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DLAddAddressCell.h"

@interface DLAddAddressCell()<UITextFieldDelegate>

@end

@implementation DLAddAddressCell

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
    return @"DLAddAddressCell";
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
    textLabel.text = @"地址";
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = KFLineColorThree;
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    textField.textColor = KFTextColorOne_h;
    textField.font = kHBFontFiveBold;
    textField.placeholder = @"地址";
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
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(124);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(35);
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
