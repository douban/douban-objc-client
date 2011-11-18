//
//  DoubanEntryReview.m
//  douban-objective-c
//
//  Created by py on 3/26/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//


#define DOUBANREVIEWS_DEFINE_GLOBALS 1

#import "GDataRating.h"

#import "DoubanDefines.h"

#import "DoubanEntryReview.h"


@implementation DoubanEntryReview



+ (NSDictionary *)reviewsNamespaces {
	
	NSMutableDictionary *namespaces;
	
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				  nil];
	
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	
	return namespaces;
}

+ (DoubanEntryReview *)reviewEntry {
	
	DoubanEntryReview *obj;
	obj = [[[self alloc] init] autorelease];
	
	[obj setNamespaces:[DoubanEntryReview reviewsNamespaces]];
	
	return obj;
}

+ (NSString *)standardEntryKind {
	return kDoubanCategoryReview;
}

+ (void)load {
	[self registerEntryClass];
}

- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];
	
	Class entryClass = [self class];
	
	[self addExtensionDeclarationForParentClass:entryClass
								   childClasses:[GDataRating class],
												[DoubanAttribute class],nil];
}


- (NSMutableArray *)itemsForDescription {	
	NSMutableArray *items = [super itemsForDescription];
	return items;
}


+ (NSString *)defaultServiceVersion {
	return kDoubanReviewsDefaultServiceVersion;
}

- (GDataRating *)rating {
	return [self objectForExtensionClass:[GDataRating class]];
}

- (void)setRating:(GDataRating *)obj {
	[self setObject:obj forExtensionClass:[GDataRating class]];
}

- (NSArray *)attributes{
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}

- (void)setAttributes:(NSArray *)attr {
	[self setObjects:attr forExtensionClass:[DoubanAttribute class]];
}
- (void)addAttribute:(DoubanAttribute *)obj {
	[self addObject:obj forExtensionClass:[DoubanAttribute class]];
}

@end