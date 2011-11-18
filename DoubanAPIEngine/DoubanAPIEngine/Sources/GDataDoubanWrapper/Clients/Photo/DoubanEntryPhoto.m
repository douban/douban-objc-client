//
//  DoubanEntryPhoto.m
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANPHOTOS_DEFINE_GLOBALS 1

#import "DoubanEntryPhoto.h"

#import "DoubanDefines.h"


@implementation DoubanEntryPhoto


+ (NSDictionary *)photosNamespaces {
	
	NSMutableDictionary *namespaces;
	
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:
				  nil];
	
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	
	return namespaces;
}

+ (DoubanEntryPhoto *)photoEntry {
	
	DoubanEntryPhoto *obj;
	obj = [[[self alloc] init] autorelease];
	
	[obj setNamespaces:[DoubanEntryPhoto photosNamespaces]];
	
	return obj;
}

+ (NSString *)standardEntryKind {
	return kDoubanCategoryPhoto;
}

+ (void)load {
	[self registerEntryClass];
}

- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];
	
	Class entryClass = [self class];
	
	[self addExtensionDeclarationForParentClass:entryClass
								   childClasses:nil];
}

- (NSMutableArray *)itemsForDescription {
	NSMutableArray *items = [super itemsForDescription];
	return items;
}

+ (NSString *)defaultServiceVersion {
	return kDoubanPhotosDefaultServiceVersion;
}

- (GDataLink *)imageLink {
	return [self linkWithRelAttributeValue:@"image"];
}

- (GDataLink *)thumbLink {
	return [self linkWithRelAttributeValue:@"thumb"];
}

@end
