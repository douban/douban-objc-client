//
//  DoubanEntryEvent.h
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GDataEntryBase.h"

#import "GDataWhen.h"
#import "GDataWhere.h"
#import "DoubanLocation.h"
#import "DoubanAttribute.h"

#undef _EXTERN
#undef _INITIALIZE_AS
#ifdef DOUBANEVENTS_DEFINE_GLOBALS
#define _EXTERN
#define _INITIALIZE_AS(x) =x
#else
#define _EXTERN extern
#define _INITIALIZE_AS(x)
#endif

_EXTERN NSString* const kDoubanEventsDefaultServiceVersion _INITIALIZE_AS(@"2.0");


typedef enum {
  MUSIC_CATEGORY,
  FILM_CATEGORY,
  SALON_CATEGORY,
  TRAVEL_CATEGORY,
  EXHIBITION_CATEGORY
} EventCategory;

@interface DoubanEntryEvent : GDataEntryBase

+ (NSDictionary *)eventsNamespaces;

+ (DoubanEntryEvent *)eventEntry;

- (GDataWhere *)where;
- (void)setWhere:(GDataWhere *)obj;

- (GDataWhen *)when;
- (void)setWhen:(GDataWhen *)obj;

- (DoubanLocation *)location;
- (void)setLocation:(DoubanLocation*)obj;

- (NSArray *)attributes;
- (void)setAttributes:(NSArray *)attr;
- (void)addAttribute:(DoubanAttribute *)obj;

- (EventCategory)eventCategory;

- (GDataLink *)imageLink;

- (NSInteger)participants;

@end
