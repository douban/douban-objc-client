//
//  GeorssPoint.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 11-12-19.
//  Copyright (c) 2011年 Douban Inc. All rights reserved.
//

#import "GeorssPoint.h"
#import "DoubanDefines.h"

static NSString* const kContentAttr = @"content";

@implementation GeorssPoint


+ (NSString *)extensionElementURI       { return kGeorssNamespace; }
+ (NSString *)extensionElementPrefix    { return kGeorssNamespacePrefix; }
+ (NSString *)extensionElementLocalName { return @"point"; }

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


- (float) geoLatitude {
  NSString *content = [self content];
  NSArray *array = [content componentsSeparatedByString:@" "];
  if ([array count] == 2) {
    return [[array objectAtIndex:0] floatValue];
  }
  return 0;
}


- (float) geoLongitude {
  NSString *content = [self content];
  NSArray *array = [content componentsSeparatedByString:@" "];
  if ([array count] == 2) {
    return [[array objectAtIndex:1] floatValue];
  }
  return 0;
}


@end
