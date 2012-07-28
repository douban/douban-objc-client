//
//  DOUOnlineArray.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUOnlineArray.h"
#import "DOUOnline.h"

@implementation DOUOnlineArray


+ (Class)objectClass {
  return [DOUOnline class];
}

+ (NSString *)objectName {
  return @"onlines";
}

@end
