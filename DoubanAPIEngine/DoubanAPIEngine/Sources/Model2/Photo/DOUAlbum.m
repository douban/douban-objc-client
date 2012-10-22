//
//  DOUAlbum.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUAlbum.h"
#import "DOUObject+Utils.h"
#import "DOUUser.h"


@implementation DOUAlbum

@dynamic identifier;
@dynamic alt;
@dynamic title;
@dynamic desc;
@dynamic privacy;

@dynamic createTimeStr;
@dynamic createTime;
@dynamic updateTimeStr;
@dynamic updateTime;

@dynamic size;
@dynamic recsCount;
@dynamic likedCount;

@dynamic icon;
@dynamic thumb;
@dynamic cover;
@dynamic image;

@dynamic liked;
@dynamic author;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)alt {
  return [self.dictionary objectForKey:@"alt"];
}

- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}

- (NSString *)desc {
  return [self.dictionary objectForKey:@"desc"];
}

- (NSString *)privacy {
  return [self.dictionary objectForKey:@"privacy"];
}


- (NSString *)createTimeStr {
  return [self.dictionary objectForKey:@"created"];
}

- (NSDate *)createTime {
  return [[self class] dateOfString:self.createTimeStr];
}

- (NSString *)updateTimeStr {
  return [self.dictionary objectForKey:@"updated"];
}

- (NSDate *)updateTime {
  return [[self class] dateOfString:self.updateTimeStr];
}


- (NSInteger)recsCount {
  return [[self.dictionary objectForKey:@"recs_count"] integerValue];
}

- (NSInteger)likedCount {
  return [[self.dictionary objectForKey:@"liked_count"] integerValue];
}

- (NSInteger)size {
  return [[self.dictionary objectForKey:@"size"] integerValue];
}


- (NSString *)icon {
  return  [self.dictionary objectForKey:@"icon"];
}

- (NSString *)thumb {
  return [self.dictionary objectForKey:@"thumb"];
}

- (NSString *)cover {
  return  [self.dictionary objectForKey:@"cover"];
}

- (NSString *)image {
  return [self.dictionary objectForKey:@"image"];
}


- (DOUUser *)author {
  NSDictionary *dic = [self.dictionary objectForKey:@"author"];
  DOUUser *people = [DOUUser objectWithDictionary:dic];
  return people;
}


- (BOOL)liked {
  return [[self.dictionary objectForKey:@"liked"] boolValue];
}


@end
