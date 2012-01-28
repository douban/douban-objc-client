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

#import "GDataEntryBase+Extension.h"


@implementation DoubanEntryCity


+ (NSString *)standardEntryKind {
	return kDoubanCategoryCityCategory;
}


- (void)addExtensionDeclarations {	
	[super addExtensionDeclarations];
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], 
                                              [DoubanUID class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanCityDefaultServiceVersion;
}


#pragma mark - Extensions

- (void)setName:(NSString *)theName {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"name"];
  [attr setContent:theName];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}


- (NSString *)name {
	DoubanAttribute *attr = [self attributeForName:@"name"];
	if (attr) {
		return [attr content];
	}
	return 0;
}


- (DoubanUID *)uid {
  DoubanUID* uid = (DoubanUID *)[self objectForExtensionClass:[DoubanUID class]];
  return uid;
}


- (void)setUid:(NSString *)theUid {
  DoubanUID *uid = [[[DoubanUID alloc] init] autorelease];
  [uid setContent:theUid];
  [self setObject:uid forExtensionClass:[DoubanUID class]];
}


- (BOOL)isHabitable {
	DoubanAttribute *attr = [self attributeForName:@"habitable"];  
	if (attr) {
    NSString * result = [attr content];
		if ([result isEqualToString:@"True"]) {
      return true;
    }
	}
	return false;
}


@end
