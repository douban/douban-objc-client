//
//  DoubanTag.m
//  douban-objective-c
//
//  Created by py on 3/18/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "DoubanDefines.h"
#import "DoubanTag.h"

static NSString* const kNameAttr = @"name";
static NSString* const kCountAttr = @"count";

@implementation DoubanTag


+ (NSString *)extensionElementURI       { return kDoubanNamespace; }
+ (NSString *)extensionElementPrefix    { return kDoubanNamespacePrefix; }
+ (NSString *)extensionElementLocalName { return @"tag"; }

- (void)addParseDeclarations {
	NSArray *attrs = [NSArray arrayWithObjects:
					  kCountAttr, kNameAttr, nil];

	[self addLocalAttributeDeclarations:attrs];
	[self addContentValueDeclaration];
}


- (NSString *)name {
  return [self stringValueForAttribute:kNameAttr];
}


- (void)setName:(NSString *)str {
  [self setStringValue:str forAttribute:kNameAttr];
}


- (NSNumber *)count {
  return [self intNumberForAttribute:kCountAttr];
}


- (void)setCount:(NSNumber *)num {
  [self setStringValue:[num stringValue] forAttribute:kCountAttr];
}


@end
