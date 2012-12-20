//
//  DoubanEntrySubject.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-4.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


#define DOUBANENTRYSUBJECT_DEFINE_GLOBALS 1

#import "DoubanEntrySubject.h"
#import "DoubanDefines.h"

#import "GDataEntryBase+Extension.h"
#import "GDataRating.h"
#import "DoubanAttribute.h"
#import "DoubanTag.h"

@implementation DoubanEntrySubject

@dynamic rating;
@dynamic tags;
@dynamic imageLink;
@dynamic publisher;
@dynamic publishDate;
@dynamic isbn;
@dynamic price;
@dynamic translators;


+ (NSString *)standardEntryKind {
	return kDoubanCategorySubject;
}


- (void)addExtensionDeclarations {
	[super addExtensionDeclarations];  
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[GDataRating class],[DoubanAttribute class],
                                              [DoubanTag class],nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanSubjectsDefaultServiceVersion;
}


#pragma mark - Extensions

- (GDataRating *)rating {
	return [self objectForExtensionClass:[GDataRating class]];
}


- (void)setRating:(GDataRating *)obj {
	[self setObject:obj forExtensionClass:[GDataRating class]];
}


- (NSArray *)tags {
	return [self objectsForExtensionClass:[DoubanTag class]];
}


- (void)setTags:(NSArray *)tag {
	[self setObjects:tag forExtensionClass:[DoubanTag class]];
}


- (void)addTag:(DoubanTag *)obj {
	[self addObject:obj forExtensionClass:[DoubanTag class]];
}


- (GDataLink *)imageLink {
  return [self linkWithRelAttributeValue:@"image"];
}


- (NSString*)publisher {
  DoubanAttribute *attr = [self attributeForName:@"publisher"];
  if (attr) {
    return [attr content];
  }
  return nil;
}


- (NSString *)publishDate {
  DoubanAttribute *attr = [self attributeForName:@"pubdate"];
  if (attr) {
    return [attr content];
  }
  return nil;
}


- (NSString *)isbn {
  DoubanAttribute *attr = [self attributeForName:@"isbn10"];
	if (attr) {
    return [attr content];
  }
  return nil;
}


- (NSString *)price {  
  DoubanAttribute *attr = [self attributeForName:@"price"];
	if (attr) {
		return [attr content];
	}
  return nil;
}


- (NSArray *)translators {
	NSMutableArray * _translators = [[[NSMutableArray alloc] init ] autorelease];
	for (id attr in [self attributes]) {
		if ([[attr name] isEqualToString:@"translators"]) {
			[_translators addObject:[attr content]];
		}
	}
	return _translators;
}


@end

