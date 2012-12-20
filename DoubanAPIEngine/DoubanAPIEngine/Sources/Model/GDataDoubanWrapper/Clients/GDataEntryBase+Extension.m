//
//  GDataEntryBase+Extension.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/16/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "GDataEntryBase+Extension.h"
#import "DoubanDefines.h"
#import "DoubanAttribute.h"
#import "GDataBaseElements.h"


@implementation GDataEntryBase (Extension)


- (NSArray *)doubanAttributes {
	return [self objectsForExtensionClass:[DoubanAttribute class]];
}


- (DoubanAttribute *)attributeForName:(NSString *)attributeName {
	DoubanAttribute *attr = nil;
	for(id _attr in [self doubanAttributes]) {
		if([[_attr name] isEqualToString:attributeName]){
			attr = _attr;
			break;
		}
	}
  return attr;
}


- (GDataAtomAuthor *)theFirstAuthor {
  NSArray *authors = [self authors];
  if (authors) {
    GDataAtomAuthor *author = (GDataAtomAuthor *)[authors objectAtIndex:0];
    return author;
  }
  return nil;
}


@end
