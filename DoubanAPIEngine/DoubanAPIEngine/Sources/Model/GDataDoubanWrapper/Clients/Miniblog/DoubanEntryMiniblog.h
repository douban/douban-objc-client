//
//  DoubanEntryMiniblog.h
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-9.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataEntryBase.h"


#undef _EXTERN
#undef _INITIALIZE_AS

#ifdef DOUBANENTRYMINIBLOG_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanMiniblogsDefaultServiceVersion _INITIALIZE_AS(@"2.0");


typedef enum {
  MINIBLOG_SAYING_CATEGORY,
  MINIBLOG_BOOK_CATEGORY,
  MINIBLOG_MAGAZINE_CATEGORY,
  MINIBLOG_MOVIE_CATEGORY,
  MINIBLOG_TV_CATEGORY,
  MINIBLOG_MUSIC_CATEGORY,
  
  MINIBLOG_PLACE_CATEGORY,  
  MINIBLOG_GROUP_CATEGORY,
  MINIBLOG_EVENT_CATEGORY,
  
  MINIBLOG_SITE_CATEGORY,
  MINIBLOG_RECOMMENDATION_CATEGORY,  
  
  MINIBLOG_NOTE_CATEGORY,  
  MINIBLOG_BLOG_CATEGORY,  
  MINIBLOG_PHOTO_CATEGORY,
  MINIBLOG_CONTACT_CATEGORY,
  
  MINIBLOG_PLAZA_CATEGORY,
  MINIBLOG_SIGNATURE_CATEGORY,

} MiniblogCategory;

@interface DoubanEntryMiniblog : GDataEntryBase

@property (nonatomic, readonly) MiniblogCategory miniblogCategory;

@end
