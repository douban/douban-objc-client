//
//  DoubanEntryPhoto.m
//  douban-objective-c
//
//  Created by py on 4/6/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANENTRYPHOTO_DEFINE_GLOBALS 1

#import "DoubanEntryPhoto.h"
#import "DoubanAttribute.h"
#import "DoubanDefines.h"

#import "GDataBaseElements.h"
#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryPhoto

@dynamic author;
@dynamic imageLink;
@dynamic thumbLink;
@dynamic iconLink;
@dynamic albumCoverLink;

@dynamic commentsCount;
@dynamic recsCount;
@dynamic position;
@dynamic nextPhotoId;
@dynamic prevPhotoId;
@dynamic albumId;
@dynamic albumTitle;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryPhoto;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanPhotosDefaultServiceVersion;
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


- (NSInteger)commentsCount {
  DoubanAttribute *attr = [self attributeForName:@"comments_count"];
	if(attr){
    return [[attr content] integerValue];
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


- (NSInteger)position {
  DoubanAttribute *attr = [self attributeForName:@"position"];
  if(attr){
    return [[attr content] integerValue];
  }
	return 0;
}


- (NSInteger)photoId {
  return [[[self identifier] lastPathComponent] integerValue];
}


- (NSInteger)nextPhotoId {
  DoubanAttribute *attr = [self attributeForName:@"next_photo"];
	if(attr){
    return [[attr content] integerValue];
  }
	return 0;
}


- (NSInteger)prevPhotoId {
  DoubanAttribute *attr = [self attributeForName:@"prev_photo"];
	if(attr) {
    return [[attr content] integerValue];
  }
	return 0;
}


- (NSInteger)albumId {	
  DoubanAttribute *attr = [self attributeForName:@"album"];
 if(attr) {
    return [[attr content] integerValue];
  }
	return 0;
}


- (NSString *)albumTitle {
  DoubanAttribute *attr = [self attributeForName:@"album_title"];
  if(attr) {
    return [attr content];		
  }
	return nil;
}


@end
