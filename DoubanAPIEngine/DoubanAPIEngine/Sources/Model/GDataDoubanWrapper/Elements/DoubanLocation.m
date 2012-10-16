//
//  DoubanLocation.m
//  douban-objective-c
//
//  Created by py on 3/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DoubanDefines.h"
#import "DoubanLocation.h"

static NSString* const kIdentityAttr = @"id";
static NSString* const kNIdentifyAttr = @"n_id";

@implementation DoubanLocation


+ (NSString *)extensionElementURI       { return kDoubanNamespace; }
+ (NSString *)extensionElementPrefix    { return kDoubanNamespacePrefix; }
+ (NSString *)extensionElementLocalName { return @"location"; }

- (void)addParseDeclarations {
	NSArray *attrs = [NSArray arrayWithObjects:
					  kIdentityAttr, kNIdentifyAttr, nil];
	
	[self addLocalAttributeDeclarations:attrs];
	[self addContentValueDeclaration];
}


- (NSString *)identity {
	return [self stringValueForAttribute:kIdentityAttr];
}


- (void)setIdentity:(NSString *)str {
	[self setStringValue:str forAttribute:kIdentityAttr];
}


- (NSString *)uid {
	return [self stringValueForAttribute:kIdentityAttr];
}


- (void)setUid:(NSString *)str {
	[self setStringValue:str forAttribute:kIdentityAttr];
}

- (NSString *)content {
	return [self contentStringValue];
}


- (void)setContent:(NSString *)str {
	[self setContentStringValue:str];
}


@end
