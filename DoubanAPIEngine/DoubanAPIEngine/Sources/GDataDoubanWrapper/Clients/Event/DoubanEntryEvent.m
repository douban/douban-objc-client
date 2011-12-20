//
//  DoubanEntryEvent.m
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANEVENTS_DEFINE_GLOBALS 1

#import "DoubanEntryEvent.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"
#import "GeorssPoint.h"

@implementation DoubanEntryEvent

NSString * const kParticipatedStr = @"participate";
NSString * const kWishedStr = @"wish";


static NSString * const kEventTravelCategoryTerm = @"http://www.douban.com/2007#event.travel";
static NSString * const kEventSalonCategoryTerm = @"http://www.douban.com/2007#event.salon";
static NSString * const kEventMusicCategoryTerm = @"http://www.douban.com/2007#event.music";
static NSString * const kEventFilmCategoryTerm = @"http://www.douban.com/2007#event.film";
static NSString * const kEventExhibitionCategoryTerm = @"http://www.douban.com/2007#event.exhibition";


+ (NSDictionary *)eventsNamespaces {
	
	NSMutableDictionary *namespaces;
	
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
	
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	
	return namespaces;
}

+ (DoubanEntryEvent *)eventEntry {
	
	DoubanEntryEvent *obj;
	obj = [[[self alloc] init] autorelease];
	
	[obj setNamespaces:[DoubanEntryEvent eventsNamespaces]];
	
	return obj;
}


+ (NSString *)standardEntryKind {
	return kDoubanCategoryEvent;
}

+ (void)load {
	[self registerEntryClass];
}

- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];
	
	Class entryClass = [self class];
	
	[self addExtensionDeclarationForParentClass:entryClass
								   childClasses:[DoubanAttribute class], 
                                [GDataWhere class], 
                                [GDataWhen class], 
                                [DoubanLocation class], 
                                [GeorssPoint class], nil];
}


- (NSMutableArray *)itemsForDescription {
	NSMutableArray *items = [super itemsForDescription];
	return items;
}


+ (NSString *)defaultServiceVersion {
	return kDoubanEventsDefaultServiceVersion;
}


#pragma mark -
#pragma mark Extensions
- (GDataWhen *)when {
	return [self objectForExtensionClass:[GDataWhen class]];
}

- (void)setWhen:(GDataWhen *)obj {
	[self setObject:obj forExtensionClass:[GDataWhen class]];
}


- (GDataWhere *)where {
	return [self objectForExtensionClass:[GDataWhere class]];
}

- (void)setWhere:(GDataWhere *)obj {
	[self setObject:obj forExtensionClass:[GDataWhere class]];
}


- (DoubanLocation *)location {
	return [self objectForExtensionClass:[DoubanLocation class]];
}

- (void)setLocation:(DoubanLocation *)obj {
	[self setObject:obj forExtensionClass:[DoubanLocation class]];
}

- (GDataLink *)imageLink {
	return [self linkWithRelAttributeValue:@"image"];
}

- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}

- (EventCategory)eventCategory {
  NSArray *categories = [self categories];
  GDataCategory *category = [categories objectAtIndex:0];
  NSString *categoryTerm = [category term];

  if ([categoryTerm isEqualToString:kEventTravelCategoryTerm]) {
    return EVENT_TRAVEL_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kEventSalonCategoryTerm]) {
    return EVENT_SALON_CATEGORY;
  }
  else if ([categoryTerm isEqualToString:kEventMusicCategoryTerm]) {
    return EVENT_MUSIC_CATEGORY;
  }  
  else if ([categoryTerm isEqualToString:kEventExhibitionCategoryTerm]) {
    return EVENT_EXHIBITION_CATEGORY;
  }
  else {
    return EVENT_FILM_CATEGORY;
  }
}


- (NSUInteger)albumId {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"album"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}

- (NSInteger)participantsCount {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"participants"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)wishersCount {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"wishers"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}

- (NSString *)status {
  DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"status"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [attr content];
	}
  return nil;
}

- (void)setStatus:(NSString *)content {
  DoubanAttribute *attr = [[DoubanAttribute alloc] init];
  [attr setName:@"status"];
  [attr setContent:content];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}

- (float)geoLatitude {
  GeorssPoint *georssPoint = [self objectForExtensionClass:[GeorssPoint class]];
  return [georssPoint geoLatitude];
}

- (float)geoLongitude {
  GeorssPoint *georssPoint = [self objectForExtensionClass:[GeorssPoint class]];
  return [georssPoint geoLongitude];
}



@end
