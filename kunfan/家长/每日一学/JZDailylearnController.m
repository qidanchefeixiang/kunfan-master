//
//  JZDailylearnController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/18.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZDailylearnController.h"
#import "AllPlayerTableCell.h"
#import "PlayerTableCell.h"
#import "RecommendPlayerCell.h"
#import "AllPlayerTitleTableCell.h"

#define NAVBAR_CHANGE_POINT 50
@interface JZDailylearnController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;

@end


@implementation JZDailylearnController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupLayout];
    [self setupToolsView];
}

#pragma mark - Private Method
- (void)setupNavigationBar {
    [self.navigationController.navigationBar setBackgroundImage:[Util createImageWithColor:[UIColor whiteColor]]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[Util createImageWithColor:KFLineColorThree]];
}

- (void)setupToolsView{
    UIView *toolsView = [[UIView alloc]init];
    toolsView.backgroundColor = KFBlueColor;
    toolsView.layer.cornerRadius = 17.5;
    toolsView.layer.masksToBounds = YES;
    [self.view addSubview:toolsView];
    [toolsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(35);
        make.width.mas_equalTo(160);
    }];
    
    CALayer *lineLayer = [CALayer layer];
    lineLayer.backgroundColor = [[UIColor colorWithWhite:0.90 alpha:0.3] CGColor];
    lineLayer.frame = CGRectMake(79, 7, 2, 21);
    [toolsView.layer addSublayer:lineLayer];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(10, 0, 75, 35);
    [btn1 setImage:[UIImage imageNamed:@"navShare_Btn_h"] forState:UIControlStateNormal];
    [btn1 setTitle:@"分享" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20, 0.0, 0.0)];
    btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    btn1.titleLabel.font = kHBFontEight;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(85, 0, 75, 35);
    [btn setImage:[UIImage imageNamed:@"cellLike_Btn"] forState:UIControlStateNormal];
    [btn setTitle:@"喜欢" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = kHBFontEight;
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.frame.size.width - btn.imageView.frame.origin.x - btn.imageView.frame.size.width, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -(btn.frame.size.width - btn.imageView.frame.size.width )+10, 0, 0);
    [toolsView addSubview:btn1];
    [toolsView addSubview:btn];

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
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 80, 0);
    self.tableView = tableView;
    [tableView registerClass:[AllPlayerTableCell class] forCellReuseIdentifier:[AllPlayerTableCell identifier]];
    [tableView registerClass:[PlayerTableCell class] forCellReuseIdentifier:[PlayerTableCell identifier]];
    [tableView registerClass:[RecommendPlayerCell class] forCellReuseIdentifier:[RecommendPlayerCell identifier]];
    [tableView registerClass:[AllPlayerTitleTableCell class] forCellReuseIdentifier:[AllPlayerTitleTableCell identifier]];
    
    
    [self addHeaderView];
}

- (void)addHeaderView{
    BigTitleView *titleView = [[BigTitleView alloc]init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, kBigTitleViewHeight);
    [titleView changTitle2:@"第38期" andDetail:@"正在播放：如何最大化程度发挥招聘"];
    
    [self.tableView setTableHeaderView:titleView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section || 1 == section || 2 == section) {
        return 1;
    }else{
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //    if (0 == section) {
    //        return 35;
    //    }else{
    return 10;
    //    }
    
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
    if (0 == indexPath.section) {
        return 220;
    }else if (1 == indexPath.section){
        return 150;
    }
    else if (2 == indexPath.section){
        return 50;
    }else{
        return 78;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 220;
    }else if (1 == indexPath.section){
        return 150;
    }
    else if (2 == indexPath.section){
        return 50;
    }else{
        return 78;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        PlayerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[PlayerTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[PlayerTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[PlayerTableCell identifier]];
        }
        
        return cell;
    }
    else if (1 == indexPath.section) {
        RecommendPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:[RecommendPlayerCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[RecommendPlayerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[RecommendPlayerCell identifier]];
        }
        
        return cell;
    }
    else if (2 == indexPath.section) {
        AllPlayerTitleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[AllPlayerTitleTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[AllPlayerTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AllPlayerTitleTableCell identifier]];
        }
        
        return cell;
        
    }
    else{
        AllPlayerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[AllPlayerTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[AllPlayerTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[AllPlayerTableCell identifier]];
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

- (void)likeBtn{
    
}

- (void)shareBtn{
    
}


@end
