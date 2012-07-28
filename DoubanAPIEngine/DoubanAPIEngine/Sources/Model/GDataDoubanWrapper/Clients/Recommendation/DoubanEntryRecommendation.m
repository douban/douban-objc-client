//
//  DoubanEntryRecommendation.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#define DOUBANENTRYRECOMMENDATION_DEFINE_GLOBALS 1

#import "DoubanEntryRecommendation.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"
#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryRecommendation

@dynamic category;
@dynamic comment;
@dynamic commentsCount;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryRecommendation;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanRecommendationsDefaultServiceVersion;
}


#pragma mark - Extensions

- (NSString *)category {
	DoubanAttribute *attr = [self attributeForName:@"category"];
	if (attr) {
		return [attr content];
	}
	return nil;
}


- (NSString *)comment {
	DoubanAttribute *attr = [self attributeForName:@"comment"];
	if (attr) {
		return [attr content];
	}
	return nil;
}


- (NSInteger)commentsCount {
	DoubanAttribute *attr = [self attributeForName:@"comments_count"];
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


@end
