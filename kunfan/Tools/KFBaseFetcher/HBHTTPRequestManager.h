//
//  HBHTTPRequestManager.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/27.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AFNetworkActivityIndicatorManager.h"

@interface HBHTTPRequestManager : AFHTTPRequestOperationManager

+ (HBHTTPRequestManager *)sharedManager;
- (AFHTTPRequestOperation *)HTTPCacheRequestOperationWithHTTPMethod:(NSString *)method
                                                          URLString:(NSString *)URLString
                                                         parameters:(id)parameters
                                                            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
