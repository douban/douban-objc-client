//
//  DOUOnline.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUOnline.h"
#import "DOUUser.h"
#import "DOUObject+Utils.h"


@implementation DOUOnline

@dynamic identifier;
@dynamic alt;
@dynamic title;
@dynamic desc;
@dynamic tags;

@dynamic createTimeStr;
@dynamic createTime;
@dynamic beginTimeStr;
@dynamic beginTime;
@dynamic endTimeStr;
@dynamic endTime;

@dynamic relatedUrl;
@dynamic topic;
@dynamic cascadeInvite;
@dynamic groupId;
@dynamic albumId;

@dynamic participantCount;
@dynamic photoCount;
@dynamic likedCount;
@dynamic recsCount;

@dynamic icon;
@dynamic thumb;
@dynamic cover;
@dynamic image;

@dynamic owner;

@dynamic liked;
@dynamic participated;


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


- (NSArray *)tags {
  return [self.dictionary objectForKey:@"tags"];
}


- (NSString *)createTimeStr {
  return [self.dictionary objectForKey:@"create_time"];
}


- (NSDate *)createTime {
  return [[self class] dateOfString:self.createTimeStr];
}


- (NSString *)beginTimeStr {
  return [self.dictionary objectForKey:@"begin_time"];
}


- (NSDate *)beginTime {
  return [[self class] dateOfString:self.beginTimeStr];
}


- (NSString *)endTimeStr {
  return [self.dictionary objectForKey:@"end_time"];
}


- (NSDate *)endTime {
  return [[self class] dateOfString:self.endTimeStr];
}


- (NSString *)relatedUrl {
  return [self.dictionary objectForKey:@"related_url"];
}


- (NSString *)topic {
  return [self.dictionary objectForKey:@"shuo_topic"];
}

- (BOOL)cascadeInvite {
  return [[self.dictionary objectForKey:@"cascade_invite"] boolValue];
}


- (NSString *)groupId {
  return [self.dictionary objectForKey:@"group_id"];
}


- (NSString *)albumId {
  return [self.dictionary objectForKey:@"album_id"];
}


- (NSInteger)participantCount {
  return [[self.dictionary objectForKey:@"participant_count"] integerValue];
}


- (NSInteger)photoCount {
  return [[self.dictionary objectForKey:@"photo_count"] integerValue];
}


- (NSInteger)likedCount {
  return  [[self.dictionary objectForKey:@"liked_count"] integerValue];
}


- (NSInteger)recsCount {
  return  [[self.dictionary objectForKey:@"recs_count"] integerValue];
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


- (DOUUser *)owner {
  NSDictionary *dic = [self.dictionary objectForKey:@"owner"];
  DOUUser *user = [DOUUser objectWithDictionary:dic];
  return user;
}


- (BOOL)liked {
  return [[self.dictionary objectForKey:@"liked"] boolValue];
}


- (BOOL)participated {
  return [[self.dictionary objectForKey:@"participated"] boolValue];
}


- (void)setParticipated:(BOOL)participated {
  [self.dictionary setValue:[NSNumber numberWithBool:participated] forKey:@"participated"];
}

@end
