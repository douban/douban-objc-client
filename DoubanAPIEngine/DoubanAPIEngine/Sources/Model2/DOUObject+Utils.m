//
//  DOUObject+Utils.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject+Utils.h"

@implementation DOUObject (Utils)

+ (NSDate *)dateOfString:(NSString *)dateString {
  return [self dateOfString:dateString dateFormat:@"yyyy-MM-dd HH:mm:SS"];
}

+ (NSDate *)dateOfString:(NSString *)dateString dateFormat:(NSString *)dateFormatString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:dateFormatString];
    NSDate *date = [dateFormat dateFromString:dateString];
    [dateFormat release];
    return date;
}

@end
