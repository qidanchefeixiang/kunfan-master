//
//  LoginViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/6.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)setupLayout {
    
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.textColor = KFBlueColor;
    titlelabel.font = kFontMediumWithSize(28);
    [self.view addSubview:titlelabel];
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(118 - 50);
        make.centerX.mas_equalTo(0);
    }];
    titlelabel.text = @"结盟帮";
    
    UILabel *detaillabel = [[UILabel alloc] init];
    detaillabel.textColor = KFPhoneColor;
    detaillabel.font = kHBFontEight;
    [self.view addSubview:detaillabel];
    [detaillabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(titlelabel.mas_bottom).offset(7);
        make.centerX.mas_equalTo(0);
    }];
    detaillabel.text = @"帮你更好的管理学校";
    
    
    UIView *textBgView = [[UIView alloc]init];
    textBgView.layer.cornerRadius = 4;
    textBgView.layer.masksToBounds = YES;
    textBgView.layer.borderWidth = 0.5;
    textBgView.layer.borderColor = [KFTextColorThree CGColor];
    
    [self.view addSubview:textBgView];
    [textBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(43);
        make.right.mas_equalTo(-43);
        make.top.mas_equalTo(detaillabel.mas_bottom).offset(65);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(101);
    }];

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KFTextColorThree;
    [textBgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
    UITextField *phoneField = [[UITextField alloc] init];
    phoneField.textColor = KFTextColorOne_h;
    phoneField.font = kHBFontSeven;
    phoneField.placeholder = @"手机号";
    [phoneField setValue:KFBlueColor_2 forKeyPath:@"_placeholderLabel.textColor"];
    [phoneField setValue:kHBFontSeven forKeyPath:@"_placeholderLabel.font"];
    phoneField.autocorrectionType = UITextAutocorrectionTypeNo;
    phoneField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    phoneField.returnKeyType = UIReturnKeyDone;
    phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    phoneField.delegate = self;
    [textBgView addSubview:phoneField];
    [phoneField isFirstResponder];
    [phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.height.mas_equalTo(45);
    }];

    
    
    UITextField *passwordField = [[UITextField alloc] init];
    passwordField.textColor = KFTextColorOne_h;
    passwordField.font = kHBFontSeven;
    passwordField.placeholder = @"密码";
    [passwordField setValue:KFBlueColor_2 forKeyPath:@"_placeholderLabel.textColor"];
    [passwordField setValue:kHBFontSeven forKeyPath:@"_placeholderLabel.font"];
    passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.returnKeyType = UIReturnKeyDone;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordField.delegate = self;
    [textBgView addSubview:passwordField];
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];

    
    
    
    
    
    
    

    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    loginBtn.backgroundColor = KFBlueColor;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setTitleColor:KFBlueColor_1 forState:UIControlStateHighlighted];
    loginBtn.titleLabel.font = kHBFontSeven;
    [loginBtn addTarget:self action:@selector(loginClick)
             forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.cornerRadius = 20;
    loginBtn.layer.masksToBounds = YES;
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textBgView.mas_bottom).offset(50);
        make.left.mas_equalTo(43);
        make.right.mas_equalTo(-43);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];

    
    UILabel *signuplabel = [[UILabel alloc] init];
    signuplabel.textAlignment = NSTextAlignmentCenter;
    signuplabel.textColor = KFPhoneColor;
    signuplabel.font = kHBFontEight;
    signuplabel.userInteractionEnabled = YES;
    [self.view addSubview:signuplabel];
    [signuplabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-22);
        make.centerX.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
    }];
    signuplabel.text = @"没有账号？ 去注册";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acitonForTouchUpSignup)];
    [signuplabel addGestureRecognizer:tap];
    
}

- (void)acitonForTouchUpSignup {
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:nil];
}

- (void)loginClick{
    if (self.loginBlock) {
        self.loginBlock();
    }

}







@end
