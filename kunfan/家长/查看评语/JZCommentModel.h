//
//  JZCommentModel.h
//  kunfan
//
//  Created by 坤凡 on 2017/3/22.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import <Foundation/Foundation.h>
@class T1User;
@class T1Tweet;

@interface JZCommentModel : NSObject
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *profileImage;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *music;
@property (nonatomic, strong) NSString *musictime;

+ (instancetype)forumMedalItemWithDict:(NSDictionary *)dict;

@end

@interface T1APIRespose : NSObject
@property (nonatomic, strong) NSDictionary *moments; ///< empty
@property (nonatomic, strong) NSDictionary<NSString *, T1User *> *users; ///< <UID(NSString), T1User>
@property (nonatomic, strong) NSDictionary<NSString *, T1Tweet *> *tweets; ///< <TID(NSString), T1Tweet>
@property (nonatomic, strong) NSArray *timelineItmes; ///< Array<T1Tweet/T1Conversation>
@property (nonatomic, strong) NSArray *timeline; ///< Array<Dictionary>

@property (nonatomic, strong) NSString *cursorTop;
@property (nonatomic, strong) NSString *cursorBottom;
@property (nonatomic, strong) NSArray *cursorGaps;
@end

@interface T1Tweet : NSObject
@property (nonatomic, assign) uint64_t tid;
@property (nonatomic, strong) NSString *tidStr;

@property (nonatomic, strong) T1User *user;
@property (nonatomic, strong) T1Tweet *retweetedStatus;
@property (nonatomic, strong) T1Tweet *quotedStatus;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *source;

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, assign) BOOL truncated;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, assign) BOOL retweeted;
@property (nonatomic, assign) BOOL isQuoteStatus;
@property (nonatomic, assign) uint32_t favoriteCount;
@property (nonatomic, assign) uint32_t retweetCount;
@property (nonatomic, assign) uint64_t conversationID;
@property (nonatomic, assign) uint32_t inReplyToUserId;
@property (nonatomic, strong) NSArray *contributors;
@property (nonatomic, assign) uint64_t inReplyToStatusID;
@property (nonatomic, strong) NSString *inReplyToStatusIDStr;
@property (nonatomic, strong) NSString *inReplyToUserIDStr;
@property (nonatomic, strong) NSString *inReplyToScreenName;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) NSDictionary *geo;
@property (nonatomic, strong) NSString *supplementalLanguage;
@property (nonatomic, strong) NSArray *coordinates;
@end




@interface T1User : NSObject
@property (nonatomic, assign) uint64_t uid;
@property (nonatomic, strong) NSString *uidStr;
@property (nonatomic, strong) NSString *name;       // e.g. "Nick Lockwood"
@property (nonatomic, strong) NSString *screenName; // e.g. "nicklockwood"
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, assign) uint32_t listedCount;
@property (nonatomic, assign) uint32_t statusesCount;
@property (nonatomic, assign) uint32_t favouritesCount;
@property (nonatomic, assign) uint32_t friendsCount;

// http://pbs.twimg.com/profile_images/558109954561679360/j1f9DiJi_normal.jpeg original
// http://pbs.twimg.com/profile_images/558109954561679360/j1f9DiJi_reasonably_small.jpeg replaced
@property (nonatomic, strong) NSURL *profileImageURL;
@property (nonatomic, strong) NSURL *profileImageURLReasonablySmall; // replaced
@property (nonatomic, strong) NSURL *profileImageURLHttps;
@property (nonatomic, strong) NSURL *profileBackgroundImageURL;
@property (nonatomic, strong) NSURL *profileBackgroundImageURLHttps;

@property (nonatomic, strong) NSString *profileBackgroundColor;
@property (nonatomic, strong) NSString *profileTextColor;
@property (nonatomic, strong) NSString *profileSidebarFillColor;
@property (nonatomic, strong) NSString *profileSidebarBorderColor;
@property (nonatomic, strong) NSString *profileLinkColor;

@property (nonatomic, strong) NSDictionary *entities;
@property (nonatomic, strong) NSDictionary *counts;

@property (nonatomic, assign) BOOL verified;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, assign) BOOL followRequestSent;
@property (nonatomic, assign) BOOL defaultProfile;
@property (nonatomic, assign) BOOL defaultProfileImage;
@property (nonatomic, assign) BOOL profileBackgroundTile;
@property (nonatomic, assign) BOOL profileUseBackgroundImage;
@property (nonatomic, assign) BOOL isProtected;
@property (nonatomic, assign) BOOL isTranslator;
@property (nonatomic, assign) BOOL notifications;
@property (nonatomic, assign) BOOL geoEnabled;
@property (nonatomic, assign) BOOL contributorsEnabled;
@property (nonatomic, assign) BOOL isTranslationEnabled;
@property (nonatomic, assign) BOOL hasExtendedProfile;

@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) NSString *timeZone;
@property (nonatomic, assign) int32_t utcOffset;
@end
