//
//  DoubanEntryMovie.h
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-4.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


#import "GDataEntryBase.h"
#import "GDataValueConstruct.h"

#import "GDataRating.h"

#import "DoubanAttribute.h"
#import "DoubanTag.h"


#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANSUJECT_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanSubjectsDefaultServiceVersion _INITIALIZE_AS(@"2.0");

_EXTERN NSString* const kDoubanBooksFeed  _INITIALIZE_AS(@"http://api.douban.com/book/subjects");
_EXTERN NSString* const kDoubanChartBooksFeed  _INITIALIZE_AS(@"http://api.douban.com/book/chart");
_EXTERN NSString* const kDoubanMoviesFeed _INITIALIZE_AS(@"http://api.douban.com/movie/subjects");
_EXTERN NSString* const kDoubanMusicsFeed _INITIALIZE_AS(@"http://api.douban.com/music/subjects");


@interface DoubanEntrySubject : GDataEntryBase

+ (NSDictionary *)subjectsNamespaces;

+ (DoubanEntrySubject *)subjectEntry;

// extensions

- (GDataRating *)rating;
- (void)setRating:(GDataRating *)obj;

- (NSArray *)attributes;
- (void)setAttributes:(NSArray *)attr;
- (void)addAttribute:(DoubanAttribute *)obj;

- (NSArray *)tags;
- (void)setTags:(NSArray *)tags;
- (void)addTag:(DoubanTag *)obj;

- (GDataLink *)imageLink;

- (NSString*) publisher;
- (NSString*) publishDate;
- (NSString*) isbn;
- (NSString*) price;
//- (NSArray*) authors;
- (NSArray*) translators;


@end

