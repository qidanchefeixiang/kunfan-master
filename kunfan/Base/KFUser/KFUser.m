//
//  KFUser.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/27.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "KFUser.h"

@implementation KFUser

- (id)init {
    self = [super init];
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kSessionKey];
    NSString *user_id = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdKey];
    NSDate *createdAt = [[NSUserDefaults standardUserDefaults] objectForKey:kCreatedAtKey];
    _user_token = @"";
    
    if ([cookiesdata length]) {
        _user_id = user_id;
        _createdAt = createdAt;
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
            
            if ([cookie.name isEqualToString:@"user_token"]) {
                _user_token = cookie.value;
                break;
            }
        }
    }
    
    return self;
}

- (void)logout {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSessionKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserIdKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kCreatedAtKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kWeibo_SINA_AccessToken];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kWeibo_SINA_Userid];
    [[NSUserDefaults standardUserDefaults] synchronize];
    _user_id = nil;
}

+ (KFUser *)currentUser {
    static dispatch_once_t pred;
    static KFUser *_currentUser = nil;
    
    dispatch_once(&pred, ^{ _currentUser = [[self alloc] init];});
    return _currentUser;
}

- (void)save {
    NSArray *cookies;
    if (kDebugMode){
        NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:kForServerUse_URL];
        if (!url || url.length == 0) {
            url = kBaseURL;
        }
        cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:url]];
    } else {
        cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:kBaseURL]];
    }
    
    NSHTTPCookie *cookie;
    for (cookie in cookies) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        
        if ([cookie.name isEqualToString:@"user_token"]) {
            _user_token = cookie.value;
            break;
        }
    }
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kSessionKey];
    [[NSUserDefaults standardUserDefaults] setObject:_user_id forKey:kUserIdKey];
    [[NSUserDefaults standardUserDefaults] setObject:_createdAt forKey:kCreatedAtKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveUserInfoWithResponseObject:(id)responseObject {
    NSString *uid = [responseObject getNotNilString:@"id"];
    NSString *registerTime = [responseObject getNotNilString:@"created_at"];
    
    if (uid.length > 0 && registerTime.length > 0) {
        self.user_id = uid;
        self.createdAt = [NSDate dateWithTimeIntervalSince1970:[registerTime integerValue]];
        [self save];
    }
}

- (BOOL)isLoggedIn {
    return _user_id != nil;
}


@end
