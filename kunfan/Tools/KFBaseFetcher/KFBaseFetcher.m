//
//  KFBaseFetcher.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/27.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "KFBaseFetcher.h"
#import "NSString+MD5.h"

#define kErrorDomain @"me.fitcare.public.hotbody"


@interface KFBaseFetcher()

@property(nonatomic,strong,getter=fileName) NSString *fileName;
@property(nonatomic,strong) NSString *dateFileName;
@property(assign,nonatomic,readonly,getter=cacheHasExpired) BOOL cacheHasExpired; //缓存是否已过期
@property(assign,nonatomic) BOOL finishLoadFromNetwork;

@property(nonatomic,strong) NSString *timestampFileName;
@property(nonatomic,strong) id cacheResponseObject;

@end

@implementation KFBaseFetcher

#pragma mark -- public

- (id)init
{
    self = [super init];
    _method = @"GET";
    _requestURL = @"";
    _finishLoadFromNetwork = NO;
    _maxCacheAge = 0;
    self.cachePolicy = HBCachePolicyNetworkOnly;
    return self;
}

- (NSError *)processData:(id)responseObject
{
    return nil;
}

- (AFHTTPRequestOperation *)runWithSuccess:(void (^)(id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *))failure
{
    HBLog(@"正在加载:%@",_requestURL);
    
    //直接从网上加载数据
    if (HBCachePolicyNetworkOnly == _cachePolicy) {
        return [self loadFromNetWorkWithSuccess:success failure:failure];
    }
    
    //直接从缓存加载数据
    if (HBCachePolicyCacheOnly == _cachePolicy) {
        [self loadFromCacheWithSuccess:success failure:failure];
    }
    
    //先从缓存中取出数据，把结果返回，再判断缓存数据是否过期，如果过期，则再从网上取，取到后把结果后返回
    if (HBCachePolicyCacheElseNetwork == _cachePolicy ) {
        [self loadFromCacheWithSuccess:success failure:failure];
        
        if (self.cacheHasExpired) {
            return [self loadFromNetWorkWithSuccess:success failure:failure];
        }
    }
    
    if (HBCachePolicyCacheThenNetwork == _cachePolicy ) {
        [self loadFromCacheWithSuccess:success failure:failure];
        
        return [self loadFromNetWorkWithSuccess:success failure:failure];
    }
    
    return nil;
}

- (void)dispose
{
    _parameters = nil;
    _requestURL = nil;
    _method = nil;
}

#pragma mark-
#pragma mark- private
- (void)loadFromCacheWithSuccess:(void (^)(id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *))failure{
    HBLog(@"正在从缓存中加载:%@",_requestURL);
    
    id responseObject = [self getObjectFromCacheWithFileName:self.fileName];
    _cacheResponseObject = responseObject;
    NSError *error = [self processData:responseObject];
    
    // 没有缓存也需要做回调，方便从网络再次拿数据
    if (error == nil) {
        _isFromCache = YES;
        success(responseObject);
    }
    //    if (responseObject && error == nil) {
    //        _isFromCache = YES;
    //        success(responseObject);
    //    } else {
    //        /*
    //        if (!self.cacheHasExpired) {
    //            [self loadFromNetWorkWithSuccess:success failure:failure];
    //        }
    //         */
    //    }
}

- (AFHTTPRequestOperation *)loadFromNetWorkWithSuccess:(void (^)(id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *))failure
{
    HBLog(@"正在从网络加载:%@",_requestURL);
    
    if (YYReachabilityStatusNone == [YYReachability reachability].status) {
        if (failure != nil) {
            failure(nil, nil);
        }
        
        return nil;
    }
    
    AFHTTPRequestOperation *o = [[HBHTTPRequestManager sharedManager] HTTPCacheRequestOperationWithHTTPMethod:_method URLString:_requestURL parameters:_parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _finishLoadFromNetwork = YES;
        NSError *error = [self processData:responseObject];
        if (error == nil){
            
            _isFromCache = NO;
            BOOL needReturnCache = NO;
            if (_useTimestamp) {
                NSString *status = [responseObject getNotNilString:@"status"];
                if ([status isEqualToString:@"ok"]) {
                    needReturnCache = YES;
                    [self processData:_cacheResponseObject];
                    success(_cacheResponseObject);
                } else {
                    [self saveObject:[responseObject getNotNilString:@"hb_data_version"] ToCacheWithFileName:_timestampFileName];
                }
            }
            
            if (!needReturnCache) {
                [self saveObject:[NSDate date] ToCacheWithFileName:_dateFileName];
                [self saveObject:responseObject ToCacheWithFileName:self.fileName];
                HBLog(@"....保存 %@  %@, %@",_requestURL, self.fileName,responseObject);
                success(responseObject);
            }
            
        }else{
            _isFromCache = NO;
            failure(operation, error);
        }
        [self dispose];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        _finishLoadFromNetwork = YES;
        _isFromCache = NO;
        failure(operation, error);
        [self dispose];
        
    }];
    
    [[HBHTTPRequestManager sharedManager].operationQueue addOperation:o];
    return o;
}

