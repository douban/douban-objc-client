//
//  DoubanFeedEventCategory.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-26.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


#define DOUBANEVENTCATEGORY_DEFINE_GLOBALS 1

#import "DoubanFeedEventCategory.h"
#import "DoubanEntryEventCategory.h"

@implementation DoubanFeedEventCategory

+ (DoubanFeedEventCategory *)eventCategoryFeed {
  
	DoubanFeedEventCategory *feed = [[[self alloc] init] autorelease];
  
	[feed setNamespaces:[DoubanEntryEventCategory eventCategoriesNamespaces]];
  
	return feed;
}

+ (NSString *)standardFeedKind {
	return @"categories"; //kGDataCategoryEventCategoriesFeed;
}

+ (void)load {
	[self registerFeedClass];
}

- (Class)classForEntries {
	return [DoubanEntryEventCategory class];
}

+ (NSString *)defaultServiceVersion {
	return kDoubanEventCategoriesDefaultServiceVersion;
}

@end
