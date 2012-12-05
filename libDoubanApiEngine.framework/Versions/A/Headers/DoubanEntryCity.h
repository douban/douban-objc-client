//
//  DoubanEntryCity.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-27.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"

#undef _EXTERN
#undef _INITIALIZE_AS

#ifdef DOUBANENTRYCITY_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanCityDefaultServiceVersion _INITIALIZE_AS(@"2.0");


@class DoubanUID;
@interface DoubanEntryCity : GDataEntryBase

@property (nonatomic, copy) NSString  *name;
@property (nonatomic, copy) NSString  *uid;
@property (nonatomic, readonly) BOOL  isHabitable;

@end
