//
//  JZCommentModel.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "JZCommentModel.h"

@implementation JZCommentModel
+ (instancetype)forumMedalItemWithDict:(NSDictionary *)dict {
    if (![dict isKindOfClass:[NSDictionary class]]
        || 0 == [dict allKeys].count) {
        return nil;
    }
    
    JZCommentModel *item = [[self alloc] init];
    item.sex = [dict getNotNilString:@"sex"];
    item.role = [dict getNotNilString:@"role"];
    item.profileImage = [dict getNotNilString:@"profileImage"];
    item.createdAt = [dict getNotNilString:@"createdAt"];
    item.uid = [dict getNotNilString:@"uid"];
    item.text = [dict getNotNilString:@"text"];
    item.name = [dict getNotNilString:@"name"];
    item.image = [dict getNotNilString:@"image"];
    item.music = [dict getNotNilString:@"music"];
    item.musictime = [dict getNotNilString:@"musictime"];
    

    
    return item;
}

@end
