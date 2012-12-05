//
//  DOUNote.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUNote.h"
#import "DOUObject+Utils.h"

@implementation DOUNote

@dynamic identifier;
@dynamic alt;
@dynamic title;
@dynamic summary;
@dynamic content;
@dynamic privacy;

@dynamic canReply;

@dynamic updateTimeStr;
@dynamic updateTime;
@dynamic publishTimeStr;
@dynamic publishTime;

@dynamic recsCount;
@dynamic likedCount;
@dynamic commentsCount;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)alt {
  return [self.dictionary objectForKey:@"alt"];
}


- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}


- (NSString *)summary {
  return [self.dictionary objectForKey:@"summary"];
}


- (NSString *)content {
  return [self.dictionary objectForKey:@"content"];
}


- (NSString *)privacy {
  return [self.dictionary objectForKey:@"privacy"];
}


- (BOOL)canReply {
  return [[self.dictionary objectForKey:@"can_reply"] boolValue];
}


- (NSString *)updateTimeStr {
  return [self.dictionary objectForKey:@"update_time"];
}

- (NSDate *)updateTime {
  return [[self class] dateOfString:self.updateTimeStr];
}


- (NSString *)publishTimeStr {
  return [self.dictionary objectForKey:@"publish_time"];
}

- (NSDate *)publishTime {
  return [[self class] dateOfString:self.publishTimeStr];
}


- (NSInteger)recsCount {
  return [[self.dictionary objectForKey:@"recs_count"] integerValue];
}

- (NSInteger)likedCount {
  return [[self.dictionary objectForKey:@"liked_count"] integerValue];
}

- (NSInteger)commentsCount {
  return [[self.dictionary objectForKey:@"comments_count"] integerValue];
}


@end
