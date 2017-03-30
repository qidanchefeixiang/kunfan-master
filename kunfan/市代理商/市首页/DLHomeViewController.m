//
//  DLHomeViewController.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/24.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "DLHomeViewController.h"
#import "BannerTableViewCell.h"
#import "DLSchoolZoneCell.h"
#import "DLAgentCell.h"
@interface DLHomeViewController ()<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property(nullable,nonatomic,strong)UIButton *currentBtn;
@property (strong, nonatomic,nullable) NSArray *buttons;
@property(nullable,nonatomic,strong)UIImageView *iconView;
@property (nonatomic, assign) BOOL isSchool;
@end

@implementation DLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method

- (void)setupLayout {
    
    _isSchool = YES;
    
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
    [tableView registerClass:[DLSchoolZoneCell class] forCellReuseIdentifier:[DLSchoolZoneCell identifier]];
    [tableView registerClass:[DLAgentCell class] forCellReuseIdentifier:[DLAgentCell identifier]];
    
    
}



#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 1;
    }else{
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return 0.01;
    }
    else{
        return 65;
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
        customView.backgroundColor = [UIColor whiteColor];
        customView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, 65);
        NSArray *names = [NSArray arrayWithObjects:@"校区",@"代理商",nil];
       
        
        NSMutableArray *btns=[[NSMutableArray alloc]init];
        
        CGFloat lastX=0;
        for (NSInteger i=0; i<names.count; i++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:names[i] forState:UIControlStateNormal];
            
            NSString *string=names[i];
            
            button.frame=CGRectMake(lastX+13, 15, 60, 25);
            lastX += 13 + 60;
            
            [button setTitleColor:KFTextColorThree forState:UIControlStateNormal];
            [button setTitleColor:KFTextColorOne_h forState:UIControlStateSelected];
            button.titleLabel.font = kHBFontTwoBold;
            [button addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [customView addSubview:button];
            
            [btns addObject:button];
            
            
        }
        self.buttons=btns;
        UIButton *lastBtn=[self.buttons lastObject];
        
        if (_isSchool) {
            self.currentBtn = self.buttons[0];
            self.currentBtn.selected=YES;
        }else{
            self.currentBtn = self.buttons[1];
            self.currentBtn.selected=YES;
        }

        
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.frame = CGRectMake(self.currentBtn.center.x - 12, self.currentBtn.center.y + 20, 24, 6);
        [customView addSubview:iconView];
        iconView.image = [UIImage imageNamed:@"slideLine_Icon"];
        self.iconView = iconView;
        
        if (!_isSchool) {
            UIImageView *moreTimeView = [[UIImageView alloc] init];
            [customView addSubview:moreTimeView];
            moreTimeView.image = [UIImage imageNamed:@"cellMore_Icon"];
            [moreTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-20);
                make.centerY.mas_equalTo(self.currentBtn.mas_centerY).offset(0);
                make.width.mas_equalTo(6);
                make.height.mas_equalTo(11);
            }];
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"本月" forState:UIControlStateNormal];
            [button setTitleColor:KFTextColorThree forState:UIControlStateNormal];
            [button setTitleColor:KFTextColorOne_h forState:UIControlStateHighlighted];
            button.titleLabel.font = kHBFontFive;
            [button addTarget:self action:@selector(changeTimeClick) forControlEvents:UIControlEventTouchUpInside];
            [customView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(moreTimeView.mas_centerY).offset(0);
                make.right.mas_equalTo(moreTimeView.mas_left).offset(-10);
            }];
        
        }
        
        
    }
    return customView;
}

-(void)headerBtnClick:(UIButton *)headerBtn
{
    NSInteger currentPage=[self.buttons indexOfObjectIdenticalTo:headerBtn];
    [self setCurrentheaderbtn:currentPage];
    
    if (self.delegate) {
        [self.delegate pageCurrentBtn:currentPage];
    }
    
}

-(void)setCurrentheaderbtn:(NSInteger)index
{
    
    if (0 == index) {
        _isSchool = YES;
    }else{
        _isSchool = NO;
    }
    
    self.currentBtn.selected=NO;
    self.currentBtn=self.buttons[index];
    self.currentBtn.selected=YES;
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:0 animations:^{
        self.iconView.frame = CGRectMake(self.currentBtn.center.x - 12, self.currentBtn.center.y + 20, 24, 6);
    } completion:^(BOOL finished) {
        [self.tableView reloadData];
    }];
    
}

- (void)changeTimeClick{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择时间"
                                                                             message:@"😄😄😄\n还可以查看更多日期的数据哦"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    //取消:style:UIAlertActionStyleCancel
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    //了解更多:style:UIAlertActionStyleDestructive
    UIAlertAction *moreAction = [UIAlertAction actionWithTitle:@"本月数据" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:moreAction];
    //原来如此:style:UIAlertActionStyleDefault
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"上月数据" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:OKAction];
    UIAlertAction *yearAction = [UIAlertAction actionWithTitle:@"本年数据" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:yearAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else {
        if (_isSchool) {
            return 85;
        }else{
            return 70;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        return 175;
    }else {
        if (_isSchool) {
            return 85;
        }else{
            return 70;
        }
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
    } else {
        if (_isSchool) {
            DLSchoolZoneCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLSchoolZoneCell identifier] forIndexPath:indexPath];
            if (!cell) {
                cell = [[DLSchoolZoneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DLSchoolZoneCell identifier]];
            }        return cell;

        }else{
            DLAgentCell *cell = [tableView dequeueReusableCellWithIdentifier:[DLAgentCell identifier] forIndexPath:indexPath];
            if (!cell) {
                cell = [[DLAgentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[DLAgentCell identifier]];
            }        return cell;

        }

    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

@end
