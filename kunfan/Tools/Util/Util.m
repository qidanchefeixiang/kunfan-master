//
//  Util.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/1.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (Util *)sharedInstance {
    static Util *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Util alloc] init];
        sharedInstance.trainCount = -1;
        sharedInstance.punch = -1;
        sharedInstance.weekRank = -1;
        sharedInstance.createdAt = -1;
    });
    return sharedInstance;
}

+ (NSString *)userAgent{
    
    NSString *userAgent;// = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleIdentifierKey], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *uid;// = [HBUser currentUser].user_id;
    if (0 == uid.length) {
        uid = @"";
    }
    userAgent = [NSString stringWithFormat:@"%@ dt:ios, v:%@, u:%@",userAgent,version,uid];
    
    return userAgent;
}



- (NSString *)dataPath;
{
    if (!_dataPath)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        _dataPath = [self dataPathString];
        if (![fileManager fileExistsAtPath:_dataPath])
        {
            [fileManager createDirectoryAtPath:_dataPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    return _dataPath;
}

- (NSString *)dataPathString {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [[paths lastObject] stringByAppendingPathComponent:@"Caches"];
    return [cacheDirectory stringByAppendingPathComponent:@"data"];
}


/**
 *  生成图片
 *
 *  @param color  图片颜色
 *  @param height 图片高度
 *
 *  @return 生成的图片
 */
+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (NSString *)createUUID
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge NSString *)string;
}

+ (UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
