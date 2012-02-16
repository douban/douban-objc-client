//
//  DoubanEntryEventCategory.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-26.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANEVENTCATEGORY_DEFINE_GLOBALS 1

#import "DoubanEntryEventCategory.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"

#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryEventCategory


NSString * const kEventAllCategoryTitle = @"all";
NSString * const kEventDramaCategoryTitle = @"drama";
NSString * const kEventMusicCategoryTitle = @"music";
NSString * const kEventExhibitionCategoryTitle = @"exhibition";
NSString * const kEventSportsCategoryTitle = @"sports";
NSString * const kEventPartyCategoryTitle = @"party";
NSString * const kEventCommonwealCategoryTitle = @"commonweal";
NSString * const kEventTravelCategoryTitle = @"travel";
NSString * const kEventFilmCategoryTitle = @"film";
NSString * const kEventSalonCategoryTitle = @"salon";
NSString * const kEventOthersCategoryTitle = @"others";


@dynamic eventsCount;
@dynamic name;
@dynamic coverLink;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryEventCategory;
}


- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];	
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanEventCategoriesDefaultServiceVersion;
}


#pragma mark - Extensions

- (NSInteger)eventsCount {
	DoubanAttribute *attr = [self attributeForName:@"event_count"];
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSString *)name {
  DoubanAttribute *attr = [self attributeForName:@"cname"];
	if (attr) {
		return [attr content];
	}
  return nil;
}


- (void)setName:(NSString *)content {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"cname"];
  [attr setContent:content];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}


- (GDataLink *)coverLink {
	return [self linkWithRelAttributeValue:@"event"];
}


@end
