//
//  DoubanFeedEventCategory.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-26.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanFeedEventCategory.h"
#import "DoubanEntryEventCategory.h"


@implementation DoubanFeedEventCategory


+ (NSString *)standardFeedKind {
	return @"categories"; //kGDataCategoryEventCategoriesFeed;
}


- (Class)classForEntries {
	return [DoubanEntryEventCategory class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanEventCategoriesDefaultServiceVersion;
}


@end
