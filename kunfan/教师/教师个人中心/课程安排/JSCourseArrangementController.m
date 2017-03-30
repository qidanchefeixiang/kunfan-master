//
//  JSCourseArrangementController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSCourseArrangementController.h"
#import "JZCalendarTableCell.h"
#import "JZStudyDetailCell.h"

#import "JSEditCourseController.h"
@interface JSCourseArrangementController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;


@end

@implementation JSCourseArrangementController

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
//    [self.navigationController.navigationBar setBackgroundImage:[Util createImageWithColor:[UIColor whiteColor]]
//                                                 forBarPosition:UIBarPositionAny
//                                                     barMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[Util createImageWithColor:KFLineColorThree]];
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
    
    [tableView registerClass:[JZCalendarTableCell class] forCellReuseIdentifier:[JZCalendarTableCell identifier]];
    [tableView registerClass:[JZStudyDetailCell class] forCellReuseIdentifier:[JZStudyDetailCell identifier]];
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"课程安排" andDetail:@"本月最新课程安排"];
    
    [self.tableView setTableHeaderView:titleView];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 30;
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
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 30);
    }else if (1 == section) {
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 25);
    }else {
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 10);
    }
    return customView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 340;
    }else{
        return 130;
    }}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 340;
    }else{
        return 130;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section)  {
        
        JZCalendarTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZCalendarTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZCalendarTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZCalendarTableCell identifier]];
        }
        @WeakObj(self);
        cell.calendarClinkBlock = ^(NSDate* date) {
            HBLog(@"%@",date);
            
//            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
//            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//               [selfWeak.tableView reloadData];
//            });
        };

        
        return cell;
    }else{
        JZStudyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZStudyDetailCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZStudyDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZStudyDetailCell identifier]];
        }
        cell.isAddStudy = YES;
        @WeakObj(self);
        cell.pushEditStudyVCBlock = ^() {
            JSEditCourseController *vc = [[JSEditCourseController alloc]init];
            [selfWeak pushVC:vc animated:YES];
        };
        return cell;
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


@end
