//
//  DoubanUID.m
//  douban-objective-c
//
//  Created by py on 3/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "DoubanDefines.h"
#import "DoubanUID.h"

static NSString* const kContentAttr = @"content";

@implementation DoubanUID


+ (NSString *)extensionElementURI       { return kDoubanNamespace; }
+ (NSString *)extensionElementPrefix    { return kDoubanNamespacePrefix; }
+ (NSString *)extensionElementLocalName { return @"uid"; }

- (void)addParseDeclarations {
	NSArray *attrs = [NSArray arrayWithObjects:
					  kContentAttr, nil];

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
