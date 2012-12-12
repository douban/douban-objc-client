//
//  DOUBookArray.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBookArray.h"
#import "DOUBook.h"

@implementation DOUBookArray

+ (Class)objectClass {
  return [DOUBook class];
}

+ (NSString *)objectName {
  return @"books";
}


@end
