//
//  AddClassViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "AddClassViewController.h"

@interface AddClassViewController ()<UITextFieldDelegate>

@end

@implementation AddClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self addHeaderView];
    [self setTextFieldLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupNavigationBar{
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 4;
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navBack_Btn_x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(exit)];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,leftBarButton, nil];
    

    UIButton *cleanNoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanNoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [cleanNoticeBtn setTitle:@"保存" forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor_1 forState:UIControlStateHighlighted];
    cleanNoticeBtn.titleLabel.font = kHBFontFiveBold;
    [cleanNoticeBtn addTarget:self action:@selector(saveBtn)
             forControlEvents:UIControlEventTouchUpInside];
    cleanNoticeBtn.frame = CGRectMake(10, 10, 100, 40);
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:cleanNoticeBtn];
    self.navigationItem.rightBarButtonItem = menuButton;
    

}


- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"添加班级" andDetail:@"添加一个班级的名称"];
    
    [self.view addSubview:titleView];
}

- (void)exit{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)saveBtn{

}

- (void)setTextFieldLayout{
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = KFLineColorThree;
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    textField.textColor = KFTextColorOne_h;
    textField.font = kHBFontFiveBold;
    textField.placeholder = @"初中二年级 三班";
    [textField setValue:KFTextColorOne_h forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:kHBFontFive forKeyPath:@"_placeholderLabel.font"];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    [self.view addSubview:textField];
     [textField isFirstResponder];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(90);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(45);
    }];
    
}


























@end
