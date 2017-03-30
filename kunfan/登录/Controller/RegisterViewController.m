//
//  RegisterViewController.m
//  kunfan
//
//  Created by Shsy on 17/3/28.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#define PhotographTag     10001
#define PhoneTxtTag       10002
#define TestNumTxtTag     10003
#define UserNameTxtTag    10004
#define PasswordTxtTag    10005
#define AreaTxtTag        10006
#define ManBtnTag         10007
#define WomanBtnTag       10008
#define PhotographViewTag 10009
#define TitleImageTag     10010

#import "RegisterViewController.h"
#import "CityPickerView.h"

@interface RegisterViewController()<UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) CityPickerView  *cityPicker;
@property (nonatomic, assign) NSInteger       cityCode;
@property (nonatomic, strong) NSString        *phoneNum;
@property (nonatomic, strong) NSString        *userName;
@property (nonatomic, strong) NSString        *password;
@property (nonatomic, strong) NSString        *address;
@property (nonatomic, strong) NSString        *sex;

@end

@implementation RegisterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionForNotificToRegister) name:@"getCityNameAndCityCode" object:nil];
    
    [self setupLayout];
}

- (void)setupLayout {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(recoverKeyBoard)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:viewTap];
    
    //关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"closeRegister"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(actionForTouchCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_offset(19);
        make.top.mas_offset(33.5);
        make.width.mas_equalTo(15.5);
        make.height.mas_equalTo(15.5);
    }];
    
    //注册 标题头
    UILabel *titleLab = [[UILabel alloc] init];
//    titleLab.backgroundColor = [UIColor yellowColor];
    titleLab.textColor = KFTextColorThree;
    titleLab.text = @"注册";
    titleLab.font = kHBFontTwoBold;
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.view);
        make.top.mas_offset(28.5);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(31.5);
    }];
    
    //头像
    UIImageView *titleImage = [[UIImageView alloc] init];
    titleImage.layer.cornerRadius = 40;
    titleImage.tag = TitleImageTag;
//    setMasksToBounds
    titleImage.layer.masksToBounds = YES;
    [self.view addSubview:titleImage];
    
    [titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(titleLab.mas_bottom).with.offset(29);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
//    UIView *photographView = [[UIView alloc] init];
//    photographView.layer.cornerRadius = 40;
//    photographView.backgroundColor = [UIColor blackColor];
//    photographView.alpha = 0.8f;
//    photographView.tag = PhotographViewTag;
//    
//    [self.view addSubview:photographView];
//    
//    [photographView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.bottom.equalTo(titleImage);
//    }];
//    
    
    //拍照按钮
    UIImageView *photographView = [[UIImageView alloc] init];
    photographView.layer.cornerRadius = 40;
    photographView.tag = PhotographTag;
    photographView.alpha = 0.8f;
    photographView.backgroundColor = [UIColor colorWithRed:(CGFloat)45/255.0 green:(CGFloat)47/255.0 blue:(CGFloat)56/255.0 alpha:0.8f];
    photographView.image = [UIImage imageNamed:@"photograph"];
    photographView.userInteractionEnabled = YES;
    photographView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:photographView];
    
    [photographView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(titleImage);
    }];
    
    UITapGestureRecognizer *photoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionForTouchPhoto)];
    [photographView addGestureRecognizer:photoTap];
    
    //录入信息父View
    UIView *backView = [[UIView alloc] init];
    [self.view addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(titleImage.mas_bottom).with.offset(28.5);
        make.width.mas_equalTo(290.5);
        make.height.mas_equalTo(201.5);
    }];
    
    //电话
    UITextField *phoneTxt = [self setTxtForBackViewWith:backView frontView:backView text:@"手机号" offSet:0];
    phoneTxt.keyboardType = UIKeyboardTypeNumberPad;
    phoneTxt.tag = PhoneTxtTag;
    //验证码 此版本暂时不需要
