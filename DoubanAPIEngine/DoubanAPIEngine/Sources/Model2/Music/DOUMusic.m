//
//  DOUMusic.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUMusic.h"
#import "DOUObject+Utils.h"


@implementation DOUMusic

@dynamic identifier;
@dynamic title;
@dynamic altTitle;
@dynamic rating;

@dynamic publisher;

@dynamic publishDateStr;
@dynamic publishDate;

@dynamic image;

- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)altTitle {
  return [self.dictionary objectForKey:@"alt_title"];
}

- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}


- (NSString *)publisher {
  return [[[self.dictionary objectForKey:@"attrs"] objectForKey:@"publisher"] objectAtIndex:0];
}


- (NSString *)rating {
  return [[self.dictionary objectForKey:@"rating"] objectForKey:@"average"];
}


- (NSString *)publishDateStr {
  return [[[self.dictionary objectForKey:@"attrs"] objectForKey:@"pubdate"] objectAtIndex:0];
}


- (NSDate *)publishDate {
  return [[self class] dateOfString:self.publishDateStr dateFormat:@"yyyy-MM-dd"];
}


- (NSString *)image {
  return [self.dictionary objectForKey:@"image"];
}


@end
