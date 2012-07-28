//
//  DoubanEntryComment.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 3/23/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#define DOUBANENTRYCOMMENT_DEFINE_GLOBALS 1

#import "DoubanDefines.h"
#import "DoubanEntryComment.h"

@implementation DoubanEntryComment

+ (NSString *)standardEntryKind {
	return kDoubanCategoryComment;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanCommentsDefaultServiceVersion;
}


@end
