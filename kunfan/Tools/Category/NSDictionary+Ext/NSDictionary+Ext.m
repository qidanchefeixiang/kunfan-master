//
//  HBDictionary.m
//  hotbody
//
//  Created by Aki on 4/5/15.
//  Copyright (c) 2015 Beijing Fitcare inc. All rights reserved.
//

#import "NSDictionary+Ext.h"

@implementation NSDictionary (Ext)

- (NSString *)getString:(NSString *)key {
    id value = nilOrJSONObjectForKey(self, key);
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value stringValue];
    } else {
        return nil;
    }
}

- (NSString *)getNotNilString:(NSString *)key {
    id value = nilOrJSONObjectForKey(self, key);
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value stringValue];
    } else {
        return @"";
    }
}

- (NSNumber *)getNumber:(NSString *)key {
    id value = nilOrJSONObjectForKey(self, key);
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSString class]]) {
        return @([(NSString *)value doubleValue]);
    } else {
        return nil;
    }
}

- (NSArray *)getArray:(NSString *)key {
    id value = nilOrJSONObjectForKey(self, key);
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    } else {
        return nil;
    }
}

- (NSDictionary *)getObject:(NSString *)key {
    id value = nilOrJSONObjectForKey(self, key);
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    } else {
        return nil;
    }
}

- (BOOL)getBOOL:(NSString *)key {
    id value = nilOrJSONObjectForKey(self, key);
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *) value boolValue];
    } else if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"true"]) {
            return YES;
        } else if ([value integerValue] == 1) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

- (BOOL)hasString:(NSString *)key {
    return [self getString:key] != nil;
}

- (BOOL)hasNumber:(NSString *)key {
    return [self getNumber:key] != nil;
}

- (BOOL)hasArray:(NSString *)key {
    return [self getArray:key] != nil;
}


- (BOOL)hasObject:(NSString *)key {
    return [self getObject:key] != nil;
}

@end
