//
//  DoubanEntryPeople.m
//  douban-objective-c
//
//  Created by py on 3/23/10.
//  Copyright 2010 Douban Inc. All rights reserved.
//

#define DOUBANENTRYPEOPLE_DEFINE_GLOBALS 1

#import "DoubanEntryPeople.h"

#import "DoubanDefines.h"
#import "DoubanAttribute.h"

#import "DoubanLocation.h"
#import "DoubanUID.h"
#import "DoubanSignature.h"

@implementation DoubanEntryPeople

@dynamic location;
@dynamic uid;
@dynamic signature;
@dynamic iconLink;
@dynamic homePage;


+ (NSString *)standardEntryKind {
	return kDoubanCategoryPeople;
}


- (void)addExtensionDeclarations {	
	[super addExtensionDeclarations];	
	Class entryClass = [self class];
	[self addExtensionDeclarationForParentClass:entryClass
                                 childClasses:[DoubanUID class], 
                                              [DoubanSignature class], 
                                              [DoubanLocation class], nil];
}


+ (NSString *)defaultServiceVersion {
	return kDoubanPeoplesDefaultServiceVersion;
}


#pragma mark - Extensions

- (DoubanLocation *)location {
	return [self objectForExtensionClass:[DoubanLocation class]];
}


- (DoubanUID *)uid {
	return [self objectForExtensionClass:[DoubanUID class]];
}


- (DoubanSignature *)signature {
	return [self objectForExtensionClass:[DoubanSignature class]];
}


- (GDataLink *)iconLink {
	return [self linkWithRelAttributeValue:@"icon"];
}


- (GDataLink *)homePage {
	return [self linkWithRelAttributeValue:@"homepage"];
}


@end
