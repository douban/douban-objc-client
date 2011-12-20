//
//  DoubanEntryRecommendation.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanEntryRecommendation.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"


@implementation DoubanEntryRecommendation

+ (NSDictionary *)recommendationsNamespaces {
	NSMutableDictionary *namespaces;
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	return namespaces;
}


+ (DoubanEntryRecommendation *)recommendationsEntry {
	DoubanEntryRecommendation *obj;
	obj = [[[self alloc] init] autorelease];
	[obj setNamespaces:[DoubanEntryRecommendation recommendationsNamespaces]];
	return obj;
}


+ (NSString *)standardEntryKind {
	return kDoubanCategoryRecommendation;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], nil];
}


- (NSMutableArray *)itemsForDescription {
	NSMutableArray *items = [super itemsForDescription];
	return items;
}


+ (NSString *)defaultServiceVersion {
	return kDoubanRecommendationsDefaultServiceVersion;
}


- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}

- (NSString *)category {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"category"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [attr content];
	}
	return nil;
}


- (NSString *)comment {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"comment"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [attr content];
	}
	return nil;
}


- (NSInteger)commentsCount {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"comments_count"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


@end
