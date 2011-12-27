//
//  DoubanFeedCity.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-27.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANCITY_DEFINE_GLOBALS 1
#import "DoubanFeedCity.h"
#import "DoubanEntryCity.h"

@implementation DoubanFeedCity

+ (DoubanFeedCity *)cityFeed {
  
	DoubanFeedCity *feed = [[[self alloc] init] autorelease];
	[feed setNamespaces:[DoubanEntryCity citiesNamespaces]];
	return feed;
}

+ (NSString *)standardFeedKind {
	return @"cities"; //kGDataCategoryCitiesFeed;
}

+ (void)load {
	[self registerFeedClass];
}

- (Class)classForEntries {
	return [DoubanEntryCity class];
}

+ (NSString *)defaultServiceVersion {
	return kDoubanCityDefaultServiceVersion;
}

@end
