//
//  DoubanEntryCity.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-27.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanEntryCity.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"
#import "DoubanUID.h"

@implementation DoubanEntryCity


+ (NSDictionary *)citiesNamespaces {
	
	NSMutableDictionary *namespaces;
	namespaces = [NSMutableDictionary dictionaryWithObjectsAndKeys:nil];
	[namespaces addEntriesFromDictionary:[GDataEntryBase baseGDataNamespaces]];
	return namespaces;
}

+ (DoubanEntryCity *)cityEntry {
	
	DoubanEntryCity *obj;
	obj = [[[self alloc] init] autorelease];
	[obj setNamespaces:[DoubanEntryCity citiesNamespaces]];
	return obj;
}


+ (NSString *)standardEntryKind {
	return kDoubanCategoryCityCategory;
}


+ (void)load {
	[self registerEntryClass];
}

- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];
	
	Class entryClass = [self class];
	
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], [DoubanUID class], nil];
}


- (NSMutableArray *)itemsForDescription {
	NSMutableArray *items = [super itemsForDescription];
	return items;
}


+ (NSString *)defaultServiceVersion {
	return kDoubanCityDefaultServiceVersion;
}


// extension

- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}

- (NSString *)cityName {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"name_cn"]){
			attr = _attr;
			break;
		}
	}
	if (attr) {
		return [attr content];
	}
	return 0;
}


- (BOOL)isHabitable {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:@"habitable"]){
			attr = _attr;
			break;
		}
	}
  
	if (attr) {
    NSString * result = [attr content];
		if ([result isEqualToString:@"True"]) {
      return true;
    }
	}
	return false;
}


@end
