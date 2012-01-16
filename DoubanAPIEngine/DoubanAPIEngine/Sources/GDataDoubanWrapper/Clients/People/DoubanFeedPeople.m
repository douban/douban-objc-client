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


+ (NSString *)standardFeedKind {
	return @"peoples"; //kGDataCategoryPeoplesFeed;
}


- (Class)classForEntries {
	return [DoubanEntryPeople class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanPeoplesDefaultServiceVersion;
}


@end
