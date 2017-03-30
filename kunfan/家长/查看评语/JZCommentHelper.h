//
//  JZCommentHelper.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JZCommentHelper : NSObject
/// Image resource bundle
+ (NSBundle *)bundle;

/// Image cache
+ (YYMemoryCache *)imageCache;

/// Get image from bundle with cache.
+ (UIImage *)imageNamed:(NSString *)name;

/// Convert date to friendly description.
+ (NSString *)stringWithTimelineDate:(NSDate *)date;

/// Convert number to friendly description.
+ (NSString *)shortedNumberDesc:(NSUInteger)number;

@end

/**
 文本 Line 位置修改
 将每行文本的高度和位置固定下来，不受中英文/Emoji字体的 ascent/descent 影响
 */
@interface HBTextLinePositionModifier : NSObject <YYTextLinePositionModifier>
@property (nonatomic, strong) UIFont *font; // 基准字体 (例如 Heiti SC/PingFang SC)
@property (nonatomic, assign) CGFloat paddingTop; //文本顶部留白
@property (nonatomic, assign) CGFloat paddingBottom; //文本底部留白
@property (nonatomic, assign) CGFloat lineHeightMultiple; //行距倍数
- (CGFloat)heightForLineCount:(NSUInteger)lineCount;

@end
