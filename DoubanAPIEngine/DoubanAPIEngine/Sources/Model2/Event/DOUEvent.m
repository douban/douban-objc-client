//
//  DOUEvent.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 4/25/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUEvent.h"
#import "DOUUser.h"
#import "DOUObject+Utils.h"


@implementation DOUEvent

NSString * const kParticipatedStatus = @"participate";
NSString * const kWishedStatus = @"wish";
NSString * const kArrivedStatus = @"arrive";

static NSString * const kEventAllCategory = @"all";
static NSString * const kEventDramaCategory = @"drama";
static NSString * const kEventMusicCategory = @"music";
static NSString * const kEventExhibitionCategory = @"exhibition";
static NSString * const kEventSportsCategory = @"sports";
static NSString * const kEventPartyCategory = @"party";
static NSString * const kEventCommonwealCategory = @"commonweal";
static NSString * const kEventTravelCategory = @"travel";
static NSString * const kEventFilmCategory = @"film";
static NSString * const kEventSalonCategory = @"salon";
static NSString * const kEventOthersCategory = @"others";

static NSString * const kEventAllCategoryName = @"类型";
static NSString * const kEventDramaCategoryName = @"戏剧/曲艺";
static NSString * const kEventMusicCategoryName = @"音乐/演出";
static NSString * const kEventExhibitionCategoryName = @"展览";
static NSString * const kEventSportsCategoryName = @"体育";
static NSString * const kEventPartyCategoryName = @"生活/聚会";
static NSString * const kEventCommonwealCategoryName = @"公益";
static NSString * const kEventTravelCategoryName = @"旅行";
static NSString * const kEventFilmCategoryName = @"电影";
static NSString * const kEventSalonCategoryName = @"讲座/沙龙";
static NSString * const kEventOthersCategoryName = @"其他";


@dynamic identifier;
@dynamic alt;
@dynamic title;
@dynamic content;

@dynamic beginTimeStr;
@dynamic beginTime;
@dynamic endTimeStr;
@dynamic endTime;
@dynamic category;
@dynamic categoryName;
@dynamic adaptUrl;
@dynamic albumId;

@dynamic participantCount;
@dynamic wisherCount;

@dynamic locId;
@dynamic locName;
@dynamic address;

@dynamic imageMobile;
@dynamic imageLarge;
@dynamic image;
@dynamic icon;

@dynamic owner;

@dynamic participateDateStr;
@dynamic participateDate;

@dynamic status;

@dynamic lat;
@dynamic lng;


- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)alt {
  return [self.dictionary objectForKey:@"alt"];
}


- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}


- (NSString *)content {
  return [self.dictionary objectForKey:@"content"];
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


- (NSString *)category {
  return [self.dictionary objectForKey:@"category"];
}


- (NSString *)categoryName {
  NSString *category = self.category;
  NSString *categoryName = kEventAllCategoryName;
  
  if  ([category isEqualToString:kEventDramaCategory]) {
    categoryName = kEventDramaCategoryName;
  }
  else if ([category isEqualToString:kEventMusicCategory]) {
    categoryName = kEventMusicCategoryName;    
  }
  else if ([category isEqualToString:kEventExhibitionCategory]) {
    categoryName = kEventExhibitionCategoryName;
  }
  else if ([category isEqualToString:kEventSportsCategory]) {
    categoryName = kEventSportsCategoryName;
  }
  else if ([category isEqualToString:kEventPartyCategory]) {
    categoryName = kEventPartyCategoryName;
  }
  else if ([category isEqualToString:kEventCommonwealCategory]) {
    categoryName = kEventCommonwealCategoryName;
  }
  else if ([category isEqualToString:kEventTravelCategory]) {
    categoryName = kEventTravelCategoryName;
  }
  else if ([category isEqualToString:kEventFilmCategory]) {
    categoryName = kEventFilmCategoryName;
  }  
  else if ([category isEqualToString:kEventSalonCategory]) {
    categoryName = kEventSalonCategoryName;
  }  
  
  return categoryName;
}


- (NSString *)adaptUrl {
  return [self.dictionary objectForKey:@"adapt_url"];
}


- (NSString *)albumId {
  return [self.dictionary objectForKey:@"album"];
}


- (NSInteger)participantCount {
  return [[self.dictionary objectForKey:@"participant_count"] integerValue];
}


- (NSInteger)wisherCount {
  return [[self.dictionary objectForKey:@"wisher_count"] integerValue];
}


- (NSString *)locId {
  return [self.dictionary objectForKey:@"loc_id"];
}


- (NSString *)locName {
  return [self.dictionary objectForKey:@"loc_name"];
}


- (NSString *)address {
  return [self.dictionary objectForKey:@"address"];
}


- (NSString *)icon {
  return  [self.dictionary objectForKey:@"icon"];
}


- (NSString *)image {
  return [self.dictionary objectForKey:@"image"];
}


- (NSString *)imageMobile {
  return [self.dictionary objectForKey:@"image_lmobile"];
}


- (NSString *)imageLarge {
  return [self.dictionary objectForKey:@"image_hlarge"];
}


- (NSString *)status {
  return [self.dictionary objectForKey:@"status"];
}


- (void)setStatus:(NSString *)status {
  return [self.dictionary setValue:status forKey:@"status"];
}


- (NSString *)participateDateStr {
  return [self.dictionary objectForKey:@"participate_date"];
}


- (void)setParticipateDateStr:(NSString *)participateDateStr {
  return [self.dictionary setValue:participateDateStr forKey:@"participate_date"];
}


- (NSDate *)participateDate {
  if (!self.participateDateStr) {
    return nil;
  }
  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
  [dateFormat setDateFormat:@"yyyy-MM-dd"];
  NSDate *date = [dateFormat dateFromString:self.participateDateStr];
  [dateFormat release];
  return date;
}


- (DOUUser *)owner {
  NSDictionary *dic = [self.dictionary objectForKey:@"owner"];
  DOUUser *user = [DOUUser objectWithDictionary:dic];
  return user;
}


- (float)lat {
  NSString *geo = [self.dictionary objectForKey:@"geo"];
  if (geo) {
    NSArray *words = [geo componentsSeparatedByString:@" "];
    if ([words count] == 2 && [words objectAtIndex:0]) {
      NSString *str = [words objectAtIndex:0];
      return [str floatValue];
    }
  }
  return 0;
}


- (float)lng {
  NSString *geo = [self.dictionary objectForKey:@"geo"];
  if (geo) {
    NSArray *words = [geo componentsSeparatedByString:@" "];
    if ([words count] == 2 && [words objectAtIndex:1]) {
      NSString *str = [words objectAtIndex:1];
      return [str floatValue];
    }
  }
  return 0;
}


@end
