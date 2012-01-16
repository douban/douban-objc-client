//
//  DoubanEntryEvent.m
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANEVENTS_DEFINE_GLOBALS 1

#import "DoubanEntryEvent.h"
#import "DoubanEntryEventCategory.h"

#import "DoubanDefines.h"
#import "DoubanAttribute.h"
#import "DoubanLocation.h"
#import "GeorssPoint.h"

#import "GDateEntryBase+Extension.h"


@implementation DoubanEntryEvent

NSString * const kParticipatedStr = @"participate";
NSString * const kWishedStr = @"wish";


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


static NSString * const kEventAllCategoryTitle = @"all";
static NSString * const kEventDramaCategoryTitle = @"drama";
static NSString * const kEventMusicCategoryTitle = @"music";
static NSString * const kEventExhibitionCategoryTitle = @"exhibition";
static NSString * const kEventSportsCategoryTitle = @"sports";
static NSString * const kEventPartyCategoryTitle = @"party";
static NSString * const kEventCommonwealCategoryTitle = @"commonweal";
static NSString * const kEventTravelCategoryTitle = @"travel";
static NSString * const kEventFilmCategoryTitle = @"film";
static NSString * const kEventSalonCategoryTitle = @"salon";
static NSString * const kEventOthersCategoryTitle = @"others";


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

- (GDataWhen *)when {
	return [self objectForExtensionClass:[GDataWhen class]];
}


- (void)setWhen:(GDataWhen *)obj {
	[self setObject:obj forExtensionClass:[GDataWhen class]];
}


- (GDataWhere *)where {
	return [self objectForExtensionClass:[GDataWhere class]];
}


- (void)setWhere:(GDataWhere *)obj {
	[self setObject:obj forExtensionClass:[GDataWhere class]];
}


- (DoubanLocation *)location {
	return [self objectForExtensionClass:[DoubanLocation class]];
}


- (void)setLocation:(DoubanLocation *)obj {
	[self setObject:obj forExtensionClass:[DoubanLocation class]];
}


- (GDataLink *)imageLink {
	return [self linkWithRelAttributeValue:@"image"];
}


- (DoubanEntryEventCategory *)eventCategory {
  NSArray *categories = [self categories];
  GDataCategory *category = [categories objectAtIndex:0];
  NSString *categoryTerm = [category term];

  DoubanEntryEventCategory *eventCategory = [[[DoubanEntryEventCategory alloc] init] autorelease];
  if  ([categoryTerm isEqualToString:kEventDramaCategoryTerm]) {
    [eventCategory setTitleWithString:kEventDramaCategoryTitle];
    [eventCategory setEventCateogryName:kEventDramaCategoryName];
  }
  else if ([categoryTerm isEqualToString:kEventMusicCategoryTerm]) {
    [eventCategory setTitleWithString:kEventMusicCategoryTitle];
    [eventCategory setEventCateogryName:kEventMusicCategoryName];  
  }
  else if ([categoryTerm isEqualToString:kEventExhibitionCategoryTerm]) {
    [eventCategory setTitleWithString:kEventExhibitionCategoryTitle];
    [eventCategory setEventCateogryName:kEventExhibitionCategoryName];
  }
  else if ([categoryTerm isEqualToString:kEventSportsCategoryTerm]) {
    [eventCategory setTitleWithString:kEventSportsCategoryTitle];
    [eventCategory setEventCateogryName:kEventSportsCategoryName];    
  }
  else if ([categoryTerm isEqualToString:kEventPartyCategoryTerm]) {
    [eventCategory setTitleWithString:kEventPartyCategoryTitle];
    [eventCategory setEventCateogryName:kEventPartyCategoryName];    
  }
  else if ([categoryTerm isEqualToString:kEventCommonwealCategoryTerm]) {
    [eventCategory setTitleWithString:kEventCommonwealCategoryTitle];
    [eventCategory setEventCateogryName:kEventCommonwealCategoryName];    
  }
  else if ([categoryTerm isEqualToString:kEventTravelCategoryTerm]) {
    [eventCategory setTitleWithString:kEventTravelCategoryTitle];
    [eventCategory setEventCateogryName:kEventTravelCategoryName];
  }
  else if ([categoryTerm isEqualToString:kEventFilmCategoryTerm]) {
    [eventCategory setTitleWithString:kEventFilmCategoryTitle];
    [eventCategory setEventCateogryName:kEventFilmCategoryName];    
  }  
  else if ([categoryTerm isEqualToString:kEventSalonCategoryTerm]) {
    [eventCategory setTitleWithString:kEventSalonCategoryTitle];
    [eventCategory setEventCateogryName:kEventSalonCategoryName];    
  }  
  else {
    [eventCategory setTitleWithString:kEventOthersCategoryTitle];
    [eventCategory setEventCateogryName:kEventOthersCategoryName];    
  }
  
  return eventCategory;
}


- (NSUInteger)albumId {
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


- (NSString *)status {
  DoubanAttribute *attr = [self attributeForName:@"status"];
	if (attr) {
		return [attr content];
	}
  return nil;
}


- (void)setStatus:(NSString *)content {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"status"];
  [attr setContent:content];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
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