//    UITextField *testNumTxt = [self setTxtForBackViewWith:backView frontView:phoneTxt text:@"验证码" offSet:51];
    
    //用户名
    UITextField *userNameTxt = [self setTxtForBackViewWith:backView frontView:phoneTxt text:@"用户名" offSet:51];
    userNameTxt.tag = UserNameTxtTag;
    
    //密码
    UITextField *passwordTxt = [self setTxtForBackViewWith:backView frontView:userNameTxt text:@"密码" offSet:51];
    passwordTxt.tag = PasswordTxtTag;
    
    //地区
    UITextField *areaTxt = [self setTxtForBackViewWith:backView frontView:passwordTxt text:@"地区" offSet:51];
    areaTxt.tag = AreaTxtTag;
    UIImageView *arrowImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    arrowImage.contentMode = UIViewContentModeScaleAspectFit;
    areaTxt.rightView = arrowImage;
    areaTxt.rightViewMode = UITextFieldViewModeAlways;
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(20);
    }];
    areaTxt.text = @"请选择";
    areaTxt.textAlignment = NSTextAlignmentRight;
    areaTxt.userInteractionEnabled = YES;
    
    //选择性别
    UILabel *sexLab = [[UILabel alloc] init];
    sexLab.text = @"性别选择:";
    sexLab.textColor = KFBlueColor_2;
    sexLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:sexLab];
    
    [sexLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(72);
        make.top.mas_equalTo(backView.mas_bottom).with.offset(30);
        make.width.mas_equalTo(74.5);
        make.height.mas_equalTo(11.5);
    }];
    
    //男
    UIButton *manBtn = [[UIButton alloc] init];
    [manBtn setImage:[UIImage imageNamed:@"man_unselect"] forState:UIControlStateNormal];
    [manBtn setImage:[UIImage imageNamed:@"man_select"] forState:UIControlStateSelected];
    [manBtn addTarget:self action:@selector(actionForTouchSexBtn:) forControlEvents:UIControlEventTouchUpInside];
    manBtn.tag = ManBtnTag;
    [self.view addSubview:manBtn];
    
    [manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(sexLab.mas_right).with.offset(20);
        make.centerY.equalTo(sexLab);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    //女
    UIButton *womanBtn = [[UIButton alloc] init];
    [womanBtn setImage:[UIImage imageNamed:@"woman_unselect"] forState:UIControlStateNormal];
    [womanBtn setImage:[UIImage imageNamed:@"woman_select"] forState:UIControlStateSelected];
    [womanBtn addTarget:self action:@selector(actionForTouchSexBtn:) forControlEvents:UIControlEventTouchUpInside];
    womanBtn.tag = WomanBtnTag;
    [self.view addSubview:womanBtn];
    
    [womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(manBtn.mas_right).with.offset(45.5);
        make.centerY.equalTo(sexLab);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    //注册按钮
    UIButton *registerBtn = [[UIButton alloc] init];
    [registerBtn setImage:[UIImage imageNamed:@"register"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(actionForTouchRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(manBtn.mas_bottom).with.offset(32.5);
        make.width.mas_equalTo(289);
        make.height.mas_equalTo(40);
    }];
    
    //已有账号？去登陆
    UILabel *loginLab = [[UILabel alloc] init];
    NSMutableAttributedString *goToLogin = [[NSMutableAttributedString alloc] initWithString:@"已有账号？去登陆"];
    [goToLogin addAttribute:NSForegroundColorAttributeName value:KFBlueColor_2 range:NSMakeRange(0, 5)];
    [goToLogin addAttribute:NSForegroundColorAttributeName value:KFBlueColor_1 range:NSMakeRange(5, 3)];
    loginLab.userInteractionEnabled = YES;
    loginLab.attributedText = goToLogin;
    loginLab.font = kHBFontEight;
    [self.view addSubview:loginLab];
    
    [loginLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-22);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(16.5);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionForTouchCloseBtn)];
    [loginLab addGestureRecognizer:tap];
    
    self.cityPicker = [[CityPickerView alloc] initWithDatas:[self getCityDatas]];
    self.cityPicker.hidden = YES;
    [self.view addSubview:self.cityPicker];
    
    [self.cityPicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
}

//输入信息的text基本一致，故抽出text的定义方法
- (UITextField *)setTxtForBackViewWith:(UIView *)backView
                             frontView:(UIView *)frontView
                                  text:(NSString *)textString
                                offSet:(CGFloat)offSetSize {
    
    UITextField *txtFiel = [[UITextField alloc] init];
    txtFiel.layer.borderWidth = 1.0f;
    txtFiel.layer.borderColor = KFLineColorThree.CGColor;
    txtFiel.delegate = self;
    [backView addSubview:txtFiel];
    
    UILabel *leftLab = [[UILabel alloc] init];
    txtFiel.leftView = leftLab;
    txtFiel.leftViewMode = UITextFieldViewModeAlways;
    leftLab.text = textString;
    leftLab.textColor = KFBlueColor_2;
    leftLab.textAlignment = NSTextAlignmentCenter;
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(59.5);
    }];
    
    [txtFiel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backView);
        make.top.equalTo(frontView.mas_top).with.offset(offSetSize);
        make.width.equalTo(backView);
        make.height.mas_equalTo(51);
    }];
    
    return txtFiel;
}

