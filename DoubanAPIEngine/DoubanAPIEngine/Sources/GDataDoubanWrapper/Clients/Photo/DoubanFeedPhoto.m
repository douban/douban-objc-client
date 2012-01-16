//
//  DoubanFeedPhoto.m
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANENTRYPHOTO_DEFINE_GLOBALS 1

#import "DoubanFeedPhoto.h"
#import "DoubanEntryPhoto.h"

@implementation DoubanFeedPhoto


+ (NSString *)standardFeedKind {
	return @"photos"; //kGDataCategoryPhotosFeed;
}


- (Class)classForEntries {
	return [DoubanEntryPhoto class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanPhotosDefaultServiceVersion;
}


@end
