//
//  JSFunctionBtnsCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JSFunctionBtnsCell.h"
#import "FunctionCollectionCell.h"

@interface JSFunctionBtnsCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) UIImageView *mainIconImage;
@property (nonatomic, weak) UILabel *typeLabel;
@property (nonatomic, weak) UILabel *typeLabel1;
@property (nonatomic, weak) UIView *lineView;
@property(weak,nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong,nullable) NSArray *datas;

@end
@implementation JSFunctionBtnsCell

#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public Method
+ (NSString *)identifier {
    return @"JSFunctionBtnsCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.datas = [NSArray arrayWithObjects:@"学生管理",@"发表评语",@"报名管理",@"接待学生",@"意见建议",@"请假申请",nil];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"我的管理";
    titleLabel.textColor = KFTextColorOne_h;
    titleLabel.font = kHBFontTwoBold;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(20);
    }];
    
    
    [self setCollectionView];
}

- (void)setCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    flowLayout.itemSize = CGSizeMake(kScreenWidth /4, 80);
    flowLayout.scrollDirection  = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *colleciton = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    colleciton.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _collectionView = colleciton;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[FunctionCollectionCell class] forCellWithReuseIdentifier:[FunctionCollectionCell identifier]];
    [self.contentView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FunctionCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FunctionCollectionCell identifier] forIndexPath:indexPath];
    cell.datas = self.datas;
    cell.indexPath = indexPath;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.JSHomepageBlock) {
        self.JSHomepageBlock(indexPath);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    FunctionCollectionCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell showMaskView];
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    FunctionCollectionCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell hideMaskView];
}

@end
