//
//  JZEditPersonalController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/21.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZEditPersonalController.h"
#import "JZPortraitTableCell.h"
#import "JZNikenameTableCell.h"
#import "JZSexTableCell.h"
#import "JZAddressTableCell.h"
@interface JZEditPersonalController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation JZEditPersonalController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self setupLayout];
    [self setSignoutBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method
- (void)setupNavigationBar {
    
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

- (void)setSignoutBtn{
    UIButton *signoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signoutBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [signoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [signoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    signoutBtn.backgroundColor = KFBlueColor_2;
    signoutBtn.titleLabel.font = kHBFontFive;
    [signoutBtn addTarget:self action:@selector(signoutBtn)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signoutBtn];
    [signoutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-50);
        make.height.mas_equalTo(40);
    }];
    [signoutBtn.layer setMasksToBounds:YES];
    [signoutBtn.layer setCornerRadius:4];

}

- (void)saveBtn{

}

- (void)signoutBtn{

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
    [tableView registerClass:[JZPortraitTableCell class] forCellReuseIdentifier:[JZPortraitTableCell identifier]];
    [tableView registerClass:[JZNikenameTableCell class] forCellReuseIdentifier:[JZNikenameTableCell identifier]];
    [tableView registerClass:[JZSexTableCell class] forCellReuseIdentifier:[JZSexTableCell identifier]];
    [tableView registerClass:[JZAddressTableCell class] forCellReuseIdentifier:[JZAddressTableCell identifier]];
    
    
    
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"编辑个人信息" andDetail:@""];
    
    [self.tableView setTableHeaderView:titleView];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 10;
    }else{
        return 10;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 35)];
    customView.backgroundColor = [UIColor clearColor];
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0==indexPath.row) {
        return 95;
    }else{
        return 60;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0==indexPath.row) {
        return 95;
    }else{
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (0 == indexPath.row) {
        JZPortraitTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZPortraitTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZPortraitTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZPortraitTableCell identifier]];
        }
        
        return cell;

    }
    else if (1 == indexPath.row){
        JZNikenameTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZNikenameTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZNikenameTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZNikenameTableCell identifier]];
        }
        
        return cell;

    
    }else if (2 == indexPath.row){
        JZSexTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZSexTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZSexTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZSexTableCell identifier]];
        }
        
        return cell;
    }
    else{
        JZAddressTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZAddressTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZAddressTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZAddressTableCell identifier]];
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
