//
//  KFBaseFetcher.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/27.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBHTTPRequestManager.h"
#import "NSDictionary+Ext.h"

typedef void (^HBObjectResultBlock)(id object, NSError *error);

typedef NS_ENUM(int, HBCachePolicy)
{
    HBCachePolicyCacheElseNetwork,  //先从缓存中取出数据，把结果返回，再判断缓存数据是否过期，如果过期，则再从网上取，取到后把结果后返回
    HBCachePolicyCacheOnly,
    HBCachePolicyNetworkOnly,
    HBCachePolicyCacheThenNetwork,  //先从缓存中取出数据，把结果返回，再从网上取，取到后把结果后返回
};

@interface KFBaseFetcher : NSObject

@property (strong, nonatomic) NSString *method;
@property (strong, nonatomic) NSString *requestURL;
@property (strong, nonatomic) NSDictionary *parameters;

@property (assign,nonatomic) HBCachePolicy cachePolicy;
@property (assign,nonatomic) float maxCacheAge; //缓存过期时间 单位分钟
@property (assign,nonatomic,readonly,getter=getNeedShowLoadingView) BOOL needShowLoadingView;
@property (assign, nonatomic,readonly) BOOL isFromCache;

/*
 timestamp:上一次访问该接口获得的时间戳，由服务器返回的，如第一次或强制刷新请填写0。
 客户端应记录它，下次访问接口的时候放在参数里。
 
 返回
 如果返回了{"status":"ok"}，表示客户端和服务器的数据是一致的，无需返回数据
 */
@property (assign, nonatomic) BOOL useTimestamp;



- (NSError *)processData:(id)responseObject;
- (AFHTTPRequestOperation *)runWithSuccess:(void(^)(id responseObject))success
                                   failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure;
- (void)dispose;

- (void)saveObject:(id)theObject ToCacheWithFileName:(NSString *)theFileName;
- (void)saveObject:(id)theObject ToCacheWithPath:(NSString *) path FileName:(NSString *)theFileName;
- (id)getObjectFromCacheWithFileName:(NSString *)theFileName;


@end
