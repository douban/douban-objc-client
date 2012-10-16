//
//  DOUEventArray.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUEventArray.h"
#import "DOUEvent.h"

@implementation DOUEventArray

+ (Class)objectClass {
  return [DOUEvent class];
}

+ (NSString *)objectName {
  return @"events";
}

@end
