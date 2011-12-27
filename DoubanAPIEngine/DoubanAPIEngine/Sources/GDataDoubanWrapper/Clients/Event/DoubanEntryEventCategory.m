//
//  DoubanEntryEventCategory.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-26.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanEntryEventCategory.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"

@implementation DoubanEntryEventCategory


+ (NSDictionary *)eventCategoriesNamespaces {
	
	NSMutableDictionary *namespaces;
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	return namespaces;
}

+ (DoubanEntryEventCategory *)eventCategoryEntry {
	
	DoubanEntryEventCategory *obj;
	obj = [[[self alloc] init] autorelease];
	[obj setNamespaces:[DoubanEntryEventCategory eventCategoriesNamespaces]];
	return obj;
}


+ (NSString *)standardEntryKind {
	return kDoubanCategoryEventCategory;
}

+ (void)load {
	[self registerEntryClass];
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
	return kDoubanEventCategoriesDefaultServiceVersion;
}

// extension

- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}


- (void)setEventCount:(NSInteger)eventCount {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"event_count"];
  [attr setContent:[NSString stringWithFormat:@"%d", eventCount]];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}


- (NSInteger)eventCount {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"event_count"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSString*)eventCateogryName {
  DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"cname"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [attr content];
	}
  return nil;
}


- (void)setEventCateogryName:(NSString *)content {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"cname"];
  [attr setContent:content];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}


@end
