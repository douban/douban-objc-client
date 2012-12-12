//
//  DOUMovie.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUMovie.h"
#import "DOUObject+Utils.h"


@implementation DOUMovie

@dynamic identifier;
@dynamic title;
@dynamic originalTitle;
@dynamic stars;
@dynamic rating;

@dynamic publishTimeStr;
@dynamic publishTime;

@dynamic largeImage;
@dynamic smallImage;
@dynamic mediumImage;

@dynamic wishCount;
@dynamic collectionCount;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)originalTitle {
  return [self.dictionary objectForKey:@"orignal_title"];
}

- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}


- (NSString *)stars {
  return [self.dictionary objectForKey:@"stars"];
}


- (NSString *)rating {
  return [self.dictionary objectForKey:@"rating"];
}


- (NSString *)publishTimeStr {
  return [self.dictionary objectForKey:@"pubdate"];
}


- (NSDate *)publishTime {
  return [[self class] dateOfString:self.publishTimeStr dateFormat:@"yyyy-MM-dd"];
}


- (NSString *)largeImage {
  return [[self.dictionary objectForKey:@"images"] objectForKey:@"large"];
}

- (NSString *)smallImage {
  return [[self.dictionary objectForKey:@"images"] objectForKey:@"small"];
}

- (NSString *)mediumImage {
  return [[self.dictionary objectForKey:@"images"] objectForKey:@"medium"];
}



- (NSInteger)wishCount {
  return [[self.dictionary objectForKey:@"wish"] integerValue];
}

- (NSInteger)collectionCount {
  return [[self.dictionary objectForKey:@"collection"] integerValue];
}


@end
