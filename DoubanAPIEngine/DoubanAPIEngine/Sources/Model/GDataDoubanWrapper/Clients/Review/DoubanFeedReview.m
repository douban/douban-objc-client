//
//  DoubanFeedReview.m
//  douban-objective-c
//
//  Created by py on 3/26/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#import "DoubanFeedReview.h"
#import "DoubanEntryReview.h"


@implementation DoubanFeedReview


+ (NSString *)standardFeedKind {
	return @"reviews"; //kGDataCategoryReviesFeed;
}


- (Class)classForEntries {
	return [DoubanEntryReview class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanReviewsDefaultServiceVersion;
}


@end