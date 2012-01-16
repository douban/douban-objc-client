//
//  GDateEntryBase+Extension.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/16/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "GDateEntryBase+Extension.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"


@implementation GDataEntryBase (Extension)


- (NSArray *)attributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}


- (DoubanAttribute *)attributeForName:(NSString *)attributeName {
	DoubanAttribute *attr = nil;
	for(id _attr in [self attributes]) {
		if([[_attr name] isEqualToString:attributeName]){
			attr = _attr;
			break;
		}
	}
  return attr;
}


- (GDataAtomAuthor *)author {
  NSArray *authors = [self authors];
  if (authors) {
    GDataAtomAuthor *author = [authors objectAtIndex:0];
    return author;
  }
  return nil;
}


@end
