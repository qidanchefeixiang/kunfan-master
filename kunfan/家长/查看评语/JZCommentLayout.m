//
//  JZCommentLayout.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZCommentLayout.h"
#import "JZCommentModel.h"
#import "JZCommentHelper.h"
@implementation JZCommentLayout

- (instancetype)initWithForum:(JZCommentModel *)forum {
    if (!forum) return nil;
    self = [super init];
    _forum = forum;
    [self layout];
    
    return self;
}

//测试
- (instancetype)init{
    self = [super init];
    [self layout];
    
    return self;
}

- (void)layout {
    [self _layout];
}

- (void)_layout {
    _marginTop = 15;
    _profileHeight = 0;
    _picHeight = 0;
    _textHeight = 0;
    _musicHeight = 0;
    _marginBottom = 15;
    
    
    // 文本排版，计算布局
    [self _layoutProfile];
        [self _layoutText];
        [self _layoutPics];
        [self _layoutMusic];


    
    // 计算高度
    _height = 0;
    _height += _marginTop;

    
    if (_profileHeight > 0) {
        _height += _profileHeight;
    }
    
    if (_textHeight > 6) {
        _height += 0;
        _height += _textHeight;
    }
    
  
    if (_picHeight == 0 && _musicHeight == 0) {
        _height += 0;
    }else{
        _height += 12;
        _height += _musicHeight;
    }
    
    
    _height += 12;
    _height += _marginBottom;
}

- (void)_layoutProfile {
    _profileHeight = 0;
    
    [self _layoutName];
    [self _layoutTime];
    
    _profileHeight = 30;
}

/// 名字
- (void)_layoutName {
    NSString *nameStr = @"王老师";
    
    if (nameStr.length == 0) {
        _nameTextLayout = nil;
        return;
    }
    
    NSMutableAttributedString *nameText = [[NSMutableAttributedString alloc] initWithString:nameStr];
    nameText.font = kHBFontFiveBold;
    nameText.color = KFTextColorOne_h;
    nameText.lineBreakMode = NSLineBreakByCharWrapping;
    
    HBTextLinePositionModifier *modifier = [HBTextLinePositionModifier new];
    modifier.font = kHBFontFiveBold;
    modifier.paddingTop = 3;
    modifier.paddingBottom = 3;
    
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenWidth - 68 - 65, HUGE)];
    container.maximumNumberOfRows = 1;
    container.linePositionModifier = modifier;
    
    _nameTextLayout = [YYTextLayout layoutWithContainer:container text:nameText];
    if (!_nameTextLayout) return;
    
    _nameHeight = [modifier heightForLineCount:_nameTextLayout.rowCount];
}

/// 时间和来源
- (void)_layoutTime {
    NSMutableAttributedString *sourceText = [NSMutableAttributedString new];
    
    NSString *timeStr = @"2017.02.03";
    // 时间
    if (timeStr.length) {
        NSMutableAttributedString *timeText = [[NSMutableAttributedString alloc] initWithString:timeStr];
        timeText.font = kHBFontNine;
        timeText.color = KFTextColorThree;
        timeText.alignment = NSTextAlignmentLeft;
        [sourceText appendAttributedString:timeText];
    }
    

    
    if (sourceText.length == 0) {
        _timeTextLayout = nil;
    } else {
        YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenWidth - 68 - 65, 9999)];
        container.maximumNumberOfRows = 1;
        _timeTextLayout = [YYTextLayout layoutWithContainer:container text:sourceText];
    }
}


/// 文本
- (void)_layoutText {
    _textHeight = 0;
    _textLayout = nil;
    
    NSString *tempBrief = @"你好校长，感觉可以在修一下学生的桌子和椅子。请您批准  谢谢！";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:tempBrief];
    HBLog(@"%@",text);
    if (0 == text.length) return;
    
    HBTextLinePositionModifier *modifier = [HBTextLinePositionModifier new];
    modifier.font = kHBFontNine;
    modifier.paddingTop = 4;
    modifier.paddingBottom = 4;
    // 设置行间距
    modifier.lineHeightMultiple = 1.7f;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(kScreenWidth - 68 - 65, HUGE);
    container.maximumNumberOfRows = 5;
    container.truncationType = YYTextTruncationTypeEnd;
    container.linePositionModifier = modifier;
    
    _textLayout = [YYTextLayout layoutWithContainer:container text:text];
    if (!_textLayout) return;
    
    _textHeight = [modifier heightForLineCount:_textLayout.rowCount];
}


- (void)_layoutPics {
    _picHeight = 0;
    
    _picHeight += 88;
    
}

- (void)_layoutMusic {
    _musicHeight = 0;
    
    _musicHeight += 88;
    
}


@end
