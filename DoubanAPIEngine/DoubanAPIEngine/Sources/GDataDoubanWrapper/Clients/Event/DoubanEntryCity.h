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

#ifdef DOUBANCITY_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanCityDefaultServiceVersion _INITIALIZE_AS(@"2.0");

@interface DoubanEntryCity : GDataEntryBase

+ (NSDictionary *)citiesNamespaces;
+ (DoubanEntryCity *)cityEntry;


- (NSString *)cityName;
- (BOOL)isHabitable;

@end
