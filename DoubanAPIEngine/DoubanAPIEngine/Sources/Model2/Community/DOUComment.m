//
//  DOUComment.m
//  DoubanApiClient
//
//  Created by Lin GUO on 5/19/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUComment.h"
#import "DOUUser.h"
#import "DOUObject+Utils.h"


@implementation DOUComment

@dynamic identifier;
@dynamic content;
@dynamic createTimeStr;
@dynamic createTime;

@dynamic author;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}


- (NSString *)content {
  return [self.dictionary objectForKey:@"content"];
}


- (NSString *)createTimeStr {
  return [self.dictionary objectForKey:@"created"];
}

- (NSDate *)createTime {
  return [[self class] dateOfString:self.createTimeStr];
}


- (DOUUser *)author {
  NSDictionary *dic = [self.dictionary objectForKey:@"author"];
  DOUUser *user = [DOUUser objectWithDictionary:dic];
  return user;
}


@end
