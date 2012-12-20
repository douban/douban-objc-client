//
//  DoubanEntryEventCategory.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-26.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"

#undef _EXTERN
#undef _INITIALIZE_AS

#ifdef DOUBANEVENTCATEGORY_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanEventCategoriesDefaultServiceVersion _INITIALIZE_AS(@"2.0");


@interface DoubanEntryEventCategory : GDataEntryBase

extern NSString * const kEventAllCategoryTitle;
extern NSString * const kEventDramaCategoryTitle;
extern NSString * const kEventMusicCategoryTitle;
extern NSString * const kEventExhibitionCategoryTitle;
extern NSString * const kEventSportsCategoryTitle;
extern NSString * const kEventPartyCategoryTitle;
extern NSString * const kEventCommonwealCategoryTitle;
extern NSString * const kEventTravelCategoryTitle;
extern NSString * const kEventFilmCategoryTitle;
extern NSString * const kEventSalonCategoryTitle;
extern NSString * const kEventOthersCategoryTitle;


@property (nonatomic, readonly) NSInteger eventsCount;
@property (nonatomic, copy)     NSString  *name;
@property (nonatomic, readonly) GDataLink *coverLink;

@end
