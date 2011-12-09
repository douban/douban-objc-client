//
//  DoubanEntryPeople.m
//  douban-objective-c
//
//  Created by py on 3/23/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANPEOPLES_DEFINE_GLOBALS 1

#import "DoubanEntryPeople.h"

#import "DoubanDefines.h"
#import "DoubanAttribute.h"

@implementation DoubanEntryPeople


+ (NSDictionary *)peoplesNamespaces {
	
	NSMutableDictionary *namespaces;
	
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
	
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	
	return namespaces;
}

+ (DoubanEntryPeople *)peopleEntry {
	
	DoubanEntryPeople *obj;
	obj = [[[self alloc] init] autorelease];
	
	[obj setNamespaces:[DoubanEntryPeople peoplesNamespaces]];
	
	return obj;
}


+ (NSString *)standardEntryKind {
	return kDoubanCategoryPeople;
}

+ (void)load {
	[self registerEntryClass];
}

- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];
	
	Class entryClass = [self class];
	
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanUID class], 
                                              [DoubanSignature class], 
                                              [DoubanLocation class], nil];
}


- (NSMutableArray *)itemsForDescription {
	
	NSMutableArray *items = [super itemsForDescription];
	return items;
}


+ (NSString *)defaultServiceVersion {
	return kDoubanPeoplesDefaultServiceVersion;
}


- (DoubanLocation *)location {
	return [self objectForExtensionClass:[DoubanLocation class]];
}

- (void)setLocation:(DoubanLocation *)obj {
	[self setObject:obj forExtensionClass:[DoubanLocation class]];
}


- (DoubanUID *)uid {
	return [self objectForExtensionClass:[DoubanUID class]];
}

- (void)setUid:(DoubanUID *)obj{
	[self setObject:obj forExtensionClass:[DoubanUID class]];
}


- (DoubanSignature *)signature {
	return [self objectForExtensionClass:[DoubanSignature class]];
}

- (void)setSignature:(DoubanSignature *)obj {
	[self setObject:obj forExtensionClass:[DoubanSignature class]];
}


- (GDataLink *)imageLink {
	return [self linkWithRelAttributeValue:@"icon"];
}


- (GDataLink *)homepage {
	return [self linkWithRelAttributeValue:@"homepage"];
}

@end
