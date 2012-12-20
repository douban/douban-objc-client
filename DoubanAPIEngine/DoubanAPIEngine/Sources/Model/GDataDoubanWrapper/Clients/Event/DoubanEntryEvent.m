//
//  DoubanEntryEvent.m
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANENTRYEVENT_DEFINE_GLOBALS 1

#import "GDataWhen.h"
#import "GDataWhere.h"
#import "DoubanEntryEvent.h"
#import "DoubanEntryEventCategory.h"

#import "DoubanDefines.h"
#import "DoubanAttribute.h"
#import "DoubanLocation.h"
#import "GeorssPoint.h"

#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryEvent

NSString * const kParticipatedStr = @"participate";
NSString * const kWishedStr = @"wish";
NSString * const kArrivedStr = @"arrive";


static NSString * const kEventAllCategoryTerm = @"http://www.douban.com/2007#event.all";
static NSString * const kEventDramaCategoryTerm = @"http://www.douban.com/2007#event.drama";
static NSString * const kEventMusicCategoryTerm = @"http://www.douban.com/2007#event.music";
static NSString * const kEventExhibitionCategoryTerm = @"http://www.douban.com/2007#event.exhibition";
static NSString * const kEventSportsCategoryTerm = @"http://www.douban.com/2007#event.sports";
static NSString * const kEventPartyCategoryTerm = @"http://www.douban.com/2007#event.party";
static NSString * const kEventCommonwealCategoryTerm = @"http://www.douban.com/2007#event.commonweal";
static NSString * const kEventTravelCategoryTerm = @"http://www.douban.com/2007#event.travel";
static NSString * const kEventFilmCategoryTerm = @"http://www.douban.com/2007#event.film";
static NSString * const kEventSalonCategoryTerm = @"http://www.douban.com/2007#event.salon";
static NSString * const kEventOthersCategoryTerm = @"http://www.douban.com/2007#event.others";


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

@dynamic when;
@dynamic where;
@dynamic location;
@dynamic eventCategory;
@dynamic imageLink;
@dynamic imageMobileLink;
@dynamic imageLargeLink;
@dynamic iconLink;
@dynamic albumId;
@dynamic participantsCount;
@dynamic wishersCount;
@dynamic participateDate;
@dynamic status;
@dynamic geoLatitude;
@dynamic geoLongitude;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryEvent;
}


- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
								   childClasses:[DoubanAttribute class], 
                                [GDataWhere class], 
                                [GDataWhen class], 
                                [DoubanLocation class], 
                                [GeorssPoint class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanEventsDefaultServiceVersion;
}


#pragma mark - Extensions

- (NSInteger)eventId {
  return [[[self identifier] lastPathComponent] integerValue];
}

- (GDataWhen *)when {
	return [self objectForExtensionClass:[GDataWhen class]];
}


- (GDataWhere *)where {
	return [self objectForExtensionClass:[GDataWhere class]];
}


- (DoubanLocation *)location {
	return [self objectForExtensionClass:[DoubanLocation class]];
}


- (GDataLink *)imageLink {
	return [self linkWithRelAttributeValue:@"image"];
}


- (GDataLink *)imageMobileLink {
	return [self linkWithRelAttributeValue:@"image-lmobile"];
}


- (GDataLink *)imageLargeLink {
	return [self linkWithRelAttributeValue:@"image-hlarge"];
}



- (GDataLink *)iconLink {
	return [self linkWithRelAttributeValue:@"icon"];
}


