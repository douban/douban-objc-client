//
//  DoubanFeedCity.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-27.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanFeedCity.h"
#import "DoubanEntryCity.h"


@implementation DoubanFeedCity


+ (NSString *)standardFeedKind {
	return @"cities"; //kGDataCategoryCitiesFeed;
}


- (Class)classForEntries {
	return [DoubanEntryCity class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanCityDefaultServiceVersion;
}


@end
