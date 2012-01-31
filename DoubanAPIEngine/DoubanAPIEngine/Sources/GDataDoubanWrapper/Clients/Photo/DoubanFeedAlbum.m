//
//  DoubanFeedAlbum.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/31/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#define DOUBANENTRYALBUM_DEFINE_GLOBALS 1

#import "DoubanFeedAlbum.h"
#import "DoubanEntryAlbum.h"

@implementation DoubanFeedAlbum


+ (NSString *)standardFeedKind {
	return @"albums"; //kGDataCategoryAlbumsFeed;
}


- (Class)classForEntries {
	return [DoubanEntryAlbum class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanAlbumsDefaultServiceVersion;
}


@end
