//
//  DoubanFeedPhoto.m
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//


#import "DoubanFeedPhoto.h"


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
