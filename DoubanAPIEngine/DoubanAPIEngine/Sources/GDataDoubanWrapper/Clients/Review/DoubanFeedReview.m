//
//  DoubanFeedReview.m
//  douban-objective-c
//
//  Created by py on 3/26/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANENTRYREVIEW_DEFINE_GLOBALS 1

#import "DoubanFeedReview.h"
#import "DoubanEntryReview.h"

@implementation DoubanFeedReview

+ (DoubanFeedReview *)reviewFeed {
	
	DoubanFeedReview *feed = [[[self alloc] init] autorelease];
	
	[feed setNamespaces:[DoubanEntryReview reviewsNamespaces]];
	
	return feed;
}

+ (NSString *)standardFeedKind {
	return @"reviews"; //kGDataCategoryReviesFeed;
}

+ (void)load {
	[self registerFeedClass];
}

- (Class)classForEntries {
	return [DoubanEntryReview class];
}

+ (NSString *)defaultServiceVersion {
	return kDoubanReviewsDefaultServiceVersion;
}

@end