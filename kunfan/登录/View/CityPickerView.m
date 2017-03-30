//
//  CityPickerView.m
//  kunfan
//
//  Created by Shsy on 2017/3/29.
//  Copyright © 2017年 坤凡. All rights reserved.
//
#define COLOR(R,G,B,A)  [UIColor colorWithRed:(CGFloat)R/255.0 green:(CGFloat)G/255.0 blue:(CGFloat)B/255.0 alpha:A]

#import "CityPickerView.h"

@implementation CityPickerView

- (instancetype)initWithDatas:(NSMutableArray *)cityData {
    
    self = [super init];
    if (self) {
        self.cityData = [[NSMutableArray alloc] initWithArray:cityData];
        [self setupLayout];
    }
    
    return self;
}

- (void)setupLayout {
    
    UIView *hideView = [[UIView alloc] init];
    hideView.backgroundColor = COLOR(45, 47, 56, 0.8f);
    [self addSubview:hideView];
    
    [hideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self);
    }];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:pickerView];
    
    
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
    
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(pickerView.mas_top);
        make.right.equalTo(self);
        make.height.mas_equalTo(47);
    }];
    
    //取消按钮
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [cancelBtn addTarget:self action:@selector(actionForTouchCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
    
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(pickerView.mas_top);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(47);
    }];
    
    //确定按钮
    UIButton *certainBtn = [[UIButton alloc] init];
    [certainBtn setTitle:@"完成" forState:UIControlStateNormal];
    [certainBtn setTitleColor:KFBlueColor_1 forState:UIControlStateNormal];
    certainBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [certainBtn setBackgroundColor:[UIColor whiteColor]];
    [certainBtn addTarget:self action:@selector(actionForTouchCertainBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:certainBtn];
    
    [certainBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(pickerView.mas_top);
        make.right.equalTo(self);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(47);
    }];
}

#pragma mark 确定/取消按钮的方法
//确定
- (void)actionForTouchCertainBtn {
    NSDictionary *shengDict = [self.cityData objectAtIndex:self.pickerSelectCityId];
    self.cityName = [NSString stringWithFormat:@"%@", [shengDict objectForKey:@"shengCityName"]];
    NSArray *shiArray = [shengDict objectForKey:@"shilist"];
    NSDictionary *shiDict = [shiArray objectAtIndex:self.pickerSelectShiId];
    self.cityName = [NSString stringWithFormat:@"%@%@", self.cityName,[shiDict objectForKey:@"shiCityName"]];
    NSArray *quArray = [shiDict objectForKey:@"qulist"];
    if (quArray.count > 0) {
        NSDictionary *quDict = [quArray objectAtIndex:self.pickerSelectQuId];
        self.cityName = [NSString stringWithFormat:@"%@%@", self.cityName,[quDict objectForKey:@"quCityName"]];
        self.cityCode = [[quDict objectForKey:@"quCtiyCode"] integerValue];
    } else {
        self.cityCode = [[shiDict objectForKey:@"shiCtiyCode"] integerValue];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getCityNameAndCityCode" object:nil];
    
    self.hidden = YES;
}

//取消
- (void)actionForTouchCancelBtn {
    self.hidden = YES;
}

#pragma mark Delegate,DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (component) {
        case 0: {
            NSDictionary *shengDict = [self.cityData objectAtIndex:row];
            NSString *cityName = [shengDict objectForKey:@"shengCityName"];
            return cityName;
            break;
        }
        
        case 1: {
            NSDictionary *shengDict = [self.cityData objectAtIndex:self.pickerSelectCityId];
            NSArray *shiArray = [shengDict objectForKey:@"shilist"];
            if (shiArray.count > 0) {
                NSDictionary *shiDict = [shiArray objectAtIndex:row];
                return [shiDict objectForKey:@"shiCityName"];
            } else {
                return @"";
            }
        }
        
        case 2: {
            NSDictionary *shengDict = [self.cityData objectAtIndex:self.pickerSelectCityId];
            NSArray *shiArray = [shengDict objectForKey:@"shilist"];
            if (shiArray.count > 0) {
                if (self.pickerSelectShiId >= shiArray.count) {
                    self.pickerSelectShiId = shiArray.count - 1;
                }
                NSDictionary *shiDict = [shiArray objectAtIndex:self.pickerSelectShiId];
                NSArray *quArray = [shiDict objectForKey:@"qulist"];
                if (quArray > 0) {
                    NSDictionary *quDict = [quArray objectAtIndex:row];
                    return [quDict objectForKey:@"quCityName"];
                } else {
                    return @"";
                }
            } else {
                return @"";
            }
        }
            
        default:
            break;
    }
    
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    switch (component) {
        case 0:
            //省份
            self.pickerSelectCityId = row;
            self.pickerSelectShiId = 0;
            self.pickerSelectQuId = 0;
            [pickerView reloadComponent:1];
            [pickerView reloadComponent:2];
            
            break;
        case 1:
            //市
            self.pickerSelectShiId = row;
            self.pickerSelectQuId = 0;
            [pickerView reloadComponent:2];
            
            break;
            
        case 2:
            //区
            self.pickerSelectQuId = row;
            break;
            
        default:
            break;
    }
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (component == 0) {
        return self.cityData.count;
    }
    else if (component == 1) {
        NSDictionary *dict = [self.cityData objectAtIndex:self.pickerSelectCityId];
        NSArray *shiArray = [dict objectForKey:@"shilist"];
        if ((NSNull*)shiArray != [NSNull null]) {
            return shiArray.count;
        }
        return 0;
    }
    else {
//        shiArray
        NSDictionary *shiDict = [self.cityData objectAtIndex:self.pickerSelectCityId];
        NSArray *shiArray = [shiDict objectForKey:@"shilist"];
        NSDictionary *quDict = [shiArray objectAtIndex:self.pickerSelectShiId];
        NSArray *array = [quDict objectForKey:@"qulist"];
        if ((NSNull*)array != [NSNull null]) {
            return array.count;
        }
        return 0;
    }
}

@end