- (DoubanEntryEventCategory *)eventCategory {
  NSArray *categories = [self categories];
  GDataCategory *category = [categories objectAtIndex:0];
  NSString *categoryTerm = [category term];

  DoubanEntryEventCategory *eventCategory = [[[DoubanEntryEventCategory alloc] init] autorelease];
  if  ([categoryTerm isEqualToString:kEventDramaCategoryTerm]) {
    [eventCategory setTitleWithString:kEventDramaCategoryTitle];
    [eventCategory setName:kEventDramaCategoryName];
  }
  else if ([categoryTerm isEqualToString:kEventMusicCategoryTerm]) {
    [eventCategory setTitleWithString:kEventMusicCategoryTitle];
    [eventCategory setName:kEventMusicCategoryName];  
  }
  else if ([categoryTerm isEqualToString:kEventExhibitionCategoryTerm]) {
    [eventCategory setTitleWithString:kEventExhibitionCategoryTitle];
    [eventCategory setName:kEventExhibitionCategoryName];
  }
  else if ([categoryTerm isEqualToString:kEventSportsCategoryTerm]) {
    [eventCategory setTitleWithString:kEventSportsCategoryTitle];
    [eventCategory setName:kEventSportsCategoryName];    
  }
  else if ([categoryTerm isEqualToString:kEventPartyCategoryTerm]) {
    [eventCategory setTitleWithString:kEventPartyCategoryTitle];
    [eventCategory setName:kEventPartyCategoryName];    
  }
  else if ([categoryTerm isEqualToString:kEventCommonwealCategoryTerm]) {
    [eventCategory setTitleWithString:kEventCommonwealCategoryTitle];
    [eventCategory setName:kEventCommonwealCategoryName];    
  }
  else if ([categoryTerm isEqualToString:kEventTravelCategoryTerm]) {
    [eventCategory setTitleWithString:kEventTravelCategoryTitle];
    [eventCategory setName:kEventTravelCategoryName];
  }
  else if ([categoryTerm isEqualToString:kEventFilmCategoryTerm]) {
    [eventCategory setTitleWithString:kEventFilmCategoryTitle];
    [eventCategory setName:kEventFilmCategoryName];    
  }  
  else if ([categoryTerm isEqualToString:kEventSalonCategoryTerm]) {
    [eventCategory setTitleWithString:kEventSalonCategoryTitle];
    [eventCategory setName:kEventSalonCategoryName];    
  }  
  else {
    [eventCategory setTitleWithString:kEventOthersCategoryTitle];
    [eventCategory setName:kEventOthersCategoryName];    
  }
  
  return eventCategory;
}


- (NSInteger)albumId {
	DoubanAttribute *attr = [self attributeForName:@"album"];
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)participantsCount {
	DoubanAttribute *attr = [self attributeForName:@"participants"];
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)wishersCount {
	DoubanAttribute *attr = [self attributeForName:@"wishers"];
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSDate *)participateDate {
	DoubanAttribute *attr = [self attributeForName:@"participate_date"];
	if (attr) {
		NSString *dateStr = [attr content];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

    NSDate *date = [dateFormatter dateFromString:dateStr];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval]; 
    
    return localeDate;
	}
  return nil;
}


- (void)setParticipateDate:(NSDate *)participateDate {

  NSString *content = nil;
  if (participateDate) {
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];    
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:zone];
    
    content = [dateFormatter stringFromDate:participateDate];
  }

  DoubanAttribute *attr = [self attributeForName:@"participate_date"];
  if (attr) {
    [attr setContent:content]; 
  }
  else {
    DoubanAttribute *newAttr = [[[DoubanAttribute alloc] init] autorelease];
    [newAttr setName:@"participate_date"];
    [newAttr setContent:content];
    
    NSArray *attrs = [self doubanAttributes];
    NSMutableArray *array = [NSMutableArray arrayWithArray:attrs];
    [array addObject:newAttr];
    [self setObjects:array forExtensionClass:[DoubanAttribute class]];
  }
}


- (NSString *)status {
  DoubanAttribute *attr = [self attributeForName:@"status"];
	if (attr) {
		return [attr content];
	}
  return nil;
}


- (void)setStatus:(NSString *)content {
  DoubanAttribute *attr = [self attributeForName:@"status"];
  if (attr) {
   [attr setContent:content]; 
  }
  else {
    DoubanAttribute *newAttr = [[[DoubanAttribute alloc] init] autorelease];
    [newAttr setName:@"status"];
    [newAttr setContent:content];
    
    NSArray *attrs = [self doubanAttributes];
    NSMutableArray *array = [NSMutableArray arrayWithArray:attrs];
    [array addObject:newAttr];
    [self setObjects:array forExtensionClass:[DoubanAttribute class]];
  }
}


- (float)geoLatitude {
  GeorssPoint *georssPoint = [self objectForExtensionClass:[GeorssPoint class]];
  return [georssPoint geoLatitude];
}


- (float)geoLongitude {
  GeorssPoint *georssPoint = [self objectForExtensionClass:[GeorssPoint class]];
  return [georssPoint geoLongitude];
}


@end
