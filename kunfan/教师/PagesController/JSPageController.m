//
//  JSPageController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSPageController.h"
#import "KFNavigationTabBar.h"

#import "JSHomeViewController.h"
#import "JSPersonalViewController.h"
#import "NoticeViewController.h"

#import "JSEditDailyController.h"
#import "NoticeViewController.h"
@interface JSPageController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property(nonatomic,strong)NSArray<UIViewController *> *subViewControllers;
@property(nonatomic,strong)KFNavigationTabBar *navigationTabBar;


@end

@implementation JSPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[Util createImageWithColor:[UIColor whiteColor]]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[Util createImageWithColor:KFLineColorThree]];
    
    [self setupNavigationBar];
    [self setNavTitleView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setNavTitleView{
    self.navigationItem.titleView = self.navigationTabBar;
    self.delegate = self;
    self.dataSource = self;
    [self setViewControllers:@[self.subViewControllers.firstObject]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
}

#pragma mark - Private Method
- (void)setupNavigationBar {
    UIBarButtonItem *leftNegativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
    leftNegativeSpacer.width = 30;
    
    // 签到按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 38/2, 37/2);
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backBtn setImage:[UIImage imageNamed:@"navEdit_Btn"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navEdit_Btn"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(perpleBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftBarItem,leftNegativeSpacer, nil];
    
    // 通知按钮
    UIButton *noticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noticeBtn.frame = CGRectMake(0, 0, 33/2, 37/2);
    noticeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [noticeBtn setImage:[UIImage imageNamed:@"notice_Btn"] forState:UIControlStateNormal];
    [noticeBtn setImage:[UIImage imageNamed:@"notice_Btn"] forState:UIControlStateHighlighted];
    [noticeBtn addTarget:self action:@selector(noticeBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:noticeBtn];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightBarItem,leftNegativeSpacer, nil];
    
}

-(KFNavigationTabBar *)navigationTabBar
{
    if (!_navigationTabBar) {
        self.navigationTabBar = [[KFNavigationTabBar alloc] initWithTitles:@[@"教师首页",@"个人中心"]];
        __weak typeof(self) weakSelf = self;
        [self.navigationTabBar setDidClickAtIndex:^(NSInteger index){
            [weakSelf navigationDidSelectedControllerIndex:index];
        }];
    }
    return _navigationTabBar;
}

-(NSArray *)subViewControllers
{
    if (!_subViewControllers) {
        JSHomeViewController *controllerOne = [[JSHomeViewController alloc] init];
        
        JSPersonalViewController *controllerTwo = [[JSPersonalViewController alloc] init];
        
        self.subViewControllers = @[controllerOne,controllerTwo];
    }
    return _subViewControllers;
}


#pragma mark - UIPageViewControllerDelegate
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.subViewControllers indexOfObject:viewController];
    if(index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self.subViewControllers objectAtIndex:index - 1];
    
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.subViewControllers indexOfObject:viewController];
    if(index == NSNotFound || index == self.subViewControllers.count - 1) {
        return nil;
    }
    return [self.subViewControllers objectAtIndex:index + 1];
}

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed {
    UIViewController *viewController = self.viewControllers[0];
    NSUInteger index = [self.subViewControllers indexOfObject:viewController];
    [self.navigationTabBar scrollToIndex:index];
    
}


#pragma mark - PrivateMethod
- (void)navigationDidSelectedControllerIndex:(NSInteger)index {
    [self setViewControllers:@[[self.subViewControllers objectAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)perpleBtn{
    JSEditDailyController *vc = [[JSEditDailyController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)noticeBtn{
    NoticeViewController *vc = [[NoticeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
