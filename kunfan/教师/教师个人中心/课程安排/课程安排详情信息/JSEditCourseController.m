//
//  JSEditCourseController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSEditCourseController.h"

#import "JSEditNameCourseCell.h"
#import "JSChoiceClassCell.h"
#import "JSChoiceTecherCell.h"
@interface JSEditCourseController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation JSEditCourseController

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
    [tableView registerClass:[JSEditNameCourseCell class] forCellReuseIdentifier:[JSEditNameCourseCell identifier]];
    [tableView registerClass:[JSChoiceClassCell class] forCellReuseIdentifier:[JSChoiceClassCell identifier]];
    [tableView registerClass:[JSChoiceTecherCell class] forCellReuseIdentifier:[JSChoiceTecherCell identifier]];
    
    
    
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle:@"课程安排" andDetail:@"2017年3月4日课程信息"];
    
    [self.tableView setTableHeaderView:titleView];
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
    if (0 == indexPath.row) {
        return 128;
    }else{
        return 50;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        return 128;
    }else{
        return 50;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        JSEditNameCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSEditNameCourseCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSEditNameCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSEditNameCourseCell identifier]];
        }
    
        return cell;
    }
    else if (1 == indexPath.row) {
        JSChoiceClassCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSChoiceClassCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSChoiceClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSChoiceClassCell identifier]];
        }
        
        return cell;
    }
    
    else{
        JSChoiceTecherCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSChoiceTecherCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSChoiceTecherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSChoiceTecherCell identifier]];
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
