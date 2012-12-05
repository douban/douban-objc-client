//
//  DoubanFeedMiniblog.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-9.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanFeedMiniblog.h"
#import "DoubanEntryMiniblog.h"


@implementation DoubanFeedMiniblog


+ (NSString *)standardFeedKind {
	return @"miniblogs"; //kGDataCategoryMiniblogsFeed;
}


- (Class)classForEntries {
	return [DoubanEntryMiniblog class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanMiniblogsDefaultServiceVersion;
}


@end
