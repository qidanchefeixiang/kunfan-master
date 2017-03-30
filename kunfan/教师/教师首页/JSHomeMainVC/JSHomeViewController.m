//
//  JSHomeViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSHomeViewController.h"
#import "KFNavigationTabBar.h"

#import "BannerTableViewCell.h"
#import "TopNewsTableViewCell.h"
#import "DailylearningTableCell.h"
#import "RecommendTitleTableCell.h"
#import "RecommendTableCell.h"

#import "NoticeViewController.h"
#import "DailyAttendanceViewController.h"
#import "GasStationListController.h"
#import "HappyBirthdayViewController.h"
#import "VisitViewController.h"
#import "DailylearnDetailController.h"
#import "SearchViewController.h"

#import "JSFunctionBtnsCell.h"
#import "StudentmManagerController.h"
#import "SignupManagerController.h"
#import "JSSendMessageController.h"
#import "JSPushNotifViewController.h"

@interface JSHomeViewController ()<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation JSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    [tableView registerClass:[BannerTableViewCell class] forCellReuseIdentifier:[BannerTableViewCell identifier]];
    [tableView registerClass:[JSFunctionBtnsCell class] forCellReuseIdentifier:[JSFunctionBtnsCell identifier]];
    [tableView registerClass:[TopNewsTableViewCell class] forCellReuseIdentifier:[TopNewsTableViewCell identifier]];
    [tableView registerClass:[DailylearningTableCell class] forCellReuseIdentifier:[DailylearningTableCell identifier]];
    [tableView registerClass:[RecommendTitleTableCell class] forCellReuseIdentifier:[RecommendTitleTableCell identifier]];
    [tableView registerClass:[RecommendTableCell class] forCellReuseIdentifier:[RecommendTableCell identifier]];
    

}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (5 == section) {
        return 10;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 0.01;
    }
    else if (1 == section){
        return 30;
    }
    else if ( 2 == section ){
        return 30;
    }
    else if ( 4 == section){
        return 35;
    }
    else if ( 5 == section){
        return 20;
    }
    else{
        return 45;
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
    }else{
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 30);
    }
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else if(1 == indexPath.section){
        return 210;
    }else if(2 == indexPath.section){
        return 130;
    }else if(3 == indexPath.section){
        return 100;
    }else if(4 == indexPath.section){
        return 28;
    }else if(5 == indexPath.section){
        return 105;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else if(1 == indexPath.section){
        return 210;
    }else if(2 == indexPath.section){
        return 130;
    }else if(3 == indexPath.section){
        return 100;
    }else if(4 == indexPath.section){
        return 28;
    }else if(5 == indexPath.section){
        return 105;
    }else{
        return 0;
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
    } else if (1 == indexPath.section){
        JSFunctionBtnsCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSFunctionBtnsCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JSFunctionBtnsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSFunctionBtnsCell identifier]];
        }
        @WeakObj(self);
        cell.JSHomepageBlock = ^(NSIndexPath* index) {
            if (0 == index.row ) {
                StudentmManagerController *vc = [[StudentmManagerController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }else if (1 == index.row ) {
                JSSendMessageController *vc = [[JSSendMessageController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }
            else if (2 == index.row ) {
                SignupManagerController *vc = [[SignupManagerController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }
            else if (4 == index.row || 5 == index.row) {
                JSPushNotifViewController *vc = [[JSPushNotifViewController alloc]init];
                [selfWeak pushVC:vc animated:YES];
            }
            else {
                return ;
            }
        };
        
        return cell;
    }
    else if (2 == indexPath.section){
        TopNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[TopNewsTableViewCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[TopNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[TopNewsTableViewCell identifier]];
        }
        
        return cell;
    }else if (3 == indexPath.section){
        DailylearningTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[DailylearningTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[DailylearningTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DailylearningTableCell identifier]];
        }
        
        return cell;
    }
   
    else if (4 == indexPath.section){
        RecommendTitleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[RecommendTitleTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[RecommendTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[RecommendTitleTableCell identifier]];
        }
        
        return cell;
    }
    else if (5 == indexPath.section){
        RecommendTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[RecommendTableCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[RecommendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[RecommendTableCell identifier]];
        }
        
        return cell;
    }
    else{
        UITableViewCell *cell = [UITableViewCell new];
        return cell;
        
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DailylearnDetailController *vc = [[DailylearnDetailController alloc]init];
    [self pushVC:vc animated:YES];
    
}




@end
