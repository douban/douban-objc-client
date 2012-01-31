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

- (NSInteger)eventCount;

- (NSString *)eventCateogryName;

- (void)setEventCateogryName:(NSString *)content;

- (NSString *)suggestCoverImage;

@end
