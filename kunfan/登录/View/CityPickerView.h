//
//  CityPickerView.h
//  kunfan
//
//  Created by Shsy on 2017/3/29.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray  *cityData;
@property (nonatomic, assign) NSInteger       pickerSelectCityId;
@property (nonatomic, assign) NSInteger       pickerSelectShiId;
@property (nonatomic, assign) NSInteger       pickerSelectQuId;
@property (nonatomic, assign) NSInteger       cityCode;
@property (nonatomic, strong) NSString        *cityName;
@property (nonatomic, assign) id              delegate;

- (instancetype)initWithDatas:(NSMutableArray *)cityData;
@end
