//
//  DoubanEntryEvent.h
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"


#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANENTRYPEOPLE_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanPeoplesDefaultServiceVersion _INITIALIZE_AS(@"2.0");

@class DoubanLocation;
@class DoubanUID;
@class DoubanSignature;
@interface DoubanEntryPeople : GDataEntryBase

@property (nonatomic, readonly) DoubanLocation  *location;
@property (nonatomic, readonly) DoubanUID       *uid;
@property (nonatomic, readonly) DoubanSignature *signature;
@property (nonatomic, readonly) GDataLink       *iconLink;
@property (nonatomic, readonly) GDataLink       *homePage;


@end
