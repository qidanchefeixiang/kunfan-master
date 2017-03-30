//
//  JSPersonalViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSPersonalViewController.h"
#import "PersonalTableCell.h"
#import "JZEditPersonalController.h"
#import "AddClassViewController.h"
#import "AddTecherViewController.h"
#import "JSCourseArrangementController.h"
#import "JSAssignClassController.h"
#import "JSAssignTecherController.h"
#import "JSPushNotifViewController.h"
@interface JSPersonalViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *homeItems;

@end

@implementation JSPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupLayout];
    [self addHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Private Method
- (void)setupNavigationBar {
    
    UIButton *cleanNoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanNoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [cleanNoticeBtn setTitle:@"编辑资料" forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFTextColorThree forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor forState:UIControlStateHighlighted];
    cleanNoticeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [cleanNoticeBtn addTarget:self action:@selector(editBtn)
             forControlEvents:UIControlEventTouchUpInside];
    cleanNoticeBtn.frame = CGRectMake(10, 10, 100, 40);
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:cleanNoticeBtn];
    self.navigationItem.rightBarButtonItem = menuButton;
}

#pragma mark - Private Method

- (void)setupLayout {
    // tableView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellStyleDefault;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    self.tableView = tableView;
    [tableView registerClass:[PersonalTableCell class] forCellReuseIdentifier:[PersonalTableCell identifier]];
//    tableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
}

- (void)addHeaderView{
    
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, kScreenWidth, 380/2);
    
    // 头像
    UIImageView *userImage = [[UIImageView alloc] init];
    //userImage.contentMode = UIViewContentModeScaleAspectFill;
    
    /*方案1:性能差
     userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
     userImage.layer.cornerRadius = 45;
     userImage.layer.masksToBounds = YES;
     */
    
    [headView addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(180/2);
        make.top.mas_equalTo(116/2 - 50);
        make.centerX.mas_equalTo(0);
    }];
    userImage.image =  [self imageWithCornerRadius:45];
    
    
    UILabel *userName = [[UILabel alloc] init];
    userName.textColor = [UIColor colorWithRed:70/255.0 green:76/255.0 blue:86/255.0 alpha:1.0];
    userName.font = [UIFont boldSystemFontOfSize:20];
    [headView addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(userImage.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
    }];
    userName.text = @"王校长";
    
    
    [self.tableView setTableHeaderView:headView];

    
}

- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
    
    CGSize size = CGSizeMake(90.0f, 90.0f);
    
    CGRect rect = (CGRect){0.f, 0.f, size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    UIImageView *userImage = [[UIImageView alloc] init];
    userImage.contentMode = UIViewContentModeScaleAspectFill;
    userImage.clipsToBounds = YES;
    userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    [userImage.image drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 3;
    }
    else{
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section ) {
        return 0.01;
    }else
        return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, self.view.frame.size.width, 45)];
    customView.backgroundColor = [UIColor clearColor];
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置 添加好友
    PersonalTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[PersonalTableCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[PersonalTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[PersonalTableCell identifier]];
    }
    
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            [cell updataCell:@"添加班级" andImage:@""];
        }else if (1 == indexPath.row){
            [cell updataCell:@"添加老师" andImage:@""];
        }else{
            [cell updataCell:@"课程安排" andImage:@""];
        }
        
    }else if(1 == indexPath.section){
        if (0 == indexPath.row) {
            [cell updataCell:@"分配班主任" andImage:@""];
        }else if (1 == indexPath.row){
            [cell updataCell:@"分配班级" andImage:@""];
        }
        
    }else{
        if (0 == indexPath.row) {
            [cell updataCell:@"发布通知" andImage:@""];
        }
        if (1 == indexPath.row) {
            [cell updataCell:@"设置" andImage:@""];
        }

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            AddClassViewController *vc = [[AddClassViewController alloc]init];
            BaseNavigationViewController *nav = [[BaseNavigationViewController alloc]initWithRootViewController:vc];
            [self.navigationController presentViewController:nav animated:YES completion:^{
                
            }];
        }else if(1 == indexPath.row){
            AddTecherViewController *vc = [[AddTecherViewController alloc]init];
            BaseNavigationViewController *nav = [[BaseNavigationViewController alloc]initWithRootViewController:vc];
            [self.navigationController presentViewController:nav animated:YES completion:^{
            }];
        }else if(2 == indexPath.row){
            JSCourseArrangementController *vc = [[JSCourseArrangementController alloc]init];
            [self pushVC:vc animated:YES];
        }
        
    }
    else if (1 == indexPath.section) {
        if (0 == indexPath.row) {
            JSAssignTecherController *vc = [[JSAssignTecherController alloc]init];
            [self pushVC:vc animated:YES];
        }else{
            
            JSAssignClassController *vc = [[JSAssignClassController alloc]init];
            [self pushVC:vc animated:YES];
        }
    }else{
        JSPushNotifViewController *vc = [[JSPushNotifViewController alloc]init];
        [self pushVC:vc animated:YES];
    }
}
#pragma mark - HBHomePagePhotoCellDelegate
- (void)pushAlbumVC{
    //    HBDynamicController *vc = [[HBDynamicController alloc] initWithUserId:userId userInfo:[self getUserInfo]];
    //    vc.selectIndex = 1;
    //    [self pushVC:vc animated:YES];
}

- (void)pushDynamicVC{
    
}

-(void)editBtn{
    JZEditPersonalController *vc = [[JZEditPersonalController alloc]init];
    [self pushVC:vc animated:YES];
}


@end
