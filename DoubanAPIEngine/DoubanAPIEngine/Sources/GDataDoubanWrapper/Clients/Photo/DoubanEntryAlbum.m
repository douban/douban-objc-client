//
//  DoubanEntryAlbum.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/31/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#define DOUBANALBUMS_DEFINE_GLOBALS 1

#import "DoubanEntryAlbum.h"
#import "DoubanAttribute.h"
#import "DoubanDefines.h"

#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryAlbum

@dynamic author;
@dynamic imageLink;
@dynamic thumbLink;
@dynamic iconLink;
@dynamic albumCoverLink;

@dynamic size;
@dynamic privacy;
@dynamic recsCount;


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
	return [self linkWithRelAttributeValue:@"thumb"];
}


- (GDataLink *)iconLink {
	return [self linkWithRelAttributeValue:@"icon"];
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


@end
