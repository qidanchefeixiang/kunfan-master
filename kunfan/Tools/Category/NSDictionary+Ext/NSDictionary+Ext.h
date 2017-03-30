//
//  HBDictionary.h
//  hotbody
//
//  Created by Aki on 4/5/15.
//  Copyright (c) 2015 Beijing Fitcare inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Ext)

- (NSString *)getString:(NSString *)key;
- (NSString *)getNotNilString:(NSString *)key;///< 判断string是否有时，需判断length
- (NSNumber *)getNumber:(NSString *)key;
- (NSArray *)getArray:(NSString *)key;
- (NSDictionary *)getObject:(NSString *)key;
- (BOOL)getBOOL:(NSString *)key;

- (BOOL)hasString:(NSString *)key;
- (BOOL)hasNumber:(NSString *)key;
- (BOOL)hasArray:(NSString *)key;
- (BOOL)hasObject:(NSString *)key;

// no hasBOOL for:
// doesn't exist means Falsy

@end
