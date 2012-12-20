//
//  DoubanFeedEvent.m
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "DoubanFeedEvent.h"
#import "DoubanEntryEvent.h"


@implementation DoubanFeedEvent


+ (NSString *)standardFeedKind {
	return @"events"; //kGDataCategoryEventsFeed;
}


- (Class)classForEntries {
	return [DoubanEntryEvent class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanEventsDefaultServiceVersion;
}


@end
