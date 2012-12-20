//
//  DOUNotification.m
//  DoubanAPIEngine
//
//  Created by alex zou on 12-11-6.
//  Copyright (c) 2012年 Douban Inc. All rights reserved.
//

#import "DOUNotification.h"
#import "DOUObject+Utils.h"


@implementation DOUNotification

@dynamic count;
@dynamic containerTitle;
@dynamic containerId;
@dynamic targetId;
@dynamic targetType;
@dynamic time;
@dynamic timeStr;
@dynamic type;
@dynamic identifier;
@dynamic cate;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSInteger)count {
  return [[self.dictionary objectForKey:@"count"] integerValue];
}


- (NSString *)containerTitle {
  return [self.dictionary objectForKey:@"container_title"];
}

- (NSString *)containerId {
  return [self.dictionary objectForKey:@"container_id"];
}


- (NSString *)targetId {
  return [self.dictionary objectForKey:@"target_id"];
}

- (NSString *)targetType {
  return [self.dictionary objectForKey:@"target_type"];
}

- (NSString *)targetTitle {
  return [self.dictionary objectForKey:@"target_title"];
}

- (NSString *)targetIcon {
  return [self.dictionary objectForKey:@"target_icon"];
}


- (NSString *)timeStr {
  return [self.dictionary objectForKey:@"time"];
}

- (NSDate *)time {
  return [[self class] dateOfString:self.timeStr];
}


-(NSString *)type {
  return [self.dictionary objectForKey:@"type"];
}


-(NSString *)cate {
  return [self.dictionary objectForKey:@"cate"];
}


- (BOOL)isEqual:(id)object {
  if (self == object) {
    return YES;
  }
  if ([object isKindOfClass:[self class]]) {
    if (![[self identifier] isEqualToString:[(DOUNotification *)object identifier]])
      return NO;
    
    return YES;
  }
  return NO;
}


- (NSUInteger)hash {
  return [[self identifier] hash];
}


@end
