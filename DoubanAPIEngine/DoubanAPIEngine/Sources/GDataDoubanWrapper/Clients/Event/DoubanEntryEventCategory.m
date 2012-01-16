//
//  DoubanEntryEventCategory.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-26.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanEntryEventCategory.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"

#import "GDateEntryBase+Extension.h"

@implementation DoubanEntryEventCategory


+ (NSString *)standardEntryKind {
	return kDoubanCategoryEventCategory;
}


- (void)addExtensionDeclarations {
	
	[super addExtensionDeclarations];	
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanAttribute class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanEventCategoriesDefaultServiceVersion;
}


#pragma mark - Extensions

- (void)setEventCount:(NSInteger)eventCount {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"event_count"];
  [attr setContent:[NSString stringWithFormat:@"%d", eventCount]];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}


- (NSInteger)eventCount {
	DoubanAttribute *attr = [self attributeForName:@"event_count"];
	if (attr) {
		return [[attr content] integerValue];
	}
	return 0;
}


- (NSString*)eventCateogryName {
  DoubanAttribute *attr = [self attributeForName:@"cname"];
	if (attr) {
		return [attr content];
	}
  return nil;
}


- (void)setEventCateogryName:(NSString *)content {
  DoubanAttribute *attr = [[[DoubanAttribute alloc] init] autorelease];
  [attr setName:@"cname"];
  [attr setContent:content];
  [self setObject:attr forExtensionClass:[DoubanAttribute class]];
}


@end
