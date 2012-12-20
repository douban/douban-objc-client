//
//  DouNotificationArray.m
//  DoubanAPIEngine
//
//  Created by alex zou on 12-11-6.
//  Copyright (c) 2012年 Douban Inc. All rights reserved.
//

#import "DouNotificationArray.h"
#import "DOUNotification.h"

@implementation DOUNotificationArray

+ (Class)objectClass {
  return [DOUNotification class];
}

+ (NSString *)objectName {
  return @"notifications";
}


- (NSInteger)num {
  return [[self.dictionary objectForKey:@"num"] integerValue];
}

@end
