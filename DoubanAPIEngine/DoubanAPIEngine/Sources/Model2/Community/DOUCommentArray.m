//
//  DOUCommentArray.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUCommentArray.h"
#import "DOUComment.h"

@implementation DOUCommentArray

+ (Class)objectClass {
  return [DOUComment class];
}

+ (NSString *)objectName {
  return @"comments";
}

@end
