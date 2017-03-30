//
//  Util.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/1.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
@property (assign, nonatomic) NSInteger trainCount;
@property (assign, nonatomic) NSInteger punch;
@property (assign, nonatomic) NSInteger weekRank;
@property (assign, nonatomic) NSInteger createdAt;

@property (nonatomic, copy) NSString *dataPath;

+ (Util *)sharedInstance;

- (NSString *)dataPathString;

+ (NSString *)userAgent;
+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

+ (NSString *)createUUID;

+ (UIImage*) createImageWithColor:(UIColor*) color;
@end
