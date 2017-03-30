//
//  KFNavigationTabBar.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/18.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "KFNavigationTabBar.h"


//#define DL_ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface KFNavigationTabBar ()

@property (nonatomic, strong) UIView *sliderView;
@property(nonatomic,strong)NSMutableArray<UIButton *> *buttonArray;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,strong)UIButton *selectedButton;

@end

@implementation KFNavigationTabBar


-(instancetype)initWithTitles:(NSArray *)titles
{
    if (self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)]) {
        self.buttonSelectedTileColor = KFBlueColor;
        [self setSubViewWithTitles:titles];
    }
    return self;
}

-(void)setSubViewWithTitles:(NSArray *)titles
{
    self.buttonArray = [[NSMutableArray alloc] init];
    for (int buttonIndex = 0 ; buttonIndex < titles.count; buttonIndex++) {
        NSString *titleString = titles[buttonIndex];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:KFTextColorOne_n forState:UIControlStateNormal];
        [btn setTitleColor:KFTextColorOne_h forState:UIControlStateSelected];
        [btn setTitleColor:KFTextColorOne_h forState:UIControlStateHighlighted | UIControlStateSelected];
        [btn setTitle:titleString forState:UIControlStateNormal];
        btn.titleLabel.font = kHBFontSixBold;
        if(buttonIndex == 0) {btn.selected = YES; self.selectedButton = btn;};
        [btn addTarget:self action:@selector(subButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100 + buttonIndex;
        [self addSubview:btn];
        [self.buttonArray addObject:btn];
    }
    
    self.sliderView = [[UIView alloc] init];
    self.sliderView.backgroundColor = self.buttonSelectedTileColor;
    [self addSubview:self.sliderView];
    self.sliderView.layer.cornerRadius = 2.5;
    self.sliderView.layer.masksToBounds = YES;
    
   
}

-(void)subButtonSelected:(UIButton *)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    [self sliderViewAnimationWithButtonIndex:button.tag - 100];
    if (self.didClickAtIndex) {
        self.didClickAtIndex(button.tag - 100);
    }
}

-(void)scrollToIndex:(NSInteger)index
{
    self.selectedButton.selected = NO;
    self.buttonArray[index].selected = YES;
    self.selectedButton = self.buttonArray[index];
    [self sliderViewAnimationWithButtonIndex:index];
    
}

-(void)sliderViewAnimationWithButtonIndex:(NSInteger)buttonIndex
{
    
    [UIView animateWithDuration:0.8 delay:0.1 usingSpringWithDamping:0.8 initialSpringVelocity:10 options:0 animations:^{
        CGFloat buttonX = self.buttonArray[buttonIndex].center.x - (self.width /2);
        self.sliderView.frame = CGRectMake(buttonX, self.frame.size.height - 2.5f, self.width , 5);
        
    } completion:^(BOOL finished) {
    }];

}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.width =  self.frame.size.width / (self.buttonArray.count * 2);
    self.width = self.width/2;
    CGFloat buttonWidth = self.frame.size.width / self.buttonArray.count;
    for (int buttonIndex = 0; buttonIndex < self.buttonArray.count; buttonIndex ++) {
        self.buttonArray[buttonIndex].frame = CGRectMake(buttonIndex * buttonWidth, 0, buttonWidth, 44);
    }
    CGFloat buttonX = self.buttonArray[0].center.x - self.width / 2;
    self.sliderView.frame = CGRectMake(buttonX, self.frame.size.height - 2.5f, self.width , 5);
}


@end
