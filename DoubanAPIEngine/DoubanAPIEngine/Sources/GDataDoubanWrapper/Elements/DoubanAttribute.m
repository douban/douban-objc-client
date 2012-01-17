//
//  DoubanAttribute.m
//  douban-objective-c
//
//  Created by py on 3/18/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "DoubanDefines.h"
#import "DoubanAttribute.h"

static NSString* const kNameAttr = @"name";
static NSString* const kContentAttr = @"content";

@implementation DoubanAttribute


+ (NSString *)extensionElementURI       { return kDoubanNamespace; }
+ (NSString *)extensionElementPrefix    { return kDoubanNamespacePrefix; }
+ (NSString *)extensionElementLocalName { return @"attribute"; }

- (void)addParseDeclarations {
	NSArray *attrs = [NSArray arrayWithObjects:
					  kNameAttr, kContentAttr, nil];

	[self addLocalAttributeDeclarations:attrs];
	[self addContentValueDeclaration];
}


- (NSString *)content {
	return [self contentStringValue];
}


- (void)setContent:(NSString *)str {
	[self setContentStringValue:str];
}


@end
