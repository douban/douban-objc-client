//
//  DoubanEntryReview.h
//  douban-objective-c
//
//  Created by py on 3/26/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"


#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANENTRYREVIEW_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanReviewsDefaultServiceVersion _INITIALIZE_AS(@"2.0");

@class GDataRating;
@interface DoubanEntryReview : GDataEntryBase

@property (nonatomic, retain) GDataRating *rating;

@end
