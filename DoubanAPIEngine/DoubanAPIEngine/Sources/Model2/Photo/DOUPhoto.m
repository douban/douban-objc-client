//
//  DOUPhoto.m
//  DoubanApiClient
//
//  Created by Lin GUO on 4/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUPhoto.h"
#import "DOUObject+Utils.h"
#import "DOUUser.h"

@implementation DOUPhoto

@dynamic identifier;
@dynamic alt;
@dynamic desc;
@dynamic privacy;
@dynamic createTimeStr;
@dynamic createTime;

@dynamic recsCount;
@dynamic likedCount;
@dynamic commentsCount;

@dynamic icon;
@dynamic thumb;
@dynamic cover;
@dynamic image;

@dynamic position;
@dynamic prevPhoto;
@dynamic nextPhoto;

@dynamic liked;
@dynamic author;

@dynamic albumId;
@dynamic albumTitle;

@dynamic imageSize;
@dynamic coverSize;
@dynamic thumbSize;
@dynamic iconSize;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}


- (NSString *)alt {
  return [self.dictionary objectForKey:@"alt"];
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


- (NSInteger)recsCount {
  return [[self.dictionary objectForKey:@"recs_count"] integerValue];
}

- (NSInteger)likedCount {
  return [[self.dictionary objectForKey:@"liked_count"] integerValue];
}

- (NSInteger)commentsCount {
  return [[self.dictionary objectForKey:@"comments_count"] integerValue];
}


- (void)setCommentsCount:(NSInteger)commentsCount {
  [self.dictionary setObject:[NSNumber numberWithInteger:commentsCount] forKey:@"comments_count"];
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


- (NSInteger)position {
  return [[self.dictionary objectForKey:@"position"] integerValue];
}

- (NSString *)prevPhoto {
  return [self.dictionary objectForKey:@"prev_photo"];
}

- (NSString *)nextPhoto {
  return [self.dictionary objectForKey:@"next_photo"];
}


- (DOUUser *)author {
  NSDictionary *dic = [self.dictionary objectForKey:@"author"];
  DOUUser *user = [DOUUser objectWithDictionary:dic];
  return user;
}


- (BOOL)liked {
  return [[self.dictionary objectForKey:@"liked"] boolValue];
}


- (NSString *)albumId {
  return [self.dictionary objectForKey:@"album_id"];
}


- (NSString *)albumTitle {
  return [self.dictionary objectForKey:@"album_title"];
}


- (CGSize)imageSizeFor:(NSString *)tag {
  NSDictionary *dic = [self.dictionary objectForKey:@"sizes"];
  if (dic) {
    NSArray *size = [dic objectForKey:tag];
    CGFloat width = [[size objectAtIndex:0] floatValue];
    CGFloat height = [[size objectAtIndex:1] floatValue];
    return CGSizeMake(width, height);
  }
  return CGSizeZero;
}


- (CGSize)imageSize {
  return [self imageSizeFor:@"image"];
}


- (CGSize)thumbSize {
  return [self imageSizeFor:@"thumb"];  
}


- (CGSize)coverSize {
  return [self imageSizeFor:@"cover"];  
}


- (CGSize)iconSize {
  return [self imageSizeFor:@"icon"];  
}


@end
