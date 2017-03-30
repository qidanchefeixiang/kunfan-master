//
//  KFUser.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/27.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KFUser : NSObject

@property (strong, nonatomic) NSString *user_id;
@property (strong, nonatomic) NSDate *createdAt;
@property (copy, nonatomic) NSString *user_token;

- (void)logout;
- (void)save;
- (void)saveUserInfoWithResponseObject:(id)responseObject;
- (BOOL)isLoggedIn;
+ (KFUser *)currentUser;

@end
