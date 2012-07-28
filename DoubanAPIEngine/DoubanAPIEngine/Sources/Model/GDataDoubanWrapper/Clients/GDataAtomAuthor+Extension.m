//
//  GDataAtomAuthor+Extension.m
//  DoubanAPIEngine
//
//  Created by Lin GUO on 1/26/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "GDataAtomAuthor+Extension.h"
#import "GDataLink.h"


@implementation GDataAtomAuthor (Extension)


- (NSArray *)links {
  NSArray *links = [self objectsForExtensionClass:[GDataLink class]];
  return links;
}

- (GDataLink *)linkWithRelAttributeValue:(NSString *)rel {
  
  return [GDataLink linkWithRel:rel
                           type:nil
                      fromLinks:[self links]];
}



@end
