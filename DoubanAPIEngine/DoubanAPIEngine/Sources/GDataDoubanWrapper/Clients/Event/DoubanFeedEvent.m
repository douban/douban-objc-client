//
//  DoubanFeedEvent.m
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANEVENT_DEFINE_GLOBALS 1

#import "DoubanFeedEvent.h"
#import "DoubanEntryEvent.h"

@implementation DoubanFeedEvent

+ (DoubanFeedEvent *)eventFeed {

	DoubanFeedEvent *feed = [[[self alloc] init] autorelease];

	[feed setNamespaces:[DoubanEntryEvent eventsNamespaces]];

	return feed;
}

+ (NSString *)standardFeedKind {
	return @"events"; //kGDataCategoryEventsFeed;
}

+ (void)load {
	[self registerFeedClass];
}

- (Class)classForEntries {
	return [DoubanEntryEvent class];
}

+ (NSString *)defaultServiceVersion {
	return kDoubanEventsDefaultServiceVersion;
}


@end
