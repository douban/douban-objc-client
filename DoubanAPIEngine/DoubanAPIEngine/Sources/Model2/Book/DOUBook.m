//
//  DOUMovie.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBook.h"
#import "DOUObject+Utils.h"


@implementation DOUBook

@dynamic identifier;
@dynamic title;
@dynamic subTitle;
@dynamic rating;
@dynamic ISBN10;
@dynamic ISBN13;

@dynamic publisher;
@dynamic publishDateStr;
@dynamic publishDate;

@dynamic largeImage;
@dynamic smallImage;
@dynamic mediumImage;

@dynamic authorIntro;
@dynamic summary;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)subTitle {
  return [self.dictionary objectForKey:@"subtitle"];
}

- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}

- (NSString *)rating {
  return [self.dictionary objectForKey:@"rating"];
}

- (NSString *)ISBN10 {
    return [self.dictionary objectForKey:@"isbn10"];
}

- (NSString *)ISBN13 {
    return [self.dictionary objectForKey:@"isbn13"];
}

- (NSString *)publishDateStr {
    return [self.dictionary objectForKey:@"pubdate"];
}


- (NSDate *)publishDate {
    return [[self class] dateOfString:self.publishDateStr dateFormat:@"yyyy-MM"];
}


- (NSString *)largeImage {
  return [self.dictionary objectForKey:@"large"];
}

- (NSString *)smallImage {
  return [self.dictionary objectForKey:@"small"];
}

- (NSString *)mediumImage {
  return [self.dictionary objectForKey:@"medium"];
}


- (NSString *)authorIntro {
  return [self.dictionary objectForKey:@"author_intro"];
}

- (NSString *)summary {
  return [self.dictionary objectForKey:@"summary"];
}


@end
