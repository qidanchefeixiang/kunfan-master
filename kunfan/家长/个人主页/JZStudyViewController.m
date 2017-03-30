//
//  JZStudyViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/20.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZStudyViewController.h"
#import "BannerTableViewCell.h"
#import "JZCalendarTableCell.h"
#import "JZStudyDetailCell.h"
#import "JZPersonalController.h"
@interface JZStudyViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation JZStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method
- (void)setupNavigationBar {
    [self.navigationController.navigationBar setBackgroundImage:[Util createImageWithColor:[UIColor whiteColor]]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[Util createImageWithColor:KFLineColorThree]];
}

#pragma mark - Private Method

- (void)setupLayout {
    
    // tableView
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellStyleDefault;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 40, 0);
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    self.tableView = tableView;
    [tableView registerClass:[BannerTableViewCell class] forCellReuseIdentifier:[BannerTableViewCell identifier]];
    [tableView registerClass:[JZCalendarTableCell class] forCellReuseIdentifier:[JZCalendarTableCell identifier]];
    [tableView registerClass:[JZStudyDetailCell class] forCellReuseIdentifier:[JZStudyDetailCell identifier]];
    
    
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 0.01;
    }
    else if (1 == section) {
        return 25;
    }
    else {
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor clearColor];
    if (0 == section) {
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 0.01);
    }else if (1 == section) {
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 25);
    }else {
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 10);
    }
    return customView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else if (1 == indexPath.section) {
        return 340;
    }else{
        return 130;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else if (1 == indexPath.section) {
        return 340;
    }else{
        return 130;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        //banner
        BannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BannerTableViewCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[BannerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[BannerTableViewCell identifier]];
        }
        
        return cell;
    }
    else if (1 == indexPath.section)  {
        
        JZCalendarTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZCalendarTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZCalendarTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZCalendarTableCell identifier]];
        }
        
        return cell;
    }else{
        JZStudyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZStudyDetailCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZStudyDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZStudyDetailCell identifier]];
        }
        
        return cell;

    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    JZPersonalController *vc = [[JZPersonalController alloc]init];
//    [self pushVC:vc animated:YES];

}


@end
