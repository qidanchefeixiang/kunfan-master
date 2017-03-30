//
//  JZStudyDetailCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/20.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZStudyDetailCell.h"
#import "JZStudyDetailCollectionCell.h"
#import "JZAddStudyDetailCollectionCell.h"

@interface JZStudyDetailCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(weak,nonatomic)UICollectionView *collectionView;
@property(weak,nonatomic) UILabel *typeLabel;

@end
@implementation JZStudyDetailCell


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
    return @"JZStudyDetailCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
//    UILabel *typeLabel = [[UILabel alloc] init];
//    typeLabel.textColor = KFTextColorOne_h;
//    typeLabel.font = kHBFontThreeBold;
//    [self.contentView addSubview:typeLabel];
//    self.typeLabel = typeLabel;
//    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(20);
//        make.top.mas_equalTo(0);
//    }];
//    typeLabel.text = @"精选列表";
    
    [self setCollectionView];
}



- (void)setCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 14;
    flowLayout.minimumLineSpacing = 15;
    flowLayout.itemSize = CGSizeMake(kScreenWidth - 100, 130);
    flowLayout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *colleciton = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    colleciton.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _collectionView = colleciton;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[JZStudyDetailCollectionCell class] forCellWithReuseIdentifier:[JZStudyDetailCollectionCell identifier]];
    [_collectionView registerClass:[JZAddStudyDetailCollectionCell class] forCellWithReuseIdentifier:[JZAddStudyDetailCollectionCell identifier]];
    
    [self.contentView addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_isAddStudy) {
        return 4;
    }else{
        return 3;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_isAddStudy) {
        if (0 == indexPath.row) {
            JZAddStudyDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[JZAddStudyDetailCollectionCell identifier] forIndexPath:indexPath];
            
            @WeakObj(self);
            cell.addStudyClinkBlock = ^() {
                if (self.pushEditStudyVCBlock) {
                    self.pushEditStudyVCBlock();
                }

            };

            return cell;
        }else{
            JZStudyDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[JZStudyDetailCollectionCell identifier] forIndexPath:indexPath];
            return cell;
        }
    }else{
        JZStudyDetailCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[JZStudyDetailCollectionCell identifier] forIndexPath:indexPath];
        return cell;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
}



@end
