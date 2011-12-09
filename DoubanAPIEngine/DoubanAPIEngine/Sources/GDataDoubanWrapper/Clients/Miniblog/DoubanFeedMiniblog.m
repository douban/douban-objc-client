//
//  DoubanFeedMiniblog.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-9.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANMINIBLOG_DEFINE_GLOBALS 1
#import "DoubanFeedMiniblog.h"
#import "DoubanEntryMiniblog.h"


@implementation DoubanFeedMiniblog


+ (DoubanFeedMiniblog *)miniblogFeed {
  
	DoubanFeedMiniblog *feed = [[[self alloc] init] autorelease];
  
	[feed setNamespaces:[DoubanEntryMiniblog miniblogsNamespaces]];
  
	return feed;
}

+ (NSString *)standardFeedKind {
	return @"miniblogs"; //kGDataCategoryMiniblogsFeed;
}

+ (void)load {
	[self registerFeedClass];
}

- (Class)classForEntries {
	return [DoubanEntryMiniblog class];
}

+ (NSString *)defaultServiceVersion {
	return kDoubanMiniblogsDefaultServiceVersion;
}

@end
