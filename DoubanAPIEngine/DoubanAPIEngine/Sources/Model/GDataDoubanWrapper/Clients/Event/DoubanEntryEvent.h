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

#ifdef DOUBANENTRYEVENT_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanEventsDefaultServiceVersion _INITIALIZE_AS(@"2.0");


extern NSString * const kParticipatedStr;
extern NSString * const kWishedStr;
extern NSString * const kArrivedStr;


@class DoubanEntryEventCategory;
@class DoubanLocation;
@class GDataWhere;
@class GDataWhen;
@interface DoubanEntryEvent : GDataEntryBase

@property (nonatomic, readonly) NSInteger  eventId;
@property (nonatomic, readonly) GDataWhere *where;
@property (nonatomic, readonly) GDataWhen  *when;
@property (nonatomic, readonly) DoubanLocation *location;
@property (nonatomic, readonly) DoubanEntryEventCategory *eventCategory;
@property (nonatomic, readonly) GDataLink   *imageLink;
@property (nonatomic, readonly) GDataLink   *imageMobileLink;
@property (nonatomic, readonly) GDataLink   *imageLargeLink;
@property (nonatomic, readonly) GDataLink   *iconLink;
@property (nonatomic, readonly) NSInteger   albumId;

@property (nonatomic, readonly) NSInteger   participantsCount;
@property (nonatomic, readonly) NSInteger   wishersCount;
@property (nonatomic, retain)   NSDate      *participateDate;
@property (nonatomic, copy)     NSString    *status;

@property (nonatomic, readonly) float       geoLatitude;
@property (nonatomic, readonly) float       geoLongitude;


@end
