//
//  DoubanEntryAlbum.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/31/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#define DOUBANENTRYALBUM_DEFINE_GLOBALS 1

#import "DoubanEntryAlbum.h"
#import "DoubanAttribute.h"
#import "DoubanDefines.h"

#import "GDataBaseElements.h"
#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryAlbum

@dynamic author;
@dynamic imageLink;
@dynamic thumbLink;
@dynamic albumCoverLink;

@dynamic size;
@dynamic privacy;
@dynamic recsCount;
@dynamic likedCount;
@dynamic albumId;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryAlbum;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanAlbumsDefaultServiceVersion;
}


#pragma mark - Extensions

- (GDataAtomAuthor *)author {
  return [self theFirstAuthor];
}

- (GDataLink *)imageLink {
	return [self linkWithRelAttributeValue:@"image"];
}


- (GDataLink *)thumbLink {
	return [self linkWithRelAttributeValue:@"cover_thumb"];
}


- (GDataLink *)albumCoverLink {
	return [self linkWithRelAttributeValue:@"cover"];
}


- (NSInteger)size {
  DoubanAttribute *attr = [self attributeForName:@"size"];
	if(attr){
    return [[attr content] integerValue];
  }
	return 0;
}


- (NSString *)privacy {
  DoubanAttribute *attr = [self attributeForName:@"privacy"];
	if(attr){
    return [attr content];
  }
	return 0;
}


- (NSInteger)recsCount {
  DoubanAttribute *attr = [self attributeForName:@"recs_count"];
	if(attr){
    return [[attr content] integerValue];
  }
	return 0;
}


- (NSInteger)likedCount {
  DoubanAttribute *attr = [self attributeForName:@"liked_count"];
	if(attr){
    return [[attr content] integerValue];
  }
	return 0;
}

- (BOOL)liked{
  DoubanAttribute *attr = [self attributeForName:@"liked"];
	if(attr){
    return [[attr content] boolValue];
  }
	return NO;
}


- (NSInteger)albumId {
  return [[[self identifier] lastPathComponent] integerValue];
}


- (NSInteger)authorId {
  return [[self.author.URI lastPathComponent] integerValue];
}

@end
