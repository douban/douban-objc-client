//
//  DoubanEntryEvent.h
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "GDataEntryBase.h"

#import "GDataWhen.h"
#import "GDataWhere.h"


#undef _EXTERN
#undef _INITIALIZE_AS

#ifdef DOUBANEVENT_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanEventsDefaultServiceVersion _INITIALIZE_AS(@"2.0");


extern NSString * const kParticipatedStr;
extern NSString * const kWishedStr;

@class DoubanEntryEventCategory;
@class DoubanLocation;
@interface DoubanEntryEvent : GDataEntryBase


- (GDataWhere *)where;
- (void)setWhere:(GDataWhere *)obj;

- (GDataWhen *)when;
- (void)setWhen:(GDataWhen *)obj;

- (DoubanLocation *)location;
- (void)setLocation:(DoubanLocation*)obj;


- (DoubanEntryEventCategory *)eventCategory;
- (GDataLink *)imageLink;

- (NSUInteger)albumId;
- (NSInteger)participantsCount;
- (NSInteger)wishersCount;
- (NSString *)status;
- (void)setStatus:(NSString *)content;

- (float)geoLatitude;
- (float)geoLongitude;

@end
