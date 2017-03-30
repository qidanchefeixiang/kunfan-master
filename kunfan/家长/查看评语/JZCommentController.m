//
//  JZCommentController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZCommentController.h"

#import "BannerTableViewCell.h"
#import "JZCalendarTableCell.h"
#import "JZStudyDetailCell.h"

#import "JZCommentCell.h"
#import "JZCommentLayout.h"

static const NSInteger kGetDataCountOnce = 20;

@interface JZCommentController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *layouts;
@end

@implementation JZCommentController

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
    [tableView registerClass:[JZCommentCell class] forCellReuseIdentifier:[JZCommentCell identifier]];
    
    
   // @WeakObj(self);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *layouts = [NSMutableArray new];
        
        NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"TestData.json"]];
        NSDictionary *response = [NSObject modelWithJSON:data];
        HBLog(@"%@",[NSObject modelWithJSON:data]);
        
//        for (id item in response.timelineItmes) {
//            T1Tweet *tweet = item;
//            JZCommentLayout *layout = [JZCommentLayout new];
//            layout.forum = tweet;
//            [layouts addObject:layout];
//        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.layouts = layouts;
            HBLog(@"%lu",(unsigned long)self.layouts.count);
            [_tableView reloadData];
        });
    });

}


#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] init];
    customView.backgroundColor = [UIColor clearColor];
    customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 0.01);
    return customView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZCommentLayout *layout = [[JZCommentLayout alloc]init];
    HBLog(@"%f",layout.height);
    return layout.height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZCommentLayout *layout = [[JZCommentLayout alloc]init];
    return layout.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        //banner
        JZCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:[JZCommentCell identifier] forIndexPath:indexPath];
        if (!cell) {
            cell = [[JZCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JZCommentCell identifier]];
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

#pragma mark - Lazy Loading
- (NSMutableArray *)layouts {
    if (!_layouts) {
        _layouts = [NSMutableArray arrayWithCapacity:kGetDataCountOnce];
    }
    
    return _layouts;
}
@end
