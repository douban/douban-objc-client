//
//  DoubanEntryReview.m
//  douban-objective-c
//
//  Created by py on 3/26/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//


#define DOUBANENTRYREVIEW_DEFINE_GLOBALS 1

#import "GDataRating.h"
#import "DoubanDefines.h"
#import "DoubanEntryReview.h"

#import "DoubanAttribute.h"

@implementation DoubanEntryReview


+ (NSString *)standardEntryKind {
	return kDoubanCategoryReview;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];	
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
								   childClasses:[GDataRating class],
												[DoubanAttribute class],nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanReviewsDefaultServiceVersion;
}


#pragma mark - Extensions

- (GDataRating *)rating {
	return [self objectForExtensionClass:[GDataRating class]];
}


- (void)setRating:(GDataRating *)obj {
	[self setObject:obj forExtensionClass:[GDataRating class]];
}


@end