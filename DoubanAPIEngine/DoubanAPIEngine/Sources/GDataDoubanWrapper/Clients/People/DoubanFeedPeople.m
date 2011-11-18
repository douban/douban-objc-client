//
//  DoubanFeedPeople.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-15.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANENTRYPEOPLE_DEFINE_GLOBALS 1

#import "DoubanFeedPeople.h"
#import "DoubanEntryPeople.h"

@implementation DoubanFeedPeople

+ (DoubanFeedPeople *)peopleFeed {
  
	DoubanFeedPeople *feed = [[[self alloc] init] autorelease];
  
	[feed setNamespaces:[DoubanEntryPeople peoplesNamespaces]];
  
	return feed;
}

+ (NSString *)standardFeedKind {
	return @"peoples"; //kGDataCategoryPeoplesFeed;
}

+ (void)load {
	[self registerFeedClass];
}

- (Class)classForEntries {
	return [DoubanEntryPeople class];
}

+ (NSString *)defaultServiceVersion {
	return kDoubanPeoplesDefaultServiceVersion;
}

@end
