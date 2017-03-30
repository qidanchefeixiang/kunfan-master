//
//  PlayerTableCell.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/13.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "PlayerTableCell.h"
@interface PlayerTableCell()
@property (nonatomic, weak) UISlider *slider;


@end
@implementation PlayerTableCell

#pragma mark - Override
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubviews];
        //        self.backgroundColor = [UIColor purpleColor];
        self.hitTestType = LLSHitTestTypeNoClip;
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public Method
+ (NSString *)identifier {
    return @"PlayerTableCell";
}

- (void)createSubviews {
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UIImageView *userImage = [[UIImageView alloc] init];
    userImage.contentMode = UIViewContentModeScaleAspectFill;
    //方案1:性能差
     userImage.image = [UIImage imageNamed:@"patterns_asana-2.jpg"];
     userImage.layer.cornerRadius = 5;
     userImage.layer.masksToBounds = YES;
    [self.contentView addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(180/2);
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
    }];
    
    UIImageView *gradientImage = [[UIImageView alloc] init];
    gradientImage.contentMode = UIViewContentModeScaleAspectFill;
    gradientImage.layer.cornerRadius = 5;
    gradientImage.layer.masksToBounds = YES;
    gradientImage.backgroundColor = [UIColor clearColor];
    //方案1:性能差
    gradientImage.image = [UIImage imageNamed:@"gradientView"];
    [self.contentView addSubview:gradientImage];
    [gradientImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(180/2);
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
    }];

    UILabel *userName = [[UILabel alloc] init];
    userName.textColor = [UIColor whiteColor];
    userName.font = kHBFontNineLight;
    [gradientImage addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-18);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    userName.text = @"王校长";
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.textColor = KFGreenColor;
    timeLabel.font = kHBFontElevenLight;
    [gradientImage addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-7);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    timeLabel.text = @"2017/02/12";
    
    
    // 滑动条slider
    UISlider *slider = [[UISlider alloc] init];
//    slider.backgroundColor = [UIColor redColor];
    slider.minimumValue = 9;// 设置最小值
    slider.maximumValue = 11;// 设置最大值
    slider.value = (slider.minimumValue + slider.maximumValue) / 2;// 设置初始值
    slider.continuous = YES;// 设置可连续变化
    slider.minimumTrackTintColor = KFTextColorOne_h; //滑轮左边颜色，如果设置了左边的图片就不会显示
    slider.maximumTrackTintColor = KFLineColorThree; //滑轮右边颜色，如果设置了右边的图片就不会显示
    slider.thumbTintColor = KFTextColorOne_h;//设置了滑轮的颜色，如果设置了滑轮的样式图片就不会显示
  
    // 通常状态下
    [slider setThumbImage:[UIImage imageNamed:@"slider_icon"] forState:UIControlStateNormal];
    
    // 滑动状态下
    [slider setThumbImage:[UIImage imageNamed:@"slider_icon"] forState:UIControlStateHighlighted];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法
    self.slider = slider;
    [self.contentView addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(-83);
    }];
    
    
    
    
    
    //添加定时器
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Progress:) userInfo:slider repeats:YES];
    
    UILabel *startLabel = [[UILabel alloc] init];
    startLabel.textColor = KFTextColorOne_h;
    startLabel.font = kHBFontEight;
    [self.contentView addSubview:startLabel];
    [startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(slider.mas_centerY).offset(0);
        make.right.mas_equalTo(slider.mas_left).offset(-3);
        make.left.mas_equalTo(20);
    }];
    startLabel.text = @"3:47";
    
    UILabel *endLabel = [[UILabel alloc] init];
    endLabel.textAlignment = NSTextAlignmentRight;
    endLabel.textColor = KFTextColorOne_h;
    endLabel.font = kHBFontEight;
    [self.contentView addSubview:endLabel];
    [endLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(slider.mas_centerY).offset(0);
        make.right.mas_equalTo(-20);
        make.left.mas_equalTo(slider.mas_left).offset(-3);
    }];
    endLabel.text = @"5:47";
    
    
    
    UIButton *thePauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    thePauseBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [thePauseBtn setImage:[UIImage imageNamed:@"thePause_Btn"] forState:UIControlStateNormal];
    [thePauseBtn setImage:[UIImage imageNamed:@"thePause_Btn"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:thePauseBtn];
    [thePauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(slider.mas_bottom).offset(24);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(24);
    }];

    
    UIButton *previousBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    previousBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [previousBtn setImage:[UIImage imageNamed:@"thePrevious_Btn"] forState:UIControlStateNormal];
    [previousBtn setImage:[UIImage imageNamed:@"thePrevious_Btn"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:previousBtn];
    [previousBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(thePauseBtn.mas_centerY).offset(0);
        make.right.mas_equalTo(thePauseBtn.mas_left).offset(-50);
        make.height.mas_equalTo(37/2);
        make.width.mas_equalTo(31/2);
    }];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [nextBtn setImage:[UIImage imageNamed:@"theNext_Btn"] forState:UIControlStateNormal];
    [nextBtn setImage:[UIImage imageNamed:@"theNext_Btn"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:nextBtn];
    [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(thePauseBtn.mas_centerY).offset(0);
        make.left.mas_equalTo(thePauseBtn.mas_right).offset(50);
        make.height.mas_equalTo(37/2);
        make.width.mas_equalTo(31/2);
    }];

    
}


- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
//    self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];
}

//定时器触发事件
-(void)Progress:(NSTimer *)timer
{
//    UIProgressView *progressView = timer.userInfo;
//    //增加进度条当前进度
//    progressView.progress+=0.02;
    
}

////父视图是否可以将消息传递给子视图，yes是将事件传递给子视图，则不滚动，no是不传递则继续滚动
//- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
//{
//    if ([view isKindOfClass:[UIButton class]])
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//    
//}
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    [[self nextResponder] touchesBegan:touches withEvent:event];
//    [super touchesBegan:touches withEvent:event];
//}

//#pragma mark - UIView的触摸事件
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"UIView start touch...");
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"UIView moving...");
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"UIView touch end.");
//}
//
//- (CGPoint)locationInView:(UIView *)view{
//
//    return CGPointMake(10, 200);
//}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    CGPoint hitPoint = [self.slider convertPoint:point fromView:self];
//    if ([self.slider pointInside:hitPoint withEvent:event]){
//        return self.slider;
//    }else{
//        return nil;
//    }
//    
//    return [super hitTest:point withEvent:event];
//    
//}

//- (nullable UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    
//    UIView *view = [super hitTest:point withEvent:event];
//    
//    if(_hitTestType == LLSHitTestTypeIgnore)
//    {
//        if([view isEqual:self])
//        {
//            return nil;
//        }
//    }
//    
//    //优先判断子视图可否响应事件
//    UIView *tempView;
//    if (_hitTestType == LLSHitTestTypeNoClip)
//    {
//        tempView = [self getTargetView:self point:point event:event];
//    }
//    
//    //如果是 返回
//    if(tempView)
//    {
//        view = tempView;
//    }
//    
//    //是否需要指定范围
//    if(_path)
//    {
//        if(!CGPathContainsPoint(_path.CGPath, NULL, point, NO))
//        {
//            return nil;
//        }
//    }
//    
//    
//    return view;
//}
//
//- (UIView *)getTargetView:(UIView *)view
//                    point:(CGPoint)point
//                    event:(UIEvent *)event
//{
//    
//    __block UIView *subView;
//    
//    //逆序 由层级最低 也就是最上层的子视图开始
//    [view.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        //point 从view 转到 obj中
//        CGPoint hitPoint = [obj convertPoint:point fromView:view];
//        //        NSLog(@"%@ - %@",NSStringFromCGPoint(point),NSStringFromCGPoint(hitPoint));
//        
//        if([obj pointInside:hitPoint withEvent:event])//在当前视图范围内
//        {
//            if(obj.subviews.count != 0)
//            {
//                //如果有子视图 递归
//                subView = [self getTargetView:obj point:hitPoint event:event];
//                
//                if(!subView)
//                {
//                    //如果没找到 提交当前视图
//                    subView = obj;
//                }
//            }
//            else
//            {
//                subView = obj;
//            }
//            
//            *stop = YES;
//        }
//        else//不在当前视图范围内
//        {
//            if(obj.subviews.count != 0)
//            {
//                //如果有子视图 递归
//                subView = [self getTargetView:obj point:hitPoint event:event];
//            }
//        }
//        
//    }];
//    
//    return subView;
//}



//-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    id hitView = [super hitTest:point withEvent:event];
//    if (hitView == self){
//        return nil;
//    }
//    
//    else{
//        if (hitView isEqual:[UISlider *Slider]) {
//            
//        }
//        return hitView;
//    }
//    
//}

@end
