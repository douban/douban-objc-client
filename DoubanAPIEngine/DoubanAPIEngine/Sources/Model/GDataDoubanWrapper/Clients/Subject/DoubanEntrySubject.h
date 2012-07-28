//
//  DoubanEntrySubject.h
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
#ifdef DOUBANENTRYSUBJECT_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanSubjectsDefaultServiceVersion _INITIALIZE_AS(@"2.0");


@interface DoubanEntrySubject : GDataEntryBase

@property (nonatomic, retain) GDataRating  *rating;
@property (nonatomic, retain) NSArray      *tags;

@property (nonatomic, readonly) GDataLink  *imageLink;
@property (nonatomic, readonly) NSString   *publisher; 
@property (nonatomic, readonly) NSString   *publishDate;
@property (nonatomic, readonly) NSString   *isbn;
@property (nonatomic, readonly) NSString   *price;
@property (nonatomic, readonly) NSArray    *translators;

- (void)addTag:(DoubanTag *)obj;

@end

