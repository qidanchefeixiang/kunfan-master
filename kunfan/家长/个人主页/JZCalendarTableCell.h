//
//  JZCalendarTableCell.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/20.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CalendarClinkBlock)(NSDate* date);

@interface JZCalendarTableCell : UITableViewCell<JTCalendarDelegate>

@property (nonatomic, copy) CalendarClinkBlock calendarClinkBlock;

@property (weak, nonatomic)  JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic)  JTHorizontalCalendarView *calendarContentView;
@property (weak, nonatomic)  NSLayoutConstraint *calendarContentViewHeight;
@property (strong, nonatomic) JTCalendarManager *calendarManager;

+ (NSString *)identifier;
@end
