//
//  DoubanFeedComment.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 3/23/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DoubanFeedComment.h"

@implementation DoubanFeedComment

+ (NSString *)standardFeedKind {
	return @"coments"; //kDoubanCommentFeed;
}


- (Class)classForEntries {
	return [DoubanEntryComment class];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanCommentsDefaultServiceVersion;
}


@end
