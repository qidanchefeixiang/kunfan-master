//
//  JSAssignClassDetailController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSAssignClassDetailController.h"
#import "JSAssignClassDetailCell.h"

#define NAVBAR_CHANGE_POINT 50

@interface JSAssignClassDetailController ()<UISearchBarDelegate,UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation JSAssignClassDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupLayout];
    
    self.navigationItem.title = @"选择班级";
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor] andFont:kHBFontFiveBold];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = KFTextColorOne_h;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha] andFont:kHBFontFiveBold];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0] andFont:kHBFontFiveBold];
    }
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
        make.bottom.mas_equalTo(0);
    }];
    self.tableView = tableView;
    [tableView registerClass:[JSAssignClassDetailCell class] forCellReuseIdentifier:[JSAssignClassDetailCell identifier]];
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"分配班级" andDetail:@"把学生分配到班级"];
    
    [self.tableView setTableHeaderView:titleView];
}

- (void)noticeBtn{
    
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 85;
    }else{
        return 10;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 85)];
    customView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *userImage = [[UIImageView alloc] init];
    userImage.contentMode = UIViewContentModeScaleAspectFill;
    userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
    userImage.layer.cornerRadius = 20;
    userImage.layer.masksToBounds = YES;
    [customView addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(40);
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];

    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.textColor = KFTextColorOne_h;
    textLabel.font = kHBFontFiveBold;
    [customView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userImage.mas_right).offset(13);
        make.top.mas_equalTo(userImage.mas_top).offset(0);
        make.right.mas_equalTo(-60);
    }];
    textLabel.text = @"Anthony Collins";
    
    
    UILabel *phonelabel = [[UILabel alloc] init];
    phonelabel.textColor = KFPhoneColor;
    phonelabel.font = kHBFontEight;
    [customView addSubview:phonelabel];
    [phonelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userImage.mas_right).offset(13);
        make.bottom.mas_equalTo(userImage.mas_bottom).offset(0);
        make.right.mas_equalTo(-60);
    }];
    phonelabel.text = @"1869387273";

    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.textColor = KFPhoneColor;
    timelabel.font = kHBFontEight;
    [customView addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-20);
    }];
    timelabel.text = @"初中二年级 三班";

    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = KFLineColorThree;
    [customView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //设置 添加好友
    JSAssignClassDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAssignClassDetailCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[JSAssignClassDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAssignClassDetailCell identifier]];
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
