//
//  HBConfig.h
//  hotbody
//
//  Created by Belle on 16/5/11.
//  Copyright © 2016年 Beijing Fitcare inc. All rights reserved.
//  项目配置

#ifndef HBConfig_h
#define HBConfig_h

#pragma mark - 调试、发布相关配置
/********************************************调试、发布相关配置********************************************/
// 测试模式，使用测试服务器，打开log
// 正式模式，使用正式服务器，关闭所有log
static const BOOL kDebugMode = YES;

// ios开发人员测试模式 正式发版时要改成NO
// 测试模式 正式发版时要改成NO
static const BOOL kDeveloperTestMode = NO;


#pragma mark - URL配置
/********************************************URL配置********************************************/
static const NSString *kForServerUse_URL = @"";
// https服务器
static const NSString *kBaseURL = kDebugMode ? @"" : @"";
static const NSString *kShareURL = kDebugMode ? @"" : @"";

static const NSString *qiniuURL = kDebugMode ? @"" : @"";

#pragma mark - 第三方帐号
/********************************************第三方帐号********************************************/
static const NSString *kAppStoreAppId = @"";
static const NSString *kUmengAppKey = @"";

static const NSString *kWeiboAppKey = @"";
static const NSString *kWeiboRedirectURI = @"https://api.weibo.com/oauth2/default.html";
static const NSString *kWeiboUIApplicationDidReceiveWeiboResponse = @"WeiboUIApplicationDidReceiveWeiboResponse";
static const NSString *kWeibo_SINA_API = @"https://api.weibo.com/2/users/show.json";
static const NSString *kWeibo_SINA_AccessToken = @"weiboaccessToken";
static const NSString *kWeibo_SINA_Userid = @"weibouserid";

static const NSString *kQQAppID = @"";
static const NSString *kQQAppKey = @"";
static const NSString *kQQUIApplicationDidReceiveResponse = @"QQUIApplicationDidReceiveResponse";
static const NSString *kQQUIApplicationDidReceiveQQResponse = @"QQUIApplicationDidReceiveQQResponse";
static const NSString *kQQ_LOGIN_API = @"https://graph.qq.com/user/get_simple_userinfo";//get_simple_userinfo //get_user_info

static const NSString *kWXAppId = @"";
static const NSString *kWXAppSecret = @"";
static const NSString *kWXUIApplicationDidReceiveWXResponse = @"UIApplicationDidReceiveWXResponse";

static const NSString *kAmapInHouseKey = @"";
static const NSString *kAmapAppStoreKey = @"";



#pragma mark - 个人信息
/********************************************个人信息********************************************/
static const NSString *kSessionKey = @"session_token";
static const NSString *kUserIdKey = @"user_id";
static const NSString *kCreatedAtKey = @"created_at";


static const NSString *kSerializationKey = @"me.kunfan";


// 魔窗
static const NSString *kMoChuangFormalModeAppKey = @"";

// Bugly
static const NSString *kMoBuglyAppId = @"e349ce6243";

// 阿里百川
static const NSString *kYWFeedbackKey = @"";

// 诸葛io
static const NSString *kZhugeioAppKey = @"";

//leanCloud推送
static const NSString *kLeanCloudApplicationId = @"-gzGzoHsz";
static const NSString *kLeanCloudClientKey = @"";

#pragma mark - 忽略部分警告
/********************************************忽略部分警告********************************************/
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
#pragma clang diagnostic ignored "-Wunreachable-code"
#pragma clang diagnostic ignored "-Wnonnull"

#endif /* HBConfig_h */
