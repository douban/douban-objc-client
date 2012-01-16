//
//  DoubanFeedRecommendation.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANRECOMMENDATION_DEFINE_GLOBALS 1
#import "DoubanFeedRecommendation.h"
#import "DoubanEntryRecommendation.h"


@implementation DoubanFeedRecommendation


+ (NSString *)standardFeedKind {
	return @"recommendations"; //kGDataCategoryRecommendationsFeed;
}


- (Class)classForEntries {
	return [DoubanEntryRecommendation class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanRecommendationsDefaultServiceVersion;
}


@end
