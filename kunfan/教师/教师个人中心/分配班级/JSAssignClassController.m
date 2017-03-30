//
//  JSAssignClassController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/23.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSAssignClassController.h"
#import "JSAssignClassCell.h"
#import "JSAssignClassDetailController.h"

@interface JSAssignClassController ()<UISearchBarDelegate,UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *indexs;         //索引数组

@property (nonatomic, strong) NSMutableArray *titleArray;    //表中内容

@end

@implementation JSAssignClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = [NSMutableArray array];
    _indexs = [NSMutableArray array];
    
    for(char c = 'A'; c <= 'Z'; c++ )
    {
        [_indexs addObject:[NSString stringWithFormat:@"%c",c]];
        [_titleArray addObject:[NSString stringWithFormat:@"%c",c]];
        [_titleArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    
    [self setupSearchBar];
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupSearchBar{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 100, 30)];//allocate titleView
    UIColor *color =  self.navigationController.navigationBar.tintColor;
    [titleView setBackgroundColor:[UIColor clearColor]];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.barStyle = UIBarStyleDefault;
    UIImage* searchBarBg = [Util GetImageWithColor:KFLineColorThree andHeight:30];
    //设置背景图片
    [searchBar setBackgroundImage:searchBarBg];
    //设置背景色
    [searchBar setBackgroundColor:[UIColor clearColor]];
    //设置文本框背景
    [searchBar setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
    searchBar.delegate = self;
    searchBar.placeholder = @"搜索学生";
    searchBar.frame = CGRectMake(0, 0, kScreenWidth - 100, 30);
    searchBar.layer.cornerRadius = 18;
    searchBar.layer.masksToBounds = YES;
    //修改placeholder 文字颜色
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    searchField.textColor = KFTextColorThree;
    [searchField setValue:KFTextColorThree forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:kHBFontSeven forKeyPath:@"_placeholderLabel.font"];
    //修改放大镜
    UIView *searchBgIconView = [[UIView alloc]init];
    searchBgIconView.frame = CGRectMake(0, 0, 20 , 15);
    UIImage *image = [UIImage imageNamed:@"search_Icon"];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:image];
    iconView.frame = CGRectMake(0, 0, image.size.width , image.size.height);
    [searchBgIconView addSubview:iconView];
    searchField.leftView = searchBgIconView;
    [titleView addSubview:searchBar];
    
    self.navigationItem.titleView = titleView;

    
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
    [tableView registerClass:[JSAssignClassCell class] forCellReuseIdentifier:[JSAssignClassCell identifier]];
    
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

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 25;
    }else{
        return 0;
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
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JSAssignClassCell *cell = [tableView dequeueReusableCellWithIdentifier:[JSAssignClassCell identifier] forIndexPath:indexPath];
    if (!cell) {
        cell = [[JSAssignClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[JSAssignClassCell identifier]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    JSAssignClassDetailController *vc = [[JSAssignClassDetailController alloc]init];
    [self pushVC:vc animated:YES];
}


//返回索引数组
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return _indexs;
}

//响应点击索引时的委托方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSInteger count = 0;
    
    for (NSString *character in _indexs) {
        
        if ([[character uppercaseString] hasPrefix:title]) {
            return count;
        }
        
        count++;
    }
    
    return  0;
}

//返回每个索引的内容
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [_indexs objectAtIndex:section];
}

//返回section的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [_indexs count];
}
@end
