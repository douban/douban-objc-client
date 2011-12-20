//
//  DoubanEntryPhoto.m
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANPHOTOS_DEFINE_GLOBALS 1

#import "DoubanEntryPhoto.h"
#import "DoubanAttribute.h"
#import "DoubanDefines.h"


@implementation DoubanEntryPhoto


+ (NSDictionary *)photosNamespaces {
	
	NSMutableDictionary *namespaces;
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
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
                                 childClasses:[DoubanAttribute class], nil];
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

- (GDataAtomAuthor *)author {
  NSArray *authors = [self authors];
  if (authors) {
    GDataAtomAuthor *author = [authors objectAtIndex:0];
    return author;
  }
  return nil;
}

- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
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



- (NSInteger)recsCount {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"recs_count"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)position {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"position"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)nextPhotoId {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"next_photo"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)prevPhotoId {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"prev_photo"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSInteger)albumId {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"album"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}

- (NSString *)albumTitle {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"album_title"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [attr content];
	}
	return nil;

}

@end
