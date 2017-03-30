//
//  AddTecherInfoController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "AddTecherInfoController.h"

#import "JSAddHeadPortraitCell.h"
#import "JSAddHeadNameCell.h"
#import "JSAddHeadPhoneCell.h"
#import "JSAddSexCell.h"
#import "JSAddBirthDateCell.h"
@interface AddTecherInfoController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation AddTecherInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupNavigationBar{
    
    UIButton *cleanNoticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanNoticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [cleanNoticeBtn setTitle:@"保存" forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor forState:UIControlStateNormal];
    [cleanNoticeBtn setTitleColor:KFBlueColor_1 forState:UIControlStateHighlighted];
    cleanNoticeBtn.titleLabel.font = kHBFontFiveBold;
    [cleanNoticeBtn addTarget:self action:@selector(addBtn)
             forControlEvents:UIControlEventTouchUpInside];
    cleanNoticeBtn.frame = CGRectMake(10, 10, 100, 40);
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:cleanNoticeBtn];
    self.navigationItem.rightBarButtonItem = menuButton;
}

- (void)addBtn{
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
    [tableView registerClass:[JSAddHeadPortraitCell class] forCellReuseIdentifier:[JSAddHeadPortraitCell identifier]];
    [tableView registerClass:[JSAddHeadNameCell class] forCellReuseIdentifier:[JSAddHeadNameCell identifier]];
    [tableView registerClass:[JSAddHeadPhoneCell class] forCellReuseIdentifier:[JSAddHeadPhoneCell identifier]];
    [tableView registerClass:[JSAddSexCell class] forCellReuseIdentifier:[JSAddSexCell identifier]];
    [tableView registerClass:[JSAddBirthDateCell class] forCellReuseIdentifier:[JSAddBirthDateCell identifier]];
    
    
    
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"添加教师" andDetail:@"共有300位教师"];
    
    [self.tableView setTableHeaderView:titleView];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
    
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
    if (0 == indexPath.row) {
        return 85;
    }else if (1 == indexPath.row){
        return 148/2;
    }else{
        return 85;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        return 85;
    }else if (1 == indexPath.row){
        return 148/2;
    }else{
        return 85;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        JSAddHeadPortraitCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAddHeadPortraitCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSAddHeadPortraitCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAddHeadPortraitCell identifier]];
        }
        
        return cell;
    }else if (1 == indexPath.row){
        JSAddHeadNameCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAddHeadNameCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSAddHeadNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAddHeadNameCell identifier]];
        }
        
        return cell;
    }
    else if (2 == indexPath.row){
        JSAddHeadPhoneCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAddHeadPhoneCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSAddHeadPhoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAddHeadPhoneCell identifier]];
        }
        
        return cell;

    }else if (3 == indexPath.row){
        JSAddSexCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAddSexCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSAddSexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAddSexCell identifier]];
        }
        
        return cell;
    }
    else{
        JSAddBirthDateCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAddBirthDateCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSAddBirthDateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAddBirthDateCell identifier]];
        }
        
        return cell;
    }
    
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
