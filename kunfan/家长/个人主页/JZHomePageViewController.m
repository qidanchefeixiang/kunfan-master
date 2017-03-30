//
//  JZHomePageViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/18.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZHomePageViewController.h"
#import "KFNavigationTabBar.h"

#import "JZStudyViewController.h"
#import "JZDailylearnController.h"
#import "JZCommentController.h"

#import "JZPersonalController.h"
@interface JZHomePageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property(nonatomic,strong)NSArray<UIViewController *> *subViewControllers;
@property(nonatomic,strong)KFNavigationTabBar *navigationTabBar;
@end

@implementation JZHomePageViewController

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
    backBtn.frame = CGRectMake(0, 0, 25, 25);
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backBtn setImage:[UIImage imageNamed:@"patterns_asana-2.jpg"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"patterns_asana-2.jpg"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(perpleBtn) forControlEvents:UIControlEventTouchUpInside];
    [backBtn.layer setMasksToBounds:YES];
    backBtn.layer.cornerRadius = 25/2;
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
        self.navigationTabBar = [[KFNavigationTabBar alloc] initWithTitles:@[@"查看课程",@"每日一学",@"查看评语"]];
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
        JZStudyViewController *controllerOne = [[JZStudyViewController alloc] init];
        
        JZDailylearnController *controllerTwo = [[JZDailylearnController alloc] init];
        
        JZCommentController *controllerThree = [[JZCommentController alloc] init];
        
        self.subViewControllers = @[controllerOne,controllerTwo,controllerThree];
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
    JZPersonalController *vc = [[JZPersonalController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)noticeBtn{

}




@end