- (void)saveObject:(id)theObject ToCacheWithPath:(NSString *) path FileName:(NSString *)theFileName{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        
        NSString *cacheFile = [path stringByAppendingPathComponent:theFileName];
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:theObject forKey:kSerializationKey];
        [archiver finishEncoding];
        [data writeToFile:cacheFile atomically:YES];
        
    }];
    
    [queue addOperation:operation];
}

- (void)saveObject:(id)theObject ToCacheWithFileName:(NSString *)theFileName{
    
    [self saveObject:theObject ToCacheWithPath:[Util sharedInstance].dataPath FileName:theFileName];
}

- (id)getObjectFromCacheWithFileName:(NSString *)theFileName{
    
    NSString *cacheFile = [[Util sharedInstance].dataPath stringByAppendingPathComponent:theFileName];
    
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:cacheFile];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    id responseObject = [unarchiver decodeObjectForKey:kSerializationKey];
    [unarchiver finishDecoding];
    return responseObject;
}

- (NSString *)getTimestamp{
    NSString *timestamp = [self getObjectFromCacheWithFileName:_timestampFileName];
    if (timestamp.length == 0) {
        return @"0";
    }
    return timestamp;
}

#pragma mark-
#pragma mark- setter and getter

- (NSString *)fileName {
    
    if (_fileName) {
        return _fileName;
    }
    
    NSString *aFileName = [[NSString stringWithFormat:@"%@%@", _requestURL, _parameters] MD5];
    
    if (_useTimestamp) {
        
        NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:_parameters];
        [mutableDic removeObjectForKey:@"hb_data_version"];
        _timestampFileName = [[NSString stringWithFormat:@"%@%@_timestamp", _requestURL, _parameters] MD5];
        aFileName = [[NSString stringWithFormat:@"%@%@", _requestURL, _parameters] MD5];
        
        if ([_parameters getNotNilString:@"hb_data_version"].length == 0) {
            NSString *timestamp = [self getTimestamp];
            NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:_parameters];
            [mutableDic setObject:timestamp forKey:@"hb_data_version"];
            _parameters = [NSDictionary dictionaryWithDictionary:mutableDic];
        }
    }
    
    _dateFileName = [aFileName stringByAppendingString:@"_date"];
    
    _fileName = aFileName;
    return aFileName;
}

- (BOOL)cacheHasExpired {
    NSDate *LoadFromNetworkFinishTime = [self getObjectFromCacheWithFileName:_dateFileName];
    
    if (nil == LoadFromNetworkFinishTime) {
        return YES;
    }
    
    if ([[NSDate date] timeIntervalSinceDate:LoadFromNetworkFinishTime]>_maxCacheAge * 60){
        return YES;
    }
    
    return NO;
}

-(BOOL)getNeedShowLoadingView {
    if (HBCachePolicyNetworkOnly == _cachePolicy) {
        if (!_finishLoadFromNetwork) {
            return YES;
        }
    } else if (HBCachePolicyCacheElseNetwork == _cachePolicy) {
        if (self.cacheHasExpired && !_finishLoadFromNetwork) {
            return  YES;
        }
    } else if (HBCachePolicyCacheThenNetwork == _cachePolicy) {
        if (!_finishLoadFromNetwork) {
            return  YES;
        }
    }
    
    return NO;
}

@end
