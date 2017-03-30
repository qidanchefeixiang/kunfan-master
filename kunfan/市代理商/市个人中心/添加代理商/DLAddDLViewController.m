//
//  DLAddDLViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/25.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DLAddDLViewController.h"
#import "DLAddNameCell.h"
#import "DLAddPhoneCell.h"
#import "DLAddCardCell.h"
#import "DLAddAddressCell.h"
#import "JSAddSexCell.h"
@interface DLAddDLViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation DLAddDLViewController

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
    [tableView registerClass:[DLAddNameCell class] forCellReuseIdentifier:[DLAddNameCell identifier]];
    [tableView registerClass:[DLAddPhoneCell class] forCellReuseIdentifier:[DLAddPhoneCell identifier]];
    [tableView registerClass:[DLAddCardCell class] forCellReuseIdentifier:[DLAddCardCell identifier]];
    [tableView registerClass:[JSAddSexCell class] forCellReuseIdentifier:[JSAddSexCell identifier]];
    [tableView registerClass:[DLAddAddressCell class] forCellReuseIdentifier:[DLAddAddressCell identifier]];
    
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"添加代理" andDetail:@"输入代理商信息"];
    
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
    return 25;
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
 
    return 55;
 
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        DLAddNameCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLAddNameCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[DLAddNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DLAddNameCell identifier]];
        }
        
        return cell;
    }else if (1 == indexPath.row){
        DLAddPhoneCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLAddPhoneCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[DLAddPhoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DLAddPhoneCell identifier]];
        }
        
        return cell;
    }
    else if (2 == indexPath.row){
        DLAddCardCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLAddCardCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[DLAddCardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DLAddCardCell identifier]];
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
        DLAddAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLAddAddressCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[DLAddAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DLAddAddressCell identifier]];
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
