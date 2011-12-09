//
//  DoubanEntrySubject.m
//  DOUAPIEngine
//
//  Created by Lin GUO on 11-11-4.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//


#define DOUBANSUJECT_DEFINE_GLOBALS 1

#import "DoubanEntrySubject.h"

#import "GDataRating.h"
#import "DoubanDefines.h"

@implementation DoubanEntrySubject


+ (NSDictionary *)subjectsNamespaces {
  
	NSMutableDictionary *namespaces;
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	return namespaces;
}

+ (DoubanEntrySubject *)subjectEntry {
  
	DoubanEntrySubject *obj;
	obj = [[[self alloc] init] autorelease];
  
	[obj setNamespaces:[DoubanEntrySubject subjectsNamespaces]];
  
	return obj;
}

+ (NSString *)standardEntryKind {
	return kDoubanCategorySubject;
}

+ (void)load {
	[self registerEntryClass];
}

- (void)addExtensionDeclarations {
  
	[super addExtensionDeclarations];
  
	Class entryClass = [self class];
  
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:
   
	 [GDataRating class],[DoubanAttribute class],
	 [DoubanTag class],
	 nil];

}


- (NSMutableArray *)itemsForDescription {
  
	NSMutableArray *items = [super itemsForDescription];
	return items;
}


+ (NSString *)defaultServiceVersion {
	return kDoubanSubjectsDefaultServiceVersion;
}

- (GDataRating *)rating {
	return [self objectForExtensionClass:[GDataRating class]];
}

- (void)setRating:(GDataRating *)obj {
	[self setObject:obj forExtensionClass:[GDataRating class]];
}


- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}

- (void)setAttributes:(NSArray *)attr {
	[self setObjects:attr forExtensionClass:[DoubanAttribute class]];
}
- (void)addAttribute:(DoubanAttribute *)obj {
	[self addObject:obj forExtensionClass:[DoubanAttribute class]];
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
	for (DoubanAttribute *attr in [self attributes]) {
		if ([[attr name] isEqualToString:@"publisher"]) {
			return [attr content];
		}
	}
  return nil;
}

- (NSString*)publishDate {
	for (DoubanAttribute *attr in [self attributes]) {
		if ([[attr name] isEqualToString:@"pubdate"]) {
			return [attr content];
		}
	}
  return nil;
}

- (NSString*)isbn {
	for (DoubanAttribute *attr in [self attributes]) {
		if ([[attr name] isEqualToString:@"isbn10"]) {
			return [attr content];
		}
	}
  
  return nil;
}

- (NSString*)price {
	for (DoubanAttribute *attr in [self attributes]) {
		if ([[attr name] isEqualToString:@"price"]) {
			return [attr content];
		}
	}
  return nil;
}


- (NSArray*)translators {
	NSMutableArray * _translators = [[[NSMutableArray alloc] init ] autorelease];
	for (id attr in [self attributes]) {
		if ([[attr name] isEqualToString:@"translators"]) {
			[_translators addObject:[attr content]];
		}
	}
	return _translators;
}


@end

