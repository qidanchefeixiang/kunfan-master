//
//  JZCommentLayout.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JZCommentModel.h"

#define kT1CellPadding 12
#define kT1CellInnerPadding 6
#define kT1CellExtendedPadding 30
#define kT1AvatarSize 48
#define kT1ImagePadding 4
#define kT1ConversationSplitHeight 25
#define kT1ContentLeft (kT1CellPadding + kT1AvatarSize + kT1CellInnerPadding)
#define kT1ContentWidth (kScreenWidth - 2 * kT1CellPadding - kT1AvatarSize - kT1CellInnerPadding)
#define kT1QuoteContentWidth (kT1ContentWidth - 2 * kT1CellPadding)
#define kT1ActionsHeight 6
#define kT1TextContainerInset 4

#define kT1UserNameFontSize 14
#define kT1UserNameSubFontSize 12
#define kT1TextFontSize 14
#define kT1ActionFontSize 12

#define kT1UserNameColor UIColorHex(292F33)
#define kT1UserNameSubColor UIColorHex(8899A6)
#define kT1CellBGHighlightColor [UIColor colorWithWhite:0.000 alpha:0.041]
#define kT1TextColor UIColorHex(292F33)
#define kT1TextHighlightedColor UIColorHex(1A91DA)
#define kT1TextActionsColor UIColorHex(8899A6)
#define kT1TextHighlightedBackgroundColor UIColorHex(ebeef0)

#define kT1TextActionRetweetColor UIColorHex(19CF86)
#define kT1TextActionFavoriteColor UIColorHex(FAB81E)


@interface JZCommentLayout : NSObject

- (instancetype)initWithForum:(JZCommentModel *)forum;
- (instancetype)init;
- (void)layout; ///< 计算布局

// 以下是数据
@property (nonatomic, strong) JZCommentModel *forum;


//以下是布局结果

// 顶部留白
@property (nonatomic, assign) CGFloat marginTop; //顶部灰色留白 15

// 个人资料
@property (nonatomic, assign) CGFloat profileHeight; //个人资料高度(包括留白) 30
@property (nonatomic, assign) CGFloat nameHeight; //名字高度
@property (nonatomic, strong) YYTextLayout *nameTextLayout; // 名字
@property (nonatomic, strong) YYTextLayout *timeTextLayout; //时间/来源

// 文本
@property (nonatomic, assign) CGFloat textHeight; //文本高度(包括下方留白)
@property (nonatomic, strong) YYTextLayout *textLayout; //文本

// 图片
@property (nonatomic, assign) CGFloat picHeight; //图片高度，0为没图片 88
@property (nonatomic, assign) CGSize picSize;

// 音频
@property (nonatomic, assign) CGFloat musicHeight; //卡片高度，0为没卡片 88
@property (nonatomic, strong) YYTextLayout *musicTextLayout; //卡片文本
@property (nonatomic, assign) CGRect musicTextRect;

// 下边留白
@property (nonatomic, assign) CGFloat marginBottom; //下边留白 15

// 总高度
@property (nonatomic, assign) CGFloat height;


@end
