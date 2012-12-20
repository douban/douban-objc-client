//
//  DOUObject+Utils.h
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUObject.h"

@interface DOUObject (Utils)

+ (NSDate *)dateOfString:(NSString *)dateString;

+ (NSDate *)dateOfString:(NSString *)dateString dateFormat:(NSString *)dateFormatString;

@end