- (void)recoverKeyBoard {
    
    UITextField *phoneTxt = (UITextField *)[self.view viewWithTag:PhoneTxtTag];
    [phoneTxt resignFirstResponder];
    
    UITextField *userTxt = (UITextField *)[self.view viewWithTag:UserNameTxtTag];
    [userTxt resignFirstResponder];
    
    UITextField *passwordTxt = (UITextField *)[self.view viewWithTag:PasswordTxtTag];
    [passwordTxt resignFirstResponder];
}

#pragma mark 获取数据的方法
- (NSMutableArray *)getCityDatas {
    
    NSArray *jsonArray = [[NSArray alloc]init];
    NSData *fileData = [[NSData alloc]init];
    NSUserDefaults *UD = [NSUserDefaults standardUserDefaults];
    if ([UD objectForKey:@"city"] == nil) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"citys" ofType:@"json"];
        fileData = [NSData dataWithContentsOfFile:path];
        
        [UD setObject:fileData forKey:@"city"];
        [UD synchronize];
    }
    else {
        fileData = [UD objectForKey:@"city"];
    }
    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:0];
    NSError *err;
    
    NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *dataStr = [[NSString alloc] initWithData:fileData encoding:enc];

    NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];

    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    jsonArray = [jsonDict objectForKey:@"shenglist"];
    for (NSDictionary *dict in jsonArray) {
        [array addObject:dict];
    }
    
    return array;
}

#pragma mark 按钮||手势方法
//关闭按钮的方法
- (void)actionForTouchCloseBtn {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//选取头像
- (void)actionForTouchPhoto {
    
    UIAlertAction *cameraAlert = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        //    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        //        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //    }
        //sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
        //sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
        //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
        picker.delegate = self;
        picker.allowsEditing = YES;//设置可编辑
        picker.sourceType = sourceType;
        [self presentModalViewController:picker animated:YES];//进入照相界面
//        [picker release];
    }];
    
    UIAlertAction *phoneAlert = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }];
    
    UIAlertAction *cancelAlert = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:cameraAlert];
    [alertController addAction:phoneAlert];
    [alertController addAction:cancelAlert];
    [self presentViewController:alertController animated:YES completion:nil];
}

//性别按钮功能
- (void)actionForTouchSexBtn:(UIButton *)btn {
    
    btn.selected = YES;
    if (btn.tag == ManBtnTag) {
        UIButton *womanBtn = (UIButton *)[self.view viewWithTag:WomanBtnTag];
        womanBtn.selected = NO;
    } else if (btn.tag == WomanBtnTag) {
        UIButton *manBtn = (UIButton *)[self.view viewWithTag:ManBtnTag];
        manBtn.selected = NO;
    }
}

//注册按钮功能
- (void)actionForTouchRegisterBtn {
    //调用注册接口
}

#pragma mark 通知调用方法
- (void)actionForNotificToRegister {
    UITextField *areatxt = (UITextField *)[self.view viewWithTag:AreaTxtTag];
    areatxt.text = self.cityPicker.cityName;
    self.cityCode = self.cityPicker.cityCode;
}

#pragma mark Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.tag == AreaTxtTag) {
        //弹出地区选择器
        self.cityPicker.hidden = NO;
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    if (textField.tag == PhoneTxtTag) {
        self.phoneNum = textField.text;
    } else if (textField.tag == UserNameTxtTag) {
        self.userName = textField.text;
    } else if (textField.tag == PasswordTxtTag) {
        self.password = textField.text;
    }
    
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 销毁控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImageView *titleImage = (UIImageView *)[self.view viewWithTag:TitleImageTag];
    
    // 设置图片
    titleImage.image = info[UIImagePickerControllerOriginalImage];
}

@end
