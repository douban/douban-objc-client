//
//  DOULocArray.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 9/7/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOULocArray.h"
#import "DOULoc.h"

@implementation DOULocArray

+ (Class)objectClass {
  return [DOULoc class];
}

+ (NSString *)objectName {
  return @"locs";
}

@end
