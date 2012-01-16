//
//  DoubanSignature.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-11-15.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "DoubanDefines.h"
#import "DoubanSignature.h"

static NSString* const kContentAttr = @"content";

@implementation DoubanSignature


+ (NSString *)extensionElementURI       { return kDoubanNamespace; }
+ (NSString *)extensionElementPrefix    { return kDoubanNamespacePrefix; }
+ (NSString *)extensionElementLocalName { return @"signature"; }


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
