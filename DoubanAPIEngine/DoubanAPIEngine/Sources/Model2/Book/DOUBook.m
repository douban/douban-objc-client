//
//  DOUBook.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUBook.h"
#import "DOUObject+Utils.h"
#import "SBJson.h"

@implementation DOUBook

@dynamic identifier;
@dynamic title;
@dynamic subTitle;
@dynamic rating;
@dynamic numRaters;
@dynamic average;
@dynamic ISBN10;
@dynamic ISBN13;

@dynamic publisher;
@dynamic publishDateStr;
@dynamic publishDate;

@dynamic image;
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

- (NSString *)numRaters {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"rating"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"numRaters"];
    }
}

- (NSString *)average {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"rating"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"average"];
    }
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
  return [[self class] dateOfString:[self publishDateStr] dateFormat:@"yyyy-MM"];
}


- (NSString *)image{
    return [self.dictionary objectForKey:@"image"];
}

- (NSString *)images{
    return [self.dictionary objectForKey:@"images"];
}

- (NSString *)largeImage {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"images"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"large"];
    }
}

- (NSString *)smallImage {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"images"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"small"];
    }
}

- (NSString *)mediumImage {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"images"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"medium"];
    }
}


- (NSString *)authorIntro {
  return [self.dictionary objectForKey:@"author_intro"];
}

- (NSString *)summary {
  return [self.dictionary objectForKey:@"summary"];
}


@end
