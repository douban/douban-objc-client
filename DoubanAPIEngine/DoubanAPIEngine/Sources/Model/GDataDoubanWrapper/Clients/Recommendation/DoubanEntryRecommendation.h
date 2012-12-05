//
//  DoubanEntryRecommendation.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataEntryBase.h"


#undef _EXTERN
#undef _INITIALIZE_AS

#ifdef DOUBANENTRYRECOMMENDATION_DEFINE_GLOBALS

#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanRecommendationsDefaultServiceVersion _INITIALIZE_AS(@"2.0");

@interface DoubanEntryRecommendation : GDataEntryBase

@property (nonatomic, readonly) NSString *category;
@property (nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) NSInteger commentsCount;

@end
