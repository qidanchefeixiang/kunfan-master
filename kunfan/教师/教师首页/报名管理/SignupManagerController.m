//
//  SignupManagerController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "SignupManagerController.h"
#import "SignupManageTableCell.h"

@interface SignupManagerController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;


@end

@implementation SignupManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupLayout];
    
}

#pragma mark - Private Method
- (void)setupNavigationBar {
    
}

#pragma mark - Private Method

- (void)setupLayout {
    // tableView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellStyleDefault;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-49);
    }];
    self.tableView = tableView;
    [tableView registerClass:[SignupManageTableCell class] forCellReuseIdentifier:[SignupManageTableCell identifier]];
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"报名管理" andDetail:@"共有300位学生报名"];
    
    [self.tableView setTableHeaderView:titleView];
}

- (void)noticeBtn{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 25;
    }else{
        return 10;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 25)];
    customView.backgroundColor = [UIColor clearColor];
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 172/2;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 172/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置 添加好友
    SignupManageTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[SignupManageTableCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[SignupManageTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[SignupManageTableCell identifier]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (0 == indexPath.section) {
        return;
    }
    else if (1 == indexPath.section) {
    }
}


@end
