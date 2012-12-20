//
//  DoubanEntryComment.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 3/23/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"


#undef _EXTERN
#undef _INITIALIZE_AS

#ifdef DOUBANENTRYCOMMENT_DEFINE_GLOBALS

#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanCommentsDefaultServiceVersion _INITIALIZE_AS(@"2.0");


@interface DoubanEntryComment : GDataEntryBase


@end
